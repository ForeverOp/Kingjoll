local BASE = "https://raw.githubusercontent.com/AkariHiera/Foreverop/main/VoxTheSeaPaste/scripts"

for i = 1, VoxConfig.MaxNumericScripts do
    local url = BASE .. "/" .. i .. ".lua"
    local src = game:HttpGet(url)

    if src and #src > 5 then
        pcall(function()
            loadstring(src)()
        end)
    end
end