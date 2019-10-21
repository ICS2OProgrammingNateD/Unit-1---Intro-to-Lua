-- Title: LivesAndTimers
-- Name: Nate Day
-- Course: ICS2O
-- This program is a updated version of Math Fun that displays hearts and a countdown timer



-- create variable for sound
local Sound1 = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3")
local Sound2 = audio.loadSound("Sounds/Wrong Buzzer Sound Effect.mp3")







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

local secondsLeft = 10
local timeDisplay
local countDownTimer = 0
local clockText

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

local randomOperator
local correctAnswer1
local tempRandomNumber

local totalSeconds = 10
local secondsLeft = 10
local clockText
local countdownTimer

local lives = 3
local heart1
local heart2
local heart3



---------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------

local function Updatetime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left on the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 2 ) then
			heart3.isVisible = false
			incorrectObject.isVisible = true
			audio.play(Sound2)
			incorrectObject = display.newText( "The Correct Answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    incorrectObject:setTextColor(0/255, 0/255, 0/255 )
		    incorrectObject.isVisible = true
		   	timer.performWithDelay(2000, Hideincorrect) 
		 

		elseif (lives == 1) then
			heart2.isVisible = false
			incorrectObject = display.newText( "The Correct Answer is ".. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    incorrectObject:setTextColor(0/255, 0/255, 0/255 )
		   	incorrectObject.isVisible = true
		   	timer.performWithDelay(2000, Hideincorrect) 
			
		   	

		elseif (lives == 0) then
			heart1.isVisible = false
			incorrectObject = display.newText( "The Correct Answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    incorrectObject:setTextColor(0/255, 0/255, 0/255 )
		    incorrectObject.isVisible = true
		   	timer.performWithDelay(2000, Hideincorrect)  
		end
	end
end


if (lives == 0) then
	gameOver = display.newImageRect("Images/gameOver.jpg", 1304, 769)
	gameOver.x = display.contentCenterX
	gameOver.y = display.contentCenterY
end




-- function that calls the timer 
local function StartTimer()
	--create countdown that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, Updatetime, 0)
end

-- function that restarts the count down clock
local function setClockStart()
   secondsLeft = 10
   clockText.text = "00:10"
end



local function AskQuestion()
	-- generate a random number between 1 & 4

	randomOperator = math.random(1, 4)

	randomNumber1 = math.random(1, 10)
	randomNumber2 = math.random(1, 10)

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

if (secondsLeft == 0) then
	Hideincorrect()
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
	secondsLeft = totalSeconds
end

local function GameOver()
    gameOver = display.newImageRect("Images/gameOver.jpg", 1304, 769)
    gameOver.x = display.contentCenterX
	gameOver.y = display.contentCenterY
	numericField.isVisible = false
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
		   audio.play(Sound1)
		   timer.performWithDelay(2000, HideCorrect)
		   -- give a point if user gets the correct answer
	       points = points + 1
	       secondsLeft = 10
           -- upadate it in the display object
		   pointsText.text = "Points = " .. points
		   -- clear text 
		   event.target.text = ""
		   
		   -- else user input wrong answer

		elseif (lives == 3) then
			incorrectObject.isVisible = true
			audio.play(Sound2)
			heart3.isVisible = false
		    timer.performWithDelay(2000, Hideincorrect) 
		    correctAnswerObject = display.newText( " The correct answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    correctAnswerObject:setTextColor(0/255, 0/255, 0/255 )
		   	correctAnswerObject.isVisible = true
		   	lives = 2
		   

		 elseif (lives == 2) then
			incorrectObject.isVisible = true
			audio.play(Sound2)
			heart2.isVisible = false
		    timer.performWithDelay(2000, Hideincorrect) 
		    correctAnswerObject = display.newText( " The correct answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    correctAnswerObject:setTextColor(0/255, 0/255, 0/255 )
		   	correctAnswerObject.isVisible = true  	
		   	lives = 1
		   

		 else 
			incorrectObject.isVisible = true
			audio.play(Sound2)
			heart1.isVisible = false
		    timer.performWithDelay(2000, Hideincorrect) 
		    correctAnswerObject = display.newText( " The correct answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    correctAnswerObject:setTextColor(0/255, 0/255, 0/255 )
		   	correctAnswerObject.isVisible = true
		   	timer.performWithDelay(2000, GameOver) 
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


-- create the countdown clock 
clockText = display.newText("00:10", 150, 80, native.systemFontBold, 80)
clockText:setFillColor( 1, 1, 1 )
clockText.isVisible = true

	

-- create the hearts to display on the screen
heart1 = display.newImageRect("Images/heart.png", 150, 150)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

-- create the hearts to display on the screen
heart2 = display.newImageRect("Images/heart.png", 150, 150)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

-- create the hearts to display on the screen
heart3 = display.newImageRect("Images/heart.png", 150, 150)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/2, 450, native.systemFontBold, 50)
pointsText:setTextColor(101/255, 14/255, 189/255)

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


------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
StartTimer()


 