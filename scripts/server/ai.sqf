call compile preprocessFileLineNumbers "scripts\server\routing.sqf";

Foley_route = [Foley_routeStart, Foley_routeEnd] call Foley_fnc_buildRoute;
publicVariable "Foley_route";

[Foley_device] execVM "scripts\server\runaway.sqf";
[Foley_kasatka, Foley_device] execVM "scripts\server\trackingHeli.sqf";

call compile preprocessFileLineNumbers "scripts\server\deployment.sqf";

// [] spawn {
// 	private _current = "Sign_Circle_F" createVehicle [0, 0, 0];
// 	_current setObjectTexture [0, "#(argb,8,8,3)color(0.1,0.9,0.1,0.1,ca)"];

// 	private _plus100 = "Sign_Circle_F" createVehicle [0, 0, 0];
// 	_plus100 setObjectTexture [0, "#(argb,8,8,3)color(0.9,0.9,0.1,0.1,ca)"];

// 	private _plus200 = "Sign_Circle_F" createVehicle [0, 0, 0];
// 	_plus200 setObjectTexture [0, "#(argb,8,8,3)color(0.9,0.1,0.1,0.1,ca)"];

// 	private _minus100 = "Sign_Circle_F" createVehicle [0, 0, 0];
// 	_minus100 setObjectTexture [0, "#(argb,8,8,3)color(0.1,0.9,0.9,0.1,ca)"];

// 	private _minus200 = "Sign_Circle_F" createVehicle [0, 0, 0];
// 	_minus200 setObjectTexture [0, "#(argb,8,8,3)color(0.1,0.1,0.9,0.1,ca)"];

// 	while {true} do {
// 		([Foley_route, getPos Foley_device] call Foley_fnc_castToRoute) params ["_pointOnRoute", "_distance"];

// 		([Foley_route, _distance] call Foley_fnc_pointOnRouteAt) params ["_pos", "_bearing"];
// 		_current setPos _pos;
// 		_current setDir _bearing;
		
// 		([Foley_route, _distance + 100] call Foley_fnc_pointOnRouteAt) params ["_pos", "_bearing"];
// 		_plus100 setPos _pos;
// 		_plus100 setDir _bearing;
		
// 		([Foley_route, _distance + 200] call Foley_fnc_pointOnRouteAt) params ["_pos", "_bearing"];
// 		_plus200 setPos _pos;
// 		_plus200 setDir _bearing;
		
// 		([Foley_route, _distance - 100] call Foley_fnc_pointOnRouteAt) params ["_pos", "_bearing"];
// 		_minus100 setPos _pos;
// 		_minus100 setDir _bearing;
		
// 		([Foley_route, _distance - 200] call Foley_fnc_pointOnRouteAt) params ["_pos", "_bearing"];
// 		_minus200 setPos _pos;
// 		_minus200 setDir _bearing;

// 		sleep 0.2;
// 	};
// };