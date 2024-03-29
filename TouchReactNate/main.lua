-- Title: TouchAndReact
-- Name: Nate Day
-- Course: ICS2O
-- This program creates a image that when touched can react.

-- load sound
audio.loadSound()

-- add background music
local mouseClick = audio.loadSound("Sounds/Button Sounds.wav")


local function click( touch )
	if (touch.phase == "began") then
		audio.play(mouseClick)
	end
end

Runtime:addEventListener("touch", click)








-- set background colour
display.setDefault ("background", 204/255, 128/255, 0/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create variable for sound
local Sound1 = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3")
local Sound2 = audio.loadSound("Sounds/Wrong Buzzer Sound Effect.mp3")

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false
local checkmark = display.newImageRect("Images/checkmark.png", 150, 150)
checkmark.x = 512
checkmark.y = 650
checkmark.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		audio.play(Sound1)
        checkmark.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
    end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

local function RedButtonListener2(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		audio.play(Sound2)
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
    end
end



-- add the respective listeners to each object
redButton:addEventListener("touch", RedButtonListener2)

