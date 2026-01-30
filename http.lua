local Http = {}

function Http.get(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)

    if ok then
        return res
    end

    return nil
end

return Http