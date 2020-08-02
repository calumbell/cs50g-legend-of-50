ParticleEffect = Class{}

function ParticleEffect:init(def)

	self.name = def.name

	-- initialise particle system
    self.psystem = love.graphics.newParticleSystem(gTextures['particle'], 64)

    -- set colours using def
    self.psystem:setColors(
        def.r, def.g, def.b, 255,
        def.r, def.g, def.b, 0
    )

    -- particles last between 0.5-1s
    self.psystem:setParticleLifetime(0.1, 0.5)

    self.psystem:setSizes(1, 0.25)

    -- set acc. to any value between (X1,Y1) and (X2,Y2)
    if def.direction == 'down' then
    	self.psystem:setLinearAcceleration(-10, 0, 10, 50)
    elseif def.direction == 'up' then
    	self.psystem:setLinearAcceleration(-10, 0, 10, -80)
    end


    self.psystem:setAreaSpread('normal', def.spreadX, def.spreadY)
    

end


function ParticleEffect:update(dt)
	self.psystem:update(dt)
end

function ParticleEffect:render()
	-- render particles
	if self.x and self.y then
    	love.graphics.draw(self.psystem, self.x + 8, self.y + 8)
    end
end

function ParticleEffect:spawnParticles(x, y)
	self.x = x
	self.y = y
	self.psystem:emit(32)
end