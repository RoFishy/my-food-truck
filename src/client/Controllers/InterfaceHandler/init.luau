-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Components
local Components = script.Components
local HUD = require(Components.HUD)
local Frames = require(Components.Frames)

-- // Scopes
local Scoped = Fusion.scoped
local UIScope = Scoped(Fusion, {
    HUD = HUD
})

-- // Module
local InterfaceHandler = {}

function InterfaceHandler.Init()
    UIScope:HUD  {
        scope = UIScope
    }
    Frames:Init()
end

function InterfaceHandler.Start()

end

return InterfaceHandler