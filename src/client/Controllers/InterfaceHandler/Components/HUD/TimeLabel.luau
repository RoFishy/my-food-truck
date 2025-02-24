-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // types
type UsedAs<T> = Fusion.UsedAs<T>

-- // label
local function TimeLabel(
    scope: Fusion.Scope,
    props: {
        Time : Fusion.Value,
        Position : UsedAs<UDim2>
    }
)
    return scope:New "ImageLabel" {
        Name = "time holder",
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        Image = "rbxassetid://96383385686057",
        Position = props.Position,
        Size = UDim2.fromScale(0.258, 0.141),
    
        [Fusion.Children] = {
            scope:New "UIAspectRatioConstraint" {
                Name = "UIAspectRatioConstraint",
                AspectRatio = 3.78,
            },
    
            scope:New "ImageLabel" {
                Name = "time icon",
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundTransparency = 1,
                Image = "rbxassetid://139681687522187",
                Position = UDim2.fromScale(0.243, 0.214),
                Size = UDim2.fromScale(0.151, 0.571),
        
                [Fusion.Children] = {
                    scope:New "UIAspectRatioConstraint" {
                        Name = "UIAspectRatioConstraint",
                    },
                }
            },
    
            scope:New "TextLabel" {
                Name = "TextLabel",
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json"),
                Position = UDim2.fromScale(0.616, 0.246),
                Size = UDim2.fromScale(0.529, 0.505),
                Text = props.Time,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                TextWrapped = true,
        
                [Fusion.Children] = {
                    scope:New "UIStroke" {
                        Name = "UIStroke",
                        Color = Color3.fromRGB(80, 53, 4),
                        Thickness = 4.03,
                    },
                }
            },
        }
    }
end

return TimeLabel