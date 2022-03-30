-- TouchGrassCursor = ISBuildingObject:derive("TouchGrassCursor")

-- function TouchGrassCursor:create(x, y, z, north, sprite)
-- 	local square = getWorld():getCell():getGridSquare(x, y, z)
-- 	TouchGrassContextMenu.doTouchGrass(self.character, square)
-- end

-- function TouchGrassCursor:isValid(square)
-- 	return true
-- end

-- function TouchGrassCursor:render(x, y, z, square)
-- 	if not TouchGrassCursor.floorSprite then
-- 		TouchGrassCursor.floorSprite = IsoSprite.new()
-- 		TouchGrassCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
-- 	end
-- 	local r,g,b,a = 0.0,1.0,0.0,0.8
-- 	if self:isValid(square) == false then
-- 		r = 1.0
-- 		g = 0.0
-- 	end
-- 	TouchGrassCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
-- end

-- function TouchGrassCursor:new(sprite, northSprite, character)
-- 	local o = {}
-- 	setmetatable(o, self)
-- 	self.__index = self
-- 	o:init()
-- 	o:setSprite(sprite)
-- 	o:setNorthSprite(northSprite)
-- 	o.character = character
-- 	o.player = character:getPlayerNum()
-- 	o.noNeedHammer = true
-- 	o.skipBuildAction = true
-- 	return o
-- end