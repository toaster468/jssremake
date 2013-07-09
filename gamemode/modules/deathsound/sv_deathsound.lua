sounds = {
	"physics/body/body_medium_break3.wav",
	"physics/body/body_medium_break3.wav",
	"physics/body/body_medium_break4.wav",
	"vo/canals/arrest_stop.wav",
	"vo/Citadel/al_soldiers01_b.wav",
	"physics/plaster/ceiling_tile_impact_bullet1.wav",
	"player/pl_fallpain3.wav",
	"ambient/materials/cupdrop.wav"
	--Add more later
}

hook.Add("PlayerDeath", "deathsound", function(ply)
	ply:EmitSound(sounds[math.random(#sounds)], 500, 100)
end)