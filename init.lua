if getgenv().VoxLoaded then return end
getgenv().VoxLoaded = true

local BASE = "https://raw.githubusercontent.com/AkariHiera/Foreverop/main/VoxTheSeaPaste"

-- 🔐 KEY SYSTEM PRIMEIRO
loadstring(game:HttpGet(BASE.."/security/gate.lua"))()

-- CONFIGURAÇÕES
loadstring(game:HttpGet(BASE.."/config.lua"))()
loadstring(game:HttpGet(BASE.."/flags.lua"))()

-- LOADER
loadstring(game:HttpGet(BASE.."/router.lua"))()

-- VoxTheSeaPaste init.lua
print("VoxTheSeaPaste Editor carregado!")

-- VoxTheSeaPaste - Infinite Lua Pages
-- Key global
local REQUIRED_KEY = "Nerph"

-- ===============================
-- PEGAR PARAMETROS (?id= & ?key=)
-- ===============================
local HttpService = game:GetService("HttpService")

local function parseQuery(url)
    local query = {}
    local q = url:match("%?(.*)")
    if not q then return query end
    for pair in q:gmatch("[^&]+") do
        local k,v = pair:match("([^=]+)=([^=]+)")
        if k and v then
            query[k] = v
        end
    end
    return query
end

local url = tostring(getgenv()._VOX_URL or "")
local params = parseQuery(url)

local SCRIPT_ID = params.id or "default"
local USER_KEY  = params.key or ""

-- ===============================
-- KEY SYSTEM
-- ===============================
if USER_KEY ~= REQUIRED_KEY then
    warn("❌ KEY INCORRETA")
    return
end

-- ===============================
-- SCRIPTS DATABASE (INFINITO)
-- ===============================
local Scripts = {

    ["default"] = [[
print("VoxTheSeaPaste carregado com sucesso")
]],

    ["speed"] = [[
-- SEU SCRIPT 1
print("Speed Menu carregado")
]],

    ["mm2"] = [[
-- SEU SCRIPT 2
print("MM2 Hub carregado")
]],

    ["fling"] = [[
-- SEU SCRIPT 3
print("Fling UI carregado")
]]

}

-- ===============================
-- EXECUÇÃO
-- ===============================
local code = Scripts[SCRIPT_ID]

if not code then
    warn("❌ SCRIPT NÃO ENCONTRADO:", SCRIPT_ID)
    return
end

local fn, err = loadstring(code)
if not fn then
    warn("Erro no script:", err)
    return
end

fn()
-- VoxTheSeaPaste - Infinite Lua Pages + Key UI
-- Global Key
local REQUIRED_KEY = "3030" -- key azul do seu encurtador

-- ======================================
-- PEGAR PARAMETROS (?id= & ?key=)
-- ======================================
local HttpService = game:GetService("HttpService")

local function parseQuery(url)
    local query = {}
    local q = url:match("%?(.*)")
    if not q then return query end
    for pair in q:gmatch("[^&]+") do
        local k,v = pair:match("([^=]+)=([^=]+)")
        if k and v then
            query[k] = v
        end
    end
    return query
end

local SCRIPT_ID = params.id or "default"
local USER_KEY  = params.key or ""

-- ======================================
-- KEY SYSTEM
-- ======================================
if USER_KEY ~= REQUIRED_KEY then
    -- Key incorreta, mostra UI azul e bloqueia script
    local StarterGui = game:GetService("StarterGui")
    pcall(function()
        local gui = Instance.new("ScreenGui", StarterGui)
        gui.ResetOnSpawn = false
        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0,400,0,200)
        frame.Position = UDim2.new(0.5,-200,0.5,-100)
        frame.BackgroundColor3 = Color3.fromRGB(0,120,255) -- azul
        frame.BorderSizePixel = 0
        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1,1,1)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 28
        label.Text = "❌ KEY INVÁLIDA!"
    end)
    warn("❌ KEY INCORRETA:", USER_KEY)
    return
end

-- ======================================
-- SCRIPTS DATABASE (INFINITO)
-- ======================================
local Scripts = {

    ["default"] = [[
print("VoxTheSeaPaste carregado com sucesso")
]],

    ["speed"] = [[
-- SEU SCRIPT 1
print("Speed Menu carregado")
]],

    ["mm2"] = [[
-- SEU SCRIPT 2
print("MM2 Hub carregado")
]],

    ["fling"] = [[
-- SEU SCRIPT 3
print("Fling UI carregado")
]]

}

-- ======================================
-- EXECUÇÃO
-- ======================================
local code = Scripts[SCRIPT_ID]

if not code then
    -- NOT FOUND
    local StarterGui = game:GetService("StarterGui")
    pcall(function()
        local gui = Instance.new("ScreenGui", StarterGui)
        gui.ResetOnSpawn = false
        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0,400,0,200)
        frame.Position = UDim2.new(0.5,-200,0.5,-100)
        frame.BackgroundColor3 = Color3.fromRGB(255,0,0) -- vermelho
        frame.BorderSizePixel = 0
        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1,1,1)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 28
        label.Text = "❌ SCRIPT NÃO ENCONTRADO!"
    end)
    warn("❌ SCRIPT NÃO ENCONTRADO:", SCRIPT_ID)
    return
end

-- Executa o script
local fn, err = loadstring(code)
if not fn then
    warn("Erro no script:", err)
    return
end
fn()