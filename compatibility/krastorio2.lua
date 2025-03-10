-- checking if mod doesn't exists
if not mods["Krastorio2"] then
    return
end

if not mods["Krastorio2Assets"] then
    nok2assets_launcher_png = "__Krastorio2__/graphics/icons/guns/heavy-rocket-launcher.png"
    nok2assets_launcher_ogg = "__Krastorio2__/sounds/weapons/rocket-launch.ogg"
else
    nok2assets_launcher_png = "__Krastorio2Assets__/icons/guns/heavy-rocket-launcher.png"
    nok2assets_launcher_ogg = "__Krastorio2Assets__/sounds/weapons/rocket-launch.ogg"
end

require "util"

local table_deepcopy = util.table.deepcopy
-- i tried to see if i can remove the vanilla spidertron burner
-- requirement in krastorio2 but i didn't work
if not settings.startup["disable-krastorio-spidertron-burner"].value then
    -- mk2 changes for krastorio2
    if not settings.startup["disable-spidertronmk2"].value then
        data.raw["spider-vehicle"]["spidertronmk2"].energy_source = {
            type = "burner",
            emissions_per_minute = 0,
            effectivity = 1,
            render_no_power_icon = true,
            render_no_network_icon = false,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            fuel_category = "fusion-fuel"
        }
        data.raw["spider-vehicle"]["spidertronmk2"].movement_energy_consumption = "3MW"
    end
    -- immolator changes for krastorio2
    if not settings.startup["disable-immolator"].value then
        data.raw["spider-vehicle"]["immolator"].energy_source = {
            type = "burner",
            emissions_per_minute = 0,
            effectivity = 1,
            render_no_power_icon = true,
            render_no_network_icon = false,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            fuel_category = "fusion-fuel"
        }
        data.raw["spider-vehicle"]["immolator"].movement_energy_consumption = "3MW"
    end
    -- mk3 changes for krastorio2
    if not settings.startup["disable-spidertronmk3"].value then
        data.raw["spider-vehicle"]["spidertronmk3"].energy_source = {
            type = "burner",
            emissions_per_minute = 0,
            effectivity = 1,
            render_no_power_icon = true,
            render_no_network_icon = false,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            fuel_category = "fusion-fuel"
        }
        data.raw["spider-vehicle"]["spidertronmk3"].movement_energy_consumption = "3MW"
    end
	-- spider builder changes for krastorio2
    if not settings.startup["disable-spidertron-builder"].value then
    data.raw["spider-vehicle"]["spidertron-builder"].energy_source = {
        type = "burner",
        emissions_per_minute = 0,
        effectivity = 1,
        render_no_power_icon = true,
        render_no_network_icon = false,
        fuel_inventory_size = 1,
        burnt_inventory_size = 1,
        fuel_category = "fusion-fuel"
    }
	data.raw["spider-vehicle"]["spidertron-builder"].movement_energy_consumption = "3MW"
    end
end

-- -- equipment grid changes
-- going to copy the grid equipment in final-fixes

-- tech changes
-- mk2 K2 tech
if not settings.startup["disable-spidertronmk2"].value then
    data.raw["technology"]["spidertronmk2-tech"].prerequisites = {
        "spidertron",
        "kr-energy-control-unit",
        "space-science-pack",
        "kr-advanced-tech-card"
    }
    data.raw["technology"]["spidertronmk2-tech"].unit = {
        count = 2500,
        ingredients = {
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"advanced-tech-card", 1}
        },
        time = 30
    }
end
-- immolator
if not settings.startup["disable-immolator"].value then
    data.raw["technology"]["immolator-tech"].prerequisites = {
        "spidertron",
        "kr-energy-control-unit",
        "space-science-pack",
        "kr-advanced-tech-card"
    }
    data.raw["technology"]["immolator-tech"].unit = {
        count = 2500,
        ingredients = {
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"advanced-tech-card", 1}
        },
        time = 30
    }
end

-- mk3 K2 tech
if not settings.startup["disable-spidertronmk3"].value then
    preqs = {
        "spidertron", 
        "kr-singularity-tech-card"
    }
    if not settings.startup["disable-spidertronmk2"].value then
        preqs = {
            "spidertronmk2-tech", 
            "kr-singularity-tech-card"
        }
    end
    data.raw["technology"]["spidertronmk3-tech"].prerequisites = preqs
    data.raw["technology"]["spidertronmk3-tech"].unit = {
        count = 2500,
        ingredients = {
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"advanced-tech-card", 1},
            {"singularity-tech-card", 1},
        },
        time = 30
    }
end
-- builder K2 tech
if not settings.startup["disable-spidertron-builder"].value then
    data.raw["technology"]["spidertron-builder-tech"].prerequisites = {
        "spidertron",
        "kr-energy-control-unit",
        "space-science-pack",
        "kr-advanced-tech-card"
    }
    data.raw["technology"]["spidertron-builder-tech"].unit = {
        count = 1000,
        ingredients = {
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"advanced-tech-card", 1}
        },
        time = 30
    }
end
-- krastorio heavy launcher for mk3
if not settings.startup["disable-spidertronmk3"].value then
    local spidertronmk3_heavy_rocket_launcher_item = {
        type = "gun",
        name = "spidertron-heavy-rocket-launcher",
        -- TODO Check properly that krastorio2assets is available
        -- since the assets are mandatory for k2 i will leave it like this
        icon = nok2assets_launcher_png,
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "gun",
        order = "d[spidertron-heavy-rocket-launcher]",
        attack_parameters =
        {
            type = "projectile",
            ammo_category = "heavy-rocket",
            movement_slow_down_factor = 0.75,
            cooldown = 180,
            projectile_creation_distance = 0.6,
            range = 90,
            projectile_center = {-0.17, 0},
            sound =
            {
                {
                    -- since the assets are mandatory for k2 i will leave it like this
                    filename = nok2assets_launcher_ogg,
                    volume = 1
                }
            }
        },
        stack_size = 5
    }

    -- i need to initialize this to add other data to it
    data:extend{
        spidertronmk3_heavy_rocket_launcher_item,
    }

    local spidertronmk3_heavy_rocket_launcher_2_item = table_deepcopy(data.raw["gun"]["spidertron-heavy-rocket-launcher"])
    spidertronmk3_heavy_rocket_launcher_2_item.name = "spidertron-heavy-rocket-launcher2"

    local spidertronmk3_heavy_rocket_launcher_3_item = table_deepcopy(data.raw["gun"]["spidertron-heavy-rocket-launcher"])
    spidertronmk3_heavy_rocket_launcher_3_item.name = "spidertron-heavy-rocket-launcher3"

    local spidertronmk3_heavy_rocket_launcher_4_item = table_deepcopy(data.raw["gun"]["spidertron-heavy-rocket-launcher"])
    spidertronmk3_heavy_rocket_launcher_4_item.name = "spidertron-heavy-rocket-launcher4"

    data:extend{
        -- spidertronmk3_heavy_rocket_launcher_item,
        -- i can't believe this worked
        spidertronmk3_heavy_rocket_launcher_2_item,
        spidertronmk3_heavy_rocket_launcher_3_item,
        spidertronmk3_heavy_rocket_launcher_4_item
    }
    -- mk3 new guns
    data.raw["spider-vehicle"]["spidertronmk3"].guns = {
        "spidertron-heavy-rocket-launcher", 
        "spidertron-heavy-rocket-launcher2", 
        "spidertron-heavy-rocket-launcher3", 
        "spidertron-heavy-rocket-launcher4"
    }
end


-- recipe changes
if not settings.startup["disable-spidertronmk2"].value then
    data.raw["recipe"]["spidertronmk2"].ingredients = {
        {"spidertron", 1},
        {"energy-control-unit", 50},
        {"speed-module-3", 30},
        {"effectivity-module-3", 30},
        {"low-density-structure", 150},
        {"fusion-reactor-equipment", 2}
    }
end

if not settings.startup["disable-immolator"].value then
    data.raw["recipe"]["immolator"].ingredients = {
        {"spidertron", 1},
        {"energy-control-unit", 50},
        {"speed-module-3", 30},
        {"effectivity-module-3", 30},
        {"low-density-structure", 150},
        {"fusion-reactor-equipment", 2}
    }
end

if not settings.startup["disable-spidertronmk3"].value then
    data.raw["recipe"]["spidertronmk3"].category = "crafting-with-fluid"
    local ingr = {
        {"spidertron",1},
        {"ai-core", 50},
        {"imersite-crystal", 25},
        -- {"fluid-nitric-acid", 125},
        {
            type="fluid", 
            name="nitric-acid", 
            amount=125, 
            catalyst_amount = 125
        },
        {"heavy-rocket-launcher", 4},
        {"imersium-plate", 100},
        {"fusion-reactor-equipment", 2}
    }
    -- if spidertronmk2 not disabled use this recipe
    if not settings.startup["disable-spidertronmk2"].value then
        ingr = {
            {"spidertronmk2", 1},
            {"ai-core", 50},
            {"imersite-crystal", 25},
            -- {"fluid-nitric-acid", 125},
            {
                type="fluid", 
                name="nitric-acid", 
                amount=125, 
                catalyst_amount = 125
            },
            {"heavy-rocket-launcher", 4},
            {"imersium-plate", 100},
            {"fusion-reactor-equipment", 2}
        }
    end
    data.raw["recipe"]["spidertronmk3"].ingredients = ingr
end



if not settings.startup["disable-spidertron-builder"].value then
    if settings.startup["kr-containers"].value then
        data.raw["recipe"]["spidertron-builder"].ingredients = {
            {"ai-core", 1},
            {"rocket-control-unit", 16},
            {"low-density-structure", 150},
            {"productivity-module-3", 2},
            {"kr-medium-container", 10},
            {"construction-robot", 50},
            {"radar", 5}
        }
    else
        data.raw["recipe"]["spidertron-builder"].ingredients = {
            {"ai-core", 1},
            {"rocket-control-unit", 16},
            {"low-density-structure", 150},
            {"productivity-module-3", 2},
            {"steel-chest",10},
            {"construction-robot", 50},
            {"radar", 5}
        }
    end
end