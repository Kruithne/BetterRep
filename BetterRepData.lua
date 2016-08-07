--[[
	BetterRep (C) Kruithne <kruithne@gmail.com>
	Licensed under GNU General Public Licence version 3.
	
	https://github.com/Kruithne/BetterRep

	BetterRepData.lua - Defines data used in BetterRep.
]]

local B = BetterRep;
local L = BetterRep.L; -- Localization.

local EXPANSION_VANILLA = 1;
local EXPANSION_TBC = 2;
local EXPANSION_WRATH = 3;
local EXPANSION_CATA = 4;
local EXPANSION_MISTS = 5;
local EXPANSION_WARLORDS = 6;
local EXPANSION_LEGION = 7;

B.Expansions = {
	[EXPANSION_VANILLA] = {
		["name"] = L.EXPANSION_VANILLA,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-Deadmines]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenDeadmines]],
			["offset"] = 0.56,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_TBC] = {
		["name"] = L.EXPANSION_TBC,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-SunwellPlateau]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LOADSCREENAUCHINDOUN]],
			["offset"] = 0.4,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_WRATH] = {
		["name"] = L.EXPANSION_WOTLK,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-PitofSaron]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenPitofSaron]],
			["offset"] = 0.35,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_CATA] = {
		["name"] = L.EXPANSION_CATA,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-Firelands1]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenDeepholmDungeon]],
			["offset"] = 0.6,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_MISTS] = {
		["name"] = L.EXPANSION_MISTS,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-Pandaria]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreen_GoldRush]],
			["offset"] = 0.6,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_WARLORDS] = {
		["name"] = L.EXPANSION_WARLORDS,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-GrimrailDepot]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\LoadScreenOgreCompound]],
			["offset"] = 0.5,
			["offsetFactor"] = 0.1,
		},
	},

	[EXPANSION_LEGION] = {
		["name"] = L.EXPANSION_LEGION,
		["buttonTexture"] = [[Interface\ENCOUNTERJOURNAL\UI-EJ-DUNGEONBUTTON-VaultoftheWardens]],
		["header"] = {
			["texture"] = [[Interface\GLUES\LOADINGSCREENS\loadingscreen_mardumwide]],
			["offset"] = 0.6,
			["offsetFactor"] = 0.2,
		},
	},
};