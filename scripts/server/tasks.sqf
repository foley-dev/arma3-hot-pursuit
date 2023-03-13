if (!isServer) exitWith {};

[
	independent,
	"intercept",
	[
		"Stop and capture the truck without destroying it",
		"Intercept the truck"
	],
	objNull,
	"ASSIGNED",
	10,
	false,
	"car"
] call BIS_fnc_taskCreate;

[
	independent,
	"bringBack",
	[
		"Bring the truck back to base once you've captured it",
		"Bring the truck to base"
	],
	objNull,
	"CREATED",
	-1,
	false,
	"move"
] call BIS_fnc_taskCreate;

[] spawn {
	sleep 10;

	waitUntil {
		sleep 1;

		{side _x == opfor && alive _x} count (crew Foley_device) == 0 || !alive Foley_device || Foley_device inArea Foley_opforBase
	};

	if (!alive Foley_device || Foley_device inArea Foley_opforBase) then {
		["intercept", "FAILED", true] call BIS_fnc_taskSetState;
	} else {
		["intercept", "SUCCEEDED", true] call BIS_fnc_taskSetState;
		sleep 6;
		["bringBack", "ASSIGNED", true] call BIS_fnc_taskSetState;
    	["bringBack", "independent_base_marker"] call BIS_fnc_taskSetDestination;
	};
};

[] spawn {
	sleep 10;

	waitUntil {
		sleep 1;

		Foley_device inArea "independent_base_marker" || !alive Foley_device || Foley_device inArea Foley_opforBase
	};

	if (!alive Foley_device || Foley_device inArea Foley_opforBase) then {
		[
			"bringBack",
			"CANCELED",
			"intercept" call BIS_fnc_taskState == "SUCCEEDED"
		] call BIS_fnc_taskSetState;
	} else {
		["bringBack", "SUCCEEDED", true] call BIS_fnc_taskSetState;
	};
};
