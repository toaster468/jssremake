util.AddNetworkString("updatesb") 

concommand.Add("updatesb", function(ply, cmd, args)
	net.Start("updatesb")
		net.WriteUInt(#player.GetAll(), 32)
	
		for k, v in pairs(player.GetAll()) do
			net.WriteTable({name = v:Nick(), money = GetMoney(v) or 0, wins = v.wins or 0})
		end
	net.Broadcast()
end)
