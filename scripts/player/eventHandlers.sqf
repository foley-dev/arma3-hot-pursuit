player addEventHandler [
	"respawn",
	{
		execVM "scripts\player\radioSilence.sqf";
		execVM "scripts\player\loadout.sqf";
	}
];
