last = {
	--name, time
}

function GetInventory(ply)
	--query = "CREATE TABLE players ( id varchar(255), timeplayed int, money int, inv longtext )"
	local query = "SELECT inv FROM players WHERE id='" .. ply:SteamID() .. "'"
	local inventory = sql.Query(query)

	if inventory == nil or inventory == false then
		SetInventory(ply, {items = 0, trafficcone = 0})
	end
	
	--table.foreach(inventory[1], print)
	
	--testprint(0, inventory)
	ply.inventory = inventory
	return inventory[1]
end

function SetInventory(ply, inv)
	local inventory = glon.encode(inv)
	print("SETTING INV", inventory)
	local q = "SELECT FIRST(id) FROM players"
	r = sql.Query(q)
	print("ID", r)
	local query = string.format("UPDATE players SET inv='%s' WHERE id='%s'", inventory, ply:SteamID())
	print(query)
	r = sql.Query(query)
end

hook.Add("PlayerDeath", "testinv", function(ply)
	GetInventory(ply)
end)

function testprint(a, tbl)
	if type(tbl) ~= "table" then print(tbl) return end
	
	table.foreach(tbl, testprint)
end

concommand.Add("requestinv", "request", function(ply, cmd, args)
	--if last[ply:Nick()] ~= nil or last[ply:Nick()] < 10 then return end
	
	net.Start("inv")
		net.WriteTable(inventory[1])
	net.Send(ply)
end)