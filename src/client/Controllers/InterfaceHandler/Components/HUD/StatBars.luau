-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

local StatBars = {}

function StatBars.Cash(
    scope : Fusion.Scope,
    props : {
        Cash : Fusion.Value
    }
)
    local Hovering = scope:Value(false)
    local MouseDown = scope:Value(false)

    return scope:New "ImageLabel" {
        Name = "cash",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://85980078849006",
        Position = UDim2.fromScale(0.5, 0.259),
        Size = UDim2.fromScale(0.873, 0.388),

    
        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
                Name = "UIAspectRatioConstraint",
                AspectRatio = 3.79,
            },
    
            scope:New "ImageLabel" {
                Name = "cash icon",
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://105110841369565",
                Position = UDim2.fromScale(0.13, 0.5),
                Size = UDim2.fromScale(0.174, 0.658),


        
                [Fusion.Children] = {
                        scope:New "UIAspectRatioConstraint" {
                            Name = "UIAspectRatioConstraint",
                        },
                }
            },
    
            scope:New "ImageButton" {
                Name = "plus",
                Active = false,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://132295849234813",
                Position = UDim2.fromScale(0.876, 0.51),
                Size = UDim2.fromScale(0.17, 0.684),

                [Fusion.OnEvent "MouseButton1Down"] = function()
                    MouseDown:set(true) 
                end,
                [Fusion.OnEvent "MouseButton1Up"] = function()
                    MouseDown:set(false)
                end,
                [Fusion.OnEvent "MouseEnter"] = function()
                    Hovering:set(true)
                end,
                [Fusion.OnEvent "MouseLeave"] = function()
                    Hovering:set(false)
                end,
        
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        Name = "UIAspectRatioConstraint",
                        AspectRatio = 0.942,
                    },
                    scope:New "UIScale" {
                        Scale = scope:Tween(scope:Computed(function(use, _)
                            if use(Hovering) == false then
                                return 1
                            elseif use(MouseDown) == false then
                                return 1.25
                            else
                                return .75
                            end
                        end), TweenInfo.new(.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
                    }
                }
            },
    
            scope:New "TextLabel" {
                Name = "TextLabel",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                Position = UDim2.fromScale(0.272, 0.171),
                Size = UDim2.fromScale(0.479, 0.658),
                Text = props.Cash,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                TextWrapped = true,
        
                [Fusion.Children] = {
                    scope:New "UIStroke" {
                        Name = "UIStroke",
                        Color = Color3.fromRGB(4, 80, 13),
                        Thickness = 3.09,
                    },
                }
            },
        }
    }
end

function StatBars.Gems(
    scope : Fusion.Scope,
    props : {
        Gems : Fusion.Value
    }
)
    local Hovering = scope:Value(false)
    local MouseDown = scope:Value(false)

    return scope:New "ImageLabel" {
        Name = "gems",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://94200048909767",
        Position = UDim2.fromScale(0.497, 0.723),
        Size = UDim2.fromScale(0.873, 0.388),
    
        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
                Name = "UIAspectRatioConstraint",
                AspectRatio = 3.79,
            },
        
            scope:New "ImageLabel" {
                Name = "gems icon",
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://116320281458853",
                Position = UDim2.fromScale(0.128, 0.5),
                Size = UDim2.fromScale(0.174, 0.658),
        
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        Name = "UIAspectRatioConstraint",
                    },
                }
            },
        
            scope:New "ImageButton" {
                Name = "plus",
                Active = false,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://132295849234813",
                Position = UDim2.fromScale(0.876, 0.51),
                Size = UDim2.fromScale(0.17, 0.684),

                [Fusion.OnEvent "MouseEnter"] = function()
                    Hovering:set(true)
                end,
                [Fusion.OnEvent "MouseLeave"] = function()
                    Hovering:set(false)
                end,
                [Fusion.OnEvent "MouseButton1Down"] = function()
                   MouseDown:set(true) 
                end,
                [Fusion.OnEvent "MouseButton1Up"] = function()
                    MouseDown:set(false)
                end,
        
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        Name = "UIAspectRatioConstraint",
                        AspectRatio = 0.942,
                    },
                    scope:New "UIScale" {
                        Scale = scope:Tween(scope:Computed(function(use, _)
                            if use(Hovering) == false then
                                return 1
                            elseif use(MouseDown) == false then
                                return 1.25
                            else
                                return .75
                            end
                        end), TweenInfo.new(.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
                    }
                }
            },
        
            scope:New "TextLabel" {
                Name = "TextLabel",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                Position = UDim2.fromScale(0.272, 0.171),
                Size = UDim2.fromScale(0.479, 0.658),
                Text = props.Gems,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                TextWrapped = true,
        
                [Fusion.Children] = {
                    scope:New "UIStroke" {
                        Name = "UIStroke",
                        Color = Color3.fromRGB(4, 45, 80),
                        Thickness = 3.09,
                    },
                }
            }
        }
    }
end

return StatBars