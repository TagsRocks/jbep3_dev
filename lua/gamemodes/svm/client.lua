include( "shared.lua" )

function GM:GetIntroData( team )

	if( team == TEAM_SNAKE ) then

		return { 	
					Title = "#JB_SVM_Snake_IntroTitle",
					Description = "#JB_SVM_Snake_IntroDescription",
					Color = Color( 185, 220, 255 ),
					Models =
					{ 
						{ Model = "models/player/bigboss.mdl", Sequence = "StandAim_PISTOL", Weapon = "models/weapons/w_ruger.mdl" },
					}
				}

	end

	return { 	
				Title = "#JB_SVM_Monkey_IntroTitle",
				Description = "#JB_SVM_Monkey_IntroDescription",
				Color = Color( 255, 50, 50 ),
				Models =
				{ 
					{ Model = "models/player/ape.mdl", Sequence = "StandIdle_KNIFE" }
				}
			}

end