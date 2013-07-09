m = "models/props_junk/TrafficCone001a.mdl"

function ENT:Initialize()
	self:SetModel(m)
	self:SetHullType(HULL_TINY_CENTERED)
	self:SetSolid(SOLID_BBOX)
	self:SetParent(player.GetAll()[1])
	self:SetPos(player.GetAll()[1]:GetPos())
end