-- Title: Math Fun
-- Name: Nate Day
-- Course: ICS2O
-- This program creates a random question generator 
--(using addition, subtraction, multiplication, and division).


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 0/255, 135/255, 139/255)

--display.setTextColor("Game Over", .8, 0, 0)

---------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------------------------


-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer = 0
local incorrectObject
local points = 0
local pointsText
local correctAnswerObject
local lives = 3
local livesText
local gameOverText
local youWinText
local RandomOperator
local correctAnswer1



---------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate a random number between 1 & 2

	RandomOperator = math.random(1,4)

	randomNumber1 = math.random(2, 12)
	randomNumber2 = math.random(2, 12)

	-- If the Random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create the question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create the question in text object 
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	-- if random operator is 3 then do multiplication
	elseif (randomOperator == 3) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create the question in text object 
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = " 
		
	-- otherwise, if random operator is 4 then do division
	elseif (randomOperator == 4) then
		--calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2

		-- show division problem
		correctAnswer1 = randomNumber1 * randomNumber2 
		correctAnswer = correctAnswer1 / randomNumber1	
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

-- set the answer (when wrong) to display incorrect
local function Hideincorrect()
	incorrectObject.isVisible = false
	correctAnswerObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins typing
	if ( event.phase == "began" ) then

		-- clear text 
		event.target.text = ""

	elseif (event.phase == "submitted") then 
	
	    -- when the answer is submitted	set their input to userAnswer
	    userAnswer = tonumber(event.target.text)

	    -- if the users answer and the correct answer are the same:
	    if (userAnswer == correctAnswer) then
		   correctObject.isVisible = true
		   timer.performWithDelay(2000, HideCorrect)
		   -- give a point if user gets the correct answer
	       points = points + 1
           -- upadate it in the display object
		   pointsText.text = "Points = " .. points
		   -- clear text 
		   event.target.text = ""
		   
		else
			incorrectObject.isVisible = true
		    timer.performWithDelay(2000, Hideincorrect) 
		    correctAnswerObject = display.newText( " The correct answer is " .. correctAnswer .. "!", 512, 680, nil, 50)
		   	correctAnswerObject.isVisible = true
		   	-- take a life if user gets the incorrect answer
	        lives = lives - 1
            -- upadate it in the display object
		    livesText.text = "Lives = " .. lives
		end   

		    -- if points reach 5 points display You Win!
	    if  
	    	(points >= 5)  then
			youWinText = display.newText( "You Win!", 512, 200, native.systemFontBold, 180)
			youWinText:setTextColor( 0, 1, 0)
			youWinText.isVisible = true
		end 

		if    -- If lives = less or equal to zero display Game Over!
		    (lives <= 0) then
			gameOverText = display.newText( "Game Over!", 512, 200, native.systemFontBold, 180)
			gameOverText:setTextColor(.8, 0, 0)
			gameOverText.isVisible = true
		end   
			-- clear text 
		    event.target.text = ""   
	end
end
		
	




-------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------------------

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, 150, 50, nil, 50)
-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(.5, .3, .8)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(.2, 1, 0)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(1, 0, 0)
incorrectObject.isVisible = false

-- create numeric field 
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the amount of lives as a text object
livesText = display.newText("Lives = " .. lives, 150, 100, nil, 50)

------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()




 