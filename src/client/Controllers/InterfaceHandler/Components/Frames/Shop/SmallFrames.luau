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

local function SmallFrame(
    scope: Fusion.Scope,
    props: {
        Tag: UsedAs<string>,
        BackgroundImage: UsedAs<string>,
    }
)

end

return SmallFrame