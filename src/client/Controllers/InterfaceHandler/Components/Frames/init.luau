-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

local Scoped = Fusion.scoped
local FrameScope = Scoped(Fusion)

local Open = FrameScope:Value(false)

-- // Utils
local Utils = script.Parent.Parent.Utils
local Events = require(Utils.Events)

local FramesHandler = {
    CurrentScope = nil,
    CurrentFrame = nil
}

function FramesHandler:Init()
    Events.ToggleFrame:Connect(function(Frame)
        if self.CurrentFrame then
            self.CurrentFrame = nil
            Open:set(false)
            task.delay(.175, function()
                self.CurrentScope:doCleanup()
                self.CurrentScope = nil
            end)
        else
            self:OpenFrame(Frame)
            Open:set(true)
        end
    end)
end

function FramesHandler:OpenFrame(Frame)
    local FrameComponent = require(script[Frame])
    self.CurrentScope = FrameScope:innerScope()
    self.CurrentFrame = FrameComponent(self.CurrentScope, {
        Position = FrameScope:Tween(FrameScope:Computed(function(use, _)
            if use(Open) == false then
                return UDim2.fromScale(.5, .75)
            else
                return UDim2.fromScale(0.5, 0.5)
            end
        end), TweenInfo.new(.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)),
        Parent = self.CurrentScope:New "ScreenGui" {
            IgnoreGuiInset = true,
            Name = "Frames",
            Parent = game.Players.LocalPlayer.PlayerGui
        }
    })
end

return FramesHandler