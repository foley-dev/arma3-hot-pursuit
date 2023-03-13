if (side player != independent) exitWith {};

sleep 3;

waitUntil {
	sleep 1;

	if (player distance Foley_device < 500) then {
		Foley_caughtUp = true;
		publicVariable "Foley_caughtUp";
	};
	
	!isNil "Foley_caughtUp"
};

private _text = "<t font='PuristaBold' size='1.6'>25 [Tour] Hot Pursuit</t><br />by Foley";
[parseText _text, true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
