
local Notify = {}

function Notify.send(title, text, time)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = time or 5
        })
    end)
end

return Notify