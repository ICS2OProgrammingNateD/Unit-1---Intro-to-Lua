-- Title: TouchAndReact
-- Name: Nate Day
-- Course: ICS2O
-- This program creates a image that when touched can react.


-- set background colour
display.setDefault ("background", 0/255, 0/255, 0/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create circle button, set its position and make it visible
local circleButton = display.newImageRect("Images/collisioncircle.png", 198, 96)
circleButton.x = display.contentWidth/2
circleButton.y = display.contentHeight/2
circleButton.isVisible = true

-- create zero button, set its position and make it invisible
local zeroButton = display.newImageRect("Images/0.png", 198, 96)
zeroButton.x = display.contentWidth/2
zeroButton.y = display.contentHeight/2
zeroButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0, 0, 0)
textObject.isVisible = false