-- Title: AreaOfRectangleAndCircle
-- Name: Nate Day
-- Course: ICS2O
-- This program displays a rectangle and shows its AreaOfRectangleAndCircle


--create my local variables.
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local myCircle
local areaTextCircle
local areaOfCircle
local radiusOfCircle = 150
local PI = 3.1415926
--sets the backround colour of my screen.
display.setDefault("background", 123/255, 122/255, 121/255)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 10
-- set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myRectangle:setFillColor(0/255, 0/255, 0/255)

-- set the colour of the border
myRectangle:setStrokeColor(255/255, 255/255, 255/255)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- writes the area on the screen
areaText = display.newText("The area of this rectangle witha width of \n"..
	widthOfRectangle .. "and a height of " .. heightOfRectangle .. " is " ..
    areaOfRectangle .. "pixels².", 0, 0, Arial, textSize)

-- anchor the text and set(x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

--set the colour of the newText
areaText:setTextColor(240/255, 240/255, 240/255)

--Create the Circle.
myCircle = display.newCircle (0, 0, radiusOfCircle)

--Calculate areaOfCircle
areaOfCircle = radiusOfCircle * radiusOfCircle * PI

--  write the area of circle on the screen
areaTextCircle = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. " is " .. areaOfCircle .. 
     "pixels².", 0, 0, Arial, textSize)

-- 

