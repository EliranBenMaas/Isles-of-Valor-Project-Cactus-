local push = require 'push'
local anim8 = require 'anim8'
local mainMenu = require 'main_Menu'
local playState = require 'play_State'
local player = {}

function player:load()
       local player = {
        x = 100,
        y = 100,
        speed = 150,
        direction = 1,
        animations = {},
        sprites = {}
    }
    -- Load player sprites
    player.sprites.idle = love.graphics.newImage("assets/Tiny Swords (Free Pack)/Units/Black Units/Warrior/Warrior_Idle.png")
    player.sprites.run = love.graphics.newImage("assets/Tiny Swords (Free Pack)/Units/Black Units/Warrior/Warrior_Run.png")

    -- Creating Grid for animations
    local g_idle = anim8.newGrid(192, 192, player.sprites.idle:getWidth(), player.sprites.idle:getHeight())
    local g_run = anim8.newGrid(192, 192, player.sprites.run:getWidth(), player.sprites.run:getHeight())

    -- Creating animations
    player.animations.idle = anim8.newAnimation(g_idle('1-6', 1), 0.1)
    player.animations.run = anim8.newAnimation(g_run('1-6', 1), 0.1)
    player.currentAnim = player.animations.idle
    player.currentImg = player.sprites.idle
    -- Load attack sprite
    player.sprites.attack = love.graphics.newImage("assets/Tiny Swords (Free Pack)/Units/Black Units/Warrior/Warrior_Attack1.png")

    -- Creating Grid for attack (Ensure the frame size matches the sheet, usually 192x192)
    local g_attack = anim8.newGrid(192, 192, player.sprites.attack:getWidth(), player.sprites.attack:getHeight())

    -- Creating the animation (4 frames, 0.1s each)
    player.animations.attack = anim8.newAnimation(g_attack('1-4', 1), 0.1, function()
        player.isAttacking = false -- This callback triggers when the animation finishes
end)

    mainMenu:load()
    playState:load(player)

    
end