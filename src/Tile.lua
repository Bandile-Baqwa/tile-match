--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

local limitedColors = {1, 2, 3, 4, 5, 6, 7, 8}
function Tile:init(x, y, color, variety,specialTile)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = self.getRandomColor()
    self.variety = variety
    self.specialTile = specialTile or false 
end

function Tile:getRandomColor()
    return limitedColors[math.random(#limitedColors)]
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    if self.specialTile then 
        local alpha = 128  * math.sin(love.timer.getTime() * 5)
        love.graphics.setColor(255, 255, 255, alpha)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
    else
        love.graphics.setColor(255,255,255,255)
    end
    
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
    self.x + x, self.y + y)
    love.graphics.setColor(255, 255, 255, 255)
    
end