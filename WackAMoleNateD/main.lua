-- Title: WhackAMole
-- Name: Nate Day
-- Course: ICS2O
-- This program creates an app that makes an object appear on the screen for an amount of time and then disappear.


-- hide status bar
display.setStatusBar(display.HiddenStatusBar)


-- load sound
audio.loadSound()

-- load sound
audio.loadStream()

-- add background music
backgroundMusic = audio.loadStream("Sounds/bkgMusic.mp3")
audio.play(backgroundMusic, {loops = -1})

-- add background image and display location
backgroundImage = display.newImageRect("Images/background.jpg", 1024, 768)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY

backgroundImage:toBack()


-----------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------------------------------------

local backgroundMusic
local backgroundImage
local moleImage

local points = 0
local pointsText

local mouseClick


----------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------

-- this function makes the mole appear in a random (x, y) position
-- before calling the hide function

function PopUp()

	-- set where the mole is able to pop up
	moleImage.x = math.random( 0, display.contentWidth )
	moleImage.y = math.random( 300, display.contentHeight )

    -- make the mole visible
	moleImage.isVisible = true

	-- call the function hide after 500 milliseconds
	timer.performWithDelay(500, Hide)
end


-- This function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end


-- This function makes the mole invisible and then calls PopUpDelay function
function Hide()

	-- make the mole invisible
	moleImage.isVisible = false

	-- call the PopUpDelay function
    PopUpDelay() 
end
	

-- This function starts the game
function GameStart()
	PopUpDelay()
end


-- This function incrrements the score only if the mole is clicked.
-- It then displays the new score.

function Whacked( event )

	-- If touch phase just started
	if (event.phase == "began") then
       points = points + 1
       pointsText.text = "Points = " .. points

       if  
	    	(points >= 5)  then
			youWin = display.newImageRect("Images/youwin.jpg", 1304, 769)
			youWin.x = display.contentCenterX
			youWin.y = display.contentCenterY

		end 
    end
end




local function click( touch )
	if (touch.phase == "began") then
		audio.play(mouseClick)
	end
end


------------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------------------------------------

-- creating Mole 
moleImage = display.newImageRect("Images/mole.png", 200, 150)

-- setting position
moleImage.x = display.contentCenterX
moleImage.y = display.contentCenterY

-- set mole size to be one third of its orginal size


-- make mole image invisible
moleImage.isVisible = false 


-- create points text and set location
pointsText = display.newText("Points = " .. points, 150, 150, native.systemFontBold, 50)

-- set points Text colour
pointsText:setTextColor(32/255, 255/255, 239/255)


-- add mouse click sound
mouseClick = audio.loadSound("Sounds/Button Sounds.wav")



-----------------------------------------------------------------------------------------------------------------------
-- EVENT LISTENERS
------------------------------------------------------------------------------------------------------------------------

moleImage:addEventListener( "touch", Whacked)


Runtime:addEventListener("touch", click)

GameStart()