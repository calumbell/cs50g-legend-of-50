ParticleEffect = Class{}

function ParticleEffect:init(def)

	self.name = def.name
	self.x = 100
	self.y = 100

	-- initialise particle system to emit on hit/death
    self.psystem = love.graphics.newParticleSystem(gTextures['particle'], 64)

    -- particles last between 0.5-1s
    self.psystem:setParticleLifetime(0.25, 0.5)

    -- set acc. to any value between (X1,Y1) and (X2,Y2)
    self.psystem:setLinearAcceleration(-15, 0, 15, 80)
    self.psystem:setAreaSpread('normal', 10, 10)
    self.psystem:setColors(
        255, 255, 255, 255,
        255, 255, 255, 255
    )
end


function ParticleEffect:update(dt)
	self.psystem:update(dt)
end

function ParticleEffect:render()
	-- render particles
    love.graphics.draw(self.psystem, self.x + 16, self.y + 8)
end

function ParticleEffect:spawnParticles(x, y)
	self.x = x
	self.y = y
	self.psystem:emit(64)
end