local M = {}
M.InventoryToString = function (table)
    local newString = ""
    for index, value in ipairs(table) do
       newString = newString .. table[index]["type"] .. " " .. tostring(table[index]["amount"]) .. "\n"
    end
    return newString
end

M.cirkleKolider = function (positionx,positiony,size,table)
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

return M