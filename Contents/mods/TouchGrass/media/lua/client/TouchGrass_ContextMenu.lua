local TouchGrass = require('TouchGrass/TouchGrass')

function TouchGrass.OnFillWorldObjectContextMenu(playerId, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)

	if not square:isFreeOrMidair(true, true) then return false end
	-- farming plot have to be on natural floor (no road, concrete etc.)
	for i = 0, square:getObjects():size() - 1 do
		local item = square:getObjects():get(i);
		-- IsoRaindrop and IsoRainSplash have no sprite/texture
		if item:getTextureName() and (luautils.stringStarts(item:getTextureName(), "floors_exterior_natural") or
			luautils.stringStarts(item:getTextureName(), "blends_natural_01")) then
				context:addOption("Touch Grass", worldobjects, TouchGrass.onTouchGrass, playerObj, nil)
				return
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(TouchGrass.OnFillWorldObjectContextMenu)
