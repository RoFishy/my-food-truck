-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

local Scopes = {}

Scopes.UIScope = Fusion.scoped(Fusion, {
    HUD = require(script.Parent.Parent.Components.HUD)
})

return Scopes