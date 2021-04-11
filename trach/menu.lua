local M = {}
M.load = function ()
    startScreen = love.graphics.newImage("start.png")
end
M.draw = function ()
    love.graphics.draw(startScreen, 0,0,0,1,1,0,0)
end
return M