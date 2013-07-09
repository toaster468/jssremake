concommand.Add("taunt", function(ply, cmd, args)
	ply:EmitSound(taunts[#taunts], 500, 100)
end)