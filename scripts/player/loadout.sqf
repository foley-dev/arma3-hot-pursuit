params [["_unit", player]];

waitUntil {
	!isNull player
};
private _loadouts = [
	[
		"I_Soldier_SL_F",
		[["rhs_weap_hk416d10_LMT","","rhsusf_acc_wmx_bk","",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_CREW_DIGI_BRN",[["rhs_mag_30Rnd_556x45_M855_Stanag",6,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_m67",2,1],["ACE_M84",2,1],["SmokeShellGreen",2,1]]],["UK3CB_B_I_Backpack_Radio_Chem",[["ACRE_PRC117F",1],["murshun_cigs_cigpack",1,20],["murshun_cigs_lighter",1,100]]],"UK3CB_AAF_B_H_Beret_SF_Off","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_Soldier_repair_F",
		[["rhs_weap_hk416d10_LMT","","rhsusf_acc_wmx_bk","",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_DIGI_BRN",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",4],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_BAF_V_Osprey_HiVis",[["rhs_mag_30Rnd_556x45_M855_Stanag",6,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["ACE_M84",4,1],["SmokeShellGreen",2,1],["ACE_Chemlight_UltraHiOrange",4,1],["ACE_Chemlight_HiBlue",4,1]]],["UK3CB_B_Backpack_Pocket",[["ToolKit",1],["DemoCharge_Remote_Mag",2,1],["ACE_Clacker",1]]],"UK3CB_BAF_H_Mk7_HiVis","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"B_medic_F",
		[["rhs_weap_hk416d10_LMT","","rhsusf_acc_wmx_bk","",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_DIGI_BRN",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",4],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_BAF_V_Osprey_HiVis",[["rhs_mag_30Rnd_556x45_M855_Stanag",3,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["ACE_M84",4,1],["SmokeShellGreen",6,1],["ACE_Chemlight_UltraHiOrange",4,1],["ACE_Chemlight_HiBlue",4,1],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_surgicalKit",1]]],["UK3CB_CHC_C_B_MED",[["ACE_fieldDressing",20],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_tourniquet",10],["ACE_bloodIV",2],["ACE_bloodIV_500",4],["ACE_bloodIV_250",4],["ACE_splint",5],["ACE_bodyBag",5]]],"UK3CB_BAF_H_Mk7_HiVis","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_officer_F",
		[["rhs_weap_hk416d10_LMT","","rhsusf_acc_wmx_bk","",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_BRN",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",4],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_BAF_V_Osprey_HiVis",[["rhs_mag_30Rnd_556x45_M855_Stanag",6,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["ACE_M84",4,1],["SmokeShellGreen",2,1],["ACE_Chemlight_UltraHiOrange",4,1],["ACE_Chemlight_HiBlue",4,1],["ACE_morphine",5],["ACE_epinephrine",5]]],["UK3CB_B_I_Backpack_Radio_Chem",[["ACRE_PRC117F",1],["murshun_cigs_cigpack",1,20],["murshun_cigs_lighter",1,100],["ToolKit",1],["ACE_fieldDressing",20],["ACE_tourniquet",10],["ACE_bloodIV_500",5],["ACE_bodyBag",5]]],"UK3CB_BAF_H_Mk7_HiVis","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_Soldier_TL_F",
		[["rhs_weap_hk416d145","","rhsusf_acc_wmx_bk","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_SL_DIGI_BRN",[["rhs_mag_30Rnd_556x45_M855_Stanag",6,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_m67",2,1],["ACE_M84",2,1],["SmokeShellGreen",2,1]]],["UK3CB_B_I_Backpack_Radio_Chem",[["ACRE_PRC117F",1],["murshun_cigs_cigpack",1,20],["murshun_cigs_lighter",1,100]]],"UK3CB_AAF_B_H_Beret_SF","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_Soldier_AR_F",
		[["rhs_weap_m249_pip_S_para","","rhsusf_acc_wmx_bk","rhsusf_acc_eotech_552",["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_coyote",100],[],"rhsusf_acc_saw_bipod"],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_MG_DIGI_BRN",[["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_coyote",3,100],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_m67",2,1],["ACE_M84",2,1],["SmokeShellGreen",2,1]]],[],"H_Cap_blk_Raven","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_engineer_F",
		[["rhs_weap_hk416d10_LMT","","rhsusf_acc_wmx_bk","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_EOD_DIGI_BRN",[["rhs_mag_30Rnd_556x45_M855_Stanag",6,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_m67",2,1],["ACE_M84",2,1],["SmokeShellGreen",2,1]]],["UK3CB_AAF_B_B_CARRYALL_DIGI_BRN",[["ToolKit",1],["DemoCharge_Remote_Mag",2,1],["SLAMDirectionalMine_Wire_Mag",4,1],["MineDetector",1],["ACE_DefusalKit",1],["ACE_Clacker",1],["ACE_SpraypaintRed",1]]],"H_Cap_blk_Raven","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_medic_F",
		[["rhs_weap_hk416d10_LMT","","rhsusf_acc_wmx_bk","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_MED_DIGI_BRN",[["rhs_mag_30Rnd_556x45_M855_Stanag",5,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["ACE_M84",2,1],["SmokeShellGreen",6,1],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_surgicalKit",1]]],["B_AssaultPack_dgtl",[["ACE_fieldDressing",20],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_tourniquet",10],["ACE_bloodIV",2],["ACE_bloodIV_500",4],["ACE_bloodIV_250",4],["ACE_splint",5],["ACE_bodyBag",5]]],"H_Cap_blk_Raven","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_Soldier_LAT_F",
		[["rhs_weap_hk416d145","","rhsusf_acc_wmx_bk","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],["rhs_weap_M136_hedp","","","",["UK3CB_BAF_AT4_CS_AT_Mag",1],[],""],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_RIF_DIGI_BRN",[["rhs_mag_30Rnd_556x45_M855_Stanag",6,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_m67",2,1],["ACE_M84",2,1],["SmokeShellGreen",2,1]]],[],"H_Cap_blk_Raven","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_Soldier_M_F",
		[["rhs_weap_M590_8RD","","","",["rhsusf_5Rnd_Slug",5],[],""],[],["rhsusf_weap_glock17g4","","acc_flashlight_pistol","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_RIF_DIGI_BRN",[["rhsusf_5Rnd_Slug",10,5],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_m67",4,1],["ACE_M84",2,1],["SmokeShellGreen",2,1]]],[],"H_Cap_blk_Raven","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_Soldier_GL_F",
		[["rhs_weap_hk416d145_m320","","rhsusf_acc_wmx_bk","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855_Stanag",30],["rhs_mag_M433_HEDP",1],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_AAF_O_V_Eagle_GL_DIGI_BRN",[["rhs_mag_30Rnd_556x45_M855_Stanag",5,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_M781_Practice",2,1],["rhs_mag_M433_HEDP",9,1],["rhs_mag_m67",4,1],["ACE_M84",2,1],["SmokeShellGreen",2,1]]],[],"H_Cap_blk_Raven","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"I_helipilot_F",
		[["rhs_weap_hk416d10_LMT","","rhsusf_acc_wmx_bk","",["rhs_mag_30Rnd_556x45_M855_Stanag",30],[],""],[],[],["UK3CB_AAF_I_U_J_Pilot_DIGI_GRN",[["ACRE_PRC343",1],["ACE_fieldDressing",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_CableTie",2],["rhsusf_acc_anpeq15side_bk",1],["ACE_EarPlugs",1]]],["UK3CB_V_Pilot_Vest_Black",[["rhs_mag_30Rnd_556x45_M855_Stanag",5,30],["SmokeShellGreen",2,1]]],["UK3CB_AAF_B_B_ASS_DIGI_BLK",[["ACRE_PRC117F",1],["murshun_cigs_cigpack",1,20],["murshun_cigs_lighter",1,100]]],"H_PilotHelmetHeli_B","",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","ACE_NVG_Gen4_Black"]]
	],
	[
		"C_man_1_1_F",  // BMW
		[[],[],[],["U_Marshal",[["murshun_cigs_cigpack",1,2],["murshun_cigs_lighter",1,100]]],[],[],"H_Hat_brown","",[],["ItemMap","","","","ItemWatch",""]]
	],
	[
		"C_man_hunter_1_F",  // Hilux
		[[],[],[],["UK3CB_CHC_C_U_HIKER_01",[["murshun_cigs_cigpack",1,4],["murshun_cigs_lighter",1,15]]],[],[],"H_Booniehat_dgtl","",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"C_man_polo_1_F",  // Sprinter
		[[],[],[],["U_C_Man_casual_1_F",[["murshun_cigs_cigpack",1,2],["murshun_cigs_matches",1,10]]],[],[],"H_Cap_blu","",[],["ItemMap","","","","ItemWatch",""]]
	],
	[
		"C_man_polo_2_F",  // Yava
		[[],[],[],["UK3CB_NAP_B_U_Pilot_FLK",[["murshun_cigs_cigpack",1,4],["murshun_cigs_matches",1,10]]],[],[],"H_Bandanna_gry","",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"C_journalist_F",  // Civic
		[[],[],[],["U_OrestesBody",[["ACE_morphine",11],["ACE_tourniquet",1],["murshun_cigs_cigpack",1,4],["murshun_cigs_lighter",1,100]]],[],[],"H_Bandanna_surfer_blk","",[],["ItemMap","","","","ItemWatch",""]]
	],
	[
		"C_man_1_3_F",  // Golf
		[[],[],[],["UK3CB_CHC_C_U_COACH_04",[["murshun_cigs_cigpack",1,15],["murshun_cigs_matches",1,7]]],[],[],"UK3CB_H_Profiteer_Cap_01","",[],["ItemMap","","","","ItemWatch",""]]
	],
	[
		"C_man_pilot_F",  // Ikarus
		[[],[],[],["UK3CB_ADC_C_Shorts_U_06",[["murshun_cigs_cigpack",1,2],["murshun_cigs_matches",1,4]]],[],[],"H_Cap_blu","",[],["ItemMap","","","","ItemWatch",""]]
	],
	[
		"C_man_shorts_2_F",  // Landcruiser
		[[],[],[],["U_C_Poloshirt_blue",[["murshun_cigs_cigpack",1,2],["murshun_cigs_lighter",1,100]]],[],[],"H_Cap_grn_BI","G_Aviator",[],["ItemMap","","","ItemCompass","ItemWatch",""]]
	],
	[
		"C_man_w_worker_F",  // Ural
		[[],[],[],["U_I_C_Soldier_Bandit_3_F",[["murshun_cigs_cigpack",1,8],["murshun_cigs_matches",1,7]]],[],[],"H_Cap_blk_CMMG","",[],["ItemMap","","","","ItemWatch",""]]
	],
	[
		"C_man_p_fugitive_F",  // Lada
		[[],[],[],["UK3CB_ADC_C_Pants_U_06",[["ACE_morphine",6],["ACE_tourniquet",1],["murshun_cigs_cigpack",1,4],["murshun_cigs_matches",1,7]]],[],[],"rhs_fieldcap_m88_vsr","",[],["ItemMap","","","","",""]]
	]
];

private _loadout = (_loadouts select {(_x select 0) isEqualTo typeOf _unit}) select 0;

if (isNil "_loadout") exitWith {};

private _profileFacewear = goggles _unit;
_unit setUnitLoadout (_loadout select 1);
removeGoggles _unit;
_unit addGoggles _profileFacewear;

if (daytime > 5 && daytime < 18) then {
	_unit removePrimaryWeaponItem "rhsusf_acc_wmx_bk";
};

if (dayTime > 3 && dayTime < 20) then {
	_unit unlinkItem "ACE_NVG_Gen4_Black";
	_unit removeItemFromUniform "rhsusf_acc_anpeq15side_bk";
};

[
	_unit,
	[
		["ACRE_PRC343", _unit getVariable ["Foley_defaultChannel", 1]]
	]
] execVM "scripts\player\radioChannelSetup.sqf";

[_unit] spawn {
	params ["_unit"];
	
	sleep 0.5;

	if (primaryWeapon _unit != "") exitWith {
		_unit playMoveNow "AmovPercMstpSlowWrflDnon";
	};

	if (handgunWeapon _unit != "") exitWith {
		_unit playMoveNow "AmovPercMstpSlowWpstDnon";
	};
};
