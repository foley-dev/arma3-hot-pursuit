call compile preprocessFileLineNumbers "scripts\common\params.sqf";
call compile preprocessFileLineNumbers "scripts\common\timeAndWeather.sqf";

if (isServer) then {
	call compile preprocessFileLineNumbers "scripts\server\tasks.sqf";
	call compile preprocessFileLineNumbers "scripts\server\vehicles.sqf";
	call compile preprocessFileLineNumbers "scripts\server\ai.sqf";
	execVM "scripts\server\endings.sqf";
	execVM "scripts\server\damageControl.sqf";
};

if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	if (side player != civilian) then {
		player addRating 100000;
	};

	doStop player;
	call compile preprocessFileLineNumbers "scripts\player\briefing.sqf";
	execVM "scripts\player\markers.sqf";
	execVM "scripts\player\loadout.sqf";
	execVM "scripts\player\radioSilence.sqf";
	execVM "scripts\player\eventHandlers.sqf";
	execVM "scripts\player\missionTitle.sqf";
	execVM "scripts\Foley_blinkers\init.sqf";
	execVM "scripts\player\outOfBounds.sqf";
	execVM "scripts\player\collisions.sqf";
};

[TOUR_respawnTickets, TOUR_respawnTime] execVM "scripts\TOUR_RC\init.sqf";
execVM "scripts\common\tracker.sqf";

if (!isMultiplayer) then {
	execVM "scripts\common\singleplayerSetup.sqf";
};
