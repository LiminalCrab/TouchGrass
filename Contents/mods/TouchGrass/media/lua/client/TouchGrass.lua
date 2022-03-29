local TouchGrass = {}


-- if luautils.walkToObject(player, grass:getSquare(), true) then
--     local playerObj = getSpecificPlayer()
--     playerObj:addLineChatElement("Wow such nice grass. Excellent.");
-- end
ISFarmingMenu.canDigHere = function(worldObjects)
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
				return true
			end
		end
	end
	return false
end


function TouchGrass.onTouchGrass(worldobjects, player, grass)
	if luautils.walkAdj(player, grass:getSquare()) then
		local primary, twoHands = true, true
		ISWorldObjectContextMenu.equip(worldobjects, grass, primary, twoHands)
		ISTimedActionQueue.add(TouchGrass:new(player, grass, 100))
	end
end

