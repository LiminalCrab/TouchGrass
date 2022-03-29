--***********************************************************
--**                    ROBERT JOHNSON                     **
--**                   INSEMINATES COWS                    **
--***********************************************************

TouchGrass = require('TouchGrass/TouchGrass')
TouchGrassAction = ISBaseTimedAction:derive('TouchGrassAction')

function TouchGrassAction:isValid()
	return 	true
end

function TouchGrassAction:waitToStart()
	self.character:faceThisObject(self.sandTile)
	return self.character:shouldBeTurning()
end

function TouchGrassAction:update()
	self.character:faceThisObject(self.sandTile)
end

function TouchGrassAction:start()
	self:setActionAnim("Loot")
	self.character:SetVariable('LootPosition', 'Mid')
end

function TouchGrassAction:stop()
	ISBaseTimedAction.stop(self);
end

function TouchGrassAction:perform()
	self.character:setPrimaryHandItem(nil)
	self.character:setSecondaryHandItem(nil)
end

function TouchGrassAction:new(character, grass, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.grass = grass
	o.maxTime = time
	if o.character:isTimedActionInstant() then o.maxTime = 1 end
	return o
end