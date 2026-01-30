return function()
    local allowed = {
        [3082002798] = true,
        [855385310] = true
    }

    return allowed[game.PlaceId] == true
end