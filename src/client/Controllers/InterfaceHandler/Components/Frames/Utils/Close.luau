-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Components/Utils
local Utils = script.Parent
local ButtonTemplate = require(Utils.ButtonTemplate)

-- // Global Utils
local GlobalUtils = script.Parent.Parent.Parent.Parent.Utils
local Events = require(GlobalUtils.Events)

-- // types
type UsedAs<T> = Fusion.UsedAs<T>

local function Close(
    scope: Fusion.Scope,
    props:{
        Position : UsedAs<UDim2>,
        Frame : UsedAs<string>,
        Size : UsedAs<UDim2>,
        AspectRatio : UsedAs<number>?
    }
)

    return ButtonTemplate(scope, {
        Name = "Close",
        Image = "rbxassetid://135109674433249",
        Position = props.Position,
        Size = props.Size,

        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
                Name = "UIAspectRatioConstraint",
                AspectRatio = props.AspectRatio or 0.961,
            },
        },
        OnClick = function()
            Events.ToggleHUD:Fire()
            Events.ToggleFrame:Fire(props.Frame)
        end
    })
end

return Close