-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // types
type UsedAs<T> = Fusion.UsedAs<T>

local function ButtonTemplate(
    scope : Fusion.Scope,
    props: {
        -- // properties
        Position: UsedAs<UDim2>,
        Name: UsedAs<string>?,
        Image: UsedAs<string>,
        Size: UsedAs<UDim2>,

        Children : {},
        OnClick : () -> ()
    }
)
    local Hovering = scope:Value(false)
    local MouseDown = scope:Value(false)

    return scope:New "ImageButton" {
        Name = props.Name or "Button",
        AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = props.Image,
        Position = props.Position,
        Size = props.Size,

        [Fusion.Children] = {
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
            },
            props.Children
        },
        [Fusion.OnEvent "MouseButton1Click"] = props.OnClick,

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

return ButtonTemplate