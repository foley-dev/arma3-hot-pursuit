#define KMPH_TO_MPS 0.2778
#define SMOKES_COUNT 3

params ["_vehicle"];

useAISteeringComponent true;

(group _vehicle) setVariable ["lambs_danger_disableGroupAI", true];
(group _vehicle) allowFleeing 0;

{
	_x setVariable ["lambs_danger_disableAI", true];
	_x setSkill ["general", 1];
	_x setSkill ["commanding", 1];
	_x setSkill ["courage", 1];
	_x disableAI "COVER";
	_x disableAI "SUPPRESSION";
	_x disableAI "AUTOCOMBAT";
} forEach units group _vehicle;

_vehicle setUnloadInCombat [false, false];
_vehicle allowCrewInImmobile true;
_vehicle setVehicleLock "LOCKED";

private _followPath = {
	params ["_vehicle"];

	private _group = group _vehicle;

	_group setBehaviour "CARELESS";
	_group setCombatBehaviour "CARELESS";
	(units _group) orderGetIn true;

	while {alive _vehicle && {side _x == opfor && alive _x} count (crew _vehicle) > 0} do {
		([Foley_route, getPos _vehicle] call Foley_fnc_castToRoute) params ["_pointOnRoute", "_distance"];
		([Foley_route, _distance + 200] call Foley_fnc_pointOnRouteAt) params ["_nextPointOnRoute", "_bearing"];

		(group _vehicle) move _nextPointOnRoute;
		
		// private _pointer = "Sign_Arrow_Direction_Green_F" createVehicle [0, 0, 0];
		// _pointer setPos _nextPointOnRoute;
		// _pointer setDir _bearing;

		sleep 1;

		private _t = time;
		waitUntil {
			sleep 0.3;
			time > _t + 10 || _vehicle distance _nextPointOnRoute < 50 || {side _x == opfor && alive _x} count (crew _vehicle) == 0
		};
	};

	_group move getPos _vehicle;
	_group setCombatBehaviour "COMBAT";
	_group setBehaviour "COMBAT";

	{	
		_x enableAI "COVER";
		_x enableAI "AUTOCOMBAT";
	} forEach units _group;
	
	_vehicle setVehicleLock "UNLOCKED";
};

[_vehicle] spawn _followPath;

[_vehicle] spawn {
	params ["_vehicle"];

	while {alive _vehicle && {side _x == opfor && alive _x} count (crew _vehicle) > 0} do {
		private _nearestPlayerDistance = selectMin ((allPlayers select {side _x == independent && alive _x}) apply {_x distance _vehicle});

		if (isNil "_nearestPlayerDistance") then {
			_nearestPlayerDistance = 99999;
		};

		if (_nearestPlayerDistance < 100) then {
			_vehicle setPilotLight false;
			(driver _vehicle) disableAI "LIGHTS";
		};
		
		{
			if (alive _x && vehicle _x == _vehicle && speed _vehicle > 5 * KMPH_TO_MPS) then {
				[_x] call ace_medical_treatment_fnc_fullHealLocal;
				_x setDamage 0;
			};
		} forEach crew _vehicle;

		private _speed = linearConversion [0, 500, 500 - _nearestPlayerDistance, 50 * KMPH_TO_MPS, 110 * KMPH_TO_MPS, true];
		_vehicle forceSpeed _speed;

		sleep 3;
	};
};

[_vehicle] spawn {
	params ["_vehicle"];

	while {alive _vehicle && {side _x == opfor && alive _x} count (crew _vehicle) > 0} do {
		private _distance = 3 * (0.278 * speed _vehicle);
		private _projectedPoint = _vehicle getPos [_distance, getDir _vehicle];
		private _nearbyPlayers = allPlayers select {
			alive _x &&
			_x distance _projectedPoint < _distance - 2 && 
			abs speed _vehicle > abs speed vehicle _x &&
			opfor knowsAbout (vehicle _x) >= 0.01 &&
			((getPosATL _x) select 2) < 10
		};
		private _nearbyPlayersCount = {
			[_vehicle, "VIEW", vehicle _x] checkVisibility [aimPos _vehicle, aimPos vehicle _x] > 0.01
		} count _nearbyPlayers;

		if (speed _vehicle > 5 && _nearbyPlayersCount > 0) then {
			private _handle = [_vehicle] spawn Foley_honkAndFlash;

			waitUntil {
				scriptDone _handle;
			};

			sleep 5;
		};

		sleep 0.5;
	};
};

[_vehicle] spawn {
	params ["_vehicle"];

	private _lastSmokePos = [0, 0, 0];
	private _smokesLeft = SMOKES_COUNT;

	while {_smokesLeft > 0 && alive _vehicle && {side _x == opfor && alive _x} count (crew _vehicle) > 0} do {
		private _nearbyPlayers = allPlayers select {
			alive _x &&
			side _x == independent &&
			_x distance _vehicle < 25 &&
			opfor knowsAbout (vehicle _x) >= 1.5 &&
			((getPosATL _x) select 2) < 10 &&
			abs speed (vehicle _x) < 20 * KMPH_TO_MPS
		};

		if (speed _vehicle < 10 * KMPH_TO_MPS && count _nearbyPlayers > 0 && (getPos _vehicle) distance _lastSmokePos > 100) then {
			[_vehicle, selectRandom _nearbyPlayers] call Foley_fnc_smoke;
			_lastSmokePos = getPos _vehicle;
			_smokesLeft = _smokesLeft - 1;
			sleep 10;
		};

		sleep 1 + random 10;
	};
};

[_vehicle] spawn {
	params ["_vehicle"];

	private _stuckSince = time;

	while {alive _vehicle && {side _x == opfor && alive _x} count (crew _vehicle) > 0} do {
		if (abs speed _vehicle > 3) then {
			_stuckSince = time;
		};

		if (time - _stuckSince > 3) then {
			private _forceMultiplier = 0.5;

			if (time - _stuckSince > 10) then {
				_forceMultiplier = 1;
			};

			if (!alive _vehicle || side _vehicle != opfor) exitWith {};

			private _handle = [_vehicle, "", _forceMultiplier] spawn Foley_bump;

			waitUntil {
				scriptDone _handle;
			};

			if (time - _stuckSince > 20) then {
				(driver _vehicle) doMove (_vehicle getPos [10 + random 50, getDir _vehicle]);
			};

			sleep (12 * _forceMultiplier);
		};
		
		sleep 0.5;
	};
};

Foley_honkAndFlash = {
	params ["_vehicle"];

	private _lightInitial = isLightOn _vehicle;
	(driver _vehicle) disableAI "LIGHTS";

	for "_i" from 1 to 4 + ceil random 2 do {
		TOUR_core action ["useWeapon", _vehicle, driver _vehicle, 0];
		_vehicle setPilotLight true;
		sleep 0.3;

		_vehicle setPilotLight false;
		sleep 0.1;
	};

	_vehicle setPilotLight _lightInitial;
	(driver _vehicle) enableAI "LIGHTS";
};

Foley_bump = {
	params ["_vehicle", ["_bumpType", ""], ["_forceMultiplier", 1]];

	if (!(_vehicle isKindOf "LandVehicle") || !alive driver _vehicle || !isEngineOn _vehicle) exitWith {};

	private _bumps = createHashMapFromArray [
		[
			"HEAD_LEFT",
			[
				[-1.5, 0, 1],
				[0, 3, 0]
			]
		],
		[
			"HEAD_RIGHT",
			[
				[1.5, 0, 1],
				[0, 3, 0]
			]
		],
		[
			"TAIL_LEFT",
			[
				[-1.5, 0, 1],
				[0, -3, 0]
			]
		],
		[
			"TAIL_RIGHT",
			[
				[1.5, 0, 1],
				[0, -3, 0]
			]
		]
	];

	private _bump = _bumps getOrDefault [_bumpType, selectRandom values _bumps];
	_bump params ["_forceModelSpace", "_positionModelSpace"];

	private _force = _vehicle vectorModelToWorld _forceModelSpace;
	_force = _force vectorMultiply getMass _vehicle;
	_force = _force vectorMultiply _forceMultiplier;

	private _position = (getCenterOfMass _vehicle) vectorAdd _positionModelSpace;

	_vehicle addForce [_force, _position];
	sleep 0.1;
	_vehicle addForce [_force, _position];
};

Foley_fnc_smoke = {
	params ["_vehicle", ["_target", objNull]];
	
	private _shell = "UK3CB_BAF_G_40mm_Smoke" createVehicle getPos _vehicle;
	_shell setPosASL AGLToASL (_vehicle modelToWorld [1, 4, 3]);

	private _velocity2D = vectorNormalized [0.71, 0.71, 0];

	if (!isNull _target) then {
		_velocity2D = (getPosASL _vehicle) vectorFromTo (getPosASL _target);
	};

	_shell setVelocity ((velocity _vehicle) vectorAdd [0, 0, 5] vectorAdd _velocity2D);

	[_shell] spawn {
		params ["_shell"];

		sleep 10;
		deleteVehicle _shell;
	};
};
