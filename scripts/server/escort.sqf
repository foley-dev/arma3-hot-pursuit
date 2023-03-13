params ["_group", "_escortee", "_offset", ["_teleportToPosition", false]];

waitUntil {
	!isNil "Foley_route"
};

useAISteeringComponent true;

_group setVariable ["lambs_danger_disableGroupAI", true];
_group allowFleeing 0;

{
	_x setVariable ["lambs_danger_disableAI", true];
	_x setSkill ["general", 1];
	_x setSkill ["commanding", 1];
	_x setSkill ["courage", 1];
} forEach units _group;

_group setBehaviourStrong "AWARE";
_group setCombatBehaviour "AWARE";
_group setSpeedMode "FULL";

private _vehicle = vehicle leader _group;
_group selectLeader (effectiveCommander _vehicle);
_vehicle setUnloadInCombat [false, false];
_vehicle allowCrewInImmobile [true, true];
(driver _vehicle) setCombatBehaviour "CARELESS";

if (_teleportToPosition) then {
	([Foley_route, getPos _escortee] call Foley_fnc_castToRoute) params ["_pointOnRoute", "_distance"];
	([Foley_route, _distance + _offset] call Foley_fnc_pointOnRouteAt) params ["_nextPointOnRoute", "_bearing"];

	private _pos = _nextPointOnRoute findEmptyPosition [0, 50, typeOf _vehicle];
	_vehicle setPos _pos;
	_vehicle setDir _bearing;
};

_group setVariable ["Foley_escortDestination", getPos _vehicle];
_group setVariable ["Foley_escortBearing", getDir _vehicle];

[_group, _vehicle, _escortee, _offset] spawn {
	params ["_group", "_vehicle", "_escortee", "_offset"];

	// private _pointer = "Sign_Arrow_Large_Blue_F" createVehicle [0, 0, 0];

	while {alive _escortee && {side _x == opfor && alive _x} count (crew _escortee) > 0} do {
		private _adjustedOffset = _offset + (vectorMagnitude velocity _escortee) * 8;

		if (speed _escortee < 10 && {alive _x && side _x == independent && _x distance _escortee < 50} count allPlayers > 0) then {
			_adjustedOffset = _adjustedOffset / 10;
		};

		([Foley_route, getPos _escortee] call Foley_fnc_castToRoute) params ["_pointOnRoute", "_distance"];
		([Foley_route, _distance + _adjustedOffset] call Foley_fnc_pointOnRouteAt) params ["_nextPointOnRoute", "_bearing"];

		_group setVariable ["Foley_escortDestination", _nextPointOnRoute];
		_group setVariable ["Foley_escortBearing", _bearing];
		// _pointer setPos _nextPointOnRoute;
		// _pointer setDir _bearing;

		sleep 0.2;
	};

	while {alive _escortee} do {
		private _nextPointOnRoute = _escortee getPos [(vectorMagnitude velocity _escortee) * 5, getDir _escortee];

		_group setVariable ["Foley_escortDestination", _nextPointOnRoute];
		_group setVariable ["Foley_escortBearing", getDir _escortee];

		sleep 0.2;
	};
};

[_group, _vehicle, _escortee] spawn {
	params ["_group", "_vehicle", "_escortee"];

	private _stuckSince = time;

	while {alive _escortee && {alive _x} count units _group > 1} do {
		private _destination = _group getVariable "Foley_escortDestination";
		private _bearing = _group getVariable "Foley_escortBearing";

		(driver _vehicle) setCombatBehaviour "CARELESS";
		_group move _destination;
		_group setFormDir _bearing;

		// private _pointer = "Sign_Arrow_Direction_Blue_F" createVehicle [0, 0, 0];
		// _pointer setPos _destination;
		// _pointer setDir _bearing;

		if (speed _vehicle > 3 || _vehicle distance _destination < 100) then {
			_stuckSince = time;
		};

		if (time - _stuckSince > 20) then {
			if (alive _vehicle && alive driver _vehicle && canMove _vehicle && side _vehicle == opfor && {alive _x && vehicle _x != _vehicle} count (units _group) == 0) then {
				private _handle = [_vehicle, "", 0.5] spawn Foley_bump;

				waitUntil {
					scriptDone _handle;
				};

				sleep 10;
			};
		};

		if (vehicle leader _group == leader _group || _vehicle distance _destination > 1000) then {
			sleep 15;
		} else {
			sleep 2.5;
		};
	};
	
	while {{alive _x} count units _group > 0} do {
		_group move (_escortee getPos [random 50, random 360]);

		sleep random [5, 30, 60];
	};
};

[_group, _vehicle, _escortee] spawn {
	params ["_group", "_vehicle", "_escortee"];

	waitUntil {
		sleep 5;
		!canMove _vehicle || fuel _vehicle == 0 || {alive _x} count units _group <= 1
	};

	{
		_x setCombatBehaviour "COMBAT";
		unassignVehicle _x;
		_x doFollow leader _group;
	} forEach units _group;

	_group leaveVehicle _vehicle;
};

[_group, _vehicle, _escortee] spawn {
	params ["_group", "_vehicle", "_escortee"];

	waitUntil {
		sleep 5;
		!canMove _escortee || fuel _escortee == 0 || {alive _x} count units _group == 0 || {side _x == opfor && alive _x} count (crew _escortee) == 0
	};

	waitUntil {
		sleep 1;
		_vehicle distance _escortee < 100 && abs speed _escortee < 3
	};

	_vehicle setUnloadInCombat [true, true];
	
	{
		_x setCombatBehaviour "COMBAT";
	} forEach units _group;
};
