local mutator = {}

mutator.Base = "default"
mutator.Name = "#JB_BR_RoundTypeBatterUp_Title"
mutator.Description = "#JB_BR_RoundTypeBatterUp_Desc"

mutator.ItemPool = { "weapon_rocketcrowbar" }

function mutator:RoundStart()
	FindConVar( "jb_sv_impact_wallspeed" ):SetValue( 100 )
	FindConVar( "jb_sv_impact_ceilspeed" ):SetValue( 30 )
	FindConVar( "jb_sv_impact_damage" ):SetValue( 125 )
	FindConVar( "jb_wep_rcrowbar_force_other_player" ):SetValue( 35)
end

function mutator:RoundEnd()
	FindConVar( "jb_sv_impact_wallspeed" ):Revert()
	FindConVar( "jb_sv_impact_ceilspeed" ):Revert()
	FindConVar( "jb_sv_impact_damage" ):Revert()
	FindConVar( "jb_wep_rcrowbar_force_other_player" ):Revert()
end

function mutator:OnWeaponEquipped( pl, weap )
	if( weap and weap:GetClassname() == "weapon_rocketcrowbar" ) then
		weap:AddCondition( JB_WEAPON_CONDITION_NO_SECONDARY )
	end
end

function mutator:ScaleHitboxDamage( pl, hitbox, info )

	if( info:HasDamageType( DMG_CLUB ) ) then
		info:SetDamage( 0.0 )
		return true
	end

	-- scale up wall, ceiling and fall damage
	if( info:HasDamageType( DMG_FALL ) ) then
		info:ScaleDamage( 4.0 )
		return true
	end
 
	return false
	
end

mutators:Register( "batterup", mutator )

