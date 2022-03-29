
TouchGrass = {}
require "ISUI\ISWorldObjectContextMenu.lua"


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

