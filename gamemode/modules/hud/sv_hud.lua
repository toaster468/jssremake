util.AddNetworkString("updatehud")

concommand.Add("updatehud", function(ply, cmd, args)
	net.Start("updatehud")
		net.WriteUInt(GetMoney(ply), 32)
	net.Send(ply)
end)