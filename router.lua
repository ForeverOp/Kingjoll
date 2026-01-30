local BASE = "https://raw.githubusercontent.com/AkariHiera/Foreverop/main/VoxTheSeaPaste"

local Http = loadstring(game:HttpGet(BASE.."/modules/http.lua"))()
local Logger = loadstring(game:HttpGet(BASE.."/modules/logger.lua"))()

Logger.info("Router iniciado")

-- escolha de loader
if VoxConfig.AutoLoadScripts then
    loadstring(Http.get(BASE.."/loaders/numeric.lua"))()
else
    loadstring(Http.get(BASE.."/loader.lua"))()
end