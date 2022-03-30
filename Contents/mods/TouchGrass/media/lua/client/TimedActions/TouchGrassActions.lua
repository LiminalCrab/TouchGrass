--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

TouchGrassActions = ISBaseTimedAction:derive("TouchGrassActions")

function TouchGrassActions:isValid()
    for i=0,self.square:getObjects():size()-1 do
        local object = self.square:getObjects():get(i);
        if object:getProperties() and object:getProperties():Is(IsoFlagType.canBeRemoved) then
            return true
        end
    end
    return false
end

function TouchGrassActions:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function TouchGrassActions:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())

    -- self.character:setMetabolicTarget(Metabolics.DiggingSpade);
end

function TouchGrassActions:start()
--	getSoundManager():PlayWorldSound("bushes", self.square, 0.2, 20, 1.0, 3, true)
	self:setActionAnim("Loot")
	self:setOverrideHandModels(nil, nil)
end

function TouchGrassActions:stop()
    ISBaseTimedAction.stop(self)
end

function TouchGrassActions:perform()
	local sq = self.square
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }

	ISBaseTimedAction.perform(self)
end

function TouchGrassActions:new(character, square)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.square = square
	o.stopOnWalk = true
	o.stopOnRun = true
	o.maxTime = 500
	o.spriteFrame = 0
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o
end


