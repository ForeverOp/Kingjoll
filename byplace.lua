local map = {
    [3082002798] = "autofarm.lua",
    [855385310] = "combat.lua"
}

local file = map[game.PlaceId]
if file then
    loadstring(game:HttpGet(_G.VOX_BASE .. "/scripts/" .. file))()
end