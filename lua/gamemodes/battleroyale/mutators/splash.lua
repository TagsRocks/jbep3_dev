local mutator = {}

mutator.Base = "default"
mutator.Name = "Splash Damage"
mutator.Description = "NO DIRECT DAMAGE, SPLASH DAMAGE ONLY"

mutator.ItemPool = { "weapon_shockrifle" }

function mutator:RoundStart()
	FindConVar( "jb_wep_shock_exp_radius" ):SetValue( 0 )
	FindConVar( "jb_wep_shock_exp_dmg" ):SetValue( 0 )
	FindConVar( "jb_wep_shock_dmg" ):SetValue( 1 ) -- Needs to be 1 to get tracers appearing...
end

function mutator:RoundEnd()
	FindConVar( "jb_wep_shock_exp_radius" ):Revert()
	FindConVar( "jb_wep_shock_exp_dmg" ):Revert()
	FindConVar( "jb_wep_shock_dmg" ):Revert()
end

function mutator:OnWeaponAssigned( pl, weap )
	if( weap ) then
		weap:AddCondition( JB_WEAPON_CONDITION_INFINITE_MAGAZINE )
	end
end

mutators:Register( "splash", mutator )

