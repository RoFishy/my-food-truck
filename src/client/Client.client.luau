print("Hello world, from client!")-- // Start
local StartTime = tick()

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Utils
local Utils = ReplicatedStorage:WaitForChild("Utils")
local Loader = require(Utils.Loader)

-- // Folders
local Controllers = script.Parent:WaitForChild("Controllers")

print("-----[CONTROLLERS]----")
Loader.Init(Controllers:GetChildren())

local EndTime = tick()
print(`Server loaded in {EndTime - StartTime}ms`)