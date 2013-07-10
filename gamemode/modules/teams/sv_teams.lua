function GM:PlayerAuthed(ply)
	ply:SetTeam(1) --Set players team to dead
end

function GM:PlayerDeath(ply)
	ply:SetTeam(1) --Player died, set team to dead
	ply:Spectate(2)
end

function AutoJoin()
	if team.NumPlayers(2) > team.NumPlayers(3) then 
		return 3
	elseif team.NumPlayers(2) < team.NumPlayers(3) then
		return 2
	elseif team.NumPlayers(2) == team.NumPlayers(3) then
		return math.random(2, 3)
	else
		print(team.NumPlayers(2), team.NumPlayers(3))
		return 2
	end
end

function GM:PlayerInitialSpawn(ply)
	if inprogress then return end
	local t = AutoJoin()
	ply:SetTeam(t)
	print("SV Team", t)
end

function GM:PlayerSpawn(ply)
	if ply:Alive() or inprogress then return end

	local t = AutoJoin()
	ply:SetTeam(t)
	print("SV Team", t)
end