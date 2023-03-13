#define WHEEL_DAMAGE_FACTOR 1.5
#define GLASS_DAMAGE_FACTOR 0.3
#define GENERAL_DAMAGE_FACTOR 0.25
#define COLLISION_DAMAGE_FACTOR 0.01
#define VEHICLE_EXPLOSION_FACTOR 0.001
#define SHOTGUN_DAMAGE_FACTOR 3.0
#define NEW_DAMAGE_CAP 0.3
#define EXPLOSIVE_WHEEL_DAMAGE_CAP 0.8
#define EXPLOSIVE_WINDOW_DAMAGE_CAP 0.8

sleep 1;

Foley_device addEventHandler [
	"HandleDamage", 
	{ 
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

		private _logId = str (10000 + floor random 89999);
		diag_log text format [
			"%1 HP RAW: time=%2, _unit=%3, _selection=%4, _damage=%5, _source=%6, _projectile=%7, _hitIndex=%8, _instigator=%9, _hitPoint=%10",
			_logId,
			time,
			_unit,
			_selection,
			_damage toFixed 4,
			_source,
			_projectile,
			_hitIndex,
			_instigator,
			_hitPoint
		];

		_projectile = toLower _projectile;
		_selection = toLower _selection;

		private _isCollision = _projectile == "";
		private _isVehicleExplosion = "fuelexplosion" in _projectile || "secondary" in _projectile || "helicopterexplo" in _projectile;
		private _isShotgun = "rhs_ammo_12g" in _projectile;
		private _isWindow = "glass" in _selection;
		private _isWheel = "wheel" in _selection;
		private _isOverallDamage = _selection isEqualTo "";
		private _isCausedByIndependent = side _instigator == independent || side _source == independent;
		private _isAlive = alive _unit;
		private _isExplosiveWeapon = "slamdirectionalmine" in _projectile || "democharge" in _projectile || 
			"grenade" in _projectile || "40mm" in _projectile ||
			"rocket" in _projectile || "at4" in _projectile || "ilaw" in _projectile || "m136" in _projectile; 

		diag_log text format [
			"%1 HP DETECTED: _isCollision=%2, _isVehicleExplosion=%3, _isShotgun=%4, _isWindow=%5, _isWheel=%6, _isOverallDamage=%7, _isCausedByIndependent=%8, _isAlive=%9, _isExplosiveWeapon=%10",
			_logId,
			_isCollision,
			_isVehicleExplosion,
			_isShotgun,
			_isWindow,
			_isWheel,
			_isOverallDamage,
			_isCausedByIndependent,
			_isAlive,
			_isExplosiveWeapon
		];

		private _previousDamage = [_unit getHitIndex _hitIndex, damage _unit] select _isOverallDamage;
		private _newDamage = _damage - _previousDamage;

		_newDamage = switch true do {
			case (_isCollision): { _newDamage * COLLISION_DAMAGE_FACTOR };  // reduce collision damage
			case (_isShotgun && (_isWheel || _isWindow)): { _newDamage * SHOTGUN_DAMAGE_FACTOR };  // increase shotgun damage to wheels and windows
			case (_isVehicleExplosion): { _newDamage * VEHICLE_EXPLOSION_FACTOR };  // reduce damage from vehicles exploding nearby
			case (_isWheel): { _newDamage * WHEEL_DAMAGE_FACTOR };  // increase damage to wheels
			case (_isWindow && !_isExplosiveWeapon): { _newDamage * GLASS_DAMAGE_FACTOR };  // reduce damage to windows unless it's from explosive
			default { _newDamage * GENERAL_DAMAGE_FACTOR };  // reduce other types of damage
		};

		_newDamage = switch true do {
			case (_isShotgun): { _newDamage };  // no damage cap for shotgun
			case (_isWheel && _isExplosiveWeapon): { _newDamage min EXPLOSIVE_WHEEL_DAMAGE_CAP };
			case (_isWindow && _isExplosiveWeapon): { _newDamage min EXPLOSIVE_WINDOW_DAMAGE_CAP };
			default { _newDamage min NEW_DAMAGE_CAP };
		};

		diag_log text format [
			"%1 HP MODIFIED: _previousDamage=%2, _newDamage=%3 -> %4, return=%5",
			_logId,
			_previousDamage toFixed 4,
			(_damage - _previousDamage) toFixed 4,
			_newDamage toFixed 4,
			(_previousDamage + _newDamage) toFixed 4
		];

		if (_previousDamage < 1.0 && _previousDamage + _newDamage >= 1.0) then {
			diag_log text format [
				"%1 HP DESTROYED: allHitPointsDamage=%2",
				_logId,
				(getAllHitPointsDamage _unit) select 2
			];
		};

		(_previousDamage + _newDamage)
	}
];

private _fnc_protectCrew = {
	params ["_unit"];

	_unit allowDamage false;

	_unit addEventHandler [
		"GetOutMan", 
		{ 
			params ["_unit", "_role", "_vehicle", "_turret"];

			_unit allowDamage true;
		}
	];

	[_unit] spawn {
		params ["_unit"];

		waitUntil {
			sleep 0.1;

			private _windowHitPoints = ["hitglass1", "hitglass2", "hitglass3", "hitglass4", "hitrglass", "hitlglass", "hitglass5", "hitglass6"];
			private _isWindowSmashed = false;
			
			if (vehicle _unit != _unit) then {
				_isWindowSmashed = _windowHitPoints findIf {(vehicle _unit) getHitPointDamage _x > 0.9} >= 0;
			};

			_isWindowSmashed || vehicle _unit == _unit || damage vehicle _unit >= 0.9
		};

		_unit allowDamage true;
	};
};

{
	[_x] call _fnc_protectCrew;
} forEach crew Foley_device;
