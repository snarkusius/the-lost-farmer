world = {
    ["framerate"]= 0,
    ["framerateUpdate"]= 1,
    ["frameratePositionX"]= 10,
    ["frameratePositionY"]= 10,
    ["time"]= 1
}

farmer = {
    ["movmentX"]= 0,
    ["movmentY"]= 0,
    ["positionX"]= 400,
    ["positionY"]= 300,
    ["farmerSize"]= 20,
    ["sped"]= 100,
    ["handY"]= 200,
    ["handX"]= 300,
    ["handSize"]= 10,
    ["hand_distens"]= 30,
    ["isHand"]= false,
    ["HandAbelToHit"]= true,
    ["handAngel"]= 0,
    ["handAngelSpeed"]= 10,
    ["handSvingDistens"] = math.pi,
    ["handSvingMiddel"] = 0,
}


objects = {
    {
        ["type"] = "trees",
        ["color"] = {0.5, 0.8, 0},
        {["x"] = 50 ,["y"] = 50 ,["size"]=20 ,["helth"]= 4},
        {["x"] = 100,["y"] = 100,["size"]=30 ,["helth"]= 4}
    }
}
items = {
    {
        ["type"] = "wood",
        ["color"] = {0.5 ,0.2,0},
        {["x"] = 50,["y"] = 200,["size"]=20,["amount"]= 4},
    },
    {
        ["type"] = "sten",
        ["color"] = {1 ,1,1},
        {["x"] = 100,["y"] = 200,["size"]=20,["amount"]= 4},
    }
}

cirkleKolider = function (positionx,positiony,size,table)
    for index, value in ipairs(table) do
        if distansBetwen(positiony,positionx,table[index].x,table[index].y) < (size + table[index].size) then
            -- print(distansBetwen(positiony,positionx,table[index].x,table[index].y))
            -- print(size + table[index].size)
            return index
        end
    end
    return false
end
distansBetwen = function (firstX,firstY,sekonX,sekondY)
    return math.sqrt(((firstX-sekonX)*(firstX-sekonX))+((firstY-sekondY)*(firstY-sekondY)))
 
 end

    
    love.keypressed = function (key)
        --farmer key preses--
        if key == "w" then
                farmer.movmentY = 1 - farmer.sped
        end
        if key == "s" then
                farmer.movmentY = farmer.sped
        end
        if key == "a" then
                farmer.movmentX = 1 - farmer.sped
        end
        if key == "d" then
                farmer.movmentX = farmer.sped
        end
    end
    love.keyreleased =function (key)
        if key == "w" then
            farmer.movmentY = 0
        end
         if key == "s" then
            farmer.movmentY = 0
        end
        if key == "a" then
            farmer.movmentX = 0
        	end
        if key == "d" then
            farmer.movmentX = 0
        end
    end
    function love.mousepressed(x, y, button, istouch)
        if button == 1 and farmer.isHand == false then 
            if farmer.positionX < x then
                farmer.handSvingMiddel = math.atan((y - farmer.positionY)/(x - farmer.positionX ))
                farmer.isHand = true
                farmer.handAngel = farmer.handSvingMiddel - farmer.handSvingDistens/2 
            end
            if farmer.positionX > x then
                farmer.handSvingMiddel = math.pi + math.atan((y - farmer.positionY)/(x - farmer.positionX ))
                farmer.isHand = true
                farmer.handAngel = farmer.handSvingMiddel - farmer.handSvingDistens/2 
            end
            farmer.HandAbelToHit = true
    
        end
     end

love.update = function (deltaTime)
    world.time = world.time + deltaTime
    if world.time > world.framerateUpdate then
        world.framerate = math.floor(1/deltaTime)
        world.time=0
    end
    -- world.framerate = math.floor(1/deltaTime)
    --farmer kolition och movment--
    for index, value in ipairs(objects) do
        if cirkleKolider((farmer.positionX + (farmer.movmentX * deltaTime)),(farmer.positionY + (farmer.movmentY * deltaTime)),farmer.farmerSize,objects[index]) == false then
            farmer.positionX = farmer.positionX + (farmer.movmentX * deltaTime)
            farmer.positionY = farmer.positionY + (farmer.movmentY * deltaTime)
        end
    end

    --hand--
    if farmer.isHand then
        farmer.handX = farmer.positionX + (math.cos(farmer.handAngel) * farmer.hand_distens)
        farmer.handY = farmer.positionY + (math.sin(farmer.handAngel) * farmer.hand_distens)
        farmer.handAngel = farmer.handAngel + (farmer.handAngelSpeed * deltaTime)
        if farmer.handAngel > farmer.handSvingMiddel + farmer.handSvingDistens/2 then
            farmer.isHand = false
        end
        --hand kolition--
        for index, value in ipairs(objects) do
            if cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index]) ~= false and farmer.HandAbelToHit == true then
                farmer.HandAbelToHit = false
                objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].helth = objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].helth - 1
                if objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].helth <= 0 then
                    items[1][1].x = 60
                    -- objects.trees[cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects.trees)] = nil
                    table.remove(objects[index],cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index]))
                end
            end
        end
        
    end
end

love.draw=function ()
    love.graphics.setBackgroundColor( 0.3, 0.5, 0, 1 )
    
    --drawing farmer--
    love.graphics.setColor(1, 1, 0)
    love.graphics.circle("fill", farmer.positionX, farmer.positionY, farmer.farmerSize)
    love.graphics.setColor(0.5, 0.5, 0)
    love.graphics.circle("fill", farmer.positionX, farmer.positionY, farmer.farmerSize / 2)
    --hand--
    if farmer.isHand then
        love.graphics.setColor(0.5, 0, 0)
        love.graphics.circle("fill", farmer.handX, farmer.handY, farmer.handSize)
    end
    --draw treas--
    for index, value in ipairs(objects) do
        love.graphics.setColor(objects[index].color[1], objects[index].color[2], objects[index].color[3])
        for index2, value in ipairs(objects[index]) do
            love.graphics.circle("fill", objects[index][index2].x , objects[index][index2].y , objects[index][index2].size )
        end
    end
    --draw items--
    for index, value in ipairs(items) do
        love.graphics.setColor(items[index].color[1], items[index].color[2], items[index].color[3])
        for index2, value in ipairs(items[index]) do
            love.graphics.circle("fill", items[index][index2].x , items[index][index2].y , items[index][index2].size)
        end
    end
    
    --overlais--
    love.graphics.setColor(1, 1, 1)
    love.graphics.print( world.framerate, world.frameratePositionX, world.frameratePositionY)
end