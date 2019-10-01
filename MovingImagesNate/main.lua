-- Title: MovingImages
-- Name: Nate Day
-- Course: ICS2O/3C
-- This program displays an image that moves across the screen.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- make new image
local rocketship = display.newImageRect("Images/rocketship", 200, 200)
 
-- global variables
scrollSpeed = 3

--set the image to be on the screen
rocketship.alpha = 1 

-- set the initial x and y position of beetleship
rocketship.x = display.contentWidth/2
rocketship.y = 700

-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
local function _MoveShip(event)
-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x + scrollSpeed
-- change the transparency of the ship every time it moves so that it fades out
	rocketship.alpha = rocketship.alpha + 0.01
end