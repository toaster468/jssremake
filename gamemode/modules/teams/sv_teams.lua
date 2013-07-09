function GM:PlayerAuthed(ply)
	ply:SetTeam(1) --Set players team to dead
end

function GM:PlayerDeath(ply)
	ply:SetTeam(1) --Player died, set team to dead
end

function GM:PlayerInitialSpawn(ply)
	local t = team.BestAutoJoinTeam()
	ply:SetTeam(t)
	print("SV Team", t)
end

function GM:PlayerSpawn(ply)
	local t = team.BestAutoJoinTeam()
	ply:SetTeam(t)
	print("SV Team", t)
end