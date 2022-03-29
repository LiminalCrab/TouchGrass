local TouchGrass = require('TouchGrass/TouchGrass')

function TouchGrass.TouchGrassMenu(playerId, context, worldobjects, test)
    local squares = {}
	local didSquare = {}
    for _,worldObj in ipairs(worldObjects) do
		if not didSquare[worldObj:getSquare()] then
			table.insert(squares, worldObj:getSquare())
			didSquare[worldObj:getSquare()] = true
		end
    end
    for _,square in ipairs(squares) do
		if CFarmingSystem.instance:getLuaObjectOnSquare(square) then
			return false
		end
        for i=1,square:getObjects():size() do
			local obj = square:getObjects():get(i-1);
			if obj:getTextureName() and (luautils.stringStarts(obj:getTextureName(), "floors_exterior_natural") or
					luautils.stringStarts(obj:getTextureName(), "blends_natural_01")) then
                        context:addOption("Touch grass", worldobjects, TouchGrass.onTouchGrass, player, nil)
			end
		end
	end
	return false
end


Events.OnFillWorldObjectContextMenu.Add(TouchGrass.TouchGrassMenu)