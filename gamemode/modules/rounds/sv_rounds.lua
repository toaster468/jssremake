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
	print("Called")
	local alive = 0
	
	for k, v in pairs(player.GetAll()) do
		if v:Alive() and v ~= ply then
			alive = alive + 1
			print(v:Nick())
		end
	end
	
	if alive == 0 then
		currenstate = getnext()
		hook.Call("RoundChange", GM, currentstate)
		print("ROUND CHANGED")
	else
		print("NOT CHANGING", alive)
	end
end)