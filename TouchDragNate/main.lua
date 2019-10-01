-- Title: TouchandDrag
-- Name: Nate Day
-- Course: ICS2O
-- This program lets the user click and drag a image


-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the variables
local backgroundImage = display.newImageRect("Images/starbackground.png", 2048, 1536)
local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.height

local planet = display.newImageRect("Images/planet.png", 150, 150)
local planetWidth = planet.width
local planetHeight = planet.height

-- boolean variables to keep track of which object is touched first
local alreadyTouchedstar = false
local alreadyTouchedplanet = false

-- set the initial x and y position of the images
star.x = 768
star.y = 384

planet.x = 256
planet.y = 384

-- Function: planetListener
-- Input: touch listener
-- Output: none
-- Description: when planet is touched, move it
local function planetListener(touch)
	if (touch.phase == "began") then
	  if (alreadyTouchedstar == false) then 
		 alreadyTouchedplanet = true
        end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedplanet == true) ) then
    	planet.x = touch.x
    	planet.y = touch.y
    end

    if (touch.phase == "ended") then
    	alreadyTouchedplanet = false
    	alreadyTouchedstar = false
    end
end

-- add the respective listeners to each object
planet:addEventListener("touch", planetListener)

-- Function: starListener
-- Input: touch listener
-- Output: none
-- Description: when star is touched, move it
local function starListener(touch)
	if (touch.phase == "began") then
	  if (alreadyTouchedplanet == false) then 
		 alreadyTouchedstar = true
        end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedstar == true) ) then
    	star.x = touch.x
    	star.y = touch.y
    end

    if (touch.phase == "ended") then
    	alreadyTouchedplanet = false
    	alreadyTouchedstar = false
    end
end

-- add the respective listeners to each object
star:addEventListener("touch", starListener)