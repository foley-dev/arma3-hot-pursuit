if (Foley_param_escortStrength < 0) exitWith {};

private _fnc_createGroup = {
	params ["_position", "_template"];
	_template params ["_vehicleType", "_unitTypes", "_script"];
	
	private _vehicle = createVehicle [_vehicleType, _position];
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
    private _group = [_position, opfor, _unitTypes] call BIS_fnc_spawnGroup;
	
	if (!isNil "_script") then {
		[_group, _vehicle] spawn _script;
	};

	{
		_x moveInAny _vehicle;
	} forEach units _group;

	_group
};

private _lsv = [
	"O_LSV_02_unarmed_F",
	[
		"O_soldierU_TL_F",
		"O_soldierU_LAT_F",
		"O_soldierU_F",
		"O_soldierU_F",
		"O_SoldierU_GL_F",
		"O_soldierU_medic_F"
	],
	nil,
	10
];

private _lsvMinigun = [
	"O_LSV_02_armed_F",
	[
		"O_soldierU_TL_F",
		"O_soldierU_LAT_F",
		"O_soldierU_F",
		"O_soldierU_F",
		"O_SoldierU_GL_F",
		"O_soldierU_medic_F",
		"O_SoldierU_GL_F"
	],
	nil,
	20
];

private _van = [
	"O_G_Van_02_vehicle_F",
	[
		"O_soldierU_TL_F",
		"O_soldierU_LAT_F",
		"O_soldierU_AR_F",
		"O_SoldierU_GL_F",
		"O_soldierU_F",
		"O_soldierU_medic_F"
	],
	{
		params ["_group", "_vehicle"];

		private _textures = ["a3\soft_f_orange\van_02\data\van_body_syndikat_co.paa","a3\soft_f_orange\van_02\data\van_wheel_co.paa","a3\soft_f_orange\van_02\data\van_glass_utility_ca.paa","a3\soft_f_orange\van_02\data\van_body_syndikat_co.paa"];

		{
			_vehicle setObjectTextureGlobal [_forEachIndex, _x];
		} forEach _textures;

		private _triggerDistance = random [10, 30, 150];

		waitUntil {
			sleep 1;
			{alive _x && side _x == independent && _x distance _vehicle < _triggerDistance} count allPlayers > 0
		};

		if (alive driver _vehicle) then {
			{
				_vehicle animateDoor [_x, 1];
			} forEach [
				"Door_3_source",
				"Door_4_source"
			];
		};
	},
	12
];

private _bike = [
	"UK3CB_O_M1030_CSAT_B",
	[
		"O_soldierU_F",
		"O_SoldierU_GL_F"
	],
	nil,
	3
];

private _convoys = [
	[
		[
			50,
			_bike
		],
		[
			-50,
			_bike
		],
		[
			-150,
			_lsv
		]
	],
	[
		[
			200,
			_bike
		],
		[
			50,
			_bike
		],
		[
			-50,
			_bike
		],
		[
			-100,
			_lsv
		]
	],
	[
		[
			150,
			_bike
		],
		[
			50,
			_lsv
		],
		[
			-50,
			_lsv
		]
	],
	[
		[
			150,
			_bike
		],
		[
			50,
			_van
		],
		[
			-50,
			_lsv
		]
	],
	[
		[
			50,
			_lsv
		],
		[
			-50,
			_lsv
		],
		[
			-150,
			_van
		]
	],
	[
		[
			200,
			_lsv
		],
		[
			50,
			_van
		],
		[
			-50,
			_lsv
		]
	],
	[
		[
			100,
			_lsv
		],
		[
			50,
			_bike
		],
		[
			-50,
			_bike
		],
		[
			-100,
			_lsv
		],
		[
			-150,
			_van
		]
	],
	[
		[
			200,
			_bike
		],
		[
			50,
			_lsvMinigun
		],
		[
			-50,
			_lsv
		],
		[
			-150,
			_van
		]
	],
	[
		[
			200,
			_bike
		],
		[
			50,
			_lsvMinigun
		],
		[
			-50,
			_lsv
		],
		[
			-100,
			_lsvMinigun
		],
		[
			-200,
			_van
		]
	],
	[
		[
			200,
			_bike
		],
		[
			50,
			_lsvMinigun
		],
		[
			-100,
			_lsvMinigun
		],
		[
			-200,
			_van
		],
		[
			-50,
			_lsv
		]
	]
];

private _convoysWithStrength = _convoys apply {
	private _strength = 0;
	private _convoy = _x;

	{
		_strength = _strength + (_x select 1 select 3);
	} forEach _convoy;

	[_convoy, _strength]
};

private _sortedConvoys = [_convoysWithStrength, [], {_x select 1}, "ASCEND"] call BIS_fnc_sortBy;
private _maxIndex = count _sortedConvoys - 1;

private _distributions = [
	[_maxIndex * 0.0, _maxIndex * 0.33, _maxIndex * 1.0],  // Default
	[_maxIndex * 0.0, _maxIndex * 0.1, _maxIndex * 0.4],  // Small
	[_maxIndex * 0.3, _maxIndex * 0.5, _maxIndex * 0.7],  // Medium
	[_maxIndex * 0.6, _maxIndex * 0.9, _maxIndex * 1.0]  // Strong
];
private _distribution = _distributions select (Foley_param_escortStrength min _maxIndex max 0);

private _index = round (random _distribution);
_index = _index max 0;
_index = _index min _maxIndex;

private _convoy = _convoys select _index;

private _roads = (getPos Foley_device) nearRoads 200;
_roads = _roads call BIS_fnc_arrayShuffle;

{
	_x params ["_offset", "_template"];

	private _group = [getPos (_roads select _forEachIndex), _template] call _fnc_createGroup;
	[_group, Foley_device, _offset, true] execVM "scripts\server\escort.sqf"; 
} forEach _convoy;
