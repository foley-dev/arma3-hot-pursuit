params ["_heli", "_target"];

private _group = group driver _heli;
private _paradropped = false;

while {alive _heli} do {
	if (!_paradropped && "intercept" call BIS_fnc_taskState == "SUCCEEDED") then {
		private _wp = _group addWaypoint [_target getPos [5 * speed _target, getDir _target], 0];
		_wp setWaypointType "SCRIPTED";
		_wp setWaypointScript "\rhsafrf\addons\rhs_c_air\scripts\WP_ParaInf.sqf";
		_group setCurrentWaypoint _wp;
		
		waitUntil {
			sleep 1;

			currentWaypoint _group > _wp select 1
		};
		
		_paradropped = true;
	};

	private _wp = _group addWaypoint [_target getPos [5 * speed _target, getDir _target], 0];
	_wp setWaypointType "LOITER";
	_wp setWaypointLoiterType "CIRCLE";
	_wp setWaypointLoiterRadius random [300, 450, 600];
	_wp setWaypointLoiterAltitude random [250, 450, 600];
	_group setCurrentWaypoint _wp;

	for "_i" from 1 to 6 do {
		_wp setWaypointPosition [(_target getPos [5 * speed _target, getDir _target]), 0];
		sleep 10;
	};
};
