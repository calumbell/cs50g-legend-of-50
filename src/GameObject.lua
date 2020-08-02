--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture

    self.frame = def.frame
    
    if def.frameOffsets then
        self.frameOffset = def.frameOffsets[math.random(#def.frameOffsets)]
    else
        self.frameOffset = 0
    end
    
    -- whether it acts as an obstacle or not
    self.solid = def.solid

    -- whether it can be broken by attacking it
    self.breakable = def.breakable

    -- whether this object can be lifted by the player
    self.liftable = def.liftable or false

    -- contains reference to an entity carrtying the object
    self.carriedBy = nil

    -- whether to render this object bobbing up and down, and by how much
    self.floating = def.floating or false
    self.floatOffsetMax = def.floatOffsetMax or nil
    self.floatRate = def.floatRate or nil
    self.floatOffsetCurrent = 0

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    self.isActive = true

    -- contains reference to an entity carrtying the object
    self.carrier = nil

    -- default empty collision callback
    self.onCollide = function() end

    -- empty breaking callback
    self.onBreak = function() end
end

function GameObject:update(dt)

    -- animate floating sprites
    if self.floating then
        self.floatOffsetCurrent = self.floatOffsetCurrent + (self.floatRate * dt)

        if self.floatOffsetCurrent >= self.floatOffsetMax then
            self.floatOffsetCurrent = self.floatOffsetMax
            self.floatRate = -self.floatRate
        end

        if self.floatOffsetCurrent < 0 then
            self.floatOffsetCurrent = 0
            self.floatRate = -self.floatRate
        end
    end
end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    if self.isActive then    
        love.graphics.draw(gTextures[self.texture], gFrames[self.texture][(self.states[self.state].frame or self.frame) + self.frameOffset],
            self.x + adjacentOffsetX, self.y + math.floor(self.floatOffsetCurrent) + adjacentOffsetY)
    end

    if self.carrier then
        self.x = self.carrier.x
        self.y = self.carrier.y - self.height + self.carrier.offsetY + 3
    end
end

function GameObject:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
end

--
-- if an object is being carrier by an entity, throw it
-- returns a Projectile or nil if no object is not being carried
--

function GameObject:throw()

    -- if the object is not being carrier, return nil
    if not self.carrier then
        return nil
    end

    -- instantiate new projectile and add it to the room projectile list
    local proj = Projectile(self.x, self.y, self.carrier.direction,
        PROJECTILE_DEFS[self.type])
    gSounds['throw']:play()
    self.carrier.carrying = nil
    self.carrier = nil
    self.isActive = false

    return proj
end

