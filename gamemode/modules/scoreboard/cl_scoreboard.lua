function GM:ScoreboardShow() 
	open = true
end

function GM:ScoreboardHide()
	open = false
end

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

hook.Add("PostDrawHUD", "test", function()
	if open ~= true then return end
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
	
	for t = 1, 3 do
		surface.SetDrawColor(team.GetColor(t))
		surface.DrawRect(ScrW() - centerx, 32 * row, width, 32)
		draw.SimpleText(string.format("%s (%s Players)", teams[t], #team.GetPlayers(t)), "ChatFont", ScrW() - (centerx - width / 2), (32 * row) + 16, Color(255, 255, 255), 1, 1)
		row = row + 1
		
		for k, v in pairs(team.GetPlayers(t)) do
			surface.SetDrawColor(Color(149, 165, 166, 160))
			surface.DrawRect(ScrW() - centerx, 32 * row, width, 32)
			draw.SimpleText(v:Nick(), "ChatFont", width + 32, (32 * row) + 16, Color(255, 255, 255), 0, 1)
			draw.SimpleText("100", "ChatFont", width + X - 196, (32 * row) + 16, Color(255, 255, 255), 0, 1)
			draw.SimpleText("0", "ChatFont", width + X - 32, (32 * row) + 16, Color(255, 255, 255), 2, 1)
			row = row + 1
		end
	end
end)