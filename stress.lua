for i = 1, 1000 do
    task.spawn(function()
        print("stress", i)
    end)
end