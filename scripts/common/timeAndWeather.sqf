setViewDistance 2000;

if (isServer) then {
	private _times = [
		[4, 15],
		[14, 0],
		[18, 40],
		[19, 40],
		[22, 0]
	];

	private _weights = [
		15,
		25,
		25,
		20,
		5
	];

	private _timeOfDay = _times selectRandomWeighted _weights;

	if (Foley_param_timeOfDay >= 0 && Foley_param_timeOfDay < count _times) then {
		_timeOfDay = _times select Foley_param_timeOfDay;
	};

	_timeOfDay params ["_hour", "_minute"];
	setDate [2035, 6, 13, _hour, _minute];
};
