-- // obj
local Scopes = require(script.Utils.Scopes)
local States = require(script.Utils.States)

local HUDToggle = States.HUDToggle
local UIScope = Scopes.UIScope

-- // Module
local InterfaceHandler = {}

function InterfaceHandler.Init()

end

function InterfaceHandler.Start()
    UIScope:HUD  {
        scope = UIScope
    }
    print("did this shit correctly")
    task.delay(3, function()
        HUDToggle:set(true)
        print("just set this shit bro")
    end)
end

return InterfaceHandler