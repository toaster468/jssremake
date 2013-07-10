currentstate = 1

function getnext()
	if currentstate == 1 then
		return 2
	elseif currentstate == 2 then
		return 3
	elseif currentstate == 3 then
		return 1
	end
end

hook.Add("PlayerDeath", "checkroundend", function(ply)
	local alive = 0
	
	if team.NumPlayers(2) == 0 and team.NumPlayers(3) > 0 then
		print("TEAM WON", 3)
		hook.Call("RoundOver", GM, 3)
		inprogress = false
	elseif team.NumPlayers(3) == 0 and team.NumPlayers(2) > 0 then
		print("TEAM WON", 2)
		hook.Call("RoundOver", GM, 2)
		inprogress = false
	elseif team.NumPlayers(2) == 0 and team.NumPlayers(3) == 0 then
		hook.Call("RoundOver", GM, 0)
		inprogress = false
	else
		inprogress = true
	end
end)

hook.Add("RoundOver", "notifyround", function(team)
	print(team .. " won the round!")
end)