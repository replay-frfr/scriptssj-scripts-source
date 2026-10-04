local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local virtualInputManager = game:GetService("VirtualInputManager")
local workspaceService = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local localPlayer = players.LocalPlayer
local remoteEvent = replicatedStorage:WaitForChild("RemoteEvent")

local scriptSSJMultiHub = Instance.new("ScreenGui")
scriptSSJMultiHub.Name = "ScriptSSJ_MultiHub"
scriptSSJMultiHub.ResetOnSpawn = false
scriptSSJMultiHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() scriptSSJMultiHub.IgnoreGuiInset = true end)

pcall(function()
  if syn and syn.protect_gui then
    syn.protect_gui(scriptSSJMultiHub)
    scriptSSJMultiHub.Parent = coreGui
  elseif gethui then
    scriptSSJMultiHub.Parent = gethui()
  else
    scriptSSJMultiHub.Parent = coreGui
  end
end)

if not scriptSSJMultiHub.Parent then
  scriptSSJMultiHub.Parent = localPlayer:WaitForChild("PlayerGui")
end

local frame = Instance.new("Frame")
frame.Parent = scriptSSJMultiHub
frame.Size = UDim2.new(0, 220, 0, 370)
frame.Position = UDim2.new(0.02, 0, 0.12, 0)
frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
frame.BorderSizePixel = 0
frame.Active = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = frame
uiStroke.Color = Color3.fromRGB(140, 70, 255)
uiStroke.Thickness = 1.5

local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(1, -40, 0, 28)
textLabel.Position = UDim2.new(0, 8, 0, 4)
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "SCRIPTSSJ"
textLabel.TextSize = 13
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.Active = true
textLabel.ZIndex = 3

local textButton = Instance.new("TextButton")
textButton.Parent = frame
textButton.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
textButton.Position = UDim2.new(1, -28, 0, 6)
textButton.Size = UDim2.new(0, 22, 0, 22)
textButton.Font = Enum.Font.GothamBold
textButton.Text = "-"
textButton.TextColor3 = Color3.new(1, 1, 1)
textButton.TextSize = 14
textButton.ZIndex = 4
textButton.Active = true

Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 5)

local frame2 = Instance.new("Frame")
frame2.Parent = frame
frame2.Position = UDim2.new(0, 8, 0, 34)
frame2.Size = UDim2.new(1, -16, 0, 1)
frame2.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
frame2.BorderSizePixel = 0

local frame3 = Instance.new("Frame")
frame3.Parent = frame
frame3.BackgroundTransparency = 1
frame3.Position = UDim2.new(0, 8, 0, 38)
frame3.Size = UDim2.new(1, -16, 1, -44)

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = frame3
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 4)

local v1 = false

textButton.Activated:Connect(function()
  v1 = not v1

  if v1 then
    frame.Size = UDim2.new(0, 220, 0, 34)
    frame3.Visible = false
    frame2.Visible = false
    textButton.Text = "+"
  else
    frame.Size = UDim2.new(0, 220, 0, 370)
    frame3.Visible = true
    frame2.Visible = true
    textButton.Text = "-"
  end
end)

local v2 = {
  ["Insta Grab"] = false,
  Speed = false,
  ["One Block"] = false,
  ["ESP Players"] = false,
  WallClimb = false,
  ["ESP Pets Max"] = false,
  ["Kill Aura"] = false,
  Xray = false,
  ["FPS Boost"] = false,
}

local v3 = {}
local v4 = 0
local v5 = {}

local v6 = {
  ["Bloxy Cola"] = true,
  ["Wooden Bat"] = true,
  ["Pick Up"] = true,
  Build = true,
  Edit = true,
  ["Speed Coil"] = true,
  ["Gravity Coil"] = true,
  ["Dual Coil"] = true,
}

local function f1(p1, p2)
  local v7 = v3[p1]

  if not v7 then
    return
  end

  if p2 then
    v7.Text = "ON"
    v7.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
    v7.TextColor3 = Color3.new(1, 1, 1)
  else
    v7.Text = "OFF"
    v7.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    v7.TextColor3 = Color3.fromRGB(200, 200, 200)
  end
end

local walkSpeed

local function f2(p3, layoutOrder)
  local frame4 = Instance.new("Frame")
  frame4.Parent = frame3
  frame4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
  frame4.Size = UDim2.new(1, 0, 0, 28)
  frame4.BorderSizePixel = 0
  frame4.LayoutOrder = layoutOrder

  Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 6)

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Parent = frame4
  textLabel2.BackgroundTransparency = 1
  textLabel2.Position = UDim2.new(0, 8, 0, 0)
  textLabel2.Size = UDim2.new(1, -56, 1, 0)
  textLabel2.Font = Enum.Font.GothamBold
  textLabel2.Text = p3
  textLabel2.TextColor3 = Color3.new(1, 1, 1)
  textLabel2.TextSize = 11
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.TextYAlignment = Enum.TextYAlignment.Center
  textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
  textLabel2.ZIndex = 1

  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame4
  textButton2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  textButton2.Position = UDim2.new(1, -52, 0.5, -11)
  textButton2.Size = UDim2.new(0, 46, 0, 22)
  textButton2.Font = Enum.Font.GothamBold
  textButton2.Text = "OFF"
  textButton2.TextColor3 = Color3.fromRGB(200, 200, 200)
  textButton2.TextSize = 11
  textButton2.ZIndex = 2
  textButton2.Active = true

  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 5)
  v3[p3] = textButton2
  local v8 = 0

  textButton2.Activated:Connect(function()
    if tick() - v8 < 0.2 then
      return
    end

    v8 = tick()
    v2[p3] = not v2[p3]
    f1(p3, v2[p3])

    if p3 == "Speed" then
      local character = localPlayer.Character

      local humanoid = character
      humanoid = character and character:FindFirstChildOfClass("Humanoid")

      if v2[p3] then
        if humanoid then
          if not walkSpeed then
            walkSpeed = humanoid.WalkSpeed

            if not walkSpeed or walkSpeed < 1 then
              walkSpeed = 16
            end
          end

          humanoid.WalkSpeed = 40
        end
      else
        if humanoid then
          humanoid.WalkSpeed = walkSpeed or 16
        end

        walkSpeed = nil
      end
    end
  end)
end

f2("Insta Grab", 1)
f2("Speed", 2)
f2("One Block", 3)
f2("ESP Players", 4)
f2("WallClimb", 5)
f2("ESP Pets Max", 6)
f2("Kill Aura", 7)
f2("Xray", 8)
f2("FPS Boost", 9)

local function f3()
  local v9 = {}

  for key, value in pairs(v2) do
    table.insert(v9, key .. "=" .. (value and "1" or "0"))
  end

  table.sort(v9)
  return table.concat(v9, "\n")
end

local function f4(p4)
  local v10 = not p4
  local v11 = {}

  if v10 or p4 == "" then
    return v11
  end

  for match in string.gmatch(p4, "[^\r\n]+") do
    local v12, v13 = match:match("^(.-)=(.*)$")

    if v12 then
      v11[v12] = v13 == "1" or v13 == "true"
    end
  end

  return v11
end

local function f5()
  local v14, v15 = pcall(function()
    if writefile then
      writefile("SCRIPTSSJ_config.txt", f3())
    elseif getgenv then
      getgenv().SCRIPTSSJ_CONFIG = f3()
    else
      error("sin writefile")
    end
  end)

  if v14 then
    print("[Save Config] Guardado OK")
  else
    print("[Save Config] Error:", v15)
  end

  return v14
end

local frame5 = Instance.new("Frame")
frame5.Parent = frame3
frame5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame5.Size = UDim2.new(1, 0, 0, 28)
frame5.BorderSizePixel = 0
frame5.LayoutOrder = 99

Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 6)

local textButton3 = Instance.new("TextButton")
textButton3.Parent = frame5
textButton3.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
textButton3.Size = UDim2.new(1, -12, 0, 22)
textButton3.Position = UDim2.new(0, 6, 0.5, -11)
textButton3.Font = Enum.Font.GothamBold
textButton3.Text = "Save Config"
textButton3.TextColor3 = Color3.new(1, 1, 1)
textButton3.TextSize = 11
textButton3.ZIndex = 2
textButton3.Active = true

Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 5)
local v16 = 0

textButton3.Activated:Connect(function()
  if tick() - v16 < 0.3 then
    return
  end

  v16 = tick()

  if f5() then
    textButton3.Text = "Saved!"

    task.delay(1, function()
      if textButton3 and textButton3.Parent then
        textButton3.Text = "Save Config"
      end
    end)
  else
    textButton3.Text = "Error"

    task.delay(1.2, function()
      if textButton3 and textButton3.Parent then
        textButton3.Text = "Save Config"
      end
    end)
  end
end)

local function f6(p5)
  if not p5 then
    return false
  end

  for index, value2 in ipairs(p5:GetChildren()) do
    if value2:IsA("Tool") and not v6[value2.Name] then
      return true
    end
  end

  return false
end

local function f7(p6)
  return p6 and p6:FindFirstChild("HumanoidRootPart")
end

local function f8(p7)
  local tool = p7 and p7:FindFirstChildOfClass("Tool")

  if not tool then
    return false
  else
    local lower = tool.Name:lower()
    return lower:find("bat") or lower:find("club") or lower:find("hammer")
  end
end

local v17 = false
local v18 = {}

local function f9()
  if v17 then
    return
  end

  v17 = true

  function v1626()
    v18.QualityLevel = settings().Rendering.QualityLevel
  end

  v18 = {
    GlobalShadows = lighting.GlobalShadows,
    FogEnd = lighting.FogEnd,
    Brightness = lighting.Brightness,
  }

  pcall(function()
    lighting.GlobalShadows = false
    lighting.FogEnd = 9000000000
    lighting.Brightness = 2

    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
  end)

  pcall(function()
    local terrain = workspaceService:FindFirstChildOfClass("Terrain")

    if terrain then
      terrain.WaterWaveSize = 0
      terrain.WaterWaveSpeed = 0
      terrain.WaterReflectance = 0
      terrain.WaterTransparency = 1
    end
  end)

  task.spawn(function()
    local count = 0

    for index2, value3 in ipairs(workspaceService:GetDescendants()) do
      if not v17 then
        break
      end

      if value3:IsA("ParticleEmitter") or value3:IsA("Trail") or value3:IsA("Beam") then
        value3.Enabled = false
      end

      count = count + 1

      if count % 150 == 0 then
        task.wait()
      end
    end
  end)

  print("[FPS Boost] ON")
end

local function f10()
  if not v17 then
    return
  end

  v17 = false

  pcall(function()
    if v18.GlobalShadows ~= nil then
      lighting.GlobalShadows = v18.GlobalShadows
    end

    if v18.FogEnd then
      lighting.FogEnd = v18.FogEnd
    end

    if v18.Brightness then
      lighting.Brightness = v18.Brightness
    end

    if v18.QualityLevel then
      settings().Rendering.QualityLevel = v18.QualityLevel
    end
  end)

  print("[FPS Boost] OFF")
end

task.spawn(function()
  local v19 = false

  while true do
    task.wait(0.3)
    local fpsBoost = v2["FPS Boost"]

    if fpsBoost ~= v19 then
      v19 = fpsBoost

      if fpsBoost then
        f9()
      else
        f10()
      end
    end
  end
end)

local hipHeight

local function f11(p8, p9)
  if not p8 then
    return
  else
    local humanoid2 = p8:FindFirstChildOfClass("Humanoid")

    if p9 then
      v5 = {}

      for index3, value4 in ipairs(p8:GetDescendants()) do
        if value4:IsA("BasePart") then
          v5[value4] = value4.Size

          value4.Size = Vector3.new(
            math.min(value4.Size.X, 0.7), value4.Size.Y, math.min(value4.Size.Z, 0.7)
          )
        end
      end

      if humanoid2 then
        hipHeight = humanoid2.HipHeight
        humanoid2.HipHeight = 0.5
      end
    else
      for key2, value5 in pairs(v5) do
        if key2 and key2.Parent then
          key2.Size = value5
        end
      end

      v5 = {}

      if humanoid2 then
        humanoid2.HipHeight = hipHeight or 2
      end

      hipHeight = nil
    end

    return
  end
end

task.spawn(function()
  local v20 = false

  while true do
    task.wait(0.25)
    local oneBlock = v2["One Block"]

    if oneBlock ~= v20 then
      v20 = oneBlock
      f11(localPlayer.Character, oneBlock)
    end

    if oneBlock then
      local v21 = f7(localPlayer.Character)

      if v21 and (v21.Size.X > 0.85 or v21.Size.Z > 0.85) then
        v21.Size = Vector3.new(0.7, v21.Size.Y, 0.7)
      end
    end
  end
end)

runService.Heartbeat:Connect(function()
  local v22

  if not v2["Kill Aura"] then
    return
  elseif tick() - v4 < 0.5 then
    return
  else
    local character2 = localPlayer.Character
    local v23 = f7(character2)

    if not v23 or not f8(character2) then
      return
    else
      v22 = nil
      local v24 = 7

      for index4, value6 in ipairs(players:GetPlayers()) do
        if value6 ~= localPlayer then
          local character3 = value6.Character
          local v25 = f7(character3)

          local humanoid3 = character3
          humanoid3 = character3 and character3:FindFirstChildOfClass("Humanoid")

          if v25 and humanoid3 and humanoid3.Health > 0 then
            local magnitude = (v23.Position - v25.Position).Magnitude

            if magnitude <= 7 and magnitude < v24 then
              v22 = value6
              v24 = magnitude
            end
          end
        end
      end

      if not v22 then
        return
      end

      pcall(function() remoteEvent:FireServer("gear_swing", v22.UserId) end)
      v4 = tick()
      return
    end
  end
end)

local v26 = {}
local v27 = {}
local v28 = false
local color = Color3.fromRGB(255, 170, 40)

local function f12(p10)
  if not p10 or not p10.Parent then
    return true
  elseif p10:IsA("Terrain") then
    return true
  else
    local character4 = localPlayer.Character

    if character4 and p10:IsDescendantOf(character4) then
      return true
    else
      local runtimePets = workspaceService:FindFirstChild("RuntimePets")

      if runtimePets and p10:IsDescendantOf(runtimePets) then
        return true
      else
        local model = p10:FindFirstAncestorOfClass("Model")

        if model then
          if model:FindFirstChildOfClass("Humanoid") then
            return true
          elseif players:GetPlayerFromCharacter(model) then
            return true
          elseif model:GetAttribute("Species") then
            return true
          else
            if p10:GetAttribute("Species") then
              return true
            end

            return false
          end
        else
          if p10:GetAttribute("Species") then
            return true
          end

          return false
        end
      end
    end
  end
end

local function f13()
  local humanoidRootPart = localPlayer.Character
    and localPlayer.Character:FindFirstChild("HumanoidRootPart")

  return humanoidRootPart and humanoidRootPart.Position or Vector3.zero
end

local function f14(p11)
  local v29 = string.lower(p11.Name)
  local wood = v29:find("wood")
  local v30 = wood

  if not wood then
    local madera = v29:find("madera")
    local v31 = madera

    if not madera then
      local plank = v29:find("plank")

      local frame6 = plank or v29:find("frame") or v29:find("beam") or v29:find("fence")
        or v29:find("post") or v29:find("rail") or v29:find("support") or v29:find("pillar")
        or v29:find("log")

      v31 = frame6
    end

    v30 = v31
  end

  if v30 then
    return true
  else
    local v32, v33 = pcall(function() return p11.Material end)

    if v32 and v33 == Enum.Material.Wood or v33 == Enum.Material.WoodPlanks then
      return true
    else
      local color2 = p11.Color

      if color2.R > 0.35 and color2.R < 0.75 and color2.G > 0.2 and color2.G < 0.55
        and color2.B < 0.35 then
        if p11.Size.Y <= 4 or p11.Size.X <= 4 or p11.Size.Z <= 4 then
          return true
        end

        return false
      end

      return false
    end
  end
end

local function f15(p12)
  local v34 = string.lower(p12.Name)

  if v34 == "base" or v34:find("floor") or v34:find("ground") then
    return true
  else
    local model2 = p12:FindFirstAncestorOfClass("Model")

    if model2 and model2.Parent and model2.Parent.Name == "Plots" then
      if p12.Size.Y <= 3 and p12.Size.X >= 8 and p12.Size.Z >= 8 then
        return true
      end

      return false
    end

    return false
  end
end

local function f16(p13)
  local v35 = v27[p13]

  if v35 then
    pcall(function()
      if v35.Parent then
        v35:Destroy()
      end
    end)

    v27[p13] = nil
  end
end

local function f17(p14)
  if v27[p14] then
    return
  else
    local ssjWoodMark = Instance.new("Highlight")
    ssjWoodMark.Name = "SSJ_WoodMark"
    ssjWoodMark.Adornee = p14
    ssjWoodMark.FillColor = color
    ssjWoodMark.OutlineColor = Color3.fromRGB(255, 220, 80)
    ssjWoodMark.FillTransparency = 0.35
    ssjWoodMark.OutlineTransparency = 0
    ssjWoodMark.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ssjWoodMark.Parent = p14

    v27[p14] = ssjWoodMark
    return
  end
end

local function f18(p15)
  if f12(p15) then
    return
  end

  if v26[p15] == nil then
    local v36 = {}

    for index5, value7 in ipairs(p15:GetChildren()) do
      if value7:IsA("Decal") or value7:IsA("Texture") then
        v36[value7] = value7.Transparency
      end
    end

    v26[p15] = { ltm = p15.LocalTransparencyModifier, trans = p15.Transparency, decals = v36 }
  end

  if f14(p15) then
    p15.LocalTransparencyModifier = 0.15
    f17(p15)
    return
  end

  p15.LocalTransparencyModifier = f15(p15) and 0.9 or 0.82

  if p15.Transparency < 0.55 then
    p15.Transparency = 0.55
  end

  for index6, value8 in ipairs(p15:GetChildren()) do
    if value8:IsA("Decal") or value8:IsA("Texture") then
      value8.Transparency = 0.65
    end
  end
end

local function f19()
  local v37 = f13()
  local v38 = {}

  for index7, value9 in ipairs(workspaceService:GetDescendants()) do
    if value9:IsA("BasePart") and not f12(value9) then
      if (value9.Position - v37).Magnitude <= 400 then
        table.insert(v38, value9)
      end
    end
  end

  return v38
end

local function f20()
  if v28 then
    return
  end

  v28 = true

  task.spawn(function()
    local v39 = f19()

    for i = 1, #v39 do
      if not v2.Xray then
        break
      end

      f18(v39[i])

      if i % 100 == 0 then
        task.wait()
      end
    end

    v28 = false
    print("[Xray] ON | partes:", #v39)
  end)
end

local function f21()
  for key3, value10 in pairs(v26) do
    if key3 and key3.Parent then
      if type(value10) == "table" then
        key3.LocalTransparencyModifier = value10.ltm or 0
        key3.Transparency = value10.trans or 0

        if value10.decals then
          for key4, value11 in pairs(value10.decals) do
            if key4 and key4.Parent then
              key4.Transparency = value11
            end
          end
        end
      else
        key3.LocalTransparencyModifier = value10
      end
    end

    f16(key3)
  end

  for key5, value12 in pairs(v27) do
    f16(key5)
  end

  v26 = {}
  v27 = {}
  v28 = false
  print("[Xray] OFF")
end

local v40 = {}



workspaceService.DescendantAdded:Connect(function(descendant)
  if v2.Xray and descendant:IsA("BasePart") and not f12(descendant) then
    v40[descendant] = true
  end
end)

task.spawn(function()
  while true do
    task.wait(1)

    if v2.Xray then
      local v41 = f13()

      for key6 in pairs(v40) do
        if key6.Parent and (key6.Position - v41).Magnitude <= 400 then
          f18(key6)
        end
      end
    end

    v40 = {}
  end
end)

task.spawn(function()
  local v42 = false

  while true do
    task.wait(0.3)
    local xray = v2.Xray

    if xray ~= v42 then
      v42 = xray

      if xray then
        f20()
      else
        f21()
      end
    end
  end
end)

local v43 = {
  common = 1,
  uncommon = 2,
  rare = 3,
  epic = 4,
  legendary = 5,
  mythical = 6,
  mythic = 6,
  godly = 7,
  secret = 8,
  divine = 9,
  celestial = 10,
  og = 11,
  ultra = 12,
}

local v44 = {
  Griffin = "Divine",
  ["Prehistoric Dragonfly"] = "Godly",
  Minotaur = "Secret",
  Mothman = "Secret",
  ["Gargoyle Bat"] = "Secret",
  ["Prehistoric Moth"] = "Godly",
  ["Saber Toothed Tiger"] = "Mythical",
  Dimetrodon = "Mythical",
  Qilin = "Celestial",
  Gallimimus = "Mythical",
  Stegosaurus = "Mythical",
  Pegasus = "Divine",
  Sphinx = "Secret",
  Cerberus = "Secret",
  ["Winged Imp"] = "Secret",
  Chirema = "Divine",
  Wyvern = "Divine",
  Manticore = "Secret",
  Quetzalcoatlus = "Godly",
  Azhdarchid = "Godly",
  Pterodactyl = "Godly",
  Pteranodon = "Godly",
  Hydra = "Celestial",
  Thunderbird = "Divine",
  Harpy = "Secret",
  Stymphalianbird = "Divine",
  Firephoenix = "Celestial",
  Argentavis = "Godly",
  Caladrius = "Divine",
  Roc = "Divine",
  Garuda = "Divine",
  Cockatrice = "Secret",
  Simurgh = "Celestial",
  Microraptor = "Mythical",
  ["Yi Qi"] = "Mythical",
  Archaeopteryx = "Mythical",
  Triceratops = "Mythical",
  ["Guinea Pig"] = "Uncommon",
  Lion = "Legendary",
  Horse = "Epic",
  Llama = "Epic",
  Goat = "Common",
  Kitsune = "Celestial",
  Capybara = "Rare",
  Bunny = "Uncommon",
  Koala = "Epic",
  Pigeon = "Uncommon",
  Parrot = "Rare",
  Hamster = "Uncommon",
  Turtle = "Rare",
  Chicken = "Common",
  Lizard = "Rare",
  Cat = "Common",
  Wolf = "Epic",
  Ostrich = "Epic",
  Pony = "Epic",
  Kangaroo = "Epic",
  Bat = "Rare",
  Owl = "Rare",
  Unicorn = "Celestial",
  Zebra = "Epic",
  ["Polar Bear"] = "Legendary",
  Bear = "Epic",
  Gorilla = "Legendary",
  Bull = "Rare",
  Cow = "Common",
  Tiger = "Legendary",
  Giraffe = "Legendary",
  Elephant = "Legendary",
  Mammoth = "Mythical",
  ["Triple Cobra"] = "Celestial",
  Cobra = "Celestial",
  Snake = "Rare",
  Snail = "Uncommon",
  Brachiosaurus = "Mythical",
  Ankylosaurus = "Mythical",
  Velociraptor = "Godly",
  Yeti = "OG",
  ["T Rex"] = "Godly",
  Dragon = "Celestial",
  Crocodile = "Legendary",
  Frog = "Uncommon",
  Dog = "Common",
  ["Neon Dumpling"] = "Divine",
  ["Rainbow Dumpling"] = "Celestial",
  ["Mushroom Dumpling"] = "Epic",
  ["Cookie Dough Dumpling"] = "Rare",
  ["Alien Dumpling"] = "Legendary",
  ["Lava Dumpling"] = "Godly",
  Leviathan = "Celestial",
  Megalodon = "Secret",
  Spinosaurus = "Godly",
  Tuna = "Common",
  Surgeonfish = "Uncommon",
  Archerfish = "Rare",
  Hawkfish = "Rare",
  Swordfish = "Legendary",
  Sailfish = "Legendary",
  ["Coral Goby"] = "Rare",
  ["Moorish Idol"] = "Epic",
  Barracuda = "Legendary",
  Pufferfish = "Uncommon",
  Stingray = "Epic",
  Kraken = "Divine",
  Jellyfish = "Epic",
  Goldfish = "Common",
  Regal = "Legendary",
  Cowfish = "Uncommon",
  Lionfish = "Epic",
  Boxfish = "Uncommon",
  Butterflyfish = "Rare",
  Seahorse = "Uncommon",
  Mandarinfish = "Epic",
  Whale = "Mythical",
  Trumpet = "Rare",
  Mosasaurus = "Godly",
  Wobbegong = "Mythical",
  Mapinguari = "OG",
  Wrasse = "Rare",
  Crab = "Common",
  Shark = "Mythical",
  Seal = "Common",
  Fairy = "OG",
  ["Big Foot"] = "OG",
  Gnome = "OG",
  Mermaid = "OG",
  ["Jersey Devil"] = "OG",
  Leprechaun = "OG",
  Shenlong = "OG",
  Werewolf = "OG",
  Plesiosaur = "Godly",
  Mech = "ULTRA",
  HydraTitan = "ULTRA",
  Destroyer = "ULTRA",
}

local v45

local function f22()
  if v45 then
    local parent = v45.Parent

    if parent then
      local ssjBestPetName = parent:FindFirstChild("SSJ_BestPetName")

      if ssjBestPetName then
        ssjBestPetName:Destroy()
      end

      v45:Destroy()
    end

    v45 = nil
  end
end

local function f23(p16)
  return p16:FindFirstAncestorOfClass("Model") or p16.Parent
end

local function f24(p17)
  if not p17 then
    return 0
  else
    local v46, v47 = tostring(p17):lower():gsub("[$%,]", ""):match("([%d%.]+)%s*([kmbtq]?)/s")

    if not v46 then
      return 0
    end

    return (tonumber(v46) or 0) * (({
      k = 1000,
      m = 1000000,
      b = 1000000000,
      t = 1000000000000,
      q = 1000000000000000,
    })[v47 or ""] or 1)
  end
end

local function f25(p18)
  local v48 = 0

  if not p18 then
    return 0
  end

  for index8, value13 in ipairs(p18:GetDescendants()) do
    if value13:IsA("TextLabel") and value13.Text ~= "" and value13.Text:lower():find("/s") then
      local v49 = f24(value13.Text)

      if v49 > v48 then
        v48 = v49
      end
    end
  end

  return v48
end

local function f26(p19)
  if not p19 then
    return 0, 0
  else
    local v50 = 0
    local species = p19:GetAttribute("Species")

    if type(species) == "string" and v44[species] then
      v50 = v43[string.lower(v44[species])] or 0
    end

    if v50 == 0 then
      for index9, value14 in ipairs(p19:GetDescendants()) do
        if value14:IsA("ProximityPrompt") then
          local gsub = value14.Name:gsub(" Steal", ""):gsub("Steal", "")

          if v44[gsub] then
            v50 = v43[string.lower(v44[gsub])] or 0
            break
          end
        end

        if value14:IsA("TextLabel") and v44[value14.Text] then
          v50 = v43[string.lower(v44[value14.Text])] or 0
          break
        end
      end
    end

    if v50 == 0 and v44[p19.Name] then
      v50 = v43[string.lower(v44[p19.Name])] or 0
    end

    return v50, f25(p19)
  end
end

task.spawn(function()
  while true do
    task.wait(1.5)

    pcall(function()
      if not v2["ESP Pets Max"] then
        f22()
        return
      else
        local runtimePets2 = workspaceService:FindFirstChild("RuntimePets")

        if not runtimePets2 then
          f22()
          return
        else
          local v51 = -1
          local v52 = -1
          local species2 = nil
          local v53 = nil

          for index10, value15 in ipairs(runtimePets2:GetDescendants()) do
            if value15:IsA("ProximityPrompt") then
              if (value15.Name .. " " .. tostring(value15.ActionText) .. " "
                .. tostring(value15.ObjectText)):lower():find("steal") then
                local v54 = f23(value15)
                local v55, v56 = f26(v54)

                if v55 > v51 or v55 == v51 and v56 > v52 then
                  v51 = v55
                  v52 = v56
                  v53 = v54
                  species2 = v54 and (v54:GetAttribute("Species") or v54.Name)
                end
              end
            end
          end

          if v53 and v51 > 0 then
            if not v45 or v45.Adornee ~= v53 then
              f22()

              local ssjBestPetESP = Instance.new("Highlight")
              ssjBestPetESP.Name = "SSJ_BestPetESP"
              ssjBestPetESP.Adornee = v53
              ssjBestPetESP.FillColor = Color3.fromRGB(255, 0, 255)
              ssjBestPetESP.OutlineColor = Color3.fromRGB(0, 255, 255)
              ssjBestPetESP.FillTransparency = 0.25
              ssjBestPetESP.OutlineTransparency = 0
              ssjBestPetESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
              ssjBestPetESP.Parent = v53

              local findFirstChild = v53.FindFirstChild
              v45 = ssjBestPetESP
              local v57 = findFirstChild(v53, "Head")

              local basePart = v57
              basePart = v57 or v53:FindFirstChildWhichIsA("BasePart")

              if basePart then
                local ssjBestPetName2 = Instance.new("BillboardGui")
                ssjBestPetName2.Name = "SSJ_BestPetName"
                ssjBestPetName2.Adornee = basePart
                ssjBestPetName2.Size = UDim2.new(0, 220, 0, 50)
                ssjBestPetName2.StudsOffset = Vector3.new(0, 3.5, 0)
                ssjBestPetName2.AlwaysOnTop = true
                ssjBestPetName2.MaxDistance = 1000
                ssjBestPetName2.Parent = v53

                local textLabel3 = Instance.new("TextLabel")
                textLabel3.BackgroundTransparency = 1
                textLabel3.Size = UDim2.new(1, 0, 1, 0)
                textLabel3.Font = Enum.Font.GothamBold
                textLabel3.TextSize = 18
                textLabel3.TextColor3 = Color3.fromRGB(255, 0, 255)
                textLabel3.TextStrokeTransparency = 0
                textLabel3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                textLabel3.Text = tostring(species2 or "?")
                textLabel3.Parent = ssjBestPetName2
              end
            end
          else
            f22()
          end

          return
        end
      end
    end)
  end
end)

local function f27()
  return userInputService.TouchEnabled and not userInputService.KeyboardEnabled
end

local function f28()
  local character5 = localPlayer.Character
  local humanoidRootPart2 = character5 and character5:FindFirstChild("HumanoidRootPart")

  if not humanoidRootPart2 then
    return
  else
    local runtimePets3 = workspaceService:FindFirstChild("RuntimePets")

    if not runtimePets3 then
      return
    else
      local adornee = v2["ESP Pets Max"] and v45 and v45.Adornee or nil
      local v58 = f27()

      for index11, value16 in ipairs(runtimePets3:GetDescendants()) do
        local v59 = value16

        repeat
          if not v59:IsA("ProximityPrompt") then
            break
          else
            local parent2 = v59.Parent:IsA("BasePart") and v59.Parent
              or v59.Parent:FindFirstChildWhichIsA("BasePart")

            if not parent2 then
              break
            else
              local parent3 = parent2

              if parent2.Parent
                and (parent2.Parent:IsA("Model") or parent2.Parent:IsA("BasePart")) then
                parent3 = parent2.Parent
              end

              local v60 = true

              if adornee then
                v60 = parent3 == adornee or parent2 == adornee
              end

              if not v60 then
                break
              else
                local lower2 = (tostring(v59.ObjectText) .. " " .. tostring(v59.ActionText)
                  .. " " .. v59.Name):lower()

                if not (lower2:find("steal") or lower2:find("pick") or lower2:find("grab")
                  or lower2:find("take") or adornee) then
                  break
                end

                if (humanoidRootPart2.Position - parent2.Position).Magnitude > 18 then
                  break
                end

                pcall(function()
                  v59.HoldDuration = 0

                  if fireproximityprompt then
                    fireproximityprompt(v59)
                  end
                end)

                if not v58 then
                  pcall(function()
                    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.03)
                    virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                  end)
                end
              end
            end
          end
        until true
      end

      return
    end
  end
end

local v61 = {}
local v62 = {}
local color3 = Color3.fromRGB(255, 0, 0)
local color4 = Color3.fromRGB(255, 255, 0)
local v63 = {}

local function f29(p20)
  if v63[p20] then
    for index12, value17 in ipairs(v63[p20]) do
      local v64 = value17
      pcall(function() v64:Disconnect() end)
    end

    v63[p20] = nil
  end
end

local function f30(p21)
  if v61[p21] then
    pcall(function()
      if v61[p21].Parent then
        v61[p21]:Destroy()
      end
    end)

    v61[p21] = nil
  end

  if v62[p21] then
    pcall(function()
      if v62[p21].Parent then
        v62[p21]:Destroy()
      end
    end)

    v62[p21] = nil
  end
end

local function f31(p22, p23)
  f30(p22)

  if not v2["ESP Players"] or p22 == localPlayer or not p23 then
    return
  else
    local ssjESP = Instance.new("Highlight")
    ssjESP.Name = "SSJ_ESP"
    ssjESP.Adornee = p23
    ssjESP.FillColor = color3
    ssjESP.OutlineColor = color4
    ssjESP.FillTransparency = 0.25
    ssjESP.OutlineTransparency = 0
    ssjESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ssjESP.Parent = p23

    v61[p22] = ssjESP
    local head = p23:FindFirstChild("Head") or p23:WaitForChild("Head", 2)

    if head then
      local ssjESPName = Instance.new("BillboardGui")
      ssjESPName.Name = "SSJ_ESP_Name"
      ssjESPName.Adornee = head
      ssjESPName.Size = UDim2.new(0, 220, 0, 50)
      ssjESPName.StudsOffset = Vector3.new(0, 3, 0)
      ssjESPName.AlwaysOnTop = true
      ssjESPName.MaxDistance = 2000
      ssjESPName.Parent = p23

      local textLabel4 = Instance.new("TextLabel")
      textLabel4.BackgroundTransparency = 1
      textLabel4.Size = UDim2.new(1, 0, 0.55, 0)
      textLabel4.Font = Enum.Font.GothamBold
      textLabel4.TextSize = 18
      textLabel4.TextColor3 = Color3.fromRGB(255, 50, 50)
      textLabel4.TextStrokeTransparency = 0
      textLabel4.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

      textLabel4.Text = p22.DisplayName ~= p22.Name
          and p22.DisplayName .. " (@" .. p22.Name .. ")"
        or p22.Name

      textLabel4.Parent = ssjESPName

      local dist = Instance.new("TextLabel")
      dist.Name = "Dist"
      dist.BackgroundTransparency = 1
      dist.Position = UDim2.new(0, 0, 0.55, 0)
      dist.Size = UDim2.new(1, 0, 0.45, 0)
      dist.Font = Enum.Font.GothamBold
      dist.TextSize = 14
      dist.TextColor3 = Color3.fromRGB(255, 255, 0)
      dist.TextStrokeTransparency = 0
      dist.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      dist.Text = ""
      dist.Parent = ssjESPName

      v62[p22] = ssjESPName
    end

    local humanoid4 = p23:FindFirstChildOfClass("Humanoid")

    if humanoid4 then
      v63[p22] = v63[p22] or {}
      local died = humanoid4.Died
      table.insert(v63[p22], died:Connect(function() f30(p22) end))
    end

    return
  end
end

local function f32(p24)
  if p24 == localPlayer then
    return
  else
    f29(p24)
    v63[p24] = {}
    local characterAdded = p24.CharacterAdded

    table.insert(v63[p24], characterAdded:Connect(function(p25)
      task.wait(0.35)

      if v2["ESP Players"] then
        f31(p24, p25)
      end
    end))

    if p24.Character and v2["ESP Players"] then
      f31(p24, p24.Character)
    end

    return
  end
end

for index13, value18 in ipairs(players:GetPlayers()) do
  f32(value18)
end

players.PlayerAdded:Connect(f32)

players.PlayerRemoving:Connect(function(player)
  f30(player)
  f29(player)
end)

task.spawn(function()
  while true do
    task.wait(0.8)

    pcall(function()
      if not v2["ESP Players"] then
        for index14, value19 in ipairs(players:GetPlayers()) do
          f30(value19)
        end

        return
      else
        local character6 = localPlayer.Character

        local humanoidRootPart3 = character6

        humanoidRootPart3 = character6
          and localPlayer.Character:FindFirstChild("HumanoidRootPart")

        for index15, value20 in ipairs(players:GetPlayers()) do
          if value20 ~= localPlayer then
            local character7 = value20.Character

            if character7 then
              if not v61[value20] or v61[value20].Adornee ~= character7 then
                f31(value20, character7)
              elseif humanoidRootPart3 and v62[value20] then
                local humanoidRootPart4 = character7:FindFirstChild("HumanoidRootPart")
                local dist2 = v62[value20]:FindFirstChild("Dist")

                if humanoidRootPart4 and dist2 then
                  dist2.Text = math.floor((humanoidRootPart3.Position - humanoidRootPart4.Position).Magnitude)
                    .. "m"
                end
              end
            else
              f30(value20)
            end
          end
        end

        return
      end
    end)
  end
end)

local v65 = 0
local v66 = 0.55

runService.Heartbeat:Connect(function()
  if not v2.WallClimb then
    return
  end

  pcall(function()
    local character8 = localPlayer.Character
    local humanoid5 = character8 and character8:FindFirstChildOfClass("Humanoid")

    local humanoidRootPart5 = character8
    humanoidRootPart5 = character8 and character8:FindFirstChild("HumanoidRootPart")

    local v67 = not humanoid5
    local v68 = humanoidRootPart5

    if v67 or not v68 or humanoid5.MoveDirection.Magnitude < 0.15 then
      return
    else
      local raycastParams = RaycastParams.new()
      raycastParams.FilterType = Enum.RaycastFilterType.Exclude
      raycastParams.FilterDescendantsInstances = { character8 }

      local lookVector = v68.CFrame.LookVector
      local raycast = workspaceService:Raycast(v68.Position, lookVector * 2, raycastParams)

      if not raycast then
        return
      else
        local normal = raycast.Normal

        if normal.Y > 0.25 or math.abs(normal.Y) > 0.35 then
          return
        elseif -lookVector:Dot(normal) < 0.45 then
          return
        else
          local assemblyLinearVelocity = v68.AssemblyLinearVelocity
          local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
          local v69 = (vector - normal * vector:Dot(normal)) * v66 - normal * 2
          v68.AssemblyLinearVelocity = Vector3.new(v69.X, 22, v69.Z)

          if tick() - v65 > 0.4 then
            if humanoid5:GetState() ~= Enum.HumanoidStateType.Jumping then
              humanoid5:ChangeState(Enum.HumanoidStateType.Jumping)
            end

            v65 = tick()
          end

          return
        end
      end
    end
  end)
end)

task.spawn(function()
  print("=== SCRIPTSSJ: Script loaded ===")

  while true do
    pcall(function()
      if v2["Insta Grab"] then
        f28()
      end

      if v2.Speed then
        local character9 = localPlayer.Character
        local humanoid6 = character9 and character9:FindFirstChildOfClass("Humanoid")

        if humanoid6 then
          local v70 = f6(character9) and 37 or 40

          if humanoid6.WalkSpeed ~= v70 then
            humanoid6.WalkSpeed = v70
          end
        end
      end
    end)

    task.wait(v2["Insta Grab"] and 0.2 or 0.35)
  end
end)

localPlayer.CharacterAdded:Connect(function(character10)
  task.wait(0.5)

  if v2.Speed then
    local humanoid7 = character10:FindFirstChildOfClass("Humanoid")

    if humanoid7 then
      walkSpeed = humanoid7.WalkSpeed

      if not walkSpeed or walkSpeed < 1 then
        walkSpeed = 16
      end

      humanoid7.WalkSpeed = f6(character10) and 37 or 40
    end
  end

  if v2["One Block"] then
    f11(character10, true)
  end
end)

task.defer(function()
  local scriptssjConfigTxt

  pcall(function()
    if isfile and isfile("SCRIPTSSJ_config.txt") and readfile then
      scriptssjConfigTxt = readfile("SCRIPTSSJ_config.txt")
    elseif getgenv and getgenv().SCRIPTSSJ_CONFIG then
      scriptssjConfigTxt = getgenv().SCRIPTSSJ_CONFIG
    end
  end)

  if not scriptssjConfigTxt then
    print("[Save Config] Sin config previa")
    return
  end

  for key7, value21 in pairs((f4(scriptssjConfigTxt))) do
    if v2[key7] ~= nil then
      v2[key7] = value21
      f1(key7, value21)

      if key7 == "Speed" and value21 then
        local character11 = localPlayer.Character

        local humanoid8 = character11
        humanoid8 = character11 and character11:FindFirstChildOfClass("Humanoid")

        if humanoid8 then
          if not walkSpeed then
            walkSpeed = humanoid8.WalkSpeed

            if not walkSpeed or walkSpeed < 1 then
              walkSpeed = 16
            end
          end

          humanoid8.WalkSpeed = 40
        end
      end
    end
  end

  print("[Save Config] Config cargada")
end)

local function f33(p26)
  return p26.UserInputType == Enum.UserInputType.MouseButton1
    or p26.UserInputType == Enum.UserInputType.Touch
end

local v71, position, position2

textLabel.InputBegan:Connect(function(input)
  if not f33(input) then
    return
  end

  v71 = true
  position = input.Position
  position2 = frame.Position
end)

userInputService.InputEnded:Connect(function(input2)
  if f33(input2) then
    v71 = false
  end
end)

userInputService.InputChanged:Connect(function(input3)
  if not v71 or not position or not position2 then
    return
  end

  if input3.UserInputType ~= Enum.UserInputType.MouseMovement
    and input3.UserInputType ~= Enum.UserInputType.Touch then
    return
  else
    local v72 = input3.Position - position

    frame.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v72.X, position2.Y.Scale,
      position2.Y.Offset + v72.Y
    )

    return
  end
end)
