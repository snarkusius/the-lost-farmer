
love.load = function ()

    world = {
        ["state"] = 1,
        ["screnSizeX"]= 800,
        ["screnSizeY"]= 600,
        ["framerate"]= 0,
        ["framerateUpdate"]= 1,
        ["frameratePositionX"]= 10,
        ["frameratePositionY"]= 10,
        ["time"] = 0,
        ["timeOflastFrameUpdate"] = 0,
        ["spawnUpdate"]= 1,
        ["timeOflastSpawnUpdate"] = 0,
        ["music"] = love.audio.newSource("sound/PatakasWorld.wav" , "stream")
    }
    
    farmer = {
        ["movmentX"]= 0,
        ["movmentY"]= 0,
        ["positionX"]= 400,
        ["positionY"]= 300,
        ["farmerSize"]= 15,
        ["sped"]= 100,
        ["handY"]= 200,
        ["handX"]= 300,
        ["handSize"]= 8,
        ["hand_distens"]= 25,
        ["isHand"]= false,
        ["HandAbelToHit"]= true,
        ["huitSound"]= love.audio.newSource("sound/hit.wav" , "stream"),
        ["handAngel"]= 0,
        ["handAngelSpeed"]= 10,
        ["handSvingDistens"] = math.pi,
        ["handSvingMiddel"] = 0,
        ["hasKolided"] = false
    }
    
    objectPropeties = {
        {
            ["type"] = "wood",
            ["spawnChanse"] = 10,
            ["size"]=10,
            ["amount"]= 4
 
        },
        {
            ["type"] = "stone",
            ["spawnChanse"] = 10,
            ["size"]=15,
            ["amount"]= 4

        },
        {
            ["type"] = "corn",
            ["spawnChanse"] = 10,
            ["size"]=10,
            ["amount"]= 4
        },
        {
            ["type"] = "wall",
            ["spawnChanse"] = 0,
            ["size"]=8,
            ["amount"]= 4
        },
        {
            ["type"] = "barel",
            ["spawnChanse"] = 0,
            ["size"]=8,
            ["amount"]= 4
        },
        {
            ["type"] = "spike",
            ["spawnChanse"] = 0,
            ["size"]=8,
            ["amount"]= 4
        }

    }
    
    objects = {
        
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
        },
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
            ["type"] = "wall",
            ["color"] = {1, 1, 1},
            ["offset"] = 8,
            ["sprite"] = love.graphics.newImage("Assets/struktures/wall.png"),
            ["drotype"] = "wood",
            -- {["x"] = 60 ,["y"] = 50 ,["size"]=10 ,["health"]= 4 ,["amount"] = 5 },
            -- {["x"] = 100 ,["y"] = 75,["size"]=10 ,["health"]= 4 ,["amount"] = 5}
        },
        {
            ["type"] = "barel",
            ["color"] = {1, 1, 1},
            ["offset"] = 16,
            ["sprite"] = love.graphics.newImage("Assets/struktures/barel.png"),
            ["drotype"] = "wood",
            -- {["x"] = 60 ,["y"] = 50 ,["size"]=10 ,["health"]= 4 ,["amount"] = 5 },
            -- {["x"] = 100 ,["y"] = 75,["size"]=10 ,["health"]= 4 ,["amount"] = 5}
        },
        {
            ["type"] = "spike",
            ["color"] = {1, 1, 1},
            ["offset"] = 16,
            ["sprite"] = love.graphics.newImage("Assets/struktures/spike.png"),
            ["drotype"] = "wood",
            -- {["x"] = 60 ,["y"] = 50 ,["size"]=10 ,["health"]= 4 ,["amount"] = 5 },
            -- {["x"] = 100 ,["y"] = 75,["size"]=10 ,["health"]= 4 ,["amount"] = 5}
        }


    }
    craftebols = {
        ["craftebolIconLockationX"] = 10,
        ["craftebolIconLockationY"] = 10,
        ["iconSize"] = 32,
        ["cureentlyPlasing"] = 1,
        ["cureentlyPlasingSprite"] = love.graphics.newImage("Assets/struktures/barel.png"),
        ["isPlasing"] = false,
        ["spaseClear"] = true,
        {
            ["type"] = "wall",
            ["gridSize"] = 16,
            ["iconSprite"] = love.graphics.newImage("Assets/struktures/struktureIcons/wall.png"),
            ["resorsType"] = "wood",
            ["resorsAmount"] = 5
        },
        {
            ["type"] = "barel",
            ["gridSize"] = 16,
            ["iconSprite"] = love.graphics.newImage("Assets/struktures/struktureIcons/barel.png"),
            ["resorsType"] = "wood",
            ["resorsAmount"] = 5
        },
        {
            ["type"] = "spike",
            ["gridSize"] = 16,
            ["iconSprite"] = love.graphics.newImage("Assets/struktures/struktureIcons/spike.png"),
            ["resorsType"] = "wood",
            ["resorsAmount"] = 5
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
        ["outputPosisionX"] = 725,
        ["outputPosisionY"] = 50,
        {
            ["type"] = "wood",
            ["amount"] = 100,
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
    
    -- love.window.setFullscreen( true )
    startScreen = love.graphics.newImage("backgrounds/start.png")
    tutorialScreen = love.graphics.newImage("backgrounds/tutorial.png")
    world.music:play()
    world.music:setLooping(true)
    world.music:setVolume(0.3)
    generalFun = require("generalFunktions")

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
            if world.state == 1 then
                love.event.quit()
            end
            world.state = 1
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
love.mousepressed =function (x, y, button, istouch)
    if world.state == 1 then
        if button == 1 then 
            if x > 263 and x < 537 and y > 150 and y < 236 then
                world.state = 2
            end
            if x > 238 and x < 624 and y > 250 and y < 336 then
                world.state = 3
            end
        end
        return
    end
    if world.state == 3 then
        if button == 1 then 
            if x > 604 and x < 794 and y > 464  and y < 518 then
                world.state = 1
            end
        end
        return
    end
    --clicing icons--
    if x > craftebols.craftebolIconLockationX and x < craftebols.craftebolIconLockationX + craftebols.iconSize and y > craftebols.craftebolIconLockationY and y <craftebols.craftebolIconLockationY + craftebols.iconSize * #craftebols then
        craftebols.cureentlyPlasing = math.ceil((y - craftebols.craftebolIconLockationY) / craftebols.iconSize)
        for index, value in ipairs(objects) do
            if craftebols[math.ceil((y - craftebols.craftebolIconLockationY) / craftebols.iconSize)].type == objects[index].type then
                craftebols.cureentlyPlasingSprite = objects[index].sprite
                for Index2, value in ipairs(inventory) do
                    if inventory[Index2].type == craftebols[craftebols.cureentlyPlasing].resorsType then
                        if inventory[Index2].amount >= craftebols[craftebols.cureentlyPlasing].resorsAmount then
                            craftebols.isPlasing = true
                            inventory[Index2].amount = inventory[Index2].amount - craftebols[craftebols.cureentlyPlasing].resorsAmount
                        end
                    end
                end
                
            end
        end
    end
    --placing items--
    if button == 2 and craftebols.isPlasing then
        for index, value in ipairs(objects) do
            if craftebols[craftebols.cureentlyPlasing].type == objects[index].type  then
                for index2, value in ipairs(objectPropeties) do
                    if objectPropeties[index2].type == craftebols[craftebols.cureentlyPlasing].type then
                        craftebols.spaseClear = true
                        for index3, value in ipairs(objects) do
                            if generalFun.cirkleKolider( x - (x%craftebols[craftebols.cureentlyPlasing].gridSize) , y - (y%craftebols[craftebols.cureentlyPlasing].gridSize),craftebols[craftebols.cureentlyPlasing].gridSize/2,objects[index3])~=false then
                                craftebols.spaseClear = false
                            end
                        end
                        if craftebols.spaseClear then
                            table.insert(objects[index],{["x"] = x - (x%craftebols[craftebols.cureentlyPlasing].gridSize) ,["y"] = y - (y%craftebols[craftebols.cureentlyPlasing].gridSize),["size"]= objectPropeties[index2].size ,["health"]= 4 ,["amount"] = objectPropeties[index2].amount})
                            craftebols.isPlasing = false
                        end 
                    end
                    
                end
            end
        end
    end
    --hitting--
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
    if world.state == 1 then
        return
    end
    if world.state == 3 then
        return
    end
    inventory.inventoryOutputString = generalFun.InventoryToString(inventory)
    world.time = world.time + deltaTime
    if world.time > world.timeOflastFrameUpdate + world.framerateUpdate then
        world.framerate = math.floor(1/deltaTime)
        world.timeOflastFrameUpdate = world.time
    end
    --spawnUpdate--
    if world.time > world.timeOflastSpawnUpdate + world.spawnUpdate then
        
        world.timeOflastSpawnUpdate = world.time
        for index, value in ipairs(objectPropeties) do
            if love.math.random(100)< objectPropeties[index].spawnChanse then
                for index2, value in ipairs(objects) do
                    if objectPropeties[index].type == objects[index2].type  then
                        table.insert(objects[index2],{["x"] = love.math.random(world.screnSizeX) ,["y"] = love.math.random(world.screnSizeY) ,["size"]= objectPropeties[index].size ,["health"]= 4 ,["amount"] = objectPropeties[index].amount})
                    end
                end
            end
        end
        
    end
    --farmer kolition and movment--
    farmer.hasKolided = false
    for index, value in ipairs(objects) do
        if generalFun.cirkleKolider((farmer.positionX + (farmer.movmentX * deltaTime)),(farmer.positionY + (farmer.movmentY * deltaTime)),farmer.farmerSize,objects[index]) ~= false then
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
            if generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index]) ~= false and farmer.HandAbelToHit == true then
                farmer.HandAbelToHit = false
                objects[index][generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].health = objects[index][generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].health - 1
                farmer.huitSound:play()
                if objects[index][generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].health <= 0 then
                    for index2, value in ipairs(items) do
                        if items[index2].type == objects[index].type then
                            table.insert(items[index2], 
                            {["x"] = objects[index][generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].x,
                             ["y"] = objects[index][generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].y,
                             ["size"]=10,
                             ["amount"]= objects[index][generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index])].amount
                            })
                        end
                    end
                    table.remove(objects[index],generalFun.cirkleKolider(farmer.handX,farmer.handY,farmer.handSize,objects[index]))
                   
                end
            end
        end
    end
    --item pickup--
    for index, value in ipairs(items) do
        if generalFun.cirkleKolider(farmer.positionX,farmer.positionY,farmer.farmerSize,items[index]) then
                for index2, value in ipairs(inventory) do
                    if inventory[index2].type == items[index].type then
                    inventory[index2].amount = inventory[index2].amount + items[index][generalFun.cirkleKolider(farmer.positionX,farmer.positionY,farmer.farmerSize,items[index])].amount
                    end
                end
            table.remove(items[index],generalFun.cirkleKolider(farmer.positionX,farmer.positionY,farmer.farmerSize,items[index]))
        end
    end
end

love.draw=function ()
    if world.state == 1 then
        love.graphics.draw(startScreen, 0,0,0,1,1,0,0)
        return
    end
    if world.state == 3 then
        love.graphics.draw(tutorialScreen, 0,0,0,1,1,0,0)
        return
    end
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
            -- love.graphics.circle("fill", objects[index][index2].x , objects[index][index2].y , objects[index][index2].size )
            love.graphics.draw(objects[index].sprite , objects[index][index2].x,objects[index][index2].y ,0,1,1,objects[index].sprite:getWidth()/2, objects[index].sprite:getHeight() - objects[index].offset)
        end
    end
    --draw items--
    for index, value in ipairs(items) do
        love.graphics.setColor(items[index].color[1], items[index].color[2], items[index].color[3])
        for index2, value in ipairs(items[index]) do
            -- love.graphics.circle("fill", items[index][index2].x , items[index][index2].y , items[index][index2].size)
            love.graphics.draw( items[index].dropSprite ,  items[index][index2].x, items[index][index2].y ,0,1,1, items[index].dropSprite:getWidth()/2,  items[index].dropSprite:getHeight()/2 )
        end
    end
    if craftebols.isPlasing then
        local x, y = love.mouse.getPosition()
        love.graphics.setColor(1,1,1,0.5)
        love.graphics.draw(craftebols.cureentlyPlasingSprite,x - (x%craftebols[craftebols.cureentlyPlasing].gridSize),y - (y%craftebols[craftebols.cureentlyPlasing].gridSize)
        
        love.graphics.setColor(1,1,1)
    end
    --overlais--
    love.graphics.setColor(1, 1, 1)
    love.graphics.print( world.framerate, world.frameratePositionX, world.frameratePositionY)
    --craftebols--
    for index, value in ipairs(craftebols) do
        love.graphics.draw(craftebols[index].iconSprite,craftebols.craftebolIconLockationX,craftebols.craftebolIconLockationY + (index - 1) * craftebols.iconSize )
    end
    --inventory--
    love.graphics.print(inventory.inventoryOutputString,inventory.outputPosisionX,inventory.outputPosisionY)
end
