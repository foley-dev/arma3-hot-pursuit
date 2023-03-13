private _vehicleTypes = [
	"B_GEN_Van_02_vehicle_F",
	"UK3CB_AAF_I_Offroad",
	"B_GEN_Offroad_01_gen_F",
	"UK3CB_AAF_I_GAZ_Vodnik_MedEvac",
	"UK3CB_ADP_I_YAVA",
	"I_E_Van_02_medevac_F",
	"C_Van_02_service_F",
	"C_Offroad_01_repair_F"
];

{
	_x addEventHandler [
		"GetOut",
		{
			params ["_vehicle", "_role", "_unit", "_turret"];

			if (isNull driver _vehicle || !alive driver _vehicle) then {
				[[_vehicle, 'CustomSoundController1', 0]] remoteExec ["setCustomSoundController"];
				_vehicle setVariable ['UK3CB_Siren_Active', false, true];
			};
		}
	];

	_x addEventHandler [
		"Dammaged",
		{
			params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];

			if (damage _unit == 1) then {
				[[_vehicle, 'CustomSoundController1', 0]] remoteExec ["setCustomSoundController"];
				_vehicle setVariable ['UK3CB_Siren_Active', false, true];
			};
		}
	];

	[_x] spawn {
		params ["_vehicle"];

		while {alive _vehicle} do {
			if (
				getCustomSoundController [_vehicle, 'CustomSoundController1'] > 0.5 ||
				_vehicle getVariable ['UK3CB_Siren_Active', false]
			) then {
				_vehicle animateSource ['lights_em_hide', 1];
				_vehicle animateSource ['Beacons', 1];
			};

			sleep 1;
		};
	};
} forEach (vehicles select {(typeOf _x) in _vehicleTypes});

{
	[_x] spawn {
		params ["_helicopter"];

		private _allowedUnitClasses = ["I_helipilot_F", "I_helicrew_F"];

		while {alive _helicopter} do {
			sleep 0.5;

			private _pilot = currentPilot _helicopter;

			if (isNull _pilot) then {
				continue;
			};

			if (vectorMagnitude velocity _helicopter > 1) then {
				continue;
			};

			if ((typeOf _pilot) in _allowedUnitClasses) then {
				continue;
			};
			
			moveOut _pilot;
			_helicopter engineOn false;
		};
	};
} forEach (
	vehicles select {
		_x isKindOf "Air" &&
		_x distance (getMarkerPos "independent_start_marker") < 100
	}
);

private _items = [
	"RoadCone_F",
	"RoadCone_F",
	"RoadBarrier_F",
	"Land_PortableLight_single_F",
	"RoadBarrier_F",
	"RoadBarrier_F",
	"RoadCone_F",
	"RoadCone_F"
];

{
	private _vehicle = _x;

	{
		[_x, _vehicle] call ace_cargo_fnc_loadItem;
	} forEach _items;
} forEach (
	vehicles select {
		_x isKindOf "LandVehicle" &&
		_x distance (getMarkerPos "independent_start_marker") < 100
	}
);