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

local function Prompt(
    scope: Fusion.Scope,
    props: {
        Position : UsedAs<UDim2>,
        Parent : UsedAs<Instance>,
        Title : UsedAs<string>,
        Text : UsedAs<string>
    }
)
    return FrameTemplate(scope, {
        Name = "Prompt",
        Image = "rbxassetid://109247852888504",
        Size = UDim2.fromScale(0.382, 0.508),
        Parent = props.Parent,
        Position = props.Position,
        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
                ASpectRatio = 1.34
            },
            scope:New "TextLabel" {
                Name = "TextLabel",
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                Position = UDim2.fromScale(0.499, 0.427),
                Size = UDim2.fromScale(0.929, 0.236),
                Text = props.Text,
                TextColor3 = Color3.fromRGB(4, 44, 80),
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 3,
                [Fusion.Children] = {
                    scope:New "UIPadding" {
                        PaddingBottom = UDim.new(0.149, 0),
                        PaddingTop = UDim.new(0.149, 0)
                    }
                }
            },
            Close(scope, {
                Position = UDim2.fromScale(0.134, 0.186),
                Size = UDim2.fromScale(0.555, 0.228),
                Frame = "Prompt"
            }),
            ButtonTemplate(scope, {
                Name = "Confirm",
                Position = UDim2.fromScale(0.499, 0.675),
                Size = UDim2.fromScale(0.218, 0.292),
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        ASpectRatio = 3.256
                    }
                },
                OnClick = function()
                    return
                end
            })
        }
    })
end

return Prompt