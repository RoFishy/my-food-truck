local Scope = require(script.Parent.Scopes)
local UIScope = Scope.UIScope

local States = {}

States.HUDToggle = UIScope:Value(false)
States.Time = UIScope:Value("10:00 AM")
States.CurrentFrame = UIScope:Value("nil")

return States