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

-- // Global Utils
local GlobalUtils = script.Parent.Parent.Parent.Parent.Utils
local Events = require(GlobalUtils.Events)

local function Deals(
    scope: Fusion.Scope,
    props: {
        Position : UsedAs<UDim2>,
        Parent : UsedAs<Instance>
    }
)
    return FrameTemplate(scope, {
        Name = "Deals",
        Size = UDim2.fromScale(.443, .562),
        Image = "rbxassetid://81929635318929",
        Position = props.Position,
        Parent = props.Parent,

        [Fusion.Children] = {
            Close(scope, {
                Position = UDim2.fromScale(.965, .0429),
                Size = UDim2.fromScale(0.115, 0.168),
                Frame = "Deals"
            }),
            scope:New "UIAspectRatioConstraint" {
                AspectRatio = 1.4
            },
            scope:New "ImageLabel" {
                Name = "Icon",
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://93599131675708",
                Position = UDim2.fromScale(0.29, 0.58),
                Size = UDim2.fromScale(0.315, 0.442),
                ZIndex = 2,
      
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        Name = "UIAspectRatioConstraint",
                    },
                }
            },
            scope:New "TextLabel" {
                Name = "TextLabel",
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                Position = UDim2.fromScale(0.724, 0.359),
                Size = UDim2.fromScale(0.404, 0.419),
                Text = "- +100K Cash".."\n".."- 1 Day (in-game) VIP Customers".."/n".." - 1 Day (in-game) x2 Money",
                TextColor3 = Color3.fromRGB(4, 44, 80),
                TextScaled = true,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 3,
            },
            ButtonTemplate(scope, {
                Name = "Purchase",
                Position = UDim2.fromScale(0.499, 0.491),
                Size = UDim2.fromScale(0.838, 0.583),
                Image = "rbxassetid://77805351331791",
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        AspectRatio = 3.2
                    },
                    scope:New "TextLabel" {
                        Name = "TextLabel",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                        Position = UDim2.fromScale(0.499, 0.491),
                        Size = UDim2.fromScale(0.838, 0.583),
                        Text = "R$1000",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextScaled = true,
                        TextWrapped = true,
                        ZIndex = 3,
                        [Fusion.Children] = {
                            scope:New "UIStroke" {
                                Name = "UIStroke",
                                Color = Color3.fromRGB(29, 75, 20),
                                Thickness = 5,
                            },
              
                            scope:New "UIPadding" {
                                Name = "UIPadding",
                                PaddingBottom = UDim.new(0.06, 0),
                                PaddingTop = UDim.new(0.06, 0),
                            },
                        }
                    }
                }
            }),
            ButtonTemplate(scope, {
                Name = "Cancel",
                Position = UDim2.fromScale(0.737, 0.938),
                Size = UDim2.fromScale(0.423, 0.186),
                Image = "rbxassetid://126487074349280",
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        ASpectRatio = 3.2
                    }
                },
                OnClick = function()
                    Events.ToggleHUD:Fire()
                    Events.ToggleFrame:Fire("Deals")
                end
            })
        }
    })
end

return Deals