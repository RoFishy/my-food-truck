-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Packages
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)

-- // Scopes
local Scoped = Fusion.scoped

-- // Module
local InterfaceHandler = {}

InterfaceHandler.UIScope = Scoped(Fusion)
InterfaceHandler.HUDScope = InterfaceHandler.UIScope:innerScope()

function InterfaceHandler.Init()
    
end

function InterfaceHandler.Start()

end

return InterfaceHandler