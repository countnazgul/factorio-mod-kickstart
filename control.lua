require "config"

script.on_event(defines.events.on_player_created, function(event)
    commands.add_command("kickstart", "Kickstart your game", function()
        local player = game.players[event.player_index]

        for _, tech in ipairs(STARTING_TECHNOLOGIES) do
            player.force.technologies[tech].researched = true
            game.print("Kickstart MOD -> Tech researched:" .. tech)
        end

        local character = player.character or player.cutscene_character
        for _, item in pairs(STARTING_ITEMS) do
            character.insert { name = item[1], count = item[2] }
            game.print("Kickstart MOD -> Item added: " .. item[1])
        end
    end)
end)
