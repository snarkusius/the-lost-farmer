love.load = function ()
    world = {
        ["framerate"]= 0,
        ["framerateUpdate"]= 1,
        ["frameratePositionX"]= 10,
        ["frameratePositionY"]= 10,
        ["time"] = 1,
        ["music"] = love.audio.newSource("sound/PatakasWorld.wav" , "stream")
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
        ["hasKolided"] = false
    }
    
    objectPropeties = {
        {
            ["type"] = "wood",
            ["color"] = {1, 1, 1},
            ["offset"] = 5,
            ["sprite"] = love.graphics.newImage("Assets/tree.png"),
            ["spawnRateat"] = 0.5,
            ["spawnChanse"] = 10,
            ["dropAmount"] = 3
        },
        {
            ["type"] = "stone",
            ["color"] = {1, 1, 1},
            ["offset"] = 15,
            ["sprite"] = love.graphics.newImage("Assets/stone.png"),
            ["spawnRateat"] = 0.5,
            ["spawnChanse"] = 10,
            ["dropAmount"] = 3
        },
        {
            ["type"] = "corn",
            ["color"] = {1, 1, 1},
            ["offset"] = 10,
            ["sprite"] = love.graphics.newImage("Assets/majs.png"),
            ["spawnRateat"] = 0.5,
            ["spawnChanse"] = 10,
            ["dropAmount"] = 3,
            ["dropSprite"] = love.graphics.newImage("Assets/drops/majskolv.png")
        }
    }
    
    objects = {
        {
            ["type"] = "wood",
            ["color"] = {1, 1, 1},
            ["offset"] = 5,
            ["sprite"] = love.graphics.newImage("Assets/tree.png"),
            ["drotype"] = "wood",
            {["x"] = 50 ,["y"] = 50 ,["size"]=10 ,["health"]= 4 ,["amount"] = 5 },
            {["x"] = 100 ,["y"] = 100,["size"]=10 ,["health"]= 4 ,["amount"] = 5}
        },
        {
            ["type"] = "stone",
            ["color"] = {1, 1, 1},
            ["offset"] = 15,
            ["sprite"] = love.graphics.newImage("Assets/stone.png"),
            {["x"] = 500 ,["y"] = 50 ,["size"]=15 ,["health"]= 4 ,["amount"] = 5},
            {["x"] = 100,["y"] = 500,["size"]=15 ,["health"]= 4 ,["amount"] = 5}
        },
        {
            ["type"] = "corn",
            ["color"] = {1, 1, 1},
            ["offset"] = 10,
            ["sprite"] = love.graphics.newImage("Assets/majs.png"),
            ["dropAmount"] = 3,
            {["x"] = 400 ,["y"] = 50 ,["size"]=10 ,["health"]= 4 ,["amount"] = 5},
            {["x"] = 200,["y"] = 500,["size"]=10 ,["health"]= 4 ,["amount"] = 5}
        }
    }
    
    items = {
        {
            ["type"] = "wood",
            ["color"] = {1 ,1,1},
            ["dropSprite"] = love.graphics.newImage("Assets/drops/log.png"),
            {["x"] = 50,["y"] = 200,["size"]=10,["amount"]= 4},
        },
        {
            ["type"] = "stone",
            ["color"] = {1,1,1},
            ["dropSprite"] = love.graphics.newImage("Assets/drops/stonePeas.png"),
            {["x"] = 100,["y"] = 200,["size"]=10,["amount"]= 4},
        },
        {
            ["type"] = "corn",
            ["color"] = {1,1,1},
            ["dropSprite"] = love.graphics.newImage("Assets/drops/majskolv.png"),
            {["x"] = 100,["y"] = 600,["size"]=10,["amount"]= 4},
        }
    }
    inventory = {
        ["inventoryOutputString"] = "",
        ["outputPosisionX"] = 750,
        ["outputPosisionY"] = 50,
        {
            ["type"] = "wood",
            ["amount"] = 0,
            ["icon"] = love.graphics.newImage("Assets/drops/majskolv.png")
        },
        {
            ["type"] = "stone",
            ["amount"] = 0,
            ["icon"] = love.graphics.newImage("Assets/drops/majskolv.png")
        },
        {
            ["type"] = "corn",
            ["amount"] = 0,
            ["icon"] = love.graphics.newImage("Assets/drops/majskolv.png")
        }
        }
    world.music:play()
    world.music:setLooping(true)
    world.music:setVolume(0.3)
    -- love.window.setFullscreen( true )
end


InventoryToString = function (table)
    local newString = ""
    for index, value in ipairs(table) do
       newString = newString .. table[index]["type"] .. " " .. tostring(table[index]["amount"]) .. "\n"
    end
    return newString
end

cirkleKolider = function (positionx,positiony,size,table)
    for index, value in ipairs(table) do
        if distansBetwen(positionx,positiony,table[index].x,table[index].y) < (size + table[index].size) then
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
        if key == "escape" then
            love.event.quit()
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
    inventory.inventoryOutputString = InventoryToString(inventory)
    world.time = world.time + deltaTime
    if world.time > world.framerateUpdate then
        world.framerate = math.floor(1/deltaTime)
        world.time=0
    end
    --farmer kolition and movment--
    farmer.hasKolided = false
    for index, value in ipairs(objects) do
        if cirkleKolider((farmer.positionX + (farmer.movmentX * deltaTime)),(farmer.positionY + (farmer.movmentY * deltaTime)),farmer.farmerSize,objects[index]) ~= false then
            farmer.hasKolided = true
        end
        
    end
    if farmer.hasKolided == false then
        farmer.positionX = farmer.positionX + (farmer.movmentX * deltaTime)
        farmer.positionY = farmer.positionY + (farmer.movmentY * deltaTime)
    end
    farmer.hasKolided = false

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
                objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].health = objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].health - 1
                if objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].health <= 0 then
                    for index2, value in ipairs(items) do
                        if items[index2].type == objects[index].type then

                            table.insert(items[index2], 
                            {["x"] = objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].x,
                             ["y"] = objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].y,
                             ["size"]=10,
                             ["amount"]= objects[index][cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].amount
                            })
                        end
                    end
                    table.remove(objects[index],cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index]))
                   
                end
            end
        end
    end
    --item pickup--
    for index, value in ipairs(items) do
        if cirkleKolider(farmer.positionX,farmer.positionY,farmer.farmerSize,items[index]) then
                for index2, value in ipairs(inventory) do
                    if inventory[index2].type == items[index].type then
                    inventory[index2].amount = inventory[index2].amount + items[index][cirkleKolider(farmer.positionX,farmer.positionY,farmer.farmerSize,items[index])].amount
                    end
                end
            table.remove(items[index],cirkleKolider(farmer.positionX,farmer.positionY,farmer.farmerSize,items[index]))
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
            love.graphics.draw(objects[index].sprite , objects[index][index2].x,objects[index][index2].y ,0,1,1,objects[index].sprite:getWidth()/2, objects[index].sprite:getHeight() - objects[index].offset)
        end
    end
    --draw items--
    for index, value in ipairs(items) do
        love.graphics.setColor(items[index].color[1], items[index].color[2], items[index].color[3])
        for index2, value in ipairs(items[index]) do
            love.graphics.circle("fill", items[index][index2].x , items[index][index2].y , items[index][index2].size)
            love.graphics.draw( items[index].dropSprite ,  items[index][index2].x, items[index][index2].y ,0,1,1, items[index].dropSprite:getWidth()/2,  items[index].dropSprite:getHeight()/2 )
        end
    end

    --overlais--
    love.graphics.setColor(1, 1, 1)
    love.graphics.print( world.framerate, world.frameratePositionX, world.frameratePositionY)
    --inventory--
    love.graphics.print(inventory.inventoryOutputString,inventory.outputPosisionX,inventory.outputPosisionY)
end