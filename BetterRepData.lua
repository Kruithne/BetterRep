--[[
	BetterRep (C) Kruithne <kruithne@gmail.com>
	Licensed under GNU General Public Licence version 3.
	
	https://github.com/Kruithne/BetterRep

	BetterRepData.lua - Defines data used in BetterRep.
]]

local B = BetterRep;

local EXPANSION_VANILLA = 1;
local EXPANSION_TBC = 2;
local EXPANSION_WRATH = 3;
local EXPANSION_CATA = 4;
local EXPANSION_MISTS = 5;
local EXPANSION_WARLORDS = 6;
local EXPANSION_LEGION = 7;

B.Expansions = {
	[EXPANSION_VANILLA] = {
		["name"] = EXPANSION_NAME0,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-Deadmines]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenDeadmines]],
			["offset"] = 0.56,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_TBC] = {
		["name"] = EXPANSION_NAME1,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-SunwellPlateau]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LOADSCREENAUCHINDOUN]],
			["offset"] = 0.4,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_WRATH] = {
		["name"] = EXPANSION_NAME2,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-PitofSaron]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenPitofSaron]],
			["offset"] = 0.35,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_CATA] = {
		["name"] = EXPANSION_NAME3,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-Firelands1]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenDeepholmDungeon]],
			["offset"] = 0.6,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_MISTS] = {
		["name"] = EXPANSION_NAME4,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-Pandaria]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreen_GoldRush]],
			["offset"] = 0.6,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_WARLORDS] = {
		["name"] = EXPANSION_NAME5,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-GrimrailDepot]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenOgreCompound]],
			["offset"] = 0.5,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_LEGION] = {
		["name"] = EXPANSION_NAME6,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-VaultoftheWardens]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\loadingscreen_mardumwide]],
			["offset"] = 0.6,
			["offsetFactor"] = 0.2,
		},
	},
};

local REACT_NEUTRAL = "All";
local REACT_ALLIANCE = "Alliance";
local REACT_HORDE = "Horde";

B.Factions = {
	[EXPANSION_VANILLA] = {
		[REACT_NEUTRAL] = {21, 59, 70, 87, 92, 93, 270, 349, 369, 470, 529, 576, 577, 609, 749, 809, 909, 910},
		[REACT_ALLIANCE] = {47, 54, 69, 72, 509, 589, 730, 890},
		[REACT_HORDE] = {68, 76, 81, 510, 530, 729, 889},
	},
	[EXPANSION_TBC] = {
		[REACT_HORDE] = {911, 922, 941, 947},
		[REACT_ALLIANCE] = {930, 946, 978},
		[REACT_NEUTRAL] = {932, 933, 934, 935, 942, 967, 970, 989, 990, 1011, 1012, 1015, 1031, 1038, 1077},
	},
	[EXPANSION_WRATH] = {
		[REACT_ALLIANCE] = {1050, 1094, 1126, 1037, 1068},
		[REACT_HORDE] = {1052, 1067, 1085, 1124, 1064},
		[REACT_NEUTRAL] = {1073, 1090, 1091, 1098, 1104, 1105, 1106, 1119},
	},
	[EXPANSION_CATA] = {
		[REACT_HORDE] = {1133, 1172, 1178},
		[REACT_ALLIANCE] = {1134, 1174, 1177},
		[REACT_NEUTRAL] = {1135, 1156, 1158, 1168, 1171, 1173, 1204},
	},
	[EXPANSION_MISTS] = {
		[REACT_NEUTRAL] = {1216, 1269, 1270, 1271, 1272, 1273, 1275, 1276, 1277, 1278, 1279, 1280, 1281, 1282, 1283, 1302, 1337, 1341, 1345, 1358, 1359, 1435, 1492},
		[REACT_HORDE] = {1228, 1352, 1375, 1388},
		[REACT_ALLIANCE] = {1242, 1353, 1376, 1387},
	},
	[EXPANSION_WARLORDS] = {
		[REACT_HORDE] = {1445, 1681, 1708, 1848},
		[REACT_NEUTRAL] = {1515, 1711, 1849, 1850},
		[REACT_ALLIANCE] = {1682, 1710, 1731, 1847},
	},
	[EXPANSION_LEGION] = {
		[REACT_NEUTRAL] = {1828, 1859, 1883, 1894, 1900, 1948, 1975, 1984},
	},
}