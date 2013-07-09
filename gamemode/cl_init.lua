--[[
	Borrowed from DarkRP
]]
local fol = GM.FolderName.."/gamemode/modules/"
local files, folders = file.Find(fol .. "*", "LUA")

for _, folder in SortedPairs(folders, true) do
	if folder ~= "." and folder ~= ".." then
		for _, File in SortedPairs(file.Find(fol .. folder .."/sh_*.lua", "LUA"), true) do
			include(fol.. folder .. "/" ..File)
		end
		
		for _, File in SortedPairs(file.Find(fol .. folder .."/cl_*.lua", "LUA"), true) do 
			include(fol.. folder .. "/" ..File)
		end  
	end
end

function GM:DrawDeathNotice()
	return false
end
