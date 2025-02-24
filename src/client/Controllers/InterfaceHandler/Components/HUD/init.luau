-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)
local Signal = require(Packages.Signal)

-- // signal
local HudOpened = Signal.new()
local HudClosed = Signal.new()

-- // states

-- // Components
local Button = require(script.Button)
local LongButton = Button.LongButton
local SquareButton = Button.SquareButton

local TimeLabel = require(script.TimeLabel)

local StatBars = require(script.StatBars)
local CashBar = StatBars.Cash
local GemsBar = StatBars.Gems

local Buttons = {
    Shop = "rbxassetid://78411123006556",
    Inventory = "rbxassetid://128673452431078",
    Player = "rbxassetid://131279536375883",
    Rewards = "rbxassetid://139460988446220",
    ["Lucky Spin"] = "rbxassetid://134420521519287",
    Stats = "rbxassetid://127394997710269",
    Quests = "rbxassetid://125549102047405"
}

local function HUD(
    scope: Fusion.Scope
)
    local States = require(script.Parent.Parent.Utils.States)
    local HUDToggle = States.HUDToggle
    local Time = States.Time

    local HudObserver = scope:Observer(HUDToggle)

    HudObserver:onChange(function()
        if Fusion.peek(HUDToggle) == true then
            HudOpened:Fire()
        else
            HudClosed:Fire()
        end
    end)

    table.insert(scope, HudOpened:Connect(function()
        local HudScope = scope:innerScope()
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

        local Info = TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

        HudScope:New "ScreenGui" {
            IgnoreGuilnset = true,
            Name = "HUD",
            [Fusion.Children] = {
                bottomScope:New "Frame" { -- bottom hud buttons
                    Name = "BottomButtons",
                    Size = UDim2.new(0.543, 0,0.199, 0),
                    Position = bottomScope:Tween(bottomScope:Computed(function(use)
                        if use(HUDToggle) == true then
                            return UDim2.fromScale(0.496,1)
                        else
                            return UDim2.fromScale(0.496, 1.2)
                        end
                    end), Info),
                    [Fusion.Children] = {
                        bottomScope:New "UIAspectRatioConstraint" {
                            AspectRatio = 6.777,
                        },
                        bottomScope:New "UIGridLayout" {
                            CellPadding = UDim2.new(0.025, 0,0.173, 0),
                            CellSize = UDim2.new(0.121, 0,0.827, 0)
                        },
                        bottomScope:ForPairs(Buttons, function(_, _, name, image)
                            return bottomScope:SquareButton {
                                Text = name,
                                Image = image
                            }
                        end)
                    }
                },
                leftScope:New "Frame" { -- left side buttons
                    Name = "LeftHolder",
                    Size = UDim2.new(0.205, 0,0.252, 0),
                    Position = leftScope:Tween(leftScope:Computed(function(use)
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
                            Cash = leftScope:Value("100,000")
                        },
                        leftScope:GemsBar {
                            Gems = leftScope:Value("100,000")
                        }
                    }
                },
                topScope:New "Frame" { -- update button shit etc
                    Name = "TopRightHolder",
                    [Fusion.Children] = {
                        
                    }
                },
                topScope:TimeLabel {
                    Time = Time,
                    Position = topScope:Tween(topScope:Computed(function(use)
                        if use(HUDToggle) == true then
                            return UDim2.fromScale(.5, .04)
                        else
                            return UDim2.fromScale(-.12)
                        end
                    end), Info)
                }
            }
        }

        table.insert(HudScope, HudClosed:Connect(function()
            task.delay(.25, function()
                HudScope:doCleanup()
            end)
        end))
    end))
end

return HUD