-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Types
type UsedAs<T> = Fusion.UsedAs<T>
type Setting = {
    [string] : number | boolean
}

-- // Components/Utils
local Utils = script.Parent.Utils
local FrameTemplate = require(Utils.FrameTemplate)
local Close = require(Utils.Close)

-- // Settings Components
local SettingFrame = require(script.SettingFrame)

-- // Data
local UserSettings : {Setting} = {
    ["High Quality"] = true,
    ["Night Cycle"] = true,
    ["SFX"] = true,
    ["Music"] = 100,
    ["Customer Effects"] = true
}

local function Settings(
    scope: Fusion.Scope,
    props: {
        Position : UsedAs<UDim2>,
        Parent : UsedAs<Instance>
    }
)
    return FrameTemplate(scope, {
        Name = "Settings",
        Size = UDim2.fromScale(0.455, 0.627),
        Position = props.Position,
        Image = "rbxassetid://140018696132341",
        Parent = props.Parent,

        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
                AspectRatio = 1.511
            },
            Close(scope, {
                Size = UDim2.fromScale(0.0958, 0.151),
                Position = UDim2.fromScale(0.924, 0.107),
                Frame = "Settings",
                AspectRatio = 0.961
            }),
            scope:New "ScrollingFrame" {
                Name = "ScrollingFrame",
                Active = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                CanvasSize = UDim2.fromScale(0, 1),
                Position = UDim2.fromScale(0.504, 0.606),
                ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                ScrollBarThickness = 4,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Size = UDim2.fromScale(0.952, 0.693),
                [Fusion.Children] = scope:ForPairs(UserSettings, function(_, _, name, value)
                    return SettingFrame(scope, {
                        Name = name,
                        Value = value
                    })
                end)
            }
        }
    })
end

return Settings