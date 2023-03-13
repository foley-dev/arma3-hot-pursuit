waitUntil {
	!isNull player || isServer
};

if (side player != independent && !isServer) exitWith {};

call compile preprocessFileLineNumbers "scripts\Foley_markers\init.sqf";

waitUntil {
	!isNil "Foley_route"
};

private _route = Foley_route select {
	!(_x getVariable ["Foley_hiddenNode", false])
};

private _fnc_roadInterpolation = {
	params ["_normalizedPoints", "_parameters"];
	_parameters params [["_step", 25]];

	private _points = [_normalizedPoints select 0];

	for "_i" from 1 to (count _normalizedPoints) - 1 do {
		private _previous = _normalizedPoints select (_i - 1);
		private _current = _normalizedPoints select _i;

		for "_t" from _step to (_previous distance _current) - _step step _step do {
			private _pointAtT = vectorLinearConversion [0, _previous distance _current, _t, _previous, _current];
			private _roads = _pointAtT nearRoads (_step / 2);

			if (count _roads > 0) then {
				_roads = [_roads, [_pointAtT], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;
				_points pushBack getPos (_roads select 0);
			};
		};

		_points pushBack _current;
	};

	[_points, [1.0, 4]] call Foley_markers_fnc_splicedBezierInterpolation
};

private _id = [
	"route", 
	_route,
	"ColorBlack", 
	true, 
	_fnc_roadInterpolation, 
	[20],
	Foley_markers_fnc_maxLengthSegmentation,
	[100]
] call Foley_markers_fnc_create;

if (isServer) then {
	[_id, _route, Foley_device] spawn {
		params ["_id", "_route", "_vehicle"];

		private _truckMarker = createMarker ["truck_marker", getPos _vehicle];
		_truckMarker setMarkerShape "ICON";
		_truckMarker setMarkerType "Empty";

		while {alive _vehicle} do {
			([_route, getPos _vehicle] call Foley_fnc_castToRoute) params ["_pointOnRoute", "_distance"];
			private _nearestPolyline = [_id, _pointOnRoute] call Foley_markers_fnc_getNearestPolyline;
			private _index = ([_id] call Foley_markers_fnc_getAllPolylines) find _nearestPolyline;
			_index = (round (_index / 5)) * 5;
			Foley_highlightedSlice = [_id, _index - 4, _index + 5] call Foley_markers_fnc_getPolylinesSlice;
			publicVariable "Foley_highlightedSlice";

			private _middleMarker = ([_id] call Foley_markers_fnc_getAllPolylines) select _index;
			_truckMarker setMarkerPos getMarkerPos _middleMarker;

			if (!("intercept" call BIS_fnc_taskCompleted)) then {
				["intercept", getMarkerPos _middleMarker] call BIS_fnc_taskSetDestination;
			};

			sleep 5;
		};
	};
};

if (hasInterface) then {
	[_id, _route] spawn {
		params ["_id", "_route"];

		if (side player != independent) exitWith {};

		waitUntil {
			!isNil "Foley_highlightedSlice";
		};

		private _previouslyHighlighted = [];

		while {true} do {
			private _highlighted = Foley_highlightedSlice;
			
			{
				_x setMarkerColorLocal "ColorBlack";
			} forEach _previouslyHighlighted;
			
			{
				_x setMarkerColorLocal "colorOPFOR";
			} forEach _highlighted;

			_previouslyHighlighted = _highlighted;

			sleep 1;
		};
	};
};
