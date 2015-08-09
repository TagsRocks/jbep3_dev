local mutator = {}

mutator.Base = "default"
mutator.Name = "#JB_BR_RoundTypeMoonwalk_Title"
mutator.Description = "#JB_BR_RoundTypeMoonwalk_Desc"

function mutator:PlayerSpawned( pl )
	pl:DisableButtons( IN_FORWARD )
	pl:DisableButtons( IN_LEFT )
	pl:DisableButtons( IN_RIGHT )
	Msg("Disabling in_forward on " .. pl:GetPlayerName() .. "\n")
end

function mutator:PlayerKilled( pl, info )
	pl:EnableButtons( IN_FORWARD )
	pl:EnableButtons( IN_LEFT )
	pl:EnableButtons( IN_RIGHT )
end

function mutator:PlayerWon( pl )
	-- reenable buttons for all players
	for k, v in pairs( player.GetAll() ) do
		v:EnableButtons( IN_FORWARD )
		v:EnableButtons( IN_LEFT )
		v:EnableButtons( IN_RIGHT )
	end
end

mutators:Register( "moonwalk", mutator )