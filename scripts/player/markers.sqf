if (side player == independent) then {
	private _militaryMarkers = [
		"independent_start_marker",
		"independent_base_marker",
		"airport_marker",
		"csat_flag_marker",
		"border_marker"
	];

	{
		_x setMarkerAlphaLocal 1;
	} forEach _militaryMarkers;
};

if (side player == civilian) then {
	private _startMarker = createMarkerLocal ["civilian_start_marker", getPos player];
	_startMarker setMarkerShapeLocal "ICON";
	_startMarker setMarkerTypeLocal "mil_start";
	_startMarker setMarkerColorLocal "ColorCivilian";
	_startMarker setMarkerTextLocal "Start";

	for "_i" from 1 to 15 do {
		("busstop_" + str _i) setMarkerAlphaLocal 0.8;
	};

	uiSleep 5;

	{
		private _marker = createMarkerLocal ["civilian_start_marker_" + str random 100000, getPos _x];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerColorLocal "ColorCivilian";
		_marker setMarkerSizeLocal [0.6, 0.6];
		_marker setMarkerAlphaLocal 0.8;
	} forEach (allUnits select {side _x == civilian && _x != player});
};
