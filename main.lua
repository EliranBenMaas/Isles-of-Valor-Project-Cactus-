--TODO: Add collision detection, add more animations, add more enemies, add health system, add score system, add sound effects, add music, add menu, add pause functionality, add game over screen, add win screen, add more levels, add more characters, add more weapons, add more items, add more power-ups, add more obstacles, add more challenges, add more secrets, add more Easter eggs, add more references, add more jokes, add more memes, add more fun!
local push = require 'push'
local anim8 = require 'anim8'
local mainMenu = require 'main_Menu'
local playState = require 'play_State'
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 640
VIRTUAL_HEIGHT = 360
gameState = "menu" -- "menu" or "play"
local player = {} 





function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    gameFont = love.graphics.newFont(14)
    
    player = {
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
    playState:load(player, cactusKing)
    
    love.window.setTitle("Isles of Valor")
end

function love.update(dt)
    if gameState == "menu" then
        mainMenu:update(dt) -- Don't forget to pass dt!
    elseif gameState == "play" then
        playState:update(dt)
    end
end

function love.mousepressed(x, y, button)
    -- המרה של קואורדינטות העכבר למידות הווירטואליות של push
    local mouseX, mouseY = push:toGame(x, y)

    if gameState == "menu" then
        mainMenu:mousepressed(mouseX, mouseY, button)
    end
end

function love.draw()
    push:start()
    if gameState == "menu" then
        mainMenu:draw()
    elseif gameState == "play" then
        playState:draw()
    end
    push:finish()
end