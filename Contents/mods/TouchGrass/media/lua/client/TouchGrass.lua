local TouchGrass = {}

function TouchGrass.onTouchGrass(worldobjects, player, handItem)
	local bo = TouchGrass_TouchAction:new(handItem, player);
	bo.player = player:getPlayerNum()
	getCell():setDrag(bo, bo.player)
end

