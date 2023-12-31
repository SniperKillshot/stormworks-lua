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
             -- if button 1 is clicked, provide an ON pulse for input.getBool(31)
        simulator:setInputNumber(7, simulator:getSlider(1))   
        simulator:setInputNumber(8, simulator:getSlider(2) * 2)  
        simulator:setInputNumber(9, simulator:getSlider(3) * 3)  
        simulator:setInputNumber(10, simulator:getSlider(4) * 4)       -- set input 31 to the value of slider 1

         -- set input 32 to the value from slider 2 * 50
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!



i10Toggled = false

i15Toggled = false

i16Toggled = false

i17Toggled = false

i26Toggled = false

function onTick()
isP1 = input.getBool(1)
isP2 = input.getBool(2)

in1X = input.getNumber(3)
in1Y = input.getNumber(4)
in2X = input.getNumber(5)
in2Y = input.getNumber(6)
p1 = input.getNumber(7)
p2 = input.getNumber(8)
p3 = input.getNumber(9)
p4 = input.getNumber(10)

if (isP1 and isInRect(72,1,24,6,in1X,in1Y)) or (isP2 and isInRect(72,1,24,6,in2X,in2Y)) then
i10Toggled=true
else
i10Toggled=false
end
output.setBool(1, i10Toggled)

if (isP1 and isInRect(72,42,24,6,in1X,in1Y)) or (isP2 and isInRect(72,42,24,6,in2X,in2Y)) then
i15Toggled=true
else
i15Toggled=false
end
output.setBool(4, i15Toggled)

if (isP1 and isInRect(72,29,24,6,in1X,in1Y)) or (isP2 and isInRect(72,29,24,6,in2X,in2Y)) then
i16Toggled=true
else
i16Toggled=false
end
output.setBool(3, i16Toggled)

if (isP1 and isInRect(72,14,24,6,in1X,in1Y)) or (isP2 and isInRect(72,14,24,6,in2X,in2Y)) then
i17Toggled=true
else
i17Toggled=false
end
output.setBool(2, i17Toggled)

if (isP1 and isInRect(0,56,24,8,in1X,in1Y)) or (isP2 and isInRect(0,56,24,8,in2X,in2Y)) then
i26Toggled=true
else
i26Toggled=false
end
output.setBool(5, i26Toggled)
end

function onDraw()

setC(21,77,37)
screen.drawRectF(72,1,24,6)
setC(0,0,96)
screen.drawRectF(72,1,24,6)text="Edit"
if i10Toggled then
text="edit"
end
if i10Toggled then
setC(96,96,96)
screen.drawRectF(72, 1, 24, 6)
end
if i10Toggled then
setC(0,0,0)
else
setC(96,96,96)
end
screen.drawTextBox(72, 1, 24, 6, text, 0, 0)

setC(0,0,96)
screen.drawRectF(72,42,24,6)
setC(0,0,96)
screen.drawRectF(72,42,24,6)text="Edit"
if i15Toggled then
text="edit"
end
if i15Toggled then
setC(96,96,96)
screen.drawRectF(72, 42, 24, 6)
end
if i15Toggled then
setC(0,0,0)
else
setC(96,96,96)
end
screen.drawTextBox(72, 42, 24, 6, text, 0, 0)

setC(21,77,37)
screen.drawRectF(72,29,24,6)
setC(0,0,96)
screen.drawRectF(72,29,24,6)text="Edit"
if i16Toggled then
text="edit"
end
if i16Toggled then
setC(96,96,96)
screen.drawRectF(72, 29, 24, 6)
end
if i16Toggled then
setC(0,0,0)
else
setC(96,96,96)
end
screen.drawTextBox(72, 29, 24, 6, text, 0, 0)

setC(21,77,37)
screen.drawRectF(72,14,24,6)
setC(0,0,96)
screen.drawRectF(72,14,24,6)text="Edit"
if i17Toggled then
text="edit"
end
if i17Toggled then
setC(96,96,96)
screen.drawRectF(72, 14, 24, 6)
end
if i17Toggled then
setC(0,0,0)
else
setC(96,96,96)
end
screen.drawTextBox(72, 14, 24, 6, text, 0, 0)

setC(69,28,1)
screen.drawRectF(0,0,30,7)
setC(0,0,0)
screen.drawRectF(0,0,30,7)
setC(96,96,96)
screen.drawTextBox(0, 0, 30, 7, "POS 1", 0, 0)

setC(43,93,90)
screen.drawRectF(38,0,33,7)
setC(0,0,0)
screen.drawRectF(38,0,33,7)
setC(96,96,96)
if p1 == 1 then
screen.drawTextBox(38, 0, 33, 7, "ANT 1", 0, 0)
end
if p1 == 2 then
    screen.drawTextBox(38, 0, 33, 7, "ANT 2", 0, 0)
end

if p1 == 3 then
    screen.drawTextBox(38, 0, 33, 7, "ANT 3", 0, 0)
end

if p1 == 4 then
    screen.drawTextBox(38, 0, 33, 7, "ANT 4", 0, 0)
end

if p1 == 0 then
    screen.drawTextBox(38, 0, 33, 7, "none", 0, 0)
end
setC(69,28,1)
screen.drawRectF(0,42,30,8)
setC(0,0,0)
screen.drawRectF(0,42,30,8)
setC(96,96,96)
screen.drawTextBox(0, 42, 30, 8, "pos 4", 0, 0)

setC(43,93,90)
screen.drawRectF(0,29,30,6)
setC(0,0,0)
screen.drawRectF(0,29,30,6)
setC(96,96,96)
screen.drawTextBox(0, 29, 30, 6, "pos 3", 0, 0)

setC(69,28,1)
screen.drawRectF(0,13,30,7)
setC(0,0,0)
screen.drawRectF(0,13,30,7)
setC(96,96,96)
screen.drawTextBox(0, 13, 30, 7, "POS 2", 0, 0)

setC(43,93,90)
screen.drawRectF(38,42,31,7)
setC(0,0,0)
screen.drawRectF(38,42,31,7)
setC(96,96,96)
if p4 == 1 then
    screen.drawTextBox(38, 42, 31, 7, "ant 1", 0, 0)
    end
    if p4 == 2 then
        screen.drawTextBox(38, 42, 31, 7, "ant 2", 0, 0)
    end
    
    if p4 == 3 then
        screen.drawTextBox(38, 42, 31, 7, "ant 3", 0, 0)
    end
    
    if p4 == 4 then
        screen.drawTextBox(38, 42, 31, 7, "ant 4", 0, 0)
    end
    
    if p4 == 0 then
        screen.drawTextBox(38, 42, 31, 7, "none", 0, 0)
    end



setC(69,28,1)
screen.drawRectF(38,28,31,8)
setC(0,0,0)
screen.drawRectF(38,28,31,8)
setC(96,96,96)
if p3 == 1 then
    screen.drawTextBox(38, 28, 31, 8, "ANT 1", 0, 0)
    end
    if p3 == 2 then
        screen.drawTextBox(38, 28, 31, 8, "ANT 2", 0, 0)
    end
    
    if p3 == 3 then
        screen.drawTextBox(38, 28, 31, 8, "ANT 3", 0, 0)   
     

    end
    
    if p3 == 4 then
        screen.drawTextBox(38, 28, 31, 8, "ANT 4", 0, 0)    
    end
    
    
    if p3 == 0 then
        screen.drawTextBox(38, 28, 31, 8, "none", 0, 0)
        end



setC(43,93,90)
screen.drawRectF(38,12,32,10)
setC(0,0,0)
screen.drawRectF(38,12,32,10)
setC(96,96,96)

if p2 == 1 then
    screen.drawTextBox(38, 12, 32, 10, "ANt 1", 0, 0)
    end
    if p2 == 2 then
        screen.drawTextBox(38, 12, 32, 10, "ANt 2", 0, 0)
        end
    
    if p2 == 3 then
        screen.drawTextBox(38, 12, 32, 10, "ANt 3", 0, 0)


    end
    
    if p2 == 4 then
        screen.drawTextBox(38, 12, 32, 10, "ANt 4", 0, 0)
        end
    
    
    if p2 == 0 then
        screen.drawTextBox(38, 12, 32, 10, "none", 0, 0)
            end


setC(0,0,96)
screen.drawRectF(0,56,24,8)
setC(0,0,96)
screen.drawRectF(0,56,24,8)text="Back"
if i26Toggled then
text="BACK"
end
if i26Toggled then
setC(96,96,96)
screen.drawRectF(0, 56, 24, 8)
end
if i26Toggled then
setC(0,0,0)
else
setC(96,96,96)
end
screen.drawTextBox(0, 56, 24, 8, text, 0, 0)
end

function setC(r,g,b,a)
if a==nil then a=255 end
screen.setColor(r,g,b,a)
end

function isInRect(x,y,w,h,px,py)
return px>=x and px<=x+w and py>=y and py<=y+h
end




