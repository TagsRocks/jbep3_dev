local mutator = {}
local nextFreeze = 0
local currentlyFrozen = false
local nextAnnounce = 0
local maxFreezeDelay = 15
local maxFreezeDuration = 4

mutator.Base = "default"
mutator.Name = "Red Light, Green Light"
mutator.Description = "Periodic player freezing."

mutator.PlayerConditions = { }

function mutator:RoundStart()
	nextFreeze = CurTime() + 5
	currentlyFrozen = false
	nextAnnounce = 3
end

function mutator:RoundEnd()
	lockAllPlayers( false )
end

function mutator:Think()

	-- Alternate between freeze/unfreeze
	if CurTime() > nextFreeze then
		currentlyFrozen = not currentlyFrozen
		lockAllPlayers( currentlyFrozen )
		nextAnnounce = 3

		-- Longer delays between freezing
		if currentlyFrozen then
			nextFreeze = CurTime() + 3 + ( math.random() * maxFreezeDuration )
		else
			nextFreeze = CurTime() + 3 + ( math.random() * maxFreezeDelay )
		end
	end

	-- Check for announcements
	if nextFreeze - CurTime() < nextAnnounce and nextAnnounce > 0 then
		game.BroadcastSound( 0, "JB." .. nextAnnounce )
		nextAnnounce = nextAnnounce - 1
	end 

end

function lockAllPlayers( bLock )
	for _, v in ipairs( player.GetAll() ) do
		if bLock then
			v:AddCondition( JB_CONDITION_LOCKED )
			v:AddCondition( JB_CONDITION_LOCKED_VIEW )		
			v:AddCondition( JB_CONDITION_NODIVE )		
		else
			v:RemoveCondition( JB_CONDITION_LOCKED )
			v:RemoveCondition( JB_CONDITION_LOCKED_VIEW )		
			v:RemoveCondition( JB_CONDITION_NODIVE )		
		end
	end
end

mutators:Register( "redlightgreenlight", mutator )
