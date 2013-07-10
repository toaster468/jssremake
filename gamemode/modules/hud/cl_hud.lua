local teams = {
	"Dead",
	"Blue",
	"Red"
}

local moneylabels = {
	"Cookies",
	"Dosh",
	"Dollars",
	"Llamas",
	"Twinkies",
	"Coins",
	"Moneh",
	"toasters"
}

msg = "Type 'maplist' or 'songlist' to see a list of the maps or songs printer in your console.\nRemember, you can type 'RTV' in chat to vote for the map change!\n\nHey! Welcome to Jo's Sexy Server. Gamemode and admin mod by Jo The Shmo. Some maps by Pez."

local current = 1

local money = 0

net.Receive("updatehud", function()
	money = net.ReadUInt(32)
end)

timer.Create("changelabel", 15, 0, function()
	current = math.random(1, #moneylabels)
end)

timer.Create("updatehud", 1, 0, function() 
	RunConsoleCommand("updatehud")
end)

surface.CreateFont("hudtext", {
	font = "ChatFont",
	size = 24,
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
	outline = false
})

surface.CreateFont("deadtext", {
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

function GM:HUDShouldDraw(name)
	if name == "CHudHealth" then
		return false
	else
		return true
	end
end

hook.Add("HUDPaint", "drawhud", function()
	--[[
		Health
	]]
	if LocalPlayer():Alive() then
		draw.RoundedBox(6, 32, ScrH() - (48 + 32), 272, 48, Color(149, 165, 166))
		draw.RoundedBox(6, 32 + 4,  ScrH() - (48 + 32 - 4), math.max(0, (272 - 8) * LocalPlayer():Health() / 100), 48 - 8, Color(231, 76, 60))
		draw.SimpleText("%" .. LocalPlayer():Health(), "hudtext", 32 + (272 / 2),  ScrH() - (48 + 32)+ 24, Color(189, 195, 199), 1, 1)
	else
		local i = 0
		
		for line in string.gmatch(msg, "%C+") do
			draw.SimpleText(line, "ChatFont", 96 + 272, (ScrH() - (ScrH() / 8)) - 24 * i, Color(189, 195, 199), 0, 1)
			i = i + 1
		end
	end
	
	--[[
		Team
	]]
	draw.RoundedBox(6, 32, ScrH() - (48 + 32) - 48 - 8, 128, 48, Color(149, 165, 166))
	draw.RoundedBox(6, 32 + 4, ScrH() + 4 - (48 + 32) - 48 - 8, 120, 40, team.GetColor(LocalPlayer():Team()))
	draw.SimpleText(teams[LocalPlayer():Team()], "hudtext", 32 + 64, ScrH() - (48 + 32) - 32, Color(189, 195, 199), 1, 1)
	
	--[[
		Team score
	]]
	draw.RoundedBox(6, 32 + 16 + 128, ScrH() - (48 + 88), 128, 48, Color(149, 165, 166))
	draw.RoundedBox(6, 32 + 16 + 128 + 4, ScrH() + 4 - (48 + 88), 120, 40, Color(106, 97, 101, 200))
	draw.SimpleText(string.format("Wins: %x", team.GetScore(LocalPlayer():Team())), "hudtext", (32 + 16 + 128) + 64, ScrH() - (48 + 64), Color(189, 195, 199), 1, 1)
	
	--[[
		Money
	]]
	draw.RoundedBox(6, 32, ScrH() - (48 + (32 * 2) + 64  +16), 272, 48, Color(149, 165, 166))
	draw.RoundedBox(6, 32 + 4, ScrH() + 4 - (48 + (32 * 2) + 64  +16), 272 - 8, 40, Color(106, 97, 101, 200))
	draw.SimpleText(string.format("%s: %s", moneylabels[current], money), "hudtext", 32 + (272 / 2), ScrH() - (48 + (32 * 2) + 64  +16) + 24, Color(189, 195, 199), 1, 1)
end)