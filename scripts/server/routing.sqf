Foley_fnc_buildRoute = {
	params ["_startNode", "_endNode"];

	private _route = [_startNode];
	private _current = _startNode;

	while {_current != _endNode} do {
		private _synched = (synchronizedObjects _current) select {!(_x in _route)};
		
		if (count _synched == 0) then {
			break;
		};

		_route pushBack _current;
		_current = _synched select 0;
	};

	_route
};

Foley_fnc_pointOnRouteAt = {
	params ["_route", "_distanceFromStart"];

	private _accumulatedDistance = 0;
	private _previous = _route select 0;
	private _pointOnRoute = getPos (_route select (count _route - 1));
	private _bearing = 0;

	{
		if (_accumulatedDistance + (_previous distance _x) >= _distanceFromStart) then {
			_pointOnRoute = _previous getPos [
				_distanceFromStart - _accumulatedDistance,
				_previous getDir _x
			];
			_bearing = _previous getDir _x;
			break;
		};

		_accumulatedDistance = _accumulatedDistance + (_previous distance _x);
		_previous = _x;
	} forEach _route;

	[_pointOnRoute, _bearing]
};

Foley_fnc_castToLineSegment = {
	params ["_point", "_segmentStart", "_segmentEnd"];
	_point params ["_x", "_y"];
	_segmentStart params ["_x1", "_y1"];
	_segmentEnd params ["_x2", "_y2"];

	private _a = _x - _x1;
	private _b = _y - _y1;
	private _c = _x2 - _x1;
	private _d = _y2 - _y1;
	
	private _dot = _a * _c + _b * _d;
	private _lenSquared = _c * _c + _d * _d;
	private _param = -1;

	if (_lenSquared != 0) then {
		_param = _dot / _lenSquared;
	};

	private _xx = _x1 + _param * _c;
	private _yy = _y1 + _param * _d;

	if (_param < 0) then {
		_xx = _x1;
		_yy = _y1;
	};

	if (_param > 1) then {
		_xx = _x2;
		_yy = _y2;
	};

	[_xx, _yy]
};

Foley_fnc_castToRoute = {
	params ["_route", "_point"];

	private _nearby = _route select {_x distance _point < 2000};
	_nearby pushBackUnique (_route select 0);
	_nearby pushBackUnique (_route select (count _route - 1));

	private _sorted = [_nearby, [_point], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;

	private _nearest = _sorted select 0;
	private _neighbors = (synchronizedObjects _nearest) apply {
		[_x, [_point, getPos _nearest, getPos _x] call Foley_fnc_castToLineSegment]
	};

	private _sortedNeighbors = [_neighbors, [_point], {_input0 distance (_x select 1)}, "ASCEND"] call BIS_fnc_sortBy;

	private _neighbor = _sortedNeighbors select 0 select 0;
	private _pointOnRoute = _sortedNeighbors select 0 select 1;

	private _previous = _route select 0;
	private _distanceOnRoute = 0;

	{
		_distanceOnRoute = _distanceOnRoute + (_previous distance _x); 

		if (_x == _nearest) then {
			_distanceOnRoute = _distanceOnRoute + (_nearest distance _pointOnRoute);
			break;
		};

		if (_x == _neighbor) then {
			_distanceOnRoute = _distanceOnRoute + (_neighbor distance _pointOnRoute);
			break;
		};

		_previous = _x;
	} forEach _route;

	[_pointOnRoute, _distanceOnRoute]
};
