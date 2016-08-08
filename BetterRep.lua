--[[
	BetterRep (C) Kruithne <kruithne@gmail.com>
	Licensed under GNU General Public Licence version 3.
	
	https://github.com/Kruithne/BetterRep

	BetterRep.lua - Core add-on core/functions.
]]

BetterRep = {
	["Constants"] = {
		["LANDING_BUTTONS_PER_ROW"] = 3,
	},
};

-- Local short-cuts.
local B = BetterRep;
local C = BetterRep.Constants;

B.ShowFrame = function()
	if B.Frame == nil then
		B.CreateFrame();
		B.CurrentExpansion = 0;
		B.ShowLanding();
	end

	B.Frame:Show();
end

B.CreateFrame = function()
	local frame = CreateFrame("FRAME", "BetterRepFrame", UIParent);
	frame:SetPoint("CENTER", 0, 0);
	frame:SetWidth(700);
	frame:SetHeight(500);
	frame:SetBackdrop({
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
		edgeSize = 32,
		insets = {
			left = 11,
			right = 12,
			top = 12,
			bottom = 11
		}
	});

	-- Header
	local header = frame:CreateTexture(nil, "BACKGROUND");
	header:SetAllPoints(frame);
	header:SetPoint("TOPLEFT", 5, -5);
	header:SetPoint("TOPRIGHT", -5, -5);
	header:SetPoint("BOTTOMLEFT", frame, "TOPRIGHT", 5, -70);
	header:SetTexCoord(0, 1, 0.3, 0.45);
	
	local headerText = frame:CreateFontString(nil, nil, "Game15Font_o1");
	headerText:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 14, 6);

	local headerBorder = frame:CreateTexture(nil, "BORDER");
	headerBorder:SetPoint("TOPLEFT", 11, -63);
	headerBorder:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -11, -79);
	headerBorder:SetTexture([[Interface\GuildBankFrame\HorizTile]]);
	headerBorder:SetHorizTile(true);

	local backdrop = frame:CreateTexture(nil, "BACKGROUND");
	backdrop:SetPoint("TOPLEFT", header, "BOTTOMLEFT");
	backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -5, 5);
	backdrop:SetHorizTile(true);
	backdrop:SetVertTile(true);
	backdrop:SetTexture([[Interface\Garrison\GarrisonMissionUIInfoBoxBackgroundTile]], true, true);

	-- Close Button
	local close = CreateFrame("BUTTON", "BetterRepCloseButton", frame, "UIPanelCloseButton");
	close:SetPoint("TOPRIGHT", -6, -6);
	close:SetScript("OnClick", function(self) self:GetParent():Hide(); end);

	B.HeaderText = headerText;
	B.Header = header;
	B.Frame = frame;
end

B.ClearLandingButtons = function()
	local buttonIndex = 1;
	while true do
		local frame = _G["BetterRepFrameLandingExpansionButton" .. buttonIndex];
		if frame ~= nil then
			frame:Hide();
			buttonIndex = buttonIndex + 1;
		else
			break;
		end
	end
end

B.ClearReputationFrame = function()
	if B.BackButton ~= nil then
		B.BackButton:Hide();
	end
end

B.Helper_CreateTexture = function(frame, data)
	local tex = frame:CreateTexture(data.name, data.layer);

	if data.size then
		tex:SetSize(data.size[1], data.size[2]);
	end

	tex:SetAllPoints(true);
	tex:SetTexture(data.texture);

	if data.texCoord then
		tex:SetTexCoord(data.texCoord[1], data.texCoord[2], data.texCoord[3], data.texCoord[4]);
	end

	return tex;
end

B.Factory_LandingButton = function(index)
	local button = CreateFrame("BUTTON", "$parentLandingExpansionButton" .. index, B.Frame);
	button:SetSize(174, 96);
	button.id = index;

	button.bgImage = B.Helper_CreateTexture(button, {
		["layer"] = "BACKGROUND",
		["texCoord"] = {0, 0.68359375, 0, 0.7421875}
	});

	local text = button:CreateFontString("$parentTitle", "ARTWORK", "GameFontNormalSmall");
	text:SetSize(150, 0);
	text:SetPoint("BOTTOM", 0, 15);
	button.title = text;

	local texture = {
		["size"] = {174, 96},
		["texture"] = [[Interface\EncounterJournal\UI-EncounterJournalTextures]],
		["texCoord"] = {0.00195313, 0.34179688, 0.42871094, 0.52246094}
	};

	button:SetNormalTexture(B.Helper_CreateTexture(button, texture));

	texture.texCoord = {0.00195313, 0.34179688, 0.33300781, 0.42675781};
	button:SetPushedTexture(B.Helper_CreateTexture(button, texture));

	texture.texCoord = {0.34570313, 0.68554688, 0.33300781, 0.42675781};
	texture.layer = "HIGHLIGHT";
	button:SetHighlightTexture(B.Helper_CreateTexture(button, texture));

	button:SetScript("OnClick", B.Event_OnLandingButtonClick);

	return button;
end

B.Event_OnLandingButtonClick = function(self)
	B.CurrentExpansion = self.id;
	B.ShowReputation();
end

B.ShowReputation = function()
	local data = B.Expansions[B.CurrentExpansion];
	B.ClearLandingButtons(); -- Clear landing buttons.
	B.HeaderText:SetText(data.name);
	B.Header:SetTexture(data.header.texture);
	B.Header:SetTexCoord(0, 1, data.header.offset, data.header.offset + data.header.offsetFactor);

	-- Show/construct the back button
	if B.BackButton == nil then
		local button = CreateFrame("BUTTON", "$parentBackButton", B.Frame);
		button:SetSize(32, 32);
		button:SetPoint("BOTTOMLEFT", 20, 20);

		local size = {32, 32};

		button:SetNormalTexture(B.Helper_CreateTexture(button, {
			["size"] = size,
			["texture"] = [[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Up]]
		}));

		button:SetPushedTexture(B.Helper_CreateTexture(button, {
			["size"] = size,
			["texture"] = [[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Down]]
		}));

		button:SetHighlightTexture(B.Helper_CreateTexture(button, {
			["size"] = size,
			["texture"] = [[Interface\BUTTONS\UI-Common-MouseHilight]],
			["layer"] = "HIGHLIGHT"
		}));

		button:SetScript("OnClick", B.ShowLanding);
		B.BackButton = button;
	end
	B.BackButton:Show();

	local factionList = B.Factions[B.CurrentExpansion];
	local playerFaction = UnitFactionGroup("player");

	for react, factions in pairs(factionList) do
		if react == "All" or playerFaction == react then
			for i = 1, #factions do
				local factionName = GetFactionInfoByID(factions[i]);
				print(factionName);
			end
		end
	end
end

B.ShowLanding = function()
	-- Clear reputation frame
	B.ClearReputationFrame();

	-- Create a button for each expansion.
	local prevButton = nil;
	for index = 1, #B.Expansions do
		local data = B.Expansions[index];
		local button = _G["BetterRepFrameLandingExpansionButton" .. index];

		-- Create a button for this expansion if we don't already have one.
		if button == nil then
			button = B.Factory_LandingButton(index);
			button.bgImage:SetTexture(data.buttonTexture);
			button.title:SetText(data.name);

			if prevButton ~= nil then
				if mod(index - 1, C.LANDING_BUTTONS_PER_ROW) == 0 then
					-- Reached the end of the row, place this button a row down.
					prevButton = _G["BetterRepFrameLandingExpansionButton" .. index - C.LANDING_BUTTONS_PER_ROW];
					button:SetPoint("TOP", prevButton, "BOTTOM", 0, -20);
				else
					-- Stack onto the end of the row.
					button:SetPoint("LEFT", prevButton, "RIGHT", 20, 0);
				end
			else
				-- No previous button, align this as the starter button.
				button:SetPoint("TOPLEFT", B.Header, "BOTTOMLEFT", 65, -40);
			end

			--button:SetPoint("TOPLEFT", 0, 0);
		end

		button:Show();
		prevButton = button;
	end

	-- Finish details and show the frame.
	B.HeaderText:SetText(REPUTATION);
	B.Header:SetTexture([[Interface\GLUES\LOADINGSCREENS\LoadScreenOldStrathome]]);
	B.Header:SetTexCoord(0, 1, 0.56, 0.65);
end

-- Register Commands
SLASH_BETTERREP1, SLASH_BETTERREP2 = "/betterrep", "/rep";
function SlashCmdList.BETTERREP(msg, editbox)
	B.ShowFrame();
end