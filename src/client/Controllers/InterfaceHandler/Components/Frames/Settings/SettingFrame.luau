-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Settings components
local Slider = require(script.Parent.Slider)
local Toggle = require(script.Parent.Toggle)

-- // Types
type UsedAs<T> = Fusion.UsedAs<T>

local function SettingFrame(
    scope : Fusion.Scope,
    props : {
        Name: UsedAs<string>,
        Value: UsedAs<number | boolean>,
    }

)
    
end

return SettingFrame