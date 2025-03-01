-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Components
local Components = script.Components
local HUD = require(Components.HUD)

-- // Scopes
local Scoped = Fusion.scoped
local UIScope = Scoped(Fusion, {
    HUD = HUD
})

-- // Module
local InterfaceHandler = {}

function InterfaceHandler.Init()

end

function InterfaceHandler.Start()
    UIScope:HUD  {
        scope = UIScope
    }
end

return InterfaceHandler