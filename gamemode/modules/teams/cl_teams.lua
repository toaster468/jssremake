print("cl_teams")

hook.Add("PlayerSpawn", "tellteam", function()
	print("Team", LocalPlayer():Team())
	print("^ Team")
end)