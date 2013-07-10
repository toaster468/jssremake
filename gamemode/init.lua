include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

whitelist = {
	"STEAM_0:1:28555826",
	"STEAM_0:1:36154954"
	--"STEAM_0:0:38664148"
}

table.foreach(team, print)

--[[
	Borrowed from DarkRP
]]
local fol = GM.FolderName.."/gamemode/modules/" 
local files, folders = file.Find(fol .. "*", "LUA")

for _, folder in SortedPairs(folders, true) do
	if folder ~= "." and folder ~= ".." then
		for _, File in SortedPairs(file.Find(fol .. folder .."/sh_*.lua", "LUA"), true) do
			AddCSLuaFile(fol..folder .. "/" ..File)
			include(fol.. folder .. "/" ..File)
		end

		for _, File in SortedPairs(file.Find(fol .. folder .."/sv_*.lua", "LUA"), true) do
			include(fol.. folder .. "/" ..File)
		end

		for _, File in SortedPairs(file.Find(fol .. folder .."/cl_*.lua", "LUA"), true) do
			AddCSLuaFile(fol.. folder .. "/" ..File)
		end
	end
end

function GM:GetFallDamage(ply, speed)
	speed = speed - 580
	return speed * (100/(1024-580))
end


hook.Add("PlayerAuthed", "kickifnotme", function(ply, steamid)
	--if steamid ~= whitelist[1] then
	--	ply:Kick("This is a dev server. Get lost.")
	--end
end)


function iswhitelisted(str)
	table.foreach(whitelist, function(_, id)
		if str == id then 
			print("Whitelisted", str, id)
			return true
		end
	end)
	
	return false
end