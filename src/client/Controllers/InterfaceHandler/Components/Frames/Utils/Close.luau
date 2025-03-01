-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Components/Utils
local Utils = script.Parent
local ButtonTemplate = require(Utils.ButtonTemplate)

-- // types
type UsedAs<T> = Fusion.UsedAs<T>

local function Close(
    scope: Fusion.Scope,
    props:{
        Position : UsedAs<UDim2>
    }
)

    return ButtonTemplate(scope, {
        Name = "Close",
        Image = "rbxassetid://135109674433249",
        Position = props.Position,
        Size = UDim2.fromScale(0.959, 0.214),

        Children = {
            scope:New "UIAspectRatioConstraint" {
                Name = "UIAspectRatioConstraint",
                AspectRatio = 0.961,
            },
        }
    })
end

return Close