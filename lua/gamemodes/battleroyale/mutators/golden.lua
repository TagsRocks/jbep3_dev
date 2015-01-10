local mutator = {}

mutator.Base = "default"
mutator.Name = "#JB_BR_RoundTypeGolden_Title"
mutator.Description = "#JB_BR_RoundTypeGolden_Desc"

mutator.ItemPool = {}

mutators:Register( "golden", mutator )

function mutator:OnWeaponAssigned( pl, weap )
	local fists = pl:Weapon_OwnsThisType( "weapon_fists" )
	
	if not fists then
		fists = pl:GiveNamedItem( "weapon_fists" )
	end
	
	if( fists ) then
		fists:AddCondition( JB_WEAPON_CONDITION_GOLDEN )
		pl:Weapon_Switch( fists )
	end
end

function mutator:ScaleHitboxDamage( pl, hitbox, info )

	info:AddDamageType( DMG_GOLDENGUN )
	info:ScaleDamage( 1000 )
	
	return true
	
end