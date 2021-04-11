love.load = function ()
    startScreen = love.graphics.newImage("start.png")
    WorldState = 1
    -- 1 = menu 2 = game 3 = tutorial--
    worldLoadFunktions = {
        require("menu").load,
        require("game").load
    }
    worldDrawFunktions = {
        require("menu").draw,
        require("game").draw
    }

    worldUpdateFunktions = {
        function () end,
        require("game").update
        
    }
    worldMousFunktions

end

love.draw = function ()
    worldDrawFunktions[WorldState]()     
end

love.update = function (dt)
    worldUpdateFunktions[WorldState](dt)
end
love.mousepressed = function(x, y, button, istouch)
    if button == 1 then 
        if x > 263 and x < 537 and y > 150 and y < 236 then
            -- love.event.quit()
            worldState = 2
            worldLoadFunktions[worldState]()
        end
        if x > 238 and x < 624 and y > 250 and y < 336 then
            love.event.quit()
            worldState = 2
        end
    end
end