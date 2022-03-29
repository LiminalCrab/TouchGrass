
TouchGrass = {}
require "ISUI\ISWorldObjectContextMenu.lua"

TouchGrass.createMenu = function(player, worldobjects, x, y, test)
    local playerObj = getSpecificPlayer(player)
    local context = ISContextMenu.get(player, x, y);

    if not playerObj:getVehicle() then
        if test == true then return true; end
        context:addOption("Touch grass ", worldobjects, TouchGrass.onTouchGrass, ISWorldObjectContextMenu.canBeRemoved, player);
    end
end


TouchGrass.onTouchGrass = function(worldobjects, square, player)
    local playerObj = getSpecificPlayer(player)
    local bo = TouchGrassCursor:new(playerObj, "grass") --what
    getCell():setDrag(bo, player);
end

TouchGrass.doTouchGrass = function(playerObj, square)
    if luautils.walkAdj(playerObj, square, true) then
        ISTimedActionQueue.add(TouchGrassTimedAction:new(playerObj, square))
    end
end

Events.OnFillWorldObjectContextMenu.Add(TouchGrass.createMenu)
