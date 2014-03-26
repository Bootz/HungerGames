
local debugMode = true

-- SCREEN_HEIGHT and SCREEN_WIDTH are global variables made in this script

-- Set up background model
local model = CreateFrame("Model"--[[, "BackgroundF", MainFrame]]);
model:SetCamera(0);
model:SetPoint("CENTER",0,0);
model:SetFrameLevel(0);
-- This gets the width/height of the screen
local res = GetCVar("gxResolution")
local vars = 1
for value in string.gmatch(res, '([^x]+)') do
	if vars == 1 then
		model:SetWidth(value)
		SCREEN_WIDTH = tonumber(value)
		vars = nil
	else
		model:SetHeight(value)
		SCREEN_HEIGHT = tonumber(value)
	end
end
res = nil
model:SetLight(1,0,0,-0.5,-0.5,0.7,1.0,1.0,1.0,0.8,1.0,1.0,0.8);

function mainFrameLoaded()
	-- Set background model
	model:SetModel("Interface\\Glues\\Models\\UI_Orc\\UI_Orc.m2");
	-- Set frame levels
	MainFrame_Back:SetFrameLevel(1)
	MainFrame_Header:SetFrameLevel(1)
	
	-- Make the edges a higher layer
	for i = -1, -8, -1 do
		select(i, MainFrame_Back:GetRegions()):SetDrawLayer("OVERLAY")
		select(i, MainFrame_Header:GetRegions()):SetDrawLayer("OVERLAY")
	end
	
	-- Buttons are easier to do in Lua it seems
	local button = CreateFrame("Button", nil, MainFrame_Back, "BigButtonTemplate")
	button:SetPoint("TOPLEFT", MainFrame_Back, "TOPLEFT", 337, -20)
	button:SetText("Play Game")
	button:SetFrameLevel(3)
	--button:SetBackdropColor(1, 0, 0 --[[, alpha]])
	
	button = CreateFrame("Button", nil, MainFrame_Back, "SmallButtonTemplate")
	button:SetPoint("TOPLEFT", MainFrame_Back, "TOPLEFT", 641, -23)
	button:SetFrameLevel(3)
	
	button = CreateFrame("Button", nil, MainFrame_Back, "SmallButtonTemplate")
	button:SetPoint("TOPLEFT", MainFrame_Back, "TOPLEFT", 727, -23)
	button:SetFrameLevel(3)
	
	button = CreateFrame("Button", nil, MainFrame_Back, "SmallButtonTemplate")
	button:SetPoint("TOPLEFT", MainFrame_Back, "TOPLEFT", 813, -23)
	button:SetFrameLevel(3)
	
	button = CreateFrame("Button", nil, MainFrame_Back, "LeftMiddleButtonTemplate")
	button:SetPoint("TOPLEFT", MainFrame_Back, "TOPLEFT", 30, -117)
	button:SetText("Do Something")
	button:SetFrameLevel(4)
end

function mainFrameUpdate()
	if not debugMode then
		UIParent:Hide()
	end
end