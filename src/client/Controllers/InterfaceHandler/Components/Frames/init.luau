-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- // Camera
local Camera = workspace.CurrentCamera

-- // Lighting
local UIBlur = Lighting:WaitForChild("UIBlur")

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
            self:CloseFrame()
        else
            self:OpenFrame(Frame)
        end
    end)
end

function FramesHandler:OpenFrame(Frame)
    TweenService:Create(UIBlur, TweenInfo.new(.2), {Size = 15}):Play()
    TweenService:Create(Camera, TweenInfo.new(.2), {FieldOfView = 50}):Play()

    local FrameComponent = require(script[Frame])
    self.CurrentScope = FrameScope:innerScope()
    self.CurrentFrame = Frame
    FrameComponent(self.CurrentScope, {
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
    Open:set(true)

end

function FramesHandler:CloseFrame()
    TweenService:Create(UIBlur, TweenInfo.new(.2), {Size = 0}):Play()
    TweenService:Create(Camera, TweenInfo.new(.2), {FieldOfView = 70}):Play()
    self.CurrentFrame = nil
    Open:set(false)
    task.delay(.175, function()
        self.CurrentScope:doCleanup()
        self.CurrentScope = nil
    end)
end

return FramesHandler