local BASE = "https://raw.githubusercontent.com/AkariHiera/Foreverop/main/VoxTheSeaPaste"
local Scripts = {"esp", "aimlock", "autofarm"}

local gate = loadstring(game:HttpGet(BASE.."/security/gate.lua"))()

for _, name in ipairs(Scripts) do
    if gate(name) then
        loadstring(game:HttpGet(BASE.."/scripts/"..name..".lua"))()
    end
end