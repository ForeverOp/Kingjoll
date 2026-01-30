-- Anti crash básico
pcall(function()
    setreadonly(getgenv(), false)
end)