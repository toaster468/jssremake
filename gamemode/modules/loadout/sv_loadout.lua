hook.Add("PlayerInitialSpawn", "setupplayer", function(ply)
	if ply:SteamID() == "STEAM_0:1:28555826" then
		ply:SetModel("models/player/breen.mdl")
	else
		ply:SetModel("models/player/kleiner.mdl")
	end
end)

hook.Add("PlayerSpawn", "giveweapons", function(ply)
	ply:Give("weapon_crowbar")
	--ply:SetModel("models/player/breen.mdl")
	--ply:SetModel("models/player/kleiner.mdl")
end)
 