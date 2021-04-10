love.load = function ()
    startScreen = love.graphics.newImage("start.png")
end
love.draw=function ()
            love.graphics.draw(startScreen, 0,0,0,1,1,0,0)     
end