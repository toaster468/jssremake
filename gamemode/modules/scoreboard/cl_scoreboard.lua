function GM:ScoreboardShow() 

	open = true
end

function GM:ScoreboardHide()
	open = false
end

playerdata = {}

surface.CreateFont("scoreboard", {
	font = "Default",
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = true
})

title = "Mini-Games - Jo The Shmo"

teams = {
	"Dead",
	"Blue",
	"Red"
}

net.Receive("updatesb", function()
	playerdata = {}
	for i = 1, net.ReadUInt(32) do
		table.insert(playerdata, net.ReadTable())
		--table.foreach(playerdata[i], print)
	end
end)

function findinfo(ply)
	cur = {}

	for k, v in pairs(playerdata) do
		if v.name == ply:Nick() then
			cur = v
			break
		end	
	end
	
	return cur
end

hook.Add("PostDrawHUD", "test", function()
	if not open then return end
	RunConsoleCommand("updatesb") 
	
	width = ScrW() / 3
	centerx = (ScrW() + width) / 2
	
	surface.SetDrawColor(Color(52, 152, 219, 200))
	surface.DrawRect(ScrW() - centerx, 32, width, 128)
	draw.SimpleText(GetHostName(), "DermaLarge", ScrW() - (centerx - width / 2), 152 - 48, Color(255, 255, 255), 1, 1)
	draw.SimpleText(title, "DermaLarge", ScrW() - (centerx - width / 2), 152 - 20, Color(255, 255, 255), 1, 1)
	
	local X = ScrW() - centerx
	
	local row = 5
	
	surface.SetDrawColor(Color(76, 75, 72, 240))
	surface.DrawRect(ScrW() - centerx, 32 * row, width, 32)
	draw.SimpleText("Name", "ChatFont", width + 32, (32 * row) + 16, Color(255, 255, 255), 0, 1)
	draw.SimpleText("Money", "ChatFont", width + X - 196, (32 * row) + 16, Color(255, 255, 255), 0, 1)
	draw.SimpleText("Wins", "ChatFont", width + X - 32, (32 * row) + 16, Color(255, 255, 255), 2, 1)
	
	row = 6
	local i = 1
	
	for t = 1, 3 do
		surface.SetDrawColor(team.GetColor(t))
		surface.DrawRect(ScrW() - centerx, 32 * row, width, 32)
		draw.SimpleText(string.format("%s (%s Players)", teams[t], #team.GetPlayers(t)), "ChatFont", ScrW() - (centerx - width / 2), (32 * row) + 16, Color(255, 255, 255), 1, 1)
		row = row + 1
		
		
		for k, v in pairs(team.GetPlayers(t)) do
			local teamcolor = team.GetColor(v:Team())
			surface.SetDrawColor(Color(149, 165, 166, 160))
			surface.DrawRect(ScrW() - centerx, 32 * row, width, 32)
			draw.SimpleText(findinfo(v).name or "", "ChatFont", width + 32, (32 * row) + 16, teamcolor, 0, 1)
			draw.SimpleText(findinfo(v).money or "", "ChatFont", width + X - 196, (32 * row) + 16, teamcolor, 0, 1)
			draw.SimpleText(findinfo(v).wins or "", "ChatFont", width + X - 32, (32 * row) + 16, teamcolor, 2, 1)
			row = row + 1
			i = i + 1 
		end
	end
end)