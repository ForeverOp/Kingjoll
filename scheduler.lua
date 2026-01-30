task.spawn(function()
    while task.wait(5) do
        if _G.VOX_FLAGS.DEBUG then
            print("Vox scheduler tick")
        end
    end
end)