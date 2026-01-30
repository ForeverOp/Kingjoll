-- PLACEID
if game.PlaceId ~= 3082002798 then return end

--------------------------------------------------
-- SERVICES
--------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

--------------------------------------------------
-- VARIÁVEIS
--------------------------------------------------
local AutoFarm = false
local AutoTP = false
local ESPEnabled = false

local HitboxGlobalSize = 5
local HitboxTargetSize = 10
local HitboxTransparency = 0.7
local TargetHitboxName = ""
local TargetName = ""

local WalkSpeedValue = 16
local JumpPowerValue = 50
local SaveSpawnPos

local GravityValue = workspace.Gravity
local GravityEnabled = false

local Platform
local CurrentTarget
local Character, HRP, Humanoid

--------------------------------------------------
-- CHARACTER FIX (RESPAWN)
--------------------------------------------------
local function UpdateCharacter()
	Character = LP.Character or LP.CharacterAdded:Wait()
	HRP = Character:WaitForChild("HumanoidRootPart")
	Humanoid = Character:WaitForChild("Humanoid")
end

UpdateCharacter()

LP.CharacterAdded:Connect(function(char)
	task.wait(0.3)
	UpdateCharacter()
	CurrentTarget = nil

	if SaveSpawnPos and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = SaveSpawnPos
	end

	if GravityEnabled then
		workspace.Gravity = GravityValue
	end
end)

--------------------------------------------------
-- RAYFIELD + KEY
--------------------------------------------------
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Speed Menu PRO",
	LoadingTitle = "Speed Menu",
	LoadingSubtitle = "by XMenu",
	KeySystem = true,
	KeySettings = {
		Title = "Speed Menu PRO",
		Subtitle = "Digite a Key",
		Note = "Key obrigatória",
		FileName = "SpeedMenuKey",
		SaveKey = false,
		Key = { "Nerph" }
	}
})

local Combat = Window:CreateTab("Combat")
local Player = Window:CreateTab("Player")
local Visual = Window:CreateTab("Visual")
local Misc = Window:CreateTab("Misc")

--------------------------------------------------
-- COMBAT
--------------------------------------------------
Combat:CreateToggle({
	Name = "Auto Farm",
	CurrentValue = false,
	Callback = function(v)
		AutoFarm = v
		if not v then CurrentTarget = nil end
	end
})

Combat:CreateInput({
	Name = "Teleport Player (@nome)",
	PlaceholderText = "Nome do player",
	Callback = function(txt)
		TargetName = txt
	end
})

Combat:CreateToggle({
	Name = "Ativar Teleporte",
	CurrentValue = false,
	Callback = function(v)
		AutoTP = v
	end
})

Combat:CreateSection("Hitbox")

Combat:CreateInput({
	Name = "Hitbox Global",
	PlaceholderText = "Ex: 10",
	Callback = function(txt)
		local n = tonumber(txt)
		if n then HitboxGlobalSize = n end
	end
})

Combat:CreateInput({
	Name = "Nome Player (Hitbox)",
	PlaceholderText = "Player",
	Callback = function(txt)
		TargetHitboxName = txt
	end
})

Combat:CreateInput({
	Name = "Hitbox Player",
	PlaceholderText = "Ex: 30",
	Callback = function(txt)
		local n = tonumber(txt)
		if n then HitboxTargetSize = n end
	end
})

Combat:CreateInput({
	Name = "Transparência Hitbox",
	PlaceholderText = "0 a 1",
	Callback = function(txt)
		local n = tonumber(txt)
		if n then HitboxTransparency = math.clamp(n,0,1) end
	end
})

--------------------------------------------------
-- PLAYER
--------------------------------------------------
Player:CreateInput({
	Name = "WalkSpeed",
	PlaceholderText = "Ex: 50",
	Callback = function(txt)
		local n = tonumber(txt)
		if n then WalkSpeedValue = n end
	end
})

Player:CreateInput({
	Name = "JumpPower",
	PlaceholderText = "Ex: 100",
	Callback = function(txt)
		local n = tonumber(txt)
		if n then JumpPowerValue = n end
	end
})

Player:CreateToggle({
	Name = "Gravity Custom",
	CurrentValue = false,
	Callback = function(v)
		GravityEnabled = v
		workspace.Gravity = v and GravityValue or 196
	end
})

Player:CreateInput({
	Name = "Gravity Value",
	PlaceholderText = "196 padrão",
	Callback = function(txt)
		local n = tonumber(txt)
		if n then GravityValue = n end
	end
})

Player:CreateButton({
	Name = "Salvar Spawn",
	Callback = function()
		if HRP then SaveSpawnPos = HRP.CFrame end
	end
})

--------------------------------------------------
-- VISUAL
--------------------------------------------------
Visual:CreateToggle({
	Name = "ESP Players",
	CurrentValue = false,
	Callback = function(v)
		ESPEnabled = v
	end
})

--------------------------------------------------
-- MISC
--------------------------------------------------
Misc:CreateButton({
	Name = "Plataforma",
	Callback = function()
		if not Platform then
			Platform = Instance.new("Part", workspace)
			Platform.Size = Vector3.new(50,2,50)
			Platform.Anchored = true
			Platform.Material = Enum.Material.Neon
			Platform.Color = Color3.fromRGB(0,170,255)
		end
		Platform.CFrame = HRP.CFrame + Vector3.new(0,8,0)
		HRP.CFrame = Platform.CFrame + Vector3.new(0,4,0)
	end
})

--------------------------------------------------
-- FUNÇÕES AUX
--------------------------------------------------
local function IsAlive(p)
	return p and p.Character
	and p.Character:FindFirstChild("Humanoid")
	and p.Character.Humanoid.Health > 0
	and p.Character:FindFirstChild("HumanoidRootPart")
end

local function GetTarget()
	for _,p in ipairs(Players:GetPlayers()) do
		if p ~= LP and IsAlive(p) then
			return p
		end
	end
end

--------------------------------------------------
-- AUTO FARM
--------------------------------------------------
task.spawn(function()
	while task.wait(0.1) do
		if AutoFarm and HRP then
			if not IsAlive(CurrentTarget) then
				CurrentTarget = GetTarget()
			end
			if IsAlive(CurrentTarget) then
				HRP.CFrame =
					CurrentTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
			end
		end
	end
end)

--------------------------------------------------
-- TP PLAYER
--------------------------------------------------
task.spawn(function()
	while task.wait(0.2) do
		if AutoTP and HRP then
			local p = Players:FindFirstChild(TargetName)
			if IsAlive(p) then
				HRP.CFrame =
					p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
			end
		end
	end
end)

--------------------------------------------------
-- HITBOX (EXATAMENTE IGUAL AO PRIMEIRO SCRIPT)
--------------------------------------------------
RunService.Stepped:Connect(function()
	for _,p in ipairs(Players:GetPlayers()) do
		if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = p.Character.HumanoidRootPart
			hrp.CanCollide = false
			hrp.Transparency = HitboxTransparency
			hrp.Size = Vector3.new(HitboxGlobalSize,HitboxGlobalSize,HitboxGlobalSize)

			if TargetHitboxName ~= "" and p.Name:lower():find(TargetHitboxName:lower()) then
				hrp.Size = Vector3.new(HitboxTargetSize,HitboxTargetSize,HitboxTargetSize)
			end
		end
	end
end)

--------------------------------------------------
-- WALK / JUMP FIX
--------------------------------------------------
task.spawn(function()
	while task.wait(0.1) do
		if Humanoid then
			Humanoid.WalkSpeed = WalkSpeedValue
			Humanoid.JumpPower = JumpPowerValue
		end
	end
end)

--------------------------------------------------
-- ESP
--------------------------------------------------
task.spawn(function()
	while task.wait(1) do
		for _,p in ipairs(Players:GetPlayers()) do
			if p ~= LP and IsAlive(p) then
				if ESPEnabled and not p.Character:FindFirstChild("ESP") then
					local box = Instance.new("BoxHandleAdornment")
					box.Name = "ESP"
					box.Adornee = p.Character.HumanoidRootPart
					box.Size = Vector3.new(4,6,4)
					box.Color3 = Color3.new(1,0,0)
					box.AlwaysOnTop = true
					box.Transparency = 0.5
					box.Parent = p.Character
				elseif not ESPEnabled and p.Character:FindFirstChild("ESP") then
					p.Character.ESP:Destroy()
				end
			end
		end
	end
end)
