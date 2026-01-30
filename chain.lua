local BASE = _G.VOX_BASE
for _, f in ipairs({
    "security.lua",
    "integrity.lua",
    "env.lua",
    "core.lua"
}) do
    pcall(function()
        loadstring(game:HttpGet(BASE .. "/" .. f))()
    end)
end