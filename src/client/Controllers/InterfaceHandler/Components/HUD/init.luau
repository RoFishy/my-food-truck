-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // HudUtils
local HudUtils = script.Utils
local FormatNumber = require(HudUtils.FormatNumber)

-- // Utils
local Utils = script.Parent.Parent.Utils

local Events = require(Utils.Events)
local ToggleHUD = Events.ToggleHUD

-- // Components
local Button = require(script.Button)
local LongButton = Button.LongButton
local SquareButton = Button.SquareButton

local TimeLabel = require(script.TimeLabel)

local StatBars = require(script.StatBars)
local CashBar = StatBars.Cash
local GemsBar = StatBars.Gems

local Buttons = {
    Shop = {"rbxassetid://78411123006556", "A", "Shop"},
    Inventory = {"rbxassetid://128673452431078", "B", "Inventory"},
    Daily = {"rbxassetid://72848940883301", "C", "Daily"},
    Rewards = {"rbxassetid://139460988446220", "D", "Rewards"},
    ["Lucky Spin"] = {"rbxassetid://134420521519287", "E", "Wheel"},
    Stats = {"rbxassetid://127394997710269", "F", "Stats"},
    Quests = {"rbxassetid://125549102047405", "G", "Quests"},
    Settings=  {"rbxassetid://75973952885907", "H", "Settings"},
}

local function HUD(
    scope: Fusion.Scope
)
    local HudScope = scope:innerScope()

    -- // states
    local HUDToggle = HudScope:Value(true)
    local Time = HudScope:Value("10:00 AM")
    local Cash = HudScope:Value("10,000")
    local Gems = HudScope:Value("10,000")

    -- // scopes
    local bottomScope = HudScope:innerScope {
        SquareButton = SquareButton
    }
    local leftScope = HudScope:innerScope {
        CashBar = CashBar,
        GemsBar = GemsBar
    }
    local topScope = HudScope:innerScope {
        TimeLabel = TimeLabel,
        LongButton = LongButton
    }

    -- // events
    ToggleHUD:Connect(function()
        if Fusion.peek(HUDToggle) == true then
            HUDToggle:set(false)
        else
            HUDToggle:set(true)
        end
    end)

    local Info = TweenInfo.new(.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    return HudScope:New "ScreenGui" {
        IgnoreGuiInset = true,
        Name = "HUD",
        Parent = game.Players.LocalPlayer.PlayerGui,
        [Fusion.Children] = {
            bottomScope:New "Frame" { -- bottom hud buttons
                Name = "BottomButtons",
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.new(0.543, 0,0.199, 0),
                BackgroundTransparency = 1,
                Position = bottomScope:Tween(
                    bottomScope:Computed(function(use, _)
                        if use(HUDToggle) == true then
                            return UDim2.fromScale(0.496,0.975)
                        else
                            return UDim2.fromScale(0.496, 1.2)
                        end
                    end),
                Info),
                [Fusion.Children] = {
                    bottomScope:New "UIAspectRatioConstraint" {
                        AspectRatio = 6.777,
                    },
                    --[[
                    bottomScope:New "UIGridLayout" {
                        CellPadding = UDim2.new(0.025, 0,0.173, 0),
                        CellSize = UDim2.new(0.121, 0,0.827, 0)
                    },
                    ]]--
                    bottomScope:New "UIListLayout" {
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        FillDirection = "Horizontal",
                        Padding = UDim.new(.025, 0),
                        SortOrder = "Name"
                    },
                    bottomScope:ForPairs(Buttons, function(_, _, name, table)
                        return name, bottomScope:SquareButton {
                            Text = name,
                            Image = table[1],
                            Name = table[2],
                            Frame = table[3]
                        }
                    end)
                }
            },
            leftScope:New "Frame" { -- left side buttons
                Name = "LeftHolder",
                Size = UDim2.new(0.205, 0,0.252, 0),
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = leftScope:Tween(leftScope:Computed(function(use, _)
                    if use(HUDToggle) == true then
                        return UDim2.fromScale(0, .5)
                    else
                        return UDim2.fromScale(-.25, .5)
                    end
                end), Info),
                [Fusion.Children] = {
                    leftScope:New "UIAspectRatioConstraint" {
                        AspectRatio = 1.684
                    },
                    leftScope:CashBar {
                        Cash = Cash
                    },
                    leftScope:GemsBar {
                        Gems = Gems
                    }
                }
            },
            topScope:New "Frame" { -- update button shit etc
                Name = "TopRightHolder",
                AnchorPoint = Vector2.new(1, 0),
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.205, 0.215),
                Position = topScope:Tween(topScope:Computed(function(use, _) 
                    if use(HUDToggle) == true then 
                        return UDim2.fromScale(0.862, 0.039)
                    else
                        return UDim2.fromScale(0.862, -.2)
                    end
                end), Info),
                [Fusion.Children] = {
                    topScope:New "UIAspectRatioConstraint" {
                        AspectRatio = 1.618
                    },
                    LongButton(topScope, {
                        Text = "Updates",
                        Image = "rbxassetid://82254931331147",
                        Frame = "Updates"
                    })
                },
            },
            topScope:TimeLabel {
                Time = Time,
                Position = topScope:Tween(topScope:Computed(function(use, _)
                    if use(HUDToggle) == true then
                        return UDim2.fromScale(.5, .04)
                    else
                        return UDim2.fromScale(.5, -.15)
                    end
                end), Info)
            }
        }
    }
end

return HUD