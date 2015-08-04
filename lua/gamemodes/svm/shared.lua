GM.Name = "Snake vs Monkeys"
GM.Description = [[One or a number of Snakes are selected at random, it is their objective to survive endless waves of monkeys until the round timer expires. Snakes spawn with a Ruger and explosives, they cannot respawn.

The rest of the players in the game spawn as monkeys and have infinite lives. They must kill Snake.]]

GM.Developer = "Team BBB"
GM.TeamPlay = true

TEAM_SNAKE = 2
TEAM_MONKEY = 3

SVM_CVAR_FLAGS = FCVAR_NOTIFY + FCVAR_REPLICATED

GM.Cvars = {}

-- Monkey cvars
GM.Cvars.MinMonkeySpeed = CreateConVar( "sv_svm_monkey_speed_min", "0.85", SVM_CVAR_FLAGS )
GM.Cvars.MaxMonkeySpeed = CreateConVar( "sv_svm_monkey_speed_max", "0.9", SVM_CVAR_FLAGS )
GM.Cvars.MonkeyScale = CreateConVar( "sv_svm_monkey_scale", "0.65", SVM_CVAR_FLAGS )
GM.Cvars.MonkeyHealth = CreateConVar( "sv_svm_monkey_health", "40", SVM_CVAR_FLAGS )

-- Snake cvars
GM.Cvars.SnakesPerTurn = CreateConVar( "sv_svm_snakes_per_turn", "2", SVM_CVAR_FLAGS )

-- Round cvars
GM.Cvars.RoundTime = CreateConVar( "sv_svm_round_time", "90", SVM_CVAR_FLAGS )

-- Set up teams in here
function GM:InitTeams()
	team.Register( TEAM_SNAKE, "#JB_Team_Snake", Color( 185, 220, 255 ), { "jb_spawn_svt_snake" } )
	team.Register( TEAM_MONKEY, "#JB_Team_Monkey", Color( 255, 50, 50 ), { "jb_spawn_all", "jb_spawn_svt_terrorist" } )
end

-- Sound Overrides
function GM:OverridePlayerSound( pl, sound )
	if( pl:GetTeamNumber() == TEAM_MONKEY ) then
		local sSoundName = sound:GetSoundName()

		if ( sSoundName == "JB.Death" or sSoundName == "JB.Taunt" or sSoundName == "Weapon_Cash.Throw" ) then
			sound:SetSoundName( "JB.MonkeyRandom" )
		end
	end
end