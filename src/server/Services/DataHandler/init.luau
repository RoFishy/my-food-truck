-- // Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage.Packages

-- // Utils
local Utils = script.Utils
local ProfileService = require(Utils.ProfileService)

local Template = require(script.DataTemplate)

-- // Store
local ProfileStore = ProfileService.GetProfileStore(
    "PlayerData",
    Template
)

local DataHandler = {}

function DataHandler.Init()
    DataHandler.Profiles = {}
end

function DataHandler.Start()
    -- // connections
    Players.PlayerAdded:Connect(function(Player)
        DataHandler:_PlayerAdded(Player)
    end)
    Players.PlayerRemoving:Connect(function(Player)
        DataHandler:_PlayerRemoving(Player)
    end)
    for _, Player in Players:GetChildren() do
        task.spawn(function()
           DataHandler:_PlayerAdded(Player)
        end)
    end
end

function DataHandler:_PlayerAdded(Player)
    local Profile = ProfileStore:LoadProfileAsync("Player_"..Player.UserId)
    if Profile ~= nil then
        Profile:AddUserId(Player.UserId)
        Profile:Reconcile()
        Profile:ListenToRelease(function()
            self.Profiles[Player] = nil
            Player:Kick()
        end)
        if Player:IsDescendantOf(Player) then
            self.Profiles[Player] = Profile
        else
            Player:Kick()
        end
    else
        Player:Kick()
    end
end

function DataHandler:_PlayerRemoving(Player)
    local Profile = self._Profiles[Player]
    if Profile ~= nil then
        Profile:Release()
    end
end

return DataHandler