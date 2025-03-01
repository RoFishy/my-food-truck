-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Components/Utils
local Utils = script.Parent
local ButtonTemplate = require(Utils.ButtonTemplate)
local FrameTemplate = require(Utils.FrameTemplate)
local Close = require(Utils.Close)

-- // data
local Rewards = {
    ["Day 1"] = {
        Reward = "250x Burger",
        Image = "rbxassetid://122720055977995"
    },
    ["Day 2"] = {
        Reward = "250",
        Image = "rbxassetid://122720055977995"
    },
    ["Day 3"] = {
        Reward = "250",
        Image = "rbxassetid://122720055977995"
    },
    ["Day 4"] = {
        Reward = "250",
        Image = "rbxassetid://122720055977995"
    },
    ["Day 5"] = {
        Reward = "250",
        Image = "rbxassetid://122720055977995"
    },
    ["Day 6"] = {
        Reward = "250",
        Image = "rbxassetid://122720055977995"
    },
    ["Day 7"] = {
        Reward = "250",
        Image = "rbxassetid://122720055977995"
    }
}

local function Daily(
    scope: Fusion.Scope
)
    return FrameTemplate(scope, {
        Name = "Daily",
        Size = UDim2.fromScale(0.532, 0.442),
        Image = "rbxassetid://140633822201266",
        Children = {
            Close(scope, {
                Position = UDim2.fromScale(0.925, 0.162)
            }),
            scope:New "UIAspectRatioConstraint" {
                AspectRatio = 0.961
            },
            ButtonTemplate(scope, {
                Position = UDim2.fromScale(0.5, 0.988),
                Name = "Claim",
                Image = "rbxassetid://1109801309",
                Size = UDim2.fromScale(0.262, 0.21),
                Children = {
                    scope:New "UIAspectRatioConstraint" {
                        AspectRatio = 2.68
                    }
                },
                OnClick = function()
                    return -- add stuff later
                end
            }),
            scope:New "Frame" {
                Name = "Frame",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0.0313, 0.367),
                Size = UDim2.fromScale(0.942, 0.504),

                [Fusion.Children] = {
                    scope:New "UIListLayout" {
                        FillDirection = "Horizontal",
                        SortOrder = "Name",
                        Padding = UDim.new(0.014, 0)
                    },
                    scope:ForPairs(Rewards, function(_, _, day, table)
                        return day, ButtonTemplate(scope, {
                            Name = day,
                            Size = UDim2.fromScale(0.187, 0.975),
                            Image = "rbxassetid://88831126214608",
                            Position = UDim2.fromScale(0, 0),

                            OnClick = function()
                                return
                            end,

                            Children = {
                                scope:New "UIAspectRatioConstraint" {
                                    AspectRatio = 0.769
                                },
                                scope:New "ImageLabel"  {
                                    Image = table.Image,
                                    Size = UDim2.fromScale(0.661, 0.509),
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    [Fusion.Children] = {
                                        scope:New "UIAspectRatioConstraint" {
                                            AspectRatio = 1
                                        }
                                    }
                                },
                                scope:New "TextLabel" {
                                    Name = "Reward",
                                    Position = UDim2.fromScale(.5, 0.995),
                                    AnchorPoint = Vector2.new(.5, 1),
                                    Size = UDim2.fromScale(0.803, 0.275),
                                    FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                                    TextColor = Color3.fromRGB(4, 44, 80),
                                    Text = table.Reward,
                                    TextScaled = true,
                                    BackgroundTransparency = 1,
                                    [Fusion.Children] = {
                                        scope:New "UIPadding" {
                                            PaddingBottom = UDim.new(.149, 0),
                                            PaddingTop = UDim.new(.149, 0)
                                        }
                                    }
                                },
                                scope:New "TextLabel" {
                                    Name = "Day",
                                    AnchorPoint = Vector2.new(0.5, 0),
                                    BackgroundTransparency = 1,
                                    FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                                    Position = UDim2.fromScale(0.464, 0.0214),
                                    Size = UDim2.fromScale(0.724, 0.22),
                                    Text = day,
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    [Fusion.Children] = {
                                        scope:New "UIPadding" {
                                            PaddingBottom = UDim.new(.06, 0),
                                            PaddingTop = UDim.new(.06, 0)
                                        },
                                        scope:New "UIStroke" {
                                            Color = Color3.fromRGB(4, 44, 80),
                                            Thickness = 3
                                        }
                                    }
                                }
                            }
                        })
                    end)
                }
            }
        }
    })
end

return Daily