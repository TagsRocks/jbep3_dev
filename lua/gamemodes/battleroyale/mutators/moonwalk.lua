local mutator = {}

mutator.Base = "default"
mutator.Name = "#JB_BR_RoundTypeMoonwalk_Title"
mutator.Description = "#JB_BR_RoundTypeMoonwalk_Desc"

function mutator:PlayerSpawned( pl )
	pl:DisableButtons( IN_FORWARD )
	Msg("Disabling in_forward on " .. pl:GetPlayerName() .. "\n")
end

function mutator:PlayerKilled( pl, info )
	pl:EnableButtons( IN_FORWARD )
end

function mutator:PlayerWon( pl )
	-- reenable buttons for all players
	for k, v in pairs( player.GetAll() ) do
		v:EnableButtons( IN_FORWARD )
	end
end

mutators:Register( "moonwalk", mutator )