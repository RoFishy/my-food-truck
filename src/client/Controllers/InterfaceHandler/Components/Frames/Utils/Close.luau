-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // types
type UsedAs<T> = Fusion.UsedAs<T>

local function Close(
    scope: Fusion.Scope,
    props:{
        Position : UsedAs<UDim2>
    }
)
    -- // Utils
    local Utils = script.Parent.Parent.Parent.Utils
    local States = require(Utils.States)
    local CurrentFrame = States.CurrentFrame

    local Hovering = scope:Value(false)
    local MouseDown = scope:Value(false)

    return scope:New "ImageButton" {
        Name = "Close",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://135109674433249",
        Position = props.Position,
        Size = UDim2.fromScale(0.0959, 0.214),
      
        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
            Name = "UIAspectRatioConstraint",
            AspectRatio = 0.961,
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
            CurrentFrame:set("nil")
        end,
        [Fusion.OnEvent "MouseButton1Up"] = function()
            MouseDown:set(false)
        end,
        [Fusion.OnEvent "MouseButton1Down"] = function()
            MouseDown:set(true)
        end,
        [Fusion.OnEvent "MouseEnter"] = function()
            Hovering:set(true)
        end,
        [Fusion.OnEvent "MouseLeave"] = function()
            Hovering:set(false)
        end
    }
end

return Close