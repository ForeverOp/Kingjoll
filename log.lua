return function(msg)
    if _G.VOX_FLAGS and _G.VOX_FLAGS.DEBUG then
        print("[VOX]", msg)
    end
end