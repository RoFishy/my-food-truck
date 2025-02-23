-- // Init
local Loader = {}
local CachedModules = {}

-- // Funcs
function Loader.Init(Scripts : {ModuleScript})
    for _, Module in Scripts do
        if not Module:IsA("ModuleScript") then continue end
        local LoadedModule = require(Module)
        CachedModules[Module.Name] = LoadedModule
        task.spawn(LoadedModule.Init)
        print(`{Module.Name} Initialized`)
    end
end

function Loader.Start()
    for _, Module in CachedModules do
        task.spawn(Module.Start)
        print(`{Module.Name} Started`)
    end
end

function Loader.Get(Name : string) : ModuleScript
    return CachedModules[Name]
end

shared.Get = Loader.Get

return Loader