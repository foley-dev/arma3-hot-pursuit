player createDiaryRecord [
	"Diary", 
	[
		"About",
		"<img image='assets\picture.paa' width='320' height='160'/><br />
<font size=16>25 [Tour] Hot Pursuit</font><br />
by Foley<br />
<br />
<font face='RobotoCondensedLight'>A suspicious truck has been spotted...</font><br />
<br />
<font size=12>Version: <font face='RobotoCondensedBold'>v0.10</font><br />
Discord: <font face='RobotoCondensedBold'>Foley#1330</font></font>"
	]
];

if (side player == independent) then {
	player createDiaryRecord [
		"Diary",
		[
			"Assets",
			"<font size=16>Units:</font><br />
<img image='ca\ui\data\markers\b_hq2.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Command</font> - <font face='RobotoCondensedLight'>PRC-343 Ch6</font><br />
<img image='ca\ui\data\markers\b_motor_inf.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Alpha</font> - Special Operations Team - <font face='RobotoCondensedLight'>PRC-343 Ch1</font><br />
<img image='ca\ui\data\markers\b_motor_inf.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Bravo</font> - Special Operations Team - <font face='RobotoCondensedLight'>PRC-343 Ch2</font><br />
<img image='ca\ui\data\markers\b_motor_inf.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Charlie</font> - Special Operations Team - <font face='RobotoCondensedLight'>PRC-343 Ch3</font><br />
<img image='ca\ui\data\markers\b_service.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Delta</font> - Service Team - <font face='RobotoCondensedLight'>PRC-343 Ch4</font><br />
<img image='ca\ui\data\markers\b_air.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Hotel</font> - Helicopter - <font face='RobotoCondensedLight'>PRC-343 Ch5</font><br />
<br />
<font size=16>Vehicles:</font><br />
<font face='RobotoCondensedBold'>Pursuit</font><br />
<img image='\rhsusf\addons\rhsusf_hmmwv\pictures\rhsusf_m1025_ca.paa' height='20' /> 2x M1025 Humvee<br />
<img image='\A3\soft_f\Offroad_01\Data\UI\Offroad_01_base_CA.paa' height='20' /> 4x Offroad<br />
<img image='\a3\Soft_F_Orange\Van_02\Data\UI\Van_02_vehicle_CA.paa' height='20' /> 2x Van<br />
<img image='\A3\soft_f_gamma\SUV_01\Data\UI\SUV_01_CA.paa' height='20' /> 1x Light SUV<br />
<img image='\A3\soft_f_gamma\Hatchback_01\Data\UI\car_CA.paa' height='20' /> 1x ホンダ Civic イR 285 hp (VTEC)<br />
<img image='\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\wheeled\UK3CB_Factions_Vehicles_motorbikes\data\ui\picture_yava250n_ca.paa' height='20' /> 4x Motorbike<br />
<br />
<font face='RobotoCondensedBold'>Air</font><br />
<img image='\A3\Air_F\Heli_Light_01\Data\UI\Heli_Light_01_CA.paa' height='20' /> 1x MH-9 Little Bird<br />
<img image='\A3\Air_F_Beta\Heli_Transport_02\Data\UI\Heli_Transport_02_CA.paa' height='20' /> 1x AW101 Merlin<br />
<br />
<font face='RobotoCondensedBold'>Service</font><br />
<img image='\A3\Soft_F_Bootcamp\Offroad_01\Data\UI\Offroad_01_repair_CA.paa' height='20' /> 1x Service Offroad<br />
<img image='\a3\Soft_F_Orange\Van_02\Data\UI\Van_02_service_CA.paa' height='20' /> 1x Service Van<br />
<img image='\a3\Soft_F_Orange\Van_02\Data\UI\Van_02_medevac_CA.paa' height='20' /> 1x Ambulance Van"
		]
	];
	player createDiaryRecord [
		"Diary", 
		[
			"Briefing",
			"A suspicious truck has been reported <font face='RobotoCondensedBold'>east-bound</font> leaving Altis Intl. Airport where you're <marker name='independent_start_marker'>based</marker>. Description matches a classified project run by CSAT.<br />
<br />
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<img image='\A3\Soft_F_EPC\Truck_03\Data\UI\truck_03_device_CA.paa' height='48' /><br />
<br />
The <marker name='truck_marker'>truck</marker> is currently on the highway, escorted by several light vehicles. Unless we intervene, it will reach the <marker name='border_marker'>border</marker> within 20 minutes.<br />
<br />
<font face='RobotoCondensedBold'>Intercept the truck ASAP and bring it back to base in one piece.</font><br />
<br />
Civilians may be active in the area, use caution."
		]
	];
};

if (side player == civilian) then {
	player createDiaryRecord [
		"Diary", 
		[
			"Ground Rules",
			"You will act as a civilian road user.<br />
<br />
This is a <font face='RobotoCondensedBold'>non-combatant</font> role. Refrain from operating weapons and military vehicles.<br />
<br />
<font face='RobotoCondensedBold'>Please drive sensibly:</font><br />
- stay on the right side of the road<br />
- respect speed limits<br />
- give way to emergency vehicles<br />
- <font face='RobotoCondensedBold'>do not block or interfere with military vehicles in any disruptive way</font><br />
<br />
Feel free to explore as you see fit, though it's best to stay near the highway inbetween: <marker name='rodopoli_marker'>Rodopoli</marker> - <marker name='paros_marker'>Paros</marker> - <marker name='delfinaki_marker'>Delfinaki</marker> - <marker name='sofia_marker'>Sofia</marker>."
		]
	];
};
