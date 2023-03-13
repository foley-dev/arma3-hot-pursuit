{
	doStop _x;
	_x disableAI "PATH";
	
	if (side _x == independent || side _x == civilian) then {
		[_x] execVM "scripts\player\loadout.sqf";
	};
} forEach (playableUnits + switchableUnits);
