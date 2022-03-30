local TouchGrass = {};

require('luautils');

TouchGrass.onTouchGrass = function(worldobjects, square, player)
    local player = getPlayer(0)
    ISTimedActionQueue.add(ISTouchGrassTimedAction:new(player, square))
end

TouchGrass.touchGrassMenu = function(player, context, worldobjects)

    local player = getPlayer(0)
    local square;
    local target;

    if player:getVehicle() then
        return
    end

    for i, v in ipairs(worldobjects) do
        square = v:getSquare();
    end

    if not square then
        return
    end

    for i = 0, square:getObjects():size() - 1 do
        local object = square:getObjects():get(i)

        if object then
            local attached = object:getAttachedAnimSprite()
            if attached then
                for n = 1, attached:size() do
                    local sprite = attached:get(n - 1)
                    if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and
                        (luautils.stringStarts(sprite:getParentSprite():getName(), "blends_natural_*") or
                            luautils.stringStarts(sprite:getParentSprite():getName(), "blends_natural_01_")) then
                        target = sprite
                        break
                    end
                end
            end
        end

        if not target then
            return
        end

        context:addOption("Touch grass ",  worldobjects, TouchGrass.touchGrassMenu, square, player);
    end
end

Events.OnFillWorldObjectContextMenu.Add(TouchGrass.touchGrassMenu)