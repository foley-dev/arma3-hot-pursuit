params ["_group", "_escortee"];

_group setBehaviour "AWARE";
_group setSpeedMode "FULL";

while {{alive _x} count units _group > 0} do {
	private _projectedPoint = _escortee getPos [(vectorMagnitude velocity _escortee) * 5, getDir _escortee];
	_group move _projectedPoint;

	if ((leader _group) distance _escortee > 1000 || vehicle leader _group == leader _group) then {
		sleep 30;
	} else {
		sleep 3;
	};
};
