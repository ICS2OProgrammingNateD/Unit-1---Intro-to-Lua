-- Title: HelloWorld
-- Name: Nate Day
-- Course: ICS2O
-- This program displays Hello to the simulator and to the command terminal.


--print to the command terminal
print("Hello World!")
print("This class is AWESOME!")

--hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-- sets the backround colour
display.setDefault("background", 123/255, 122/255, 121/255)

-- create a local variable
local textObject

-- make the text object display my name
textObject = display.newText ("Hello!", 512, 400, "Comic Sans MS", 200)

--change the text colour
textObject:setTextColor(0/255, 0/255, 0/255)

-- creating another variable
local textObjectSignature 

--displays the creator of the app
textObjectSignature = display.newText ("Created by: Nate Day", 500, 600, "Comic Sans MS", 50)