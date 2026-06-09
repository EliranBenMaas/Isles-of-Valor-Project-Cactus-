-- play_State.lua
local playState = {}

function playState:load(player, cactusKing)
    self.player = player
    self.cactusKing = cactusKing
end

function playState:update(dt)
    local isMoving = false

    if love.mouse.isDown(1) and not self.player.isAttacking then
        self.player.isAttacking = true
        self.player.currentAnim = self.player.animations.attack
        self.player.currentImg = self.player.sprites.attack
        self.player.currentAnim:gotoFrame(1) -- Start from the beginning
    end

    -- Player movement logic
    if not self.player.isAttacking then
        if love.keyboard.isDown("d") then
            self.player.x = self.player.x + self.player.speed * dt
            self.player.direction = 1
            isMoving = true
        elseif love.keyboard.isDown("a") then
            self.player.x = self.player.x - self.player.speed * dt
            self.player.direction = -1
            isMoving = true
        end

        if love.keyboard.isDown("w") then
            self.player.y = self.player.y - self.player.speed * dt
            isMoving = true
        elseif love.keyboard.isDown("s") then
            self.player.y = self.player.y + self.player.speed * dt
            isMoving = true
        end

        -- Logic to switch between idle and run animations
        if isMoving then
            self.player.currentAnim = self.player.animations.run
            self.player.currentImg = self.player.sprites.run
        else
            self.player.currentAnim = self.player.animations.idle
            self.player.currentImg = self.player.sprites.idle
        end
    end

    if self.player.currentAnim then
        self.player.currentAnim:update(dt)
    end
end

function playState:draw()
    love.graphics.clear(0.5, 0.8, 0.5)
    love.graphics.print("Isles of Valor", 10, 10)
    if self.player.currentAnim then
        self.player.currentAnim:draw(self.player.currentImg, self.player.x, self.player.y, 0, self.player.direction, 1, 96, 96)
    end
end

return playState