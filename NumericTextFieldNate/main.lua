-- Title: NumericTextFields
-- Name: Nate Day
-- Course: ICS2O
-- This program creates a random question generator (using addition).


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 0/255, 135/255, 139/255)


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
local correctAnswer


---------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------


local function AskQuestion()
	-- generates 2 random numbers between a lowest and highest number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2
	
	correctAnswer = randomNumber1 .. " + " .. randomNumber2 .. " + "
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins typing
	if ( event.phase == "began" ) then

		-- clear text 
		event.target.text = ""

	elseif event.phase == "submitted" then 
	
	    -- when the answer is submitted	set their input to userAnswer
	    userAnswer = tonumber(event.target.text)

	    -- if the users answer and the correct answer are the same:
	    if (userAnswer == correctAnswer) then
		   correctObject.isVisible = true
		   timer.performWithDelay(2000, HideCorrect)
		end
	end
end


-------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------------------


-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(.5, .3, .8)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(.2, 1, 0)
correctObject.isVisible = false

-- create numeric field 
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )


------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()


	   
	  


 