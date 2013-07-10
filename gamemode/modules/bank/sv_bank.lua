concommand.Add("transfer", function(ply, cmd, args)
	if GetMoney(ply) - tonumber(args[2]) < 0 then print("Not enough money") return end
	
	for k, v in pairs(player.GetAll()) do
		if v:Nick() == args[1] and tonumber(args[2]) ~= nil then
			AddMoney(v, tonumber(args[2]))
			AddMoney(v, tonumber(args[2]) * -1)
			--print(tonumber(args[2]) * -1, tonumber(args[2]))
			--print(string.format("Sent 0x%x dollars to %s", tonumber(args[2], "10"), v:Nick()))
		end
	end
	GetMoney(ply)
end)

concommand.Add("setmoney", function(ply, cmd, args)
	for k, v in pairs(player.GetAll()) do
		if v:Nick() == args[1] and tonumber(args[2]) ~= nil and ply:IsAdmin() then
			SetMoney(v, tonumber(args[2]))
			print(string.format("Set %s's money to 0x%x dollars", v:Nick(), tonumber(args[2])))
		end
	end
end)

function SetMoney(ply, money)
	local query = string.format("UPDATE players SET money=%s WHERE id='%s'", money, ply:SteamID())
	sql.Query(query)
end

function GetMoney(ply)
	local query = string.format("SELECT money FROM players WHERE id='%s'", ply:SteamID())
	tbl = sql.Query(query)
	return tonumber(tbl[1].money)
end

function testprint(a, tbl)
	if type(tbl) ~= "table" then print("money", tbl) return end
	
	table.foreach(tbl, testprint)
end

function AddMoney(ply, amt)
	local cur = GetMoney(ply)
	SetMoney(ply, amt + cur)
end

timer.Create("payday", 4, 0, function()
	for k, v in pairs(player.GetAll()) do
		if v:Alive() then
			AddMoney(v, 1)
		end
	end
end)