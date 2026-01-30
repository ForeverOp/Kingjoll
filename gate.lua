local check = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/AkariHiera/Foreverop/main/VoxTheSeaPaste/security/per_script.lua"
))()

return function(scriptName)
    local enteredKey

    repeat
        enteredKey = tostring(
            game:GetService("Players").LocalPlayer
            :WaitForChild("PlayerGui")
            :WaitForChild("VoxKeyInput", 5)
            and getgenv().VOX_INPUT_KEY
        )
        task.wait()
    until check(scriptName, enteredKey)

    return true
end