-- Title: Math Fun
-- Name: Nate Day
-- Course: ICS2O
-- This program creates a random question generator 
--(using addition, subtraction, multiplication, and division).


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
backgroundImage = display.newImageRect("Images/background.jpg", 1304, 769)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY

---------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------------------------


-- create local variables
local backgroundImage
local youWin
local gameOver
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
local randomOperator
local correctAnswer1
local tempRandomNumber



---------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate a random number between 1 & 2

	randomOperator = math.random(1, 4)

	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	-- If the Random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create the question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	    -- otherwise, if the random operator is 2, do subtraction
	    elseif (randomOperator == 2) then
		
		-- if randomNumber1 is smaller than randomNumber2 then swap them
	    if(randomNumber1 < randomNumber2) then
			tempRandomNumber = randomNumber1
			randomNumber1 = randomNumber2
			randomNumber2 = tempRandomNumber
		end

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
		correctAnswer1 = randomNumber1 * randomNumber2
		correctAnswer = correctAnswer1 / randomNumber1
		questionObject.text = correctAnswer1 .. " / " .. randomNumber1 .. " = "
	
		
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
		    correctAnswerObject = display.newText( " The correct answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    correctAnswerObject:setTextColor(101/255, 14/255, 189/255 )
		   	correctAnswerObject.isVisible = true
		   	-- take a life if user gets the incorrect answer
	        lives = lives - 1
            -- upadate it in the display object
		    livesText.text = "Lives = " .. lives
		end   

		    -- if points reach 5 points display You Win!
	    if  
	    	(points >= 5)  then
			youWin = display.newImageRect("Images/youWin.jpg", 1304, 769)
			youWin.x = display.contentCenterX
			youWin.y = display.contentCenterY
			numericField.isVisible = false

		end 

		if    -- If lives = less or equal to zero display Game Over!
		    (lives <= 0) then
			gameOver = display.newImageRect("Images/gameOver.jpg", 1304, 769)
			gameOver.x = display.contentCenterX
			gameOver.y = display.contentCenterY
			numericField.isVisible = false


		end   
			-- clear text 
		    event.target.text = ""   
	end
end
		
	




-------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------------------

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, 150, 50, native.systemFontBold, 50)
pointsText:setTextColor(32/255, 225/255, 239/255)

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, native.systemFontBold, 50)
questionObject:setTextColor(.0, .0, .0)

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
numericField.isVisible = true

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the amount of lives as a text object
livesText = display.newText("Lives = " .. lives, 150, 100, native.systemFontBold, 50)
livesText:setTextColor(32/255, 225/255, 239/255)

------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()




 