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

local function LargeFrame(
    scope: Fusion.Scope,
    props: {
        Tag: UsedAs<string>,
        BackgroundImage: UsedAs<string>,

        -- Text
        TextColor : UsedAs<Color3>,
        TextStrokeColor : UsedAs<Color3>,

        -- Pricing
        Price: UsedAs<number>,
        
    }
)
    
end

return LargeFrame