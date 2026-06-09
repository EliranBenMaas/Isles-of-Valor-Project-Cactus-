local mainMenu = {}
local menu = {}
local push = require 'push'

function mainMenu:load()
    -- Load Tiny Swords assets
    menu.btnNormal = love.graphics.newImage("assets/Tiny Swords (Free Pack)/UI Elements/UI Elements/Buttons/TinyRoundBlueButton.png")
    menu.btnPressed = love.graphics.newImage("assets/Tiny Swords (Free Pack)/UI Elements/UI Elements/Buttons/TinyRoundRedButton.png")
    --Load custom cursor
    local cursorData = love.image.newImageData("assets/Tiny Swords (Free Pack)/UI Elements/UI Elements/Cursors/Cursor_02.png")
    local customCursor = love.mouse.newCursor(cursorData, 0, 0)
    love.mouse.setCursor(customCursor)
    -- Set menu button dimensions and position
    menu.width = menu.btnNormal:getWidth()
    menu.height = menu.btnNormal:getHeight()
    menu.x = (VIRTUAL_WIDTH - menu.width) / 2
    menu.y = (VIRTUAL_HEIGHT - menu.height) / 2

    gameState = "menu"
end

function mainMenu:update(dt)
    -- Get the mouse position relative to the screen
    local mx, my = love.mouse.getPosition()
    -- Convert those to our VIRTUAL resolution (640x360)
    local vmx, vmy = push:toGame(mx, my)

    -- Ensure the mouse is actually inside the window before checking hover
    if vmx and vmy then
        menu.isHovered = vmx >= menu.x and vmx <= menu.x + menu.width and 
                         vmy >= menu.y and vmy <= menu.y + menu.height
    else
        menu.isHovered = false
    end
end


function mainMenu:draw()
    if gameState == "menu" then 
        -- Draw background (White)
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
        local currentImg = menu.btnNormal
        local textOffset = 0 -- To adjust text position when button is pressed
        -- Logical Check: Is the button hovered and mouse is pressed?
        if menu.isHovered and love.mouse.isDown(1) then
            currentImg = menu.btnPressed
            textOffset = 6 -- Move text down when button is pressed to create a "pressed" effect
        end
        -- Draw the Button Asset
        love.graphics.draw(currentImg, menu.x, menu.y)
        -- Draw Button Text
        love.graphics.setColor(0, 0, 0) -- Set text color to black
        love.graphics.printf("Start Game", menu.x, menu.y + 18 + textOffset, menu.width, "center")
    elseif gameState == "play" then
        love.graphics.print("Game Started!, Press ESC to go back", 20, 20)
    end
end
function mainMenu:mousepressed(x, y, button)
    -- Check if the button is clicked
    if button == 1 and menu.isHovered then
        gameState = "play"
    end
end  
    
return mainMenu