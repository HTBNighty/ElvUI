local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local mod = E:GetModule('NamePlates')
local LSM = LibStub("LibSharedMedia-3.0")


function mod:UpdateElement_MaxPower(frame)
	local maxValue = UnitPowerMax(frame.displayedUnit, frame.PowerToken);
	frame.PowerBar:SetMinMaxValues(0, maxValue);
end

local temp = {r = 1, b = 1, g = 1}
function mod:UpdateElement_Power(frame)
	self:UpdateElement_MaxPower(frame)
	
	local curValue = UnitPower(frame.displayedUnit, frame.PowerToken);
	frame.PowerBar:SetValue(curValue);	

	local color = E.db.unitframe.colors.power[frame.PowerToken] or PowerBarColor[frame.PowerToken] or temp

	if(color) then
		frame.PowerBar:SetStatusBarColor(color.r, color.g, color.b)
	end
	if(self.db.classbar.enable and self.db.classbar.position == "BELOW") then
		self:ClassBar_Update(frame)
	end			
end 

function mod:ConfigureElement_PowerBar(frame)
	local powerBar = frame.PowerBar
	powerBar:SetPoint("TOPLEFT", frame.HealthBar, "BOTTOMLEFT", 0, -mod.mult)
	powerBar:SetPoint("TOPRIGHT", frame.HealthBar, "BOTTOMRIGHT", 0, -mod.mult)
	powerBar:SetHeight(self.db.units[frame.UnitType].castbar.height)
	powerBar:SetStatusBarTexture(LSM:Fetch("statusbar", self.db.statusbar))
end


function mod:ConstructElement_PowerBar(parent)
	local frame = CreateFrame("StatusBar", "$parentPowerBar", parent)
	self:StyleFrame(frame, true)
	frame:Hide()

	return frame
end