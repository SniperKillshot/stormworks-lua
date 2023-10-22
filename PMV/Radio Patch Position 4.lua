--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey


--[====[ HOTKEYS ]====]
-- Press F6 to simulate this file
-- Press F7 to build the project, copy the output from /_build/out/ into the game to use
-- Remember to set your Author name etc. in the settings: CTRL+COMMA


--[====[ EDITABLE SIMULATOR CONFIG - *automatically removed from the F7 build output ]====]
---@section __LB_SIMULATOR_ONLY__
do
    ---@type Simulator -- Set properties and screen sizes here - will run once when the script is loaded
    simulator = simulator
    simulator:setScreen(1, "3x3")
    simulator:setProperty("ExampleNumberProperty", 123)

    -- Runs every tick just before onTick; allows you to simulate the inputs changing
    ---@param simulator Simulator Use simulator:<function>() to set inputs etc.
    ---@param ticks     number Number of ticks since simulator started
    function onLBSimulatorTick(simulator, ticks)

        -- touchscreen defaults
        local screenConnection = simulator:getTouchScreen(1)
        simulator:setInputBool(1, screenConnection.isTouched)
        simulator:setInputNumber(1, screenConnection.width)
        simulator:setInputNumber(2, screenConnection.height)
        simulator:setInputNumber(3, screenConnection.touchX)
        simulator:setInputNumber(4, screenConnection.touchY)

        -- NEW! button/slider options from the UI
        simulator:setInputBool(31, simulator:getIsClicked(1))       -- if button 1 is clicked, provide an ON pulse for input.getBool(31)
        simulator:setInputNumber(31, simulator:getSlider(1))        -- set input 31 to the value of slider 1

        simulator:setInputBool(4, simulator:getIsToggled(1))   
        simulator:setInputBool(5, simulator:getIsToggled(2)) 
        simulator:setInputBool(6, simulator:getIsToggled(3)) 
        simulator:setInputBool(7, simulator:getIsToggled(4))     -- make button 2 a toggle, for input.getBool(32)
        simulator:setInputNumber(32, simulator:getSlider(2) * 50)   -- set input 32 to the value from slider 2 * 50
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!



i2T = false
i2TP = false
i3T = false
i3TP = false
i4T = false
i4TP = false
i5T = false
i5TP = false
i6T = false
i8T = false

function onTick()
isP1 = input.getBool(1)
isP2 = input.getBool(2)
in1X = input.getNumber(3)
in1Y = input.getNumber(4)
in2X = input.getNumber(5)
in2Y = input.getNumber(6)
a1 = input.getBool(4)
a2 = input.getBool(5)
a3 = input.getBool(6)
a4 = input.getBool(7)

if (isP1 and isInRect(46,44,30,8,in1X,in1Y)) or (isP2 and isInRect(46,44,30,8,in2X,in2Y)) 
then
i3TP =false
i3T =false
i4T=false
i5T=false
i4TP =false
i5TP =false
i2TP=true
end
if not (isP1 or isP2) and i2TP then
i2TP = false
i2T = not i2T
end
output.setBool(4, i2T)

if (isP1 and isInRect(46,31,30,8,in1X,in1Y)) or (isP2 and isInRect(46,31,30,8,in2X,in2Y)) 
then
    i2TP =false
    i2T =false
    i4T=false
    i4TP =false
    i5T=false
    i5TP =false
i3TP=true
end
if not (isP1 or isP2) and i3TP then
i3TP = false
i3T = not i3T
end
output.setBool(3, i3T)

if (isP1 and isInRect(46,18,30,8,in1X,in1Y)) or (isP2 and isInRect(46,18,30,8,in2X,in2Y)) 
then
    i2TP =false
    i2T =false
    i3T=false
    i3TP =false
    i5T=false
    i5TP =false
i4TP=true
end
if not (isP1 or isP2) and i4TP then
i4TP = false
i4T = not i4T
end
output.setBool(2, i4T)

if (isP1 and isInRect(46,6,30,8,in1X,in1Y)) or (isP2 and isInRect(46,6,30,8,in2X,in2Y)) 
then
    i2TP =false
    i2T =false
    i4T=false
    i4TP =false
    i3T=false
    i3TP =false
i5TP=true
end
if not (isP1 or isP2) and i5TP then
i5TP = false
i5T = not i5T
end
output.setBool(1, i5T)

if (isP1 and isInRect(0,56,24,8,in1X,in1Y)) or (isP2 and isInRect(0,56,24,8,in2X,in2Y)) then
i6T=true
else
i6T=false
end
output.setBool(5, i6T)

if (isP1 and isInRect(48,56,26,8,in1X,in1Y)) or (isP2 and isInRect(48,56,26,8,in2X,in2Y)) then
i8T=true
else
i8T=false
end
output.setBool(6, i8T)
end

function onDraw()

setC(0,0,0)
screen.drawRectF(0,6,33,8)
setC(96,96,96)
screen.drawTextBox(0,6,33,8,"POS 4",0,0)

setC(0,0,96)
screen.drawRectF(46,44,30,8)text="ant 4"
if i2T 

then
text="ant 4"
end
if i2T 

then
setC(0,96,0)
screen.drawRectF(46,44,30,8)
end

if a4
then
    setC(96,0,0)
    screen.drawRectF(46,44,30,8)
    i2T = false
    i2TP = false
    end
if i2T 

then
setC(96,96,96)
else
setC(96,96,96)
end
screen.drawTextBox(46,44,30,8,text,0,0)

setC(0,0,96)
screen.drawRectF(46,31,30,8)text="ant 3"
if i3T 

then
text="ant 3"
end
if i3T 

then
setC(0,96,0)
screen.drawRectF(46,31,30,8)
end

if a3
then
    setC(96,0,0)
    screen.drawRectF(46,31,30,8)
    i3T = false
    i3TP = false
    end
if i3T 

then
setC(96,96,96)
else
setC(96,96,96)
end
screen.drawTextBox(46,31,30,8,text,0,0)

setC(0,0,96)
screen.drawRectF(46,18,30,8)text="ANT 2"
if i4T 

then
text="ant 2"
end
if i4T 

then
setC(0,96,0)
screen.drawRectF(46,18,30,8)
end

if a2
then
    setC(96,0,0)
    screen.drawRectF(46,18,30,8)
    i4T = false
    i4TP = false
    end
if i4T 

then
setC(96,96,96)
else
setC(96,96,96)
end
screen.drawTextBox(46,18,30,8,text,0,0)

setC(0,0,96)
screen.drawRectF(46,6,30,8)text="Ant 1"
if i5T 

then
text="ant 1"
end
if i5T 

then
setC(0,96,0)
screen.drawRectF(46,6,30,8)
end
if a1
then
    setC(96,0,0)
    screen.drawRectF(46,6,30,8)
    i5T = false
    i5TP = false
    end


if i5T 

then
setC(96,96,96)
else
setC(96,96,96)
end
screen.drawTextBox(46,6,30,8,text,0,0)

setC(0,0,96)
screen.drawRectF(0,56,24,8)text="menu"
if i6T then
text="menu"
end
if i6T then
setC(96,96,96)
screen.drawRectF(0,56,24,8)
end
if i6T then
setC(0,0,0)
else
setC(96,96,96)
end
screen.drawTextBox(0,56,24,8,text,0,0)

setC(0,0,96)
screen.drawRectF(48,56,26,8)text="back"
if i8T then
text="back"
end
if i8T then
setC(96,96,96)
screen.drawRectF(48,56,26,8)
end
if i8T then
setC(0,0,0)
else
setC(96,96,96)
end
screen.drawTextBox(48,56,26,8,text,0,0)
end

function setC(r,g,b,a)
if a==nil then a=255 end
screen.setColor(r,g,b,a)
end

function isInRect(x,y,w,h,px,py)
return px>=x and px<=x+w and py>=y and py<=y+h
end


