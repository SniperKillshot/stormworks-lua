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
        simulator:setInputNumber(31, simulator:getSlider(0))        -- set input 31 to the value of slider 1

        simulator:setInputBool(32, simulator:getIsToggled(2))       -- make button 2 a toggle, for input.getBool(32)
        simulator:setInputNumber(1, simulator:getSlider(1) * 50) 
        simulator:setInputNumber(2, simulator:getSlider(2) * 50) 
        simulator:setInputNumber(3, simulator:getSlider(3) * 50) 

        simulator:setInputNumber(4, simulator:getSlider(4) * 50) 
        simulator:setInputNumber(5, simulator:getSlider(5) * 50) 
        simulator:setInputNumber(6, simulator:getSlider(6) * 50) 
        
        -- set input 32 to the value from slider 2 * 50
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!


function onTick()
rax = input.getNumber(1)
ray = input.getNumber(2)
raz = input.getNumber(3)
gx = input.getNumber(4)
gy = input.getNumber(5)
gz = input.getNumber(6)
tx = input.getNumber(7)
ty = input.getNumber(8)
tz = input.getNumber(9)



output.setBool(1, rtx)



    if rax > (gx-5) and rax < (gx+5) and ray < (gy+5) and ray > (gy-5) and raz < (gz+5) and raz > (gz-5) then rtx = false
    else rtx = true
    end
output.setNumber(1, rax)
output.setNumber(2, ray)
output.setNumber(3, raz)

end



function onDraw()

end



