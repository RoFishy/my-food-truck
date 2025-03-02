-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Types
type UsedAs<T> = Fusion.UsedAs<T>

-- // Components/Utils
local Utils = script.Parent.Utils
local ButtonTemplate = require(Utils.ButtonTemplate)
local FrameTemplate = require(Utils.FrameTemplate)
local Close = require(Utils.Close)

-- // Shop Components
local LargeFrame = require(script.LargeFrame)
local SmallFrame = require(script.SmallFrames)

local function Shop(
    scope: Fusion.Scope,
    props: {
        Position : UsedAs<UDim2>,
        Parent : UsedAs<Instance>
    }
)
    return FrameTemplate(scope, {
        Name = "Shop",
        Size = UDim2.fromScale(0.562, 0.741),
        Image =  "rbxassetid://97122732554680",
        Position = props.Position,
        Parent = props.Parent,
        [Fusion.Children] = {
            Close(scope, {
                Position = UDim2.fromScale(1, 0),
                Frame = "Shop",
                Size = UDim2.fromScale(0.109, 0.153),
                AspectRatio = 0.967
            }),
            scope:New "ScrollingFrame" {
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                CanvasSize = UDim2.fromScale(0, 2.36),
                Position = UDim2.fromScale(0.029, 0.253),
                ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                ScrollBarThickness = 10,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Size = UDim2.fromScale(0.956, 0.707),

                [Fusion.Children] = {
                    scope:New "UIPadding" {
                        Name = "UIPadding"
                    },
                    
                }
            }

        }
    })
end

return Shop