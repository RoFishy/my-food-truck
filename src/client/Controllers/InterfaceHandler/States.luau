-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // ui
local Interface = require(script.InterfaceHandler)
local UIScope = Interface.UIScope

-- // states
local States = {}

-- HUD
States.HUDToggle = UIScope:Value(true)

return States