if (side player != civilian) exitWith {};

while {alive player} do {
	if (player inArea Foley_opforKillzone) then {
		hint "That's too far";

		sleep 10;

		if (player inArea Foley_opforKillzone) exitWith {
			addCamShake [
				10,
				1,
				25
			];
			sleep 0.1;
			player setDamage 1;
			hintSilent "";
		};
	};

	sleep 3;
};
