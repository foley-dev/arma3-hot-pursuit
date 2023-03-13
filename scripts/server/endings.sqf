if (!isServer) exitWith {};

sleep 10;

waitUntil {
	sleep 1;

	time > 0 && ({alive _x && side _x == independent} count allPlayers) > 0
};

waitUntil {
	sleep 1;

	"intercept" call BIS_fnc_taskCompleted && "bringBack" call BIS_fnc_taskCompleted || ({alive _x && side _x == independent} count allPlayers) == 0
};

private _unconsciousPlayers = allPlayers select {
	alive _x &&
	(_x getVariable ["ACE_isUnconscious", false])
};

// Kill unconscious players to let them spectate the aftermath
{
	_x setDamage 1;
} forEach _unconsciousPlayers;

if ("intercept" call BIS_fnc_taskState == "SUCCEEDED" && "bringBack" call BIS_fnc_taskState == "SUCCEEDED") exitWith {
	sleep 10;
	"VictoryEnding" call BIS_fnc_endMissionServer;
};

if (!alive Foley_device) exitWith {
	sleep 30;
	"MinorDefeatEnding" call BIS_fnc_endMissionServer;
};

if (Foley_device inArea Foley_opforBase) exitWith {
	sleep 30;
	"DefeatEnding" call BIS_fnc_endMissionServer;
};

sleep 5;
"loser" call BIS_fnc_endMissionServer;
