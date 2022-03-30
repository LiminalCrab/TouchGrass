require "TimedActions/ISBaseTimedAction"

ISTouchGrassTimedAction = ISBaseTimedAction:derive("ISTouchGrassTimedAction");

function ISTouchGrassTimedAction:isValid() -- Check if the action can be done
    return true;
end

function ISTouchGrassTimedAction:update() -- Trigger every game update when the action is perform
    print("Action is update");
    self.character:faceLocation(self.square:getX(), self.square:getY())
    if (ZombRand(1500) == 0) then
        print("ZombRand:" .. tostring(ZombRand))
        self.character:addLineChatElement("Oh my god is this Bermuda?")
    elseif (ZombRand(1500) == 200) then
        self.character:addLineChatElement("Wow... the texture...")
    end
end

function ISTouchGrassTimedAction:waitToStart() -- Wait until return false
    self.character:faceLocation(self.square:getX(), self.square:getY())
    return self.character:shouldBeTurning()
end

function ISTouchGrassTimedAction:start() -- Trigger when the action start
    print("Action start");
    self.character:faceLocation(self.square:getX(), self.square:getY())
    self:setActionAnim("Loot"); 
    self:setAnimVariable("LootPosition", "Low");

end

function ISTouchGrassTimedAction:stop() -- Trigger if the action is cancel
    print("Action stop");
    ISBaseTimedAction.stop(self);
end

function ISTouchGrassTimedAction:perform() -- Trigger when the action is complete
    print("Action perform");
    ISBaseTimedAction.perform(self);
end

function ISTouchGrassTimedAction:new(character, square, time) -- What to call in you code
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
    o.square = square;
    o.maxTime = 500; -- Time take by the action
    o.stopOnRun = true;
    o.stopOnWalk = true;
    if o.character:isTimedActionInstant() then o.maxTime = 1; end
    return o;
end