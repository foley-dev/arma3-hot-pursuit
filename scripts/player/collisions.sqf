waitUntil {
	time > 0	
};

sleep 10;

if (side player != civilian) exitWith {};

Foley_forceSum = 0;

Foley_fnc_handleCollision = {
	params ["_object1", "_object2", "_selection1", "_selection2", "_force"];
	
	if (_object2 != vehicle player || _force < 0.01) exitWith {};

	Foley_forceSum = Foley_forceSum + _force;
	addCamShake [
    	linearConversion [0, 3000, Foley_forceSum, 1, 10, true],
		1,
		25
	];

	if (Foley_forceSum > 3000) then {
		player setDamage 1;
	};
};

{
	_x addEventHandler ["EpeContactStart", {
		_this call Foley_fnc_handleCollision;
	}];

	_x addEventHandler ["EpeContact", {
		_this call Foley_fnc_handleCollision;
	}];

	_x addEventHandler ["EpeContactEnd", {
		_this call Foley_fnc_handleCollision;
	}];
} forEach (vehicles select {side _x == opfor});
