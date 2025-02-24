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
        scope = InterfaceHandler.UIScope
    }
    task.delay(5, function()
        HUDToggle:set(true)
    end)
end

return InterfaceHandler