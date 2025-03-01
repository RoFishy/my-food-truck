-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Types
type UsedAs<T> = Fusion.UsedAs<T>

local function FrameTemplate(
    scope: Fusion.Scope,
    props: {
        Name : UsedAs<string>,
        Size: UsedAs<UDim2>,
        Image : UsedAs<string>,
        
        Children : {},
        OuterChildren : {}?
    }
)

    return scope:New "Frame" {
        Name = props.Name,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(.5, .5),
        BackgroundTransparency = 1,

        [Fusion.Children] = {
            scope:New "ImageLabel" {
                Name = "Frame",
                AnchorPoint = Vector2.new(.5, .5),
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(.5, .5),
                Size = props.Size,
                Image = props.Image,
                [Fusion.Children] = {
                    props.Children
                }
            },
            props.OuterChildren
        }
    }

end

return FrameTemplate