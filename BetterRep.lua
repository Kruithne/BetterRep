BetterRep = {};

-- Localization function.
BetterRep.L = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end });

-- Local short-cuts.
local B = BetterRep;
local L = BetterRep.L;

B.ShowFrame = function()
	if B.Frame == nil then
		B.CreateFrame();
	end

	B.Frame:Show();
end

B.CreateFrame = function()
	local frame = CreateFrame("FRAME", "BetterRepFrame", UIParent);
	frame:SetPoint("CENTER", 0, 0);
	frame:SetWidth(500);
	frame:SetHeight(300);
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
	header:SetPoint("BOTTOMLEFT", 5, 230);
	header:SetTexture([[Interface\GLUES\LOADINGSCREENS\LoadScreenRagefireChasm]]);
	header:SetTexCoord(0, 1, 0.3, 0.5);
	
	local headerText = frame:CreateFontString(nil, nil, "Game15Font_o1");
	headerText:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 14, 6);
	headerText:SetText("Ragefire Chasm");

	local headerBorder = frame:CreateTexture(nil, "BORDER");
	headerBorder:SetPoint("TOPLEFT", 11, -63);
	headerBorder:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -11, -79);
	headerBorder:SetTexture([[Interface\GuildBankFrame\HorizTile]]);
	headerBorder:SetHorizTile(true);
	frame.b = headerBorder;

	local backdrop = frame:CreateTexture(nil, "BACKGROUND");
	backdrop:SetPoint("TOPLEFT", header, "BOTTOMLEFT");
	backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -5, 5);
	backdrop:SetHorizTile(true);
	backdrop:SetVertTile(true);
	backdrop:SetTexture([[Interface\Garrison\GarrisonMissionUIInfoBoxBackgroundTile]], true);

	-- Close Button
	local close = CreateFrame("BUTTON", "BetterRepCloseButton", frame, "UIPanelCloseButton");
	close:SetPoint("TOPRIGHT", -6, -6);
	close:SetScript("OnClick", function(self) self:GetParent():Hide(); end);

	B.Frame = frame;
end

-- Register Commands
SLASH_BETTERREP1, SLASH_BETTERREP2 = "/betterrep", "/rep";
function SlashCmdList.BETTERREP(msg, editbox)
	B.ShowFrame();
end