-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Signal  = require(Packages.Signal)

-- // Module
return {
    ToggleHUD = Signal.new(),
    ToggleFrame = Signal.new()
}