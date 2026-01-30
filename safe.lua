return function(fn)
    local ok, err = pcall(fn)
    if not ok then
        warn("[VOX SAFE]", err)
    end
end