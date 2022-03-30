
TouchGrass = {}
require "ISUI\ISWorldObjectContextMenu.lua"

TouchGrass.createMenu = function(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true end

    local playerObj = getSpecificPlayer(player)

    if not playerObj:getVehicle() then
        if test == true then return true; end
        context:addOption("Touch grass ", worldobjects, TouchGrass.onTouchGrass, canBeRemoved, player);
    end
end


TouchGrass.onTouchGrass = function(player, square)
    local playerObj = getSpecificPlayer(player)
    -- local bo = TouchGrassCursor:new(playerObj, "grass") --what
    -- getCell():setDrag(bo, player);
    if luautils.walkAdj(playerObj, square, true) then
        ISTimedActionQueue.add(TouchGrassAction:new(playerObj, square))
    end


end

TouchGrass.doTouchGrass = function(playerObj, square)
    player:addLineChatElement("HOLY FUCK THIS GRASS IS SO COOL")
end

Events.OnFillWorldObjectContextMenu.Add(TouchGrass.createMenu)
