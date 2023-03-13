Foley_param_timeOfDay = ["Foley_param_timeOfDay"] call BIS_fnc_getParamValue;
Foley_param_escortStrength = ["Foley_param_escortStrength"] call BIS_fnc_getParamValue;

TOUR_respawnTime = ["TOUR_param_respawn", 30] call BIS_fnc_getParamValue;
TOUR_respawnTickets = [
	["TOUR_param_tickets", 1] call BIS_fnc_getParamValue,
	["TOUR_param_tickets", 1] call BIS_fnc_getParamValue,
	["TOUR_param_tickets", 1] call BIS_fnc_getParamValue,
	["TOUR_param_tickets", 1] call BIS_fnc_getParamValue
];
