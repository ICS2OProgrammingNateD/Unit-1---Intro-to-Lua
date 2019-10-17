-- Title: PhysicsAndCollisions
-- Name: Nate Day
-- Course: ICS2O
-- This program is made to have objects interact using physics.

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)



-- load sound
audio.loadStream()

-- add background music
backgroundMusic = audio.loadStream("Sounds/bkgMusic.mp3")
audio.play(backgroundMusic, {loops = -1})

--------------------------------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------------------------------

local backgroundMusic
local backgroundImage
local physics

local ground
local beam
local beam2

local ball1
local ball2
local ball3
local ball4






---------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------

physics = require("physics")


-- start physics
physics.start()


-- create first ball
local function firstBall()
	-- creating first ball 
	ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.5, radius = 25})
end


-- create second ball
local function secondBall()
	-- creating second ball 
	ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density = 1.0, friction = 0.5, bounce = 0.5, radius = 50})
	ball2:scale( 2, 2)
end


-- create third ball
local function thirdBall()
	-- creating second ball 
	ball3 = display.newImage("Images/super_ball.png", 1024, 0)

	-- add to physics
	physics.addBody(ball3, {density = 1.0, friction = 0.5, bounce = 0.5, radius = 75})
	ball3:scale( 3, 3)
end

-- create fourth ball
local function fourthBall()
	-- creating second ball 
	ball4 = display.newImage("Images/super_ball.png", 1024, 0)

	-- add to physics
	physics.addBody(ball4, {density = 1.0, friction = 0.5, bounce = 0.5, radius = 12.5})
	ball4:scale( 0.5, 0.5)
end






--------------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------


-- creating the ground image and setting the location
ground = display.newImage("Images/ground.png", display.contentWidth/2, 750)

-- change the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics
physics.addBody(ground, "static", {friction = 0.5, bounce = 0.5})

----------------------------------------------------------------------------------------------

-- make new beam image
beam = display.newImage("Images/beam.png", 0, 0)

-- set the x and y position
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

-- change the width to be the same as the screen
beam.width = display.contentWidth/2
beam.height = display.contentHeight* 1/10

-- rotate the beam -60 degrees so it is on a angle
beam:rotate(45)

-- send it to the back layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction = 0.5, bounce = 0.5})



-- make new beam image
beam2 = display.newImage("Images/beam.png", 0, 0)

-- set the x and y position
beam2.x = 900
beam2.y = display.contentCenterY*1.65

-- change the width to be the same as the screen
beam2.width = display.contentWidth/2
beam2.height = display.contentHeight* 1/10

-- rotate the beam -60 degrees so it is on a angle
beam2:rotate(-45)

-- send it to the back layer
beam2:toBack()

-- add to physics
physics.addBody(beam2, "static", {friction = 0.5, bounce = 0.5})

-- Create background image
backgroundImage = display.newImageRect("Images/bkg.jpg", 1024, 768)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY

backgroundImage:toBack()




----------------------------------------------------------------------------------
-- TIMER DELAYS
----------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 250, thirdBall)
timer.performWithDelay( 0, fourthBall)