local mutator = {}

mutator.Base = "default"
mutator.Name = "Boomerangs"
mutator.Description = "Boomerangs"

mutator.ItemPool = { "weapon_boomerang" }
mutator.PlayerConditions = { JB_CONDITION_INFINITE_AMMO }

mutators:Register( "boomerangs", mutator )

