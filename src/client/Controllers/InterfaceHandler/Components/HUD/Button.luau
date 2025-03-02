-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Utils
local Utils = script.Parent.Parent.Parent.Utils
local Events = require(Utils.Events)

-- // types
type UsedAs<T> = Fusion.UsedAs<T>

-- // button
local Button = {}

function Button.SquareButton(
    scope: Fusion.Scope,
    props: {
        Text: UsedAs<string>,
        Image: UsedAs<string>,
        Name: UsedAs<string>
    }
)
    local Hovering = scope:Value(false)
    local MouseDown = scope:Value(false)
    return scope:New "ImageButton" {
        Name = props.Name,
        Active = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = props.Image,
        LayoutOrder = 1,
        Position = UDim2.fromScale(0.5, .5),
        Size = UDim2.fromScale(0.121, 0.827),
        
        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
                Name = "UIAspectRatioConstraint",
                AspectRatio = 0.991,
            },
        
            scope:New "TextLabel" {
                Name = "TextLabel",
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                Position = UDim2.fromScale(0.5, 1.05),
                Size = UDim2.fromScale(1.21, 0.261),
                Text = props.Text,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                TextWrapped = true,
        
                [Fusion.Children] = {
                    scope:New "UIStroke" {
                        Name = "UIStroke",
                        Color = Color3.fromRGB(4, 45, 80),
                        Thickness = 2.86,
                    },
                }
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
        },
        [Fusion.OnEvent "MouseButton1Click"] = function()
            Events.ToggleHUD:Fire()
            Events.ToggleFrame:Fire(props.Name)
        end,
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
        end
    }
end

function Button.LongButton(
    scope: Fusion.Scope,
    props: {
        Text: UsedAs<string>,
        Image: UsedAs<string>
    }
)
    scope:New "ImageLabel" {
        Name = "updates",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://90248858322706",
        Position = UDim2.fromScale(0.498, 0.283),
        Size = UDim2.fromScale(0.932, 0.398),
      
        [Fusion.Children] = {
          scope:New "UIAspectRatioConstraint" {
            Name = "UIAspectRatioConstraint",
            AspectRatio = 3.79,
          },
      
          scope:New "ImageLabel" {
            Name = "Icon",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = props.Image,
            Position = UDim2.fromScale(0.289, 0.5),
            Size = UDim2.fromScale(0.156, 0.645),
      
            [Fusion.Children] = {
              scope:New "UIAspectRatioConstraint" {
                Name = "UIAspectRatioConstraint",
                AspectRatio = 0.918,
              },
            }
          },
      
          Fusion.New "TextLabel" {
            Name = "TextLabel",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
            Position = UDim2.fromScale(0.407, 0.244),
            Size = UDim2.fromScale(0.479, 0.5),
            Text = props.Text,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            TextWrapped = true,
      
            [Fusion.Children] = {
              scope:New "UIStroke" {
                Name = "UIStroke",
                Color = Color3.fromRGB(4, 45, 80),
                Thickness = 2.81,
              },
            }
          },
        }
      }
end

return Button