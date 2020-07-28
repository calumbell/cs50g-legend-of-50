PlayerLiftPotState = Class{__includes = BaseState}

function PlayerLiftPotState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 0

    -- create hitbox based on where the player is and facing
    self.direction = self.player.direction

    self.player:changeAnimation('lift-pot-' .. self.direction)
    self.player.currentAnimation.looping = false
end


function PlayerLiftPotState:enter(params)
    if params['animate'] then
        self.player.currentAnimation:refresh()
    else
        self.player.currentAnimation.currentFrame = 3
        self.player.currentAnimation.pause = true        
    end
end



function PlayerLiftPotState:update(dt)
	if self.player.currentAnimation:getCurrentFrame() == 3 then
		self.player.currentAnimation.pause = true
	end

    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.player:changeState('walk-pot')
    end

    if love.keyboard.isDown('space') then
        if self.player.carrying then
            local proj = self.player.carrying:throw()
            table.insert(self.dungeon.currentRoom.projectiles, proj)
            self.player:changeState('idle')
        end
    end

end

function PlayerLiftPotState:render()
	local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end