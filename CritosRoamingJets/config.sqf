/*
Roaming Jets
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.4 4/30/2022
*/

RJSpawnTime = 60;									//Delay between spawning each jet on server start.

RJMaxJets = 3;										//Max number of jets to have on server at the same time.

RJJetAISide = EAST;									//Side The AI should be on.

RJSearchDist = 4000;								//max radius the AI jet will search for a suitable target.			

RJRespect = 300;									//Respect payout to player for destroying jet.
													//If jet only gets damaged and crahing to ground is what destroys it the player does not get respect.
				
RJprizechance = 35;									//number from 0 to 100, represents % chance for enemy jet to spawn loot crate when shot down. Set to 0 if you do not want prizes.

RJcash = 500000;									//max ammount of tabs to spawn in prize crate. random number selected from 0 to RJcash number.

RJgunsAmount = 10;									//max number of guns to spawn in loot crate.

RJitemAmount = 2;									//max number of items to spawn in loot crate.

RJ_Plane = [										//list of jets for system to choose from. 			
				"B_Plane_Fighter_01_F",				
				"B_Plane_Fighter_01_Stealth_F",		
				"O_Plane_Fighter_02_F",
				"O_Plane_Fighter_02_Stealth_F",
				"I_Plane_Fighter_04_F"
			];

RJLootGuns = 	[									//List of possible guns to spawn in loot crate chosen randomly.
					"Exile_Weapon_AK107",
					"Exile_Weapon_AK74",
					"exile_arifle_M16A4",
					"Exile_Weapon_M16A4",
					"Exile_Weapon_M16A2",
					"exile_arifle_M16A2",
					"exile_arifle_M4",
					"Exile_Weapon_M4",
					"Exile_Weapon_AK47",
					"Exile_Weapon_AKM",
					"Exile_Weapon_AKS",
					"Exile_Weapon_AKS_Gold",
					"arifle_Mk20_GL_F",
					"arifle_Mk20_GL_plain_F",
					"arifle_TRG21_GL_F",
					"arifle_Katiba_GL_F",
					"arifle_MX_GL_Black_F",
					"arifle_MX_GL_F",
					"Exile_Weapon_AK107_GL",
					"Exile_Weapon_AK74_GL",
					"LMG_Mk200_F",
					"LMG_Zafir_F",
					"arifle_MX_SW_Black_F",
					"arifle_MX_SW_F",
					"MMG_02_black_F",
					"MMG_02_camo_F",
					"MMG_02_sand_F",
					"MMG_01_hex_F",
					"MMG_01_tan_F",
					"arifle_MXM_Black_F",
					"arifle_MXM_F",
					"srifle_DMR_01_F",
					"srifle_DMR_03_F",
					"srifle_DMR_03_khaki_F",
					"srifle_DMR_03_multicam_F",
					"srifle_DMR_03_tan_F",
					"srifle_DMR_03_woodland_F",
					"srifle_DMR_06_camo_F",
					"srifle_DMR_06_olive_F",
					"srifle_EBR_F",
					"srifle_DMR_04_F",
					"srifle_DMR_04_Tan_F",
					"srifle_DMR_05_blk_F",
					"srifle_DMR_05_hex_F",
					"srifle_DMR_05_tan_f",
					"srifle_DMR_02_F",
					"srifle_DMR_02_camo_F",
					"srifle_DMR_02_sniper_F",
					"srifle_GM6_F",
					"srifle_GM6_camo_F",
					"srifle_LRR_F",
					"srifle_LRR_camo_F"
				];

RJLootItems = 	[									//lits of possible items to spawn in loot crate chosen randomly.					
											"Exile_Item_Magazine01",
											"Exile_Item_SafeKit",
											"Exile_Item_CodeLock",
											"optic_tws",
											"Laserdesignator_03",
											"optic_Nightstalker",
											"optic_tws_mg",
											"Exile_Item_Wrench",
											"Exile_Item_Beer",
											"Exile_Item_Magazine02",
											"H_HelmetO_ViperSP_hex_F",
											"H_HelmetO_ViperSP_ghex_F",
											"ToolKit",
											"Laserdesignator",
											"Exile_Item_Beer",
											"Exile_Item_Beer",
											"Laserbatteries",
											"Exile_Item_Magazine03",
											"Laserdesignator_01_khk_F",
											"Exile_Item_CodeLock",
											"B_Static_Designator_01_F",
											"Laserdesignator_02_ghex_F",
											"Exile_Item_Beer",
											"ToolKit",
											"Exile_Item_Magazine04",
											"Exile_Item_Beer",
											"ToolKit",
											"Laserdesignator_02",
											"Exile_Item_RubberDuck"
				];

//List of planes that cannot fight jets so they will not get targeted by the jets. Add Planes only! Helicopters are not targeted by jets by default.			
RJBlacklist =	[							
					"B_T_VTOL_01_armed_F",
					"B_T_VTOL_01_infantry_F",
					"B_T_VTOL_01_vehicle_F",
					"O_T_VTOL_02_infantry_dynamicLoadout_F", 
					"O_T_VTOL_02_vehicle_dynamicLoadout_F",
					"I_C_Plane_Civil_01_F",
					"Exile_Plane_AN2_Stripe",
					"Exile_Plane_AN2_Green",
					"Exile_Plane_AN2_White",
					"An2_af",
					"An2_tk",
					"An2_a2",
					"C_Plane_Civil_01_F",
					"C_Plane_Civil_01_racing_F",
					"Exile_Plane_Ceasar",
					"GNT_C185F",
					"Exile_Plane_Cessna",
					"GNT_C185",
					"Exile_Plane_BlackfishInfantry",
					"Exile_Plane_BlackfishVehicle"
				];