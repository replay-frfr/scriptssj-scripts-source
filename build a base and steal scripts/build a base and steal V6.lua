local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local virtualInputManager = game:GetService("VirtualInputManager")
local workspaceService = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")
local localPlayer = players.LocalPlayer
local remoteEvent = replicatedStorage:WaitForChild("RemoteEvent")

pcall(function()
  local scriptSSJMultiHub = coreGui:FindFirstChild("ScriptSSJ_MultiHub")

  if scriptSSJMultiHub then
    scriptSSJMultiHub:Destroy()
  end
end)

pcall(function()
  local playerGui = localPlayer:FindFirstChild("PlayerGui")

  if playerGui then
    local scriptSSJMultiHub2 = playerGui:FindFirstChild("ScriptSSJ_MultiHub")

    if scriptSSJMultiHub2 then
      scriptSSJMultiHub2:Destroy()
    end
  end
end)

pcall(function()
  if gethui then
    local v1 = gethui()
    local scriptSSJMultiHub3 = v1 and v1:FindFirstChild("ScriptSSJ_MultiHub")

    if scriptSSJMultiHub3 then
      scriptSSJMultiHub3:Destroy()
    end
  end
end)

local scriptSSJMultiHub4 = Instance.new("ScreenGui")
scriptSSJMultiHub4.Name = "ScriptSSJ_MultiHub"
scriptSSJMultiHub4.ResetOnSpawn = false
scriptSSJMultiHub4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() scriptSSJMultiHub4.IgnoreGuiInset = true end)

pcall(function()
  if syn and syn.protect_gui then
    syn.protect_gui(scriptSSJMultiHub4)
    scriptSSJMultiHub4.Parent = coreGui
  elseif gethui then
    scriptSSJMultiHub4.Parent = gethui()
  else
    scriptSSJMultiHub4.Parent = coreGui
  end
end)

if not scriptSSJMultiHub4.Parent then
  scriptSSJMultiHub4.Parent = localPlayer:WaitForChild("PlayerGui")
end

local frame = Instance.new("Frame")
frame.Parent = scriptSSJMultiHub4
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

local v2 = false

textButton.Activated:Connect(function()
  v2 = not v2

  if v2 then
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

local v3 = {
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

local v4 = {}
local v5 = 0
local v6 = {}

local function f1(key, value)
  local v7 = v4[key]

  if not v7 then
    return
  end

  if value then
    v7.Text = "ON"
    v7.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
    v7.TextColor3 = Color3.new(1, 1, 1)
  else
    v7.Text = "OFF"
    v7.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    v7.TextColor3 = Color3.fromRGB(200, 200, 200)
  end
end

local v8 = {
  ["Bloxy Cola"] = true,
  ["Wooden Bat"] = true,
  ["Pick Up"] = true,
  Build = true,
  Edit = true,
  ["Speed Coil"] = true,
  ["Gravity Coil"] = true,
  ["Dual Coil"] = true,
}

local walkSpeed

local function makeTextButton(key2, layoutOrder)
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
  textLabel2.Text = key2
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
  v4[key2] = textButton2
  local v9 = 0

  textButton2.Activated:Connect(function()
    if tick() - v9 < 0.2 then
      return
    end

    v9 = tick()
    v3[key2] = not v3[key2]
    f1(key2, v3[key2])

    if key2 == "Speed" then
      local character = localPlayer.Character

      local humanoid = character
      humanoid = character and character:FindFirstChildOfClass("Humanoid")

      if v3[key2] then
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

makeTextButton("Insta Grab", 1)
makeTextButton("Speed", 2)
makeTextButton("One Block", 3)
makeTextButton("ESP Players", 4)
makeTextButton("WallClimb", 5)
makeTextButton("ESP Pets Max", 6)
makeTextButton("Kill Aura", 7)
makeTextButton("Xray", 8)
makeTextButton("FPS Boost", 9)

local function f2(p1)
  local v10 = {}

  if not p1 or p1 == "" then
    return v10
  end

  for match in string.gmatch(p1, "[^\r\n]+") do
    local v11, v12 = match:match("^(.-)=(.*)$")

    if v11 then
      v10[v11] = v12 == "1" or v12 == "true"
    end
  end

  return v10
end

local f3

local function f4()
  local v13, v14 = pcall(function()
    if writefile then
      writefile("SCRIPTSSJ_config.txt", f3())
    elseif getgenv then
      getgenv().SCRIPTSSJ_CONFIG = f3()
    else
      error("sin writefile")
    end
  end)

  if v13 then
    print("[Save Config] Guardado OK")
  else
    print("[Save Config] Error:", v14)
  end

  return v13
end

function f3()
  local v15 = {}

  for key3, value2 in pairs(v3) do
    table.insert(v15, key3 .. "=" .. (value2 and "1" or "0"))
  end

  table.sort(v15)
  return table.concat(v15, "\n")
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

local function f5(character2)
  if not character2 then
    return false
  end

  if character2:GetAttribute("CarryingPet") == true then
    return true
  end

  for index, value3 in ipairs(character2:GetChildren()) do
    if value3:IsA("Tool") and not v8[value3.Name] then
      return true
    end
  end

  return false
end

Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 5)
local v16 = 0

textButton3.Activated:Connect(function()
  if tick() - v16 < 0.3 then
    return
  end

  v16 = tick()

  if f4() then
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

local function f6(character3)
  return character3 and character3:FindFirstChild("HumanoidRootPart")
end

local function f7(character4)
  local tool = character4 and character4:FindFirstChildOfClass("Tool")

  if not tool then
    return false
  else
    local lower = tool.Name:lower()
    return lower:find("bat") or lower:find("club") or lower:find("hammer")
  end
end

local v17 = false
local v18 = {}

local function f8()
  if v17 then
    return
  end

  v17 = true

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

    for index2, value4 in ipairs(workspaceService:GetDescendants()) do
      if not v17 then
        break
      end

      if value4:IsA("ParticleEmitter") or value4:IsA("Trail") or value4:IsA("Beam") then
        value4.Enabled = false
      end

      count = count + 1

      if count % 150 == 0 then
        task.wait()
      end
    end
  end)

  print("[FPS Boost] ON")
end

local function f9()
  if not v17 then
    return
  end

  function v2114()
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
  end

  v17 = false
  print("[FPS Boost] OFF")
end

task.spawn(function()
  local v19 = false

  while true do
    task.wait(0.3)
    local fpsBoost = v3["FPS Boost"]

    if fpsBoost ~= v19 then
      v19 = fpsBoost

      if fpsBoost then
        f8()
      else
        f9()
      end
    end
  end
end)

local hipHeight

local function f10(character5, oneBlock)
  if not character5 then
    return
  else
    local humanoid2 = character5:FindFirstChildOfClass("Humanoid")

    if oneBlock then
      v6 = {}

      for index3, value5 in ipairs(character5:GetDescendants()) do
        if value5:IsA("BasePart") then
          v6[value5] = value5.Size

          value5.Size = Vector3.new(
            math.min(value5.Size.X, 0.7), value5.Size.Y, math.min(value5.Size.Z, 0.7)
          )
        end
      end

      if humanoid2 then
        hipHeight = humanoid2.HipHeight
        humanoid2.HipHeight = 0.5
      end
    else
      for key4, value6 in pairs(v6) do
        if key4 and key4.Parent then
          key4.Size = value6
        end
      end

      v6 = {}

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
    local oneBlock2 = v3["One Block"]

    if oneBlock2 ~= v20 then
      v20 = oneBlock2
      f10(localPlayer.Character, oneBlock2)
    end

    if oneBlock2 then
      local v21 = f6(localPlayer.Character)

      if v21 and (v21.Size.X > 0.85 or v21.Size.Z > 0.85) then
        v21.Size = Vector3.new(0.7, v21.Size.Y, 0.7)
      end
    end
  end
end)

runService.Heartbeat:Connect(function()
  local v22

  if not v3["Kill Aura"] then
    return
  elseif tick() - v5 < 0.5 then
    return
  else
    local character6 = localPlayer.Character
    local v23 = f6(character6)

    if not v23 or not f7(character6) then
      return
    else
      local v24 = 7
      v22 = nil

      for index4, value7 in ipairs(players:GetPlayers()) do
        if value7 ~= localPlayer then
          local character7 = value7.Character
          local humanoid3 = character7
          local v25 = f6(character7)
          humanoid3 = character7 and character7:FindFirstChildOfClass("Humanoid")

          if v25 and humanoid3 and humanoid3.Health > 0 then
            local magnitude = (v23.Position - v25.Position).Magnitude

            if magnitude <= 7 and magnitude < v24 then
              v22 = value7
              v24 = magnitude
            end
          end
        end
      end

      if not v22 then
        return
      end

      pcall(function() remoteEvent:FireServer("gear_swing", v22.UserId) end)
      v5 = tick()
      return
    end
  end
end)

local v26 = {}
local v27 = {}
local v28 = false
local color = Color3.fromRGB(255, 170, 40)

local function f11(p2)
  if not p2 or not p2.Parent then
    return true
  elseif p2:IsA("Terrain") then
    return true
  else
    local character8 = localPlayer.Character

    if character8 and p2:IsDescendantOf(character8) then
      return true
    else
      local runtimePets = workspaceService:FindFirstChild("RuntimePets")

      if runtimePets and p2:IsDescendantOf(runtimePets) then
        return true
      else
        local model = p2:FindFirstAncestorOfClass("Model")

        if model then
          if model:FindFirstChildOfClass("Humanoid") then
            return true
          elseif players:GetPlayerFromCharacter(model) then
            return true
          elseif model:GetAttribute("Species") then
            return true
          else
            if p2:GetAttribute("Species") then
              return true
            end

            return false
          end
        else
          if p2:GetAttribute("Species") then
            return true
          end

          return false
        end
      end
    end
  end
end

local function f12(key5)
  local v29 = v27[key5]

  if v29 then
    pcall(function()
      if v29.Parent then
        v29:Destroy()
      end
    end)

    v27[key5] = nil
  end
end

local function f13(p3)
  local v30 = string.lower(p3.Name)

  if v30 == "base" or v30:find("floor") or v30:find("ground") then
    return true
  else
    local model2 = p3:FindFirstAncestorOfClass("Model")

    if model2 and model2.Parent and model2.Parent.Name == "Plots" then
      if p3.Size.Y <= 3 and p3.Size.X >= 8 and p3.Size.Z >= 8 then
        return true
      end

      return false
    end

    return false
  end
end

local function f14(p4)
  local v31 = string.lower(p4.Name)
  local wood = v31:find("wood")
  local v32 = wood

  if not wood then
    local madera = v31:find("madera")
    local v33 = madera

    if not madera then
      local plank = v31:find("plank")

      local frame6 = plank or v31:find("frame") or v31:find("beam") or v31:find("fence")
        or v31:find("post") or v31:find("rail") or v31:find("support") or v31:find("pillar")
        or v31:find("log")

      v33 = frame6
    end

    v32 = v33
  end

  if v32 then
    return true
  else
    local v34, v35 = pcall(function() return p4.Material end)

    if v34 and (v35 == Enum.Material.Wood or v35 == Enum.Material.WoodPlanks) then
      return true
    else
      local color2 = p4.Color

      if color2.R > 0.35 and color2.R < 0.75 and color2.G > 0.2 and color2.G < 0.55
        and color2.B < 0.35 then
        if p4.Size.Y <= 4 or p4.Size.X <= 4 or p4.Size.Z <= 4 then
          return true
        end

        return false
      end

      return false
    end
  end
end

local function f15()
  local humanoidRootPart = localPlayer.Character
    and localPlayer.Character:FindFirstChild("HumanoidRootPart")

  return humanoidRootPart and humanoidRootPart.Position or Vector3.zero
end

local function makeHighlight(key6)
  if v27[key6] then
    return
  else
    local ssjWoodMark = Instance.new("Highlight")
    ssjWoodMark.Name = "SSJ_WoodMark"
    ssjWoodMark.Adornee = key6
    ssjWoodMark.FillColor = color
    ssjWoodMark.OutlineColor = Color3.fromRGB(255, 220, 80)
    ssjWoodMark.FillTransparency = 0.35
    ssjWoodMark.OutlineTransparency = 0
    ssjWoodMark.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ssjWoodMark.Parent = key6

    v27[key6] = ssjWoodMark
    return
  end
end

local function f16()
  local v36 = f15()
  local v37 = {}

  for index5, value8 in ipairs(workspaceService:GetDescendants()) do
    if value8:IsA("BasePart") and not f11(value8) then
      if (value8.Position - v36).Magnitude <= 400 then
        table.insert(v37, value8)
      end
    end
  end

  return v37
end

local function f17()
  for key7, value9 in pairs(v26) do
    if key7 and key7.Parent then
      if type(value9) == "table" then
        key7.LocalTransparencyModifier = value9.ltm or 0
        key7.Transparency = value9.trans or 0

        if value9.decals then
          for key8, value10 in pairs(value9.decals) do
            if key8 and key8.Parent then
              key8.Transparency = value10
            end
          end
        end
      else
        key7.LocalTransparencyModifier = value9
      end
    end

    f12(key7)
  end

  for key9, value11 in pairs(v27) do
    f12(key9)
  end

  v26 = {}
  v27 = {}
  v28 = false
  print("[Xray] OFF")
end

local function f18(key10)
  if f11(key10) then
    return
  end

  if v26[key10] == nil then
    local v38 = {}

    for index6, value12 in ipairs(key10:GetChildren()) do
      if value12:IsA("Decal") or value12:IsA("Texture") then
        v38[value12] = value12.Transparency
      end
    end

    v26[key10] = {
      ltm = key10.LocalTransparencyModifier,
      trans = key10.Transparency,
      decals = v38,
    }
  end

  if f14(key10) then
    key10.LocalTransparencyModifier = 0.15
    makeHighlight(key10)
    return
  end

  key10.LocalTransparencyModifier = f13(key10) and 0.9 or 0.82

  if key10.Transparency < 0.55 then
    key10.Transparency = 0.55
  end

  for index7, value13 in ipairs(key10:GetChildren()) do
    if value13:IsA("Decal") or value13:IsA("Texture") then
      value13.Transparency = 0.65
    end
  end
end

local function f19()
  if v28 then
    return
  end

  v28 = true

  task.spawn(function()
    local v39 = f16()
    local v40 = #v39
    local count2 = 0

    while true do
      count2 = 1 + count2

      if not (count2 <= v40) then
        break
      end

      local v41 = count2

      if not v3.Xray then
        break
      end

      f18(v39[v41])

      if v41 % 100 == 0 then
        task.wait()
      end
    end

    v28 = false
    print("[Xray] ON | partes:", #v39)
  end)
end

local v42 = {}

workspaceService.DescendantAdded:Connect(function(descendant)
  if v3.Xray and descendant:IsA("BasePart") and not f11(descendant) then
    v42[descendant] = true
  end
end)

task.spawn(function()
  while true do
    task.wait(1)

    if v3.Xray then
      local v43 = f15()

      for key11 in pairs(v42) do
        if key11.Parent and (key11.Position - v43).Magnitude <= 400 then
          f18(key11)
        end
      end
    end

    v42 = {}
  end
end)

task.spawn(function()
  local v44 = false

  while true do
    task.wait(0.3)
    local xray = v3.Xray

    if xray ~= v44 then
      v44 = xray

      if xray then
        f19()
      else
        f17()
      end
    end
  end
end)

local v45 = {
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

local v46 = {
  common = Color3.fromRGB(200, 200, 200),
  uncommon = Color3.fromRGB(80, 230, 130),
  rare = Color3.fromRGB(70, 150, 255),
  epic = Color3.fromRGB(190, 80, 255),
  legendary = Color3.fromRGB(255, 195, 40),
  mythical = Color3.fromRGB(255, 110, 40),
  mythic = Color3.fromRGB(255, 110, 40),
  godly = Color3.fromRGB(255, 55, 55),
  secret = Color3.fromRGB(255, 40, 170),
  divine = Color3.fromRGB(100, 255, 255),
  celestial = Color3.fromRGB(170, 255, 255),
  og = Color3.fromRGB(255, 235, 100),
  ultra = Color3.fromRGB(255, 30, 255),
}

local v47 = {
  normal = Color3.fromRGB(255, 255, 255),
  golden = Color3.fromRGB(255, 215, 50),
  cosmic = Color3.fromRGB(170, 100, 255),
  inferno = Color3.fromRGB(255, 80, 30),
  admin = Color3.fromRGB(70, 255, 110),
}

local function f20()
  local v48 = {}
  local rarities = replicatedStorage:FindFirstChild("Rarities")

  if rarities then
    for index8, value14 in ipairs(rarities:GetChildren()) do
      v48[string.lower(value14.Name)] = value14.Name
    end
  end

  return v48
end

local function f21()
  local v49 = {}
  local mutations = replicatedStorage:FindFirstChild("Mutations")

  if mutations then
    for index9, value15 in ipairs(mutations:GetChildren()) do
      v49[string.lower(value15.Name)] = value15.Name
    end
  end

  return v49
end

f20()
local v50 = f21()
local v51

local function f22()
  if v51 then
    local parent = v51.Parent

    if parent then
      local ssjBestPetName = parent:FindFirstChild("SSJ_BestPetName")

      if ssjBestPetName then
        ssjBestPetName:Destroy()
      end

      v51:Destroy()
    end

    v51 = nil
  end
end

local v52 = {
  ["ARM 1"] = "ULTRA",
  ["Alien Dumpling"] = "Legendary",
  Ankylosaurus = "Mythical",
  Archaeopteryx = "Mythical",
  Archerfish = "Rare",
  Argentavis = "Godly",
  Azhdarchid = "Godly",
  Barracuda = "Legendary",
  Bat = "Rare",
  Bear = "Epic",
  ["Big Foot"] = "OG",
  Boxfish = "Uncommon",
  Brachiosaurus = "Mythical",
  Bull = "Rare",
  Bunny = "Uncommon",
  Butterflyfish = "Rare",
  Caladrius = "Divine",
  Capybara = "Rare",
  Cat = "Common",
  Cerberus = "Secret",
  Chicken = "Common",
  Chirema = "Divine",
  Cobra = "Celestial",
  Cockatrice = "Secret",
  ["Cookie Dough Dumpling"] = "Rare",
  ["Coral Goby"] = "Rare",
  Cow = "Common",
  Cowfish = "Uncommon",
  Crab = "Common",
  Crocodile = "Legendary",
  ["Cybernetic Dog"] = "Celestial",
  Destroyer = "ULTRA",
  Dimetrodon = "Mythical",
  Dog = "Common",
  Dragon = "Celestial",
  Elephant = "Legendary",
  Fairy = "OG",
  Firephoenix = "Celestial",
  Frog = "Uncommon",
  Gallimimus = "Mythical",
  ["Gargoyle Bat"] = "Secret",
  Garuda = "Divine",
  Ghost = "Secret",
  Giraffe = "Legendary",
  Gnome = "OG",
  Goat = "Common",
  Goldfish = "Common",
  Gorilla = "Legendary",
  Griffin = "Divine",
  ["Guinea Pig"] = "Uncommon",
  Hamster = "Uncommon",
  Harpy = "Secret",
  Hawkfish = "Rare",
  Horse = "Epic",
  Hydra = "Celestial",
  HydraTitan = "ULTRA",
  Jellyfish = "Epic",
  ["Jersey Devil"] = "OG",
  Kangaroo = "Epic",
  Kitsune = "Celestial",
  Koala = "Epic",
  Kraken = "Divine",
  ["Lava Dumpling"] = "Godly",
  Leprechaun = "OG",
  Leviathan = "Celestial",
  Lion = "Legendary",
  Lionfish = "Epic",
  Lizard = "Rare",
  Llama = "Epic",
  Mammoth = "Mythical",
  Mandarinfish = "Epic",
  Manticore = "Secret",
  Mapinguari = "OG",
  Mech = "ULTRA",
  Megalodon = "Secret",
  Mermaid = "OG",
  Microraptor = "Mythical",
  Minotaur = "Secret",
  ["Moorish Idol"] = "Epic",
  Mosasaurus = "Godly",
  Mothman = "Secret",
  ["Mushroom Dumpling"] = "Epic",
  ["Neon Dumpling"] = "Divine",
  Ostrich = "Epic",
  Owl = "Rare",
  Parrot = "Rare",
  Pegasus = "Divine",
  Pigeon = "Uncommon",
  Plesiosaur = "Godly",
  ["Polar Bear"] = "Legendary",
  Pony = "Epic",
  ["Prehistoric Dragonfly"] = "Godly",
  ["Prehistoric Moth"] = "Godly",
  Pteranodon = "Godly",
  Pterodactyl = "Godly",
  Pufferfish = "Uncommon",
  Qilin = "Celestial",
  Quetzalcoatlus = "Godly",
  ["Rainbow Dumpling"] = "Celestial",
  Regal = "Legendary",
  Roc = "Divine",
  ["Saber Toothed Tiger"] = "Mythical",
  Sailfish = "Legendary",
  Seahorse = "Uncommon",
  Seal = "Common",
  Shark = "Mythical",
  Shenlong = "OG",
  Simurgh = "Celestial",
  Snail = "Uncommon",
  Snake = "Rare",
  Sphinx = "Secret",
  Spinosaurus = "Godly",
  Stegosaurus = "Mythical",
  Stingray = "Epic",
  Stymphalianbird = "Divine",
  Surgeonfish = "Uncommon",
  Swordfish = "Legendary",
  ["T Rex"] = "Godly",
  Thunderbird = "Divine",
  Tiger = "Legendary",
  Triceratops = "Mythical",
  ["Triple Cobra"] = "Celestial",
  Trumpet = "Rare",
  Tuna = "Common",
  Turtle = "Rare",
  ["UFO Alien"] = "Celestial",
  Unicorn = "Celestial",
  Velociraptor = "Godly",
  Werewolf = "OG",
  Whale = "Mythical",
  ["Winged Imp"] = "Secret",
  Wizard = "Secret",
  Wobbegong = "Mythical",
  Wolf = "Epic",
  Wrasse = "Rare",
  Wyvern = "Divine",
  Yeti = "OG",
  ["Yi Qi"] = "Mythical",
  Zebra = "Epic",
}

local function f23(value16)
  return value16:FindFirstAncestorOfClass("Model") or value16.Parent
end

local f24

local function f25(p5)
  local v53 = 0

  if not p5 then
    return 0
  end

  for index10, value17 in ipairs(p5:GetDescendants()) do
    if value17:IsA("TextLabel") and value17.Text ~= "" and value17.Text:lower():find("/s") then
      local v54 = f24(value17.Text)

      if v54 > v53 then
        v53 = v54
      end
    end
  end

  return v53
end

local function f26(p6)
  if not p6 then
    return nil
  else
    local species = p6:GetAttribute("Species")

    if type(species) == "string" and v52[species] then
      return v52[species]
    end

    if v52[p6.Name] then
      return v52[p6.Name]
    end

    for index11, value18 in ipairs(p6:GetDescendants()) do
      if value18:IsA("ProximityPrompt") then
        local gsub = value18.Name:gsub(" Steal", ""):gsub("Steal", "")

        if v52[gsub] then
          return v52[gsub]
        end
      end

      if value18:IsA("TextLabel") and v52[value18.Text] then
        return v52[value18.Text]
      end
    end

    return nil
  end
end

function f24(p7)
  if not p7 then
    return 0
  else
    local v55, v56 = tostring(p7):lower():gsub("[$%,]", ""):match("([%d%.]+)%s*([kmbtq]?)/s")

    if not v55 then
      return 0
    else
      local v57 = tonumber(v55) or 0

      local v58 = {
        k = 1000,
        m = 1000000,
        b = 1000000000,
        t = 1000000000000,
        q = 1000000000000000,
      }

      return v57 * (v58[v56 or ""] or 1)
    end
  end
end

local function f27(p8)
  if p8 >= 1000000000000000 then
    return string.format("$%.2fq/s", p8 / 1000000000000000)
  elseif p8 >= 1000000000000 then
    return string.format("$%.2ft/s", p8 / 1000000000000)
  elseif p8 >= 1000000000 then
    return string.format("$%.2fb/s", p8 / 1000000000)
  elseif p8 >= 1000000 then
    return string.format("$%.2fm/s", p8 / 1000000)
  else
    if p8 >= 1000 then
      return string.format("$%.2fk/s", p8 / 1000)
    end

    return string.format("$%d/s", p8)
  end
end

local function f28(p9)
  if not p9 then
    return nil
  else
    local mutation = p9:GetAttribute("Mutation")

    if type(mutation) == "string" then
      local v59 = string.lower(mutation)

      if v50[v59] then
        return v50[v59]
      elseif v47[v59] then
        return mutation
      end
    end

    for index12, value19 in ipairs(p9:GetDescendants()) do
      if value19:IsA("TextLabel") or value19:IsA("StringValue") or value19:IsA("ObjectValue") then
        local v60 = string.lower(tostring(value19.Name))

        if v50[v60] then
          return v50[v60]
        else
          local v61 = string.lower(tostring(value19.Text or ""))

          if v50[v61] then
            return v50[v61]
          end
        end
      end
    end

    return nil
  end
end

local function f29(p10)
  if not p10 then
    return 0, 0, nil
  else
    local v62 = f26(p10)
    local v63 = v62 and (v45[string.lower(v62)] or 0) or 0
    local v64 = f25(p10)
    return v63 * 1000000000000 + v64, v64, v62
  end
end

task.spawn(function()
  while true do
    task.wait(1.5)

    pcall(function()
      if not v3["ESP Pets Max"] then
        f22()
        return
      else
        local runtimePets2 = workspaceService:FindFirstChild("RuntimePets")

        if not runtimePets2 then
          f22()
          return
        else
          local v65 = nil
          local v66 = -1
          local v67 = -1
          local species2 = nil
          local v68 = nil

          for index13, value20 in ipairs(runtimePets2:GetDescendants()) do
            if value20:IsA("ProximityPrompt") then
              if (value20.Name .. " " .. tostring(value20.ActionText) .. " "
                .. tostring(value20.ObjectText)):lower():find("steal") then
                local v69 = f23(value20)
                local v70, v71, v72 = f29(v69)

                if v70 > v67 or v70 == v67 and v71 > v66 then
                  v66 = v71
                  v67 = v70
                  v68 = v69
                  species2 = v69 and (v69:GetAttribute("Species") or v69.Name)
                  v65 = v72
                end
              end
            end
          end

          if v68 and v67 > 0 then
            if not v51 or v51.Adornee ~= v68 then
              f22()

              local ssjBestPetESP = Instance.new("Highlight")
              ssjBestPetESP.Name = "SSJ_BestPetESP"
              ssjBestPetESP.Adornee = v68
              ssjBestPetESP.FillColor = Color3.fromRGB(160, 0, 255)
              ssjBestPetESP.OutlineColor = Color3.fromRGB(230, 120, 255)
              ssjBestPetESP.FillTransparency = 0.25
              ssjBestPetESP.OutlineTransparency = 0
              ssjBestPetESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
              ssjBestPetESP.Parent = v68

              v51 = ssjBestPetESP
              local head = v68:FindFirstChild("Head")

              local basePart = head
              basePart = head or v68:FindFirstChildWhichIsA("BasePart")

              if basePart then
                local v73 = f28(v68)

                local ssjBestPetName2 = Instance.new("BillboardGui")
                ssjBestPetName2.Name = "SSJ_BestPetName"
                ssjBestPetName2.Adornee = basePart
                ssjBestPetName2.Size = UDim2.new(0, 240, 0, 78)
                ssjBestPetName2.StudsOffset = Vector3.new(0, 3.2, 0)
                ssjBestPetName2.AlwaysOnTop = true
                ssjBestPetName2.MaxDistance = 1200
                ssjBestPetName2.Parent = v68

                local frame7 = Instance.new("Frame")
                frame7.Size = UDim2.new(1, 0, 1, 0)
                frame7.BackgroundColor3 = Color3.fromRGB(8, 4, 18)
                frame7.BackgroundTransparency = 0.08
                frame7.BorderSizePixel = 0
                frame7.Parent = ssjBestPetName2

                local uiCorner = Instance.new("UICorner")
                uiCorner.CornerRadius = UDim.new(0, 14)
                uiCorner.Parent = frame7

                local uiStroke2 = Instance.new("UIStroke")
                uiStroke2.Color = Color3.fromRGB(180, 40, 255)
                uiStroke2.Thickness = 2.2
                uiStroke2.Transparency = 0.15
                uiStroke2.Parent = frame7

                local uiGradient = Instance.new("UIGradient")

                uiGradient.Color = ColorSequence.new({
                  ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 10, 70)),
                  ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 5, 30)),
                  ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 10, 70)),
                })

                uiGradient.Rotation = 90
                uiGradient.Parent = frame7

                local frame8 = Instance.new("Frame")
                frame8.Size = UDim2.new(0.7, 0, 0, 2)
                frame8.Position = UDim2.new(0.15, 0, 0, 0)
                frame8.BackgroundColor3 = Color3.fromRGB(255, 80, 255)
                frame8.BorderSizePixel = 0
                frame8.Parent = frame7

                local uiCorner2 = Instance.new("UICorner")
                uiCorner2.CornerRadius = UDim.new(1, 0)
                uiCorner2.Parent = frame8

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Name = "NameLabel"
                nameLabel.BackgroundTransparency = 1
                nameLabel.Position = UDim2.new(0, 0, 0, 4)
                nameLabel.Size = UDim2.new(1, 0, 0, 22)
                nameLabel.Font = Enum.Font.GothamBlack
                nameLabel.TextSize = 17
                nameLabel.TextStrokeTransparency = 0
                nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                nameLabel.Text = tostring(species2 or "?")
                nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                nameLabel.Parent = ssjBestPetName2

                local v74 = v65 or "Unknown"

                local rarityLabel = Instance.new("TextLabel")
                rarityLabel.Name = "RarityLabel"
                rarityLabel.BackgroundTransparency = 1
                rarityLabel.Position = UDim2.new(0, 0, 0, 24)
                rarityLabel.Size = UDim2.new(1, 0, 0, 16)
                rarityLabel.Font = Enum.Font.GothamBold
                rarityLabel.TextSize = 12
                rarityLabel.TextStrokeTransparency = 0.1
                rarityLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                rarityLabel.Text = "◆ " .. string.upper(v74) .. " ◆"
                rarityLabel.TextColor3 = v46[string.lower(v74)] or Color3.fromRGB(200, 200, 200)
                rarityLabel.Parent = ssjBestPetName2

                local mutationLabel = Instance.new("TextLabel")
                mutationLabel.Name = "MutationLabel"
                mutationLabel.BackgroundTransparency = 1
                mutationLabel.Position = UDim2.new(0, 0, 0, 40)
                mutationLabel.Size = UDim2.new(1, 0, 0, 14)
                mutationLabel.Font = Enum.Font.GothamMedium
                mutationLabel.TextSize = 11
                mutationLabel.TextStrokeTransparency = 0.2
                mutationLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

                if v73 then
                  mutationLabel.Text = "✦ " .. string.upper(v73) .. " ✦"

                  mutationLabel.TextColor3 = v47[string.lower(v73)]
                    or Color3.fromRGB(255, 255, 255)
                else
                  mutationLabel.Text = ""
                end

                mutationLabel.Parent = ssjBestPetName2

                local incomeLabel = Instance.new("TextLabel")
                incomeLabel.Name = "IncomeLabel"
                incomeLabel.BackgroundTransparency = 1
                incomeLabel.Position = UDim2.new(0, 0, 0, 54)
                incomeLabel.Size = UDim2.new(1, 0, 0, 20)
                incomeLabel.Font = Enum.Font.GothamBlack
                incomeLabel.TextSize = 15
                incomeLabel.TextColor3 = Color3.fromRGB(80, 255, 150)
                incomeLabel.TextStrokeTransparency = 0
                incomeLabel.TextStrokeColor3 = Color3.fromRGB(0, 30, 15)
                incomeLabel.Text = f27(v66)
                incomeLabel.Parent = ssjBestPetName2
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

local function f30()
  return userInputService.TouchEnabled and not userInputService.KeyboardEnabled
end

local function f31()
  local character9 = localPlayer.Character
  local humanoidRootPart2 = character9 and character9:FindFirstChild("HumanoidRootPart")

  if not humanoidRootPart2 then
    return
  else
    local runtimePets3 = workspaceService:FindFirstChild("RuntimePets")

    if not runtimePets3 then
      return
    else
      local adornee = v3["ESP Pets Max"] and v51 and v51.Adornee or nil
      local v75 = f30()

      for index14, value21 in ipairs(runtimePets3:GetDescendants()) do
        local v76 = value21

        repeat
          if not v76:IsA("ProximityPrompt") then
            break
          else
            local parent2 = v76.Parent:IsA("BasePart") and v76.Parent
              or v76.Parent:FindFirstChildWhichIsA("BasePart")

            if not parent2 then
              break
            else
              local parent3 = parent2

              if parent2.Parent
                and (parent2.Parent:IsA("Model") or parent2.Parent:IsA("BasePart")) then
                parent3 = parent2.Parent
              end

              local v77 = true

              if adornee then
                v77 = parent3 == adornee or parent2 == adornee
              end

              if not v77 then
                break
              else
                local lower2 = (tostring(v76.ObjectText) .. " "
                  .. tostring(v76.ActionText) .. " " .. v76.Name):lower()

                if not (lower2:find("steal") or lower2:find("pick") or lower2:find("grab")
                  or lower2:find("take") or adornee) then
                  break
                end

                if (humanoidRootPart2.Position - parent2.Position).Magnitude > 18 then
                  break
                end

                pcall(function()
                  v76.HoldDuration = 0



                  if fireproximityprompt then
                    fireproximityprompt(v76)
                  end
                end)

                if not v75 then
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

local v78 = {}
local v79 = {}
local v80 = {}
local color3 = Color3.fromRGB(180, 30, 255)
local color4 = Color3.fromRGB(255, 255, 255)

local v81 = {
  Color3.fromRGB(255, 60, 60), Color3.fromRGB(255, 160, 40), Color3.fromRGB(255, 255, 60),
  Color3.fromRGB(60, 255, 100), Color3.fromRGB(60, 180, 255), Color3.fromRGB(160, 80, 255),
  Color3.fromRGB(255, 80, 200),
}

local function f32(player)
  if v80[player] then
    for index15, value22 in ipairs(v80[player]) do
      local v82 = value22
      pcall(function() v82:Disconnect() end)
    end

    v80[player] = nil
  end
end

local function f33(key12)
  if v78[key12] then
    pcall(function()
      if v78[key12].Parent then
        v78[key12]:Destroy()
      end
    end)

    v78[key12] = nil
  end

  if v79[key12] then
    pcall(function()
      if v79[key12].Parent then
        v79[key12]:Destroy()
      end
    end)

    v79[key12] = nil
  end
end

local function f34(p11)
  if p11 <= 30 then
    return Color3.fromRGB(255, 70, 80)
  end

  if p11 <= 100 then
    return Color3.fromRGB(255, 175, 50)
  end

  return Color3.fromRGB(100, 230, 140)
end

local function f35(name)
  task.spawn(function()
    local v83 = 1

    while name and name.Parent do
      local v84 = v83 % #v81 + 1

      local create = tweenService:Create(name, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
        TextColor3 = v81[v84],
      })

      create:Play()
      create.Completed:Wait()

      v83 = v84
    end
  end)
end

local function makeTextLabel(value23, character10)
  f33(value23)

  if not v3["ESP Players"] or value23 == localPlayer or not character10 then
    return
  else
    local ssjESPPlayer = Instance.new("Highlight")
    ssjESPPlayer.Name = "SSJ_ESP_Player"
    ssjESPPlayer.Adornee = character10
    ssjESPPlayer.FillColor = color3
    ssjESPPlayer.OutlineColor = color4
    ssjESPPlayer.FillTransparency = 0.6
    ssjESPPlayer.OutlineTransparency = 0
    ssjESPPlayer.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ssjESPPlayer.Parent = character10

    v78[value23] = ssjESPPlayer
    local head2 = character10:FindFirstChild("Head")

    if not head2 then
      return
    else
      local ssjESPName = Instance.new("BillboardGui")
      ssjESPName.Name = "SSJ_ESP_Name"
      ssjESPName.Adornee = head2
      ssjESPName.Size = UDim2.new(0, 200, 0, 34)
      ssjESPName.StudsOffset = Vector3.new(0, 2.6, 0)
      ssjESPName.AlwaysOnTop = true
      ssjESPName.MaxDistance = 2000
      ssjESPName.LightInfluence = 0
      ssjESPName.Parent = character10

      local name2 = value23.Name

      if value23.DisplayName ~= value23.Name then
        name2 = value23.DisplayName
      end

      local name3 = Instance.new("TextLabel")
      name3.Name = "Name"
      name3.BackgroundTransparency = 1
      name3.Size = UDim2.new(1, 0, 0, 17)
      name3.Position = UDim2.new(0, 0, 0, 0)
      name3.Font = Enum.Font.GothamBold
      name3.TextSize = 13
      name3.TextColor3 = v81[1]
      name3.TextStrokeTransparency = 0
      name3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      name3.TextXAlignment = Enum.TextXAlignment.Center
      name3.TextYAlignment = Enum.TextYAlignment.Center
      name3.Text = string.upper(name2)
      name3.Parent = ssjESPName

      f35(name3)

      local dist = Instance.new("TextLabel")
      dist.Name = "Dist"
      dist.BackgroundTransparency = 1
      dist.Size = UDim2.new(1, 0, 0, 15)
      dist.Position = UDim2.new(0, 0, 0, 16)
      dist.Font = Enum.Font.GothamMedium
      dist.TextSize = 11
      dist.TextColor3 = Color3.fromRGB(200, 190, 230)
      dist.TextStrokeTransparency = 0
      dist.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      dist.TextXAlignment = Enum.TextXAlignment.Center
      dist.TextYAlignment = Enum.TextYAlignment.Center
      dist.Text = "-- m"
      dist.Parent = ssjESPName

      v79[value23] = ssjESPName
      return
    end
  end
end

local function f36(value24)
  if value24 == localPlayer then
    return
  else
    f32(value24)
    v80[value24] = {}
    local characterAdded = value24.CharacterAdded

    table.insert(v80[value24], characterAdded:Connect(function(p12)
      task.wait(0.3)

      if v3["ESP Players"] then
        makeTextLabel(value24, p12)
      end
    end))

    if value24.Character and v3["ESP Players"] then
      makeTextLabel(value24, value24.Character)
    end

    return
  end
end

for index16, value25 in ipairs(players:GetPlayers()) do
  f36(value25)
end

players.PlayerAdded:Connect(f36)

players.PlayerRemoving:Connect(function(player2)
  f33(player2)
  f32(player2)
end)

task.spawn(function()
  while true do
    task.wait(0.45)

    pcall(function()
      if not v3["ESP Players"] then
        for index17, value26 in ipairs(players:GetPlayers()) do
          f33(value26)
        end
      else
        local character11 = localPlayer.Character

        local humanoidRootPart3 = character11
        humanoidRootPart3 = character11 and character11:FindFirstChild("HumanoidRootPart")

        for index18, value27 in ipairs(players:GetPlayers()) do
          if value27 ~= localPlayer then
            local character12 = value27.Character

            if not character12 then
              f33(value27)
            else
              local v85 = false

              if not v78[value27] then
                v85 = true
              elseif v78[value27].Adornee ~= character12 then
                v85 = true
              end

              if v85 then
                makeTextLabel(value27, character12)
              elseif humanoidRootPart3 and v79[value27] then
                local humanoidRootPart4 = character12:FindFirstChild("HumanoidRootPart")
                local dist2 = v79[value27]:FindFirstChild("Dist")

                if humanoidRootPart4 and dist2 then
                  local v86 = math.floor((humanoidRootPart3.Position
                    - humanoidRootPart4.Position).Magnitude)

                  dist2.Text = v86 .. " m"
                  dist2.TextColor3 = f34(v86)
                end
              end
            end
          end
        end
      end
    end)
  end
end)

local v87 = 0

runService.Heartbeat:Connect(function()
  if not v3.WallClimb then
    return
  end

  pcall(function()
    local character13 = localPlayer.Character
    local humanoid4 = character13 and character13:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart5 = character13 and character13:FindFirstChild("HumanoidRootPart")

    if not humanoid4 or not humanoidRootPart5 or humanoid4.MoveDirection.Magnitude < 0.15 then
      return
    else
      local raycastParams = RaycastParams.new()
      raycastParams.FilterType = Enum.RaycastFilterType.Exclude
      raycastParams.FilterDescendantsInstances = { character13 }

      local lookVector = humanoidRootPart5.CFrame.LookVector

      local raycast = workspaceService:Raycast(
        humanoidRootPart5.Position, lookVector * 2, raycastParams
      )

      if not raycast then
        return
      else
        local normal = raycast.Normal

        if normal.Y > 0.25 or math.abs(normal.Y) > 0.35 then
          return
        elseif -lookVector:Dot(normal) < 0.45 then
          return
        else
          local assemblyLinearVelocity = humanoidRootPart5.AssemblyLinearVelocity
          local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
          local v88 = (vector - normal * vector:Dot(normal)) * 0.55 - normal * 2
          humanoidRootPart5.AssemblyLinearVelocity = Vector3.new(v88.X, 22, v88.Z)

          if tick() - v87 > 0.4 then
            if humanoid4:GetState() ~= Enum.HumanoidStateType.Jumping then
              humanoid4:ChangeState(Enum.HumanoidStateType.Jumping)
            end

            v87 = tick()
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
      if v3["Insta Grab"] then
        f31()
      end

      if v3.Speed then
        local character14 = localPlayer.Character
        local humanoid5 = character14 and character14:FindFirstChildOfClass("Humanoid")

        if humanoid5 then
          local v89 = f5(character14) and 37 or 40

          if humanoid5.WalkSpeed ~= v89 then
            humanoid5.WalkSpeed = v89
          end
        end
      end
    end)

    task.wait(v3["Insta Grab"] and 0.2 or 0.35)
  end
end)

localPlayer.CharacterAdded:Connect(function(character15)
  task.wait(0.5)

  if v3.Speed then
    local humanoid6 = character15:FindFirstChildOfClass("Humanoid")

    if humanoid6 then
      walkSpeed = humanoid6.WalkSpeed

      if not walkSpeed or walkSpeed < 1 then
        walkSpeed = 16
      end

      humanoid6.WalkSpeed = f5(character15) and 37 or 40
    end
  end

  if v3["One Block"] then
    f10(character15, true)
  end
end)

task.defer(function()
  local v90

  if not v90 then
    print("[Save Config] Sin config previa")
    return
  end

  for key13, value28 in pairs((f2(v90))) do
    if v3[key13] ~= nil then
      v3[key13] = value28
      f1(key13, value28)

      if key13 == "Speed" and value28 then
        local character16 = localPlayer.Character

        local humanoid7 = character16
        humanoid7 = character16 and character16:FindFirstChildOfClass("Humanoid")

        if humanoid7 then
          if not walkSpeed then
            walkSpeed = humanoid7.WalkSpeed

            if not walkSpeed or walkSpeed < 1 then
              walkSpeed = 16
            end
          end

          humanoid7.WalkSpeed = 40
        end
      end
    end
  end

  print("[Save Config] Config cargada")
end)

local function f37(input)
  return input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch
end

local v91, position, position2

textLabel.InputBegan:Connect(function(input2)
  if not f37(input2) then
    return
  end

  v91 = true
  position = input2.Position
  position2 = frame.Position
end)

local function f38()
  local character17 = localPlayer.Character
  return character17 and character17:FindFirstChild("HumanoidRootPart")
end

userInputService.InputEnded:Connect(function(input3)
  if f37(input3) then
    v91 = false
  end
end)

userInputService.InputChanged:Connect(function(input4)
  if not v91 or not position or not position2 then
    return
  end

  if input4.UserInputType ~= Enum.UserInputType.MouseMovement
    and input4.UserInputType ~= Enum.UserInputType.Touch then
    return
  else
    local v92 = input4.Position - position

    frame.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v92.X, position2.Y.Scale,
      position2.Y.Offset + v92.Y
    )

    return
  end
end)

local connect

local function f39(p13)
  if p13 then
    if not connect then
      connect = runService.Stepped:Connect(function()
        local character18 = localPlayer.Character

        if not character18 then
          return
        end

        for index19, value29 in ipairs(character18:GetDescendants()) do
          if value29:IsA("BasePart") and value29.Name ~= "HumanoidRootPart" then
            value29.CanCollide = false
          end
        end
      end)
    end
  else
    if connect then
      connect:Disconnect()
      connect = nil
    end

    local character19 = localPlayer.Character

    if character19 then
      for index20, value30 in ipairs(character19:GetDescendants()) do
        if value30:IsA("BasePart") then
          if value30.Name == "HumanoidRootPart" then
            value30.CanCollide = false
          else
            value30.CanCollide = true
          end
        end
      end
    end
  end
end

local v93

local function f40()
  if v93 then
    pcall(function() v93:Destroy() end)
    v93 = nil
  end

  local baseSubterranea = workspaceService:FindFirstChild("BaseSubterranea")

  if baseSubterranea then
    pcall(function() baseSubterranea:Destroy() end)
  end
end

local v94 = false

local function f41(p14, p15)
  local v95 = f38()

  if v94 or not v95 then
    return
  else
    v94 = true
    local cframe = CFrame.new(0, p14, 0)

    local create2 = tweenService:Create(v95, TweenInfo.new(
      p15 or 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
    ), { CFrame = v95.CFrame * cframe })

    create2:Play()
    create2.Completed:Wait()

    v94 = false
    return
  end
end

local function f42()
  local v96 = f38()

  if v96 then
    v96.CFrame = v96.CFrame + Vector3.new(0, 22, 0)
    v96.AssemblyLinearVelocity = Vector3.zero
  end

  f39(false)
  f40()
end

local function makePart()
  local v97 = f38()

  if not v97 then
    return
  else
    f40()
    local position3 = v97.Position
    local vector2 = Vector3.new(position3.X, position3.Y - 18, position3.Z)

    local baseSubterranea2 = Instance.new("Part")
    baseSubterranea2.Name = "BaseSubterranea"
    baseSubterranea2.Size = Vector3.new(20000, 5, 20000)
    baseSubterranea2.Position = Vector3.new(vector2.X, vector2.Y - 4, vector2.Z)
    baseSubterranea2.Anchored = true
    baseSubterranea2.CanCollide = true
    baseSubterranea2.Material = Enum.Material.SmoothPlastic
    baseSubterranea2.Color = Color3.fromRGB(140, 70, 255)
    baseSubterranea2.Transparency = 0.35
    baseSubterranea2.Parent = workspaceService

    v93 = baseSubterranea2

    v97.CFrame = CFrame.new(vector2)
    v97.AssemblyLinearVelocity = Vector3.zero

    f39(true)
    return
  end
end

local f43

local function f44()
  local v98 = f43(30)

  if not v98 then
    print("[PANEL Z] Auto Grab: sin prompt cerca")
    return
  end

  print("[PANEL Z] Auto Grab:", v98:GetFullName())

  pcall(function() remoteEvent:FireServer("steal_cancel", 83618240) end)
  pcall(function() remoteEvent:FireServer("steal_cancel") end)

  pcall(function()
    v98.Enabled = true
    v98.HoldDuration = 0
    v98.RequiresLineOfSight = false
    v98.MaxActivationDistance = 50
  end)

  task.spawn(function()
    for i = 1, 4 do
      if v98 and v98.Parent then
        pcall(function()
          if fireproximityprompt then
            fireproximityprompt(v98)
          end
        end)
      end

      task.wait(0.02)
    end
  end)
end

function f43(p16)
  local v99 = f38()

  if not v99 then
    return nil
  else
    local position4 = v99.Position
    local v100 = nil
    local v101 = p16 or 30
    local v102 = {}
    local runtimePets4 = workspaceService:FindFirstChild("RuntimePets")

    if runtimePets4 then
      table.insert(v102, runtimePets4)
    end

    table.insert(v102, workspaceService)
    local v103 = {}

    for index21, value31 in ipairs(v102) do
      for index22, value32 in ipairs(value31:GetDescendants()) do
        if value32:IsA("ProximityPrompt") and not v103[value32] then
          v103[value32] = true
          local parent4 = value32.Parent
          local position5 = nil

          if parent4 and parent4:IsA("BasePart") then
            position5 = parent4.Position
          elseif parent4 and parent4:IsA("Model") then
            local primaryPart = parent4.PrimaryPart

            local findFirstChildWhichIsA = primaryPart

            findFirstChildWhichIsA = primaryPart
              or parent4:FindFirstChildWhichIsA("BasePart", true)

            position5 = findFirstChildWhichIsA and findFirstChildWhichIsA.Position
          end

          if position5 then
            local magnitude2 = (position4 - position5).Magnitude

            if magnitude2 < v101 then
              local lower3 = (value32.Name .. " " .. tostring(value32.ActionText) .. " "
                .. tostring(value32.ObjectText)):lower()

              if lower3:find("steal") or lower3:find("grab") or lower3:find("pick")
                or lower3:find("take") or not v100 then
                v101 = magnitude2
                v100 = value32
              end
            end
          end
        end
      end

      if v100 and value31 == runtimePets4 then
        break
      end
    end

    return v100
  end
end

localPlayer.CharacterAdded:Connect(function()
  f39(false)
  f40()
end)

local ssjPanelZ = Instance.new("Frame")
ssjPanelZ.Name = "SSJ_PanelZ"
ssjPanelZ.Parent = scriptSSJMultiHub4
ssjPanelZ.Size = UDim2.new(0, 220, 0, 210)
ssjPanelZ.Position = UDim2.new(0.02, 230, 0.12, 0)
ssjPanelZ.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ssjPanelZ.BorderSizePixel = 0
ssjPanelZ.Active = true

Instance.new("UICorner", ssjPanelZ).CornerRadius = UDim.new(0, 8)

local uiStroke3 = Instance.new("UIStroke")
uiStroke3.Parent = ssjPanelZ
uiStroke3.Color = Color3.fromRGB(140, 70, 255)
uiStroke3.Thickness = 1.5

local textLabel3 = Instance.new("TextLabel")
textLabel3.Parent = ssjPanelZ
textLabel3.BackgroundTransparency = 1
textLabel3.Size = UDim2.new(1, -12, 0, 26)
textLabel3.Position = UDim2.new(0, 8, 0, 2)
textLabel3.Font = Enum.Font.GothamBold
textLabel3.Text = "PANEL Z"
textLabel3.TextSize = 12
textLabel3.TextColor3 = Color3.new(1, 1, 1)
textLabel3.TextXAlignment = Enum.TextXAlignment.Left
textLabel3.Active = true

local frame9 = Instance.new("Frame")
frame9.Parent = ssjPanelZ
frame9.Position = UDim2.new(0, 8, 0, 28)
frame9.Size = UDim2.new(1, -16, 0, 1)
frame9.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
frame9.BorderSizePixel = 0

local function makeTextButton2(text, p17, fn)
  local textButton4 = Instance.new("TextButton")
  textButton4.Parent = ssjPanelZ
  textButton4.Size = UDim2.new(1, -16, 0, 28)
  textButton4.Position = UDim2.new(0, 8, 0, p17)
  textButton4.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  textButton4.Font = Enum.Font.GothamBold
  textButton4.Text = text
  textButton4.TextColor3 = Color3.fromRGB(220, 220, 220)
  textButton4.TextSize = 11
  textButton4.AutoButtonColor = true

  Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 6)
  local v104 = 0

  textButton4.Activated:Connect(function()
    if tick() - v104 < 0.2 then
      return
    end

    v104 = tick()
    fn(textButton4)
  end)

  return textButton4
end

makeTextButton2("Go down", 36, function() f41(-20, 0.4) end)
makeTextButton2("Go up", 68, function() f41(20, 0.4) end)

makeTextButton2("TP Floor", 100, function(p18)
  makePart()

  p18.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
  p18.TextColor3 = Color3.new(1, 1, 1)

  task.delay(0.5, function()
    if p18 and p18.Parent then
      p18.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
      p18.TextColor3 = Color3.fromRGB(220, 220, 220)
    end
  end)
end)

makeTextButton2("Auto Grab", 132, function(text2)
  text2.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
  text2.TextColor3 = Color3.new(1, 1, 1)
  text2.Text = "..."

  f44()

  task.delay(0.45, function()
    if text2 and text2.Parent then
      text2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
      text2.TextColor3 = Color3.fromRGB(220, 220, 220)
      text2.Text = "Auto Grab"
    end
  end)
end)

makeTextButton2("Go back", 164, function() f42() end)

local v105, position6, position7

textLabel3.InputBegan:Connect(function(input5)
  if input5.UserInputType == Enum.UserInputType.MouseButton1
    or input5.UserInputType == Enum.UserInputType.Touch then
    v105 = true
    position6 = input5.Position
    position7 = ssjPanelZ.Position
  end
end)

userInputService.InputEnded:Connect(function(input6)
  if input6.UserInputType == Enum.UserInputType.MouseButton1
    or input6.UserInputType == Enum.UserInputType.Touch then
    v105 = false
  end
end)

userInputService.InputChanged:Connect(function(input7)
  if not v105 or not position6 or not position7 then
    return
  end

  if input7.UserInputType ~= Enum.UserInputType.MouseMovement
    and input7.UserInputType ~= Enum.UserInputType.Touch then
    return
  else
    local v106 = input7.Position - position6

    ssjPanelZ.Position = UDim2.new(
      position7.X.Scale, position7.X.Offset + v106.X, position7.Y.Scale,
      position7.Y.Offset + v106.Y
    )

    return
  end
end)

print("[SCRIPTSSJ] Panel Z ready (Bajar/Subir/TP Suelo/Auto Grab/Regresar)")

local v107 = {
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

local v108 = {
  normal = 0,
  golden = 1,
  cosmic = 2,
  inferno = 3,
  admin = 5,
}

Color3.fromRGB(255, 255, 255)
Color3.fromRGB(255, 215, 60)
Color3.fromRGB(180, 120, 255)
Color3.fromRGB(255, 90, 40)
Color3.fromRGB(90, 255, 120)

local v109 = {
  common = Color3.fromRGB(180, 180, 180),
  uncommon = Color3.fromRGB(90, 220, 120),
  rare = Color3.fromRGB(90, 160, 255),
  epic = Color3.fromRGB(180, 90, 255),
  legendary = Color3.fromRGB(255, 200, 60),
  mythical = Color3.fromRGB(255, 120, 60),
  mythic = Color3.fromRGB(255, 120, 60),
  godly = Color3.fromRGB(255, 80, 80),
  secret = Color3.fromRGB(255, 60, 180),
  divine = Color3.fromRGB(120, 255, 255),
  celestial = Color3.fromRGB(180, 255, 255),
  og = Color3.fromRGB(255, 240, 120),
  ultra = Color3.fromRGB(255, 50, 255),
}

local v110 = {
  ["ARM 1"] = "ULTRA",
  ["Alien Dumpling"] = "Legendary",
  Ankylosaurus = "Mythical",
  Archaeopteryx = "Mythical",
  Archerfish = "Rare",
  Argentavis = "Godly",
  Azhdarchid = "Godly",
  Barracuda = "Legendary",
  Bat = "Rare",
  Bear = "Epic",
  ["Big Foot"] = "OG",
  Boxfish = "Uncommon",
  Brachiosaurus = "Mythical",
  Bull = "Rare",
  Bunny = "Uncommon",
  Butterflyfish = "Rare",
  Caladrius = "Divine",
  Capybara = "Rare",
  Cat = "Common",
  Cerberus = "Secret",
  Chicken = "Common",
  Chirema = "Divine",
  Cobra = "Celestial",
  Cockatrice = "Secret",
  ["Cookie Dough Dumpling"] = "Rare",
  ["Coral Goby"] = "Rare",
  Cow = "Common",
  Cowfish = "Uncommon",
  Crab = "Common",
  Crocodile = "Legendary",
  ["Cybernetic Dog"] = "Celestial",
  Destroyer = "ULTRA",
  Dimetrodon = "Mythical",
  Dog = "Common",
  Dragon = "Celestial",
  Elephant = "Legendary",
  Fairy = "OG",
  Firephoenix = "Celestial",
  Frog = "Uncommon",
  Gallimimus = "Mythical",
  ["Gargoyle Bat"] = "Secret",
  Garuda = "Divine",
  Ghost = "Secret",
  Giraffe = "Legendary",
  Gnome = "OG",
  Goat = "Common",
  Goldfish = "Common",
  Gorilla = "Legendary",
  Griffin = "Divine",
  ["Guinea Pig"] = "Uncommon",
  Hamster = "Uncommon",
  Harpy = "Secret",
  Hawkfish = "Rare",
  Horse = "Epic",
  Hydra = "Celestial",
  HydraTitan = "ULTRA",
  Jellyfish = "Epic",
  ["Jersey Devil"] = "OG",
  Kangaroo = "Epic",
  Kitsune = "Celestial",
  Koala = "Epic",
  Kraken = "Divine",
  ["Lava Dumpling"] = "Godly",
  Leprechaun = "OG",
  Leviathan = "Celestial",
  Lion = "Legendary",
  Lionfish = "Epic",
  Lizard = "Rare",
  Llama = "Epic",
  Mammoth = "Mythical",
  Mandarinfish = "Epic",
  Manticore = "Secret",
  Mapinguari = "OG",
  Mech = "ULTRA",
  Megalodon = "Secret",
  Mermaid = "OG",
  Microraptor = "Mythical",
  Minotaur = "Secret",
  ["Moorish Idol"] = "Epic",
  Mosasaurus = "Godly",
  Mothman = "Secret",
  ["Mushroom Dumpling"] = "Epic",
  ["Neon Dumpling"] = "Divine",
  Ostrich = "Epic",
  Owl = "Rare",
  Parrot = "Rare",
  Pegasus = "Divine",
  Pigeon = "Uncommon",
  Plesiosaur = "Godly",
  ["Polar Bear"] = "Legendary",
  Pony = "Epic",
  ["Prehistoric Dragonfly"] = "Godly",
  ["Prehistoric Moth"] = "Godly",
  Pteranodon = "Godly",
  Pterodactyl = "Godly",
  Pufferfish = "Uncommon",
  Qilin = "Celestial",
  Quetzalcoatlus = "Godly",
  ["Rainbow Dumpling"] = "Celestial",
  Regal = "Legendary",
  Roc = "Divine",
  ["Saber Toothed Tiger"] = "Mythical",
  Sailfish = "Legendary",
  Seahorse = "Uncommon",
  Seal = "Common",
  Shark = "Mythical",
  Shenlong = "OG",
  Simurgh = "Celestial",
  Snail = "Uncommon",
  Snake = "Rare",
  Sphinx = "Secret",
  Spinosaurus = "Godly",
  Stegosaurus = "Mythical",
  Stingray = "Epic",
  Stymphalianbird = "Divine",
  Surgeonfish = "Uncommon",
  Swordfish = "Legendary",
  ["T Rex"] = "Godly",
  Thunderbird = "Divine",
  Tiger = "Legendary",
  Triceratops = "Mythical",
  ["Triple Cobra"] = "Celestial",
  Trumpet = "Rare",
  Tuna = "Common",
  Turtle = "Rare",
  ["UFO Alien"] = "Celestial",
  Unicorn = "Celestial",
  Velociraptor = "Godly",
  Werewolf = "OG",
  Whale = "Mythical",
  ["Winged Imp"] = "Secret",
  Wizard = "Secret",
  Wobbegong = "Mythical",
  Wolf = "Epic",
  Wrasse = "Rare",
  Wyvern = "Divine",
  Yeti = "OG",
  ["Yi Qi"] = "Mythical",
  Zebra = "Epic",
}

local v111 = {}
local v112 = {}

local function f45()
  local rarities2 = replicatedStorage:FindFirstChild("Rarities")

  if rarities2 then
    for index23, value33 in ipairs(rarities2:GetChildren()) do
      v107[string.lower(value33.Name)] = v107[string.lower(value33.Name)] or 1
    end
  end

  local mutations2 = replicatedStorage:FindFirstChild("Mutations")

  if mutations2 then
    for index24, value34 in ipairs(mutations2:GetChildren()) do
      v112[string.lower(value34.Name)] = value34.Name
    end
  end

  local pets = replicatedStorage:FindFirstChild("Pets")

  if pets then
    for index25, value35 in ipairs(pets:GetChildren()) do
      local rarity = value35:GetAttribute("Rarity")

      local rarity2 = rarity
      rarity2 = rarity or value35:GetAttribute("rarity")

      if type(rarity2) == "string" then
        v111[value35.Name] = rarity2
      end
    end
  end

  for key14, value36 in pairs(v110) do
    if not v111[key14] then
      v111[key14] = value36
    end
  end
end

f45()

local function f46(character20, canCollide)
  if not character20 then
    return
  end

  for index26, value37 in ipairs(character20:GetDescendants()) do
    local v113 = value37

    if v113:IsA("BasePart") then
      pcall(function() v113.CanCollide = canCollide end)
    end
  end
end

task.delay(3, f45)
task.delay(6, f45)

local v114 = false
local v115 = false

local function f47(character21)
  local character22 = character21 or localPlayer.Character

  local humanoid8 = character22
  humanoid8 = character22 and character22:FindFirstChildOfClass("Humanoid")

  return humanoid8 and humanoid8.RootPart, humanoid8, character22
end

local v116 = false
local cframe2, connect2

local function f48()
  if connect2 then
    connect2:Disconnect()
  end

  connect2 = runService.Heartbeat:Connect(function()
    if v115 or v114 then
      return
    else
      local v117 = f47()

      if v117 then
        cframe2 = v117.CFrame
      end

      return
    end
  end)

  task.spawn(function()
    local v118 = f47(localPlayer.Character or localPlayer.CharacterAdded:Wait())

    if not v118 then
      return
    end

    v118:GetPropertyChangedSignal("CFrame"):Connect(function()
      if v114 or v115 then
        return
      end

      v115 = true

      if cframe2 and v118 and v118.Parent then
        v118.CFrame = cframe2
      end

      runService.Heartbeat:Wait()
      v115 = false
    end)
  end)
end

localPlayer.CharacterAdded:Connect(function(character23)
  while true do
    runService.Heartbeat:Wait()

    if f47(character23) then
      break
    end
  end

  f48()
end)

task.spawn(f48)

local function f49(value38)
  return value38:FindFirstAncestorOfClass("Model") or value38.Parent
end

local function f50(p19)
  if not p19 then
    return nil
  end

  for index27, value39 in ipairs({ "Mutation", "Mutations", "mutations", "mutation" }) do
    local getAttribute = p19:GetAttribute(value39)

    if type(getAttribute) == "string" then
      local v119 = string.lower(getAttribute)

      if v112[v119] then
        return v112[v119]
      elseif v108[v119] ~= nil then
        return getAttribute
      end
    end
  end

  for index28, value40 in ipairs(p19:GetDescendants()) do
    local v120 = string.lower(tostring(value40.Name))

    if v112[v120] then
      return v112[v120]
    end

    if value40:IsA("TextLabel") or value40:IsA("StringValue") then
      local v121 = string.lower(tostring(value40.Text or value40.Value or ""))

      if v112[v121] then
        return v112[v121]
      end
    end
  end

  return nil
end

local function f51(p20)
  if not p20 then
    return nil
  else
    local species3 = p20:GetAttribute("Species")

    if type(species3) == "string" and v111[species3] then
      return v111[species3]
    end

    if v111[p20.Name] then
      return v111[p20.Name]
    end

    for index29, value41 in ipairs(p20:GetDescendants()) do
      if value41:IsA("ProximityPrompt") then
        local gsub2 = value41.Name:gsub(" Steal", ""):gsub("Steal", "")

        if v111[gsub2] then
          return v111[gsub2]
        end
      end

      if value41:IsA("TextLabel") and v111[value41.Text] then
        return v111[value41.Text]
      end
    end

    return nil
  end
end

local f52

local function f53(p21)
  local v122 = 0

  if not p21 then
    return 0
  end

  for index30, value42 in ipairs(p21:GetDescendants()) do
    if value42:IsA("TextLabel") and value42.Text ~= "" and value42.Text:lower():find("/s") then
      local v123 = f52(value42.Text)

      if v123 > v122 then
        v122 = v123
      end
    end
  end

  return v122
end

function f52(p22)
  if not p22 then
    return 0
  else
    local v124, v125 = tostring(p22):lower():gsub("[$%,]", ""):match("([%d%.]+)%s*([kmbtq]?)/s")

    if not v124 then
      return 0
    else
      local v126 = tonumber(v124) or 0

      local v127 = {
        k = 1000,
        m = 1000000,
        b = 1000000000,
        t = 1000000000000,
        q = 1000000000000000,
      }

      return v126 * (v127[v125 or ""] or 1)
    end
  end
end

local f54

local function f55()
  local runtimePets5 = workspaceService:FindFirstChild("RuntimePets") or workspaceService
  local v128 = -1
  local v129 = -1
  local v130, v131, v132, v133

  for index31, value43 in ipairs(runtimePets5:GetDescendants()) do
    if value43:IsA("ProximityPrompt") then
      if (value43.Name .. " " .. tostring(value43.ActionText) .. " "
        .. tostring(value43.ObjectText)):lower():find("steal") then
        local v134 = f49(value43)
        local v135, v136, v137, v138 = f54(v134)

        if v135 > v128 or v135 == v128 and v136 > v129 then
          v128 = v135
          v130 = v137
          v133 = v134
          v132 = value43
          v131 = v138
          v129 = v136
        end
      end
    end
  end

  return v133, v132, v130, v131
end

function f54(p23)
  if not p23 then
    return 0, 0, nil, nil
  else
    local v139 = f51(p23)
    local v140 = f50(p23)
    local v141 = v139 and (v107[string.lower(v139)] or 0) or 0
    local v142 = v140 and (v108[string.lower(v140)] or 0) or 0
    return v141 * 100 + v142, f53(p23), v139, v140
  end
end

local ssjPanelTP = Instance.new("Frame")
ssjPanelTP.Name = "SSJ_PanelTP"
ssjPanelTP.Parent = scriptSSJMultiHub4
ssjPanelTP.Size = UDim2.new(0, 220, 0, 160)
ssjPanelTP.Position = UDim2.new(0.02, 230, 0.12, 220)
ssjPanelTP.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ssjPanelTP.BorderSizePixel = 0
ssjPanelTP.Active = true

Instance.new("UICorner", ssjPanelTP).CornerRadius = UDim.new(0, 8)

local uiStroke4 = Instance.new("UIStroke")
uiStroke4.Parent = ssjPanelTP
uiStroke4.Color = Color3.fromRGB(140, 70, 255)
uiStroke4.Thickness = 1.5

local textLabel4 = Instance.new("TextLabel")
textLabel4.Parent = ssjPanelTP
textLabel4.BackgroundTransparency = 1
textLabel4.Size = UDim2.new(1, -12, 0, 26)
textLabel4.Position = UDim2.new(0, 8, 0, 2)
textLabel4.Font = Enum.Font.GothamBold
textLabel4.Text = "TP OP v2"
textLabel4.TextSize = 12
textLabel4.TextColor3 = Color3.new(1, 1, 1)
textLabel4.TextXAlignment = Enum.TextXAlignment.Left
textLabel4.Active = true

local frame10 = Instance.new("Frame")
frame10.Parent = ssjPanelTP
frame10.Position = UDim2.new(0, 8, 0, 28)
frame10.Size = UDim2.new(1, -16, 0, 1)
frame10.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
frame10.BorderSizePixel = 0

local textButton5 = Instance.new("TextButton")
textButton5.Parent = ssjPanelTP
textButton5.Size = UDim2.new(1, -16, 0, 32)
textButton5.Position = UDim2.new(0, 8, 0, 36)
textButton5.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textButton5.Font = Enum.Font.GothamBold
textButton5.TextSize = 11
textButton5.TextColor3 = Color3.fromRGB(220, 220, 220)
textButton5.Text = "1. GUARDAR POSICIÓN"

Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 6)
local cframe3

textButton5.Activated:Connect(function()
  local v143 = f47()

  if v143 then
    cframe3 = v143.CFrame
    cframe2 = v143.CFrame
    textButton5.Text = "¡POSICIÓN GUARDADA!"
    task.wait(1.5)
    textButton5.Text = "1. ACTUALIZAR POSICIÓN"
  end
end)

local textLabel5 = Instance.new("TextLabel")
textLabel5.Parent = ssjPanelTP
textLabel5.Size = UDim2.new(1, -16, 0, 20)
textLabel5.Position = UDim2.new(0, 8, 0, 72)
textLabel5.BackgroundTransparency = 1
textLabel5.Font = Enum.Font.GothamBold
textLabel5.TextSize = 11
textLabel5.TextColor3 = Color3.fromRGB(180, 180, 200)
textLabel5.Text = "Objetivo: —"
textLabel5.TextXAlignment = Enum.TextXAlignment.Left

local textButton6 = Instance.new("TextButton")
textButton6.Parent = ssjPanelTP
textButton6.Size = UDim2.new(1, -16, 0, 50)
textButton6.Position = UDim2.new(0, 8, 0, 96)
textButton6.BackgroundColor3 = Color3.fromRGB(110, 30, 200)
textButton6.Font = Enum.Font.GothamBold
textButton6.TextSize = 12
textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton6.Text = "FLASH STEAL"

Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)

textButton6.Activated:Connect(function()
  if v116 then
    return
  end

  if not cframe3 then
    textButton6.Text = "¡GUARDA POSICIÓN PRIMERO!"
    task.wait(1.5)
    textButton6.Text = "FLASH STEAL"
    return
  end

  v116 = true

  task.spawn(function()
    local v144, v145 = pcall(function()
      local v146, v147, v148, v149 = f55()
      local currentCamera, cameraType, cameraSubject

      if not v146 then
        textButton6.Text = "¡SIN PETS DISPONIBLES!"
        textLabel5.Text = "Objetivo: —"
        task.wait(1.2)
        return
      else
        local species4 = v146:GetAttribute("Species") or v146.Name

        textLabel5.Text = string.format(
          "%s [%s]%s", species4, v148 or "?", v149 and " ✨" .. v149 or ""
        )

        textLabel5.TextColor3 = v109[string.lower(v148 or "")] or Color3.fromRGB(255, 255, 255)

        if not v147 then
          for index32, value44 in ipairs(v146:GetDescendants()) do
            if value44:IsA("ProximityPrompt") then
              v147 = value44
              break
            end
          end
        end

        local head3 = v146:FindFirstChild("Head") or v146:FindFirstChild("HumanoidRootPart")
          or v146:FindFirstChildWhichIsA("BasePart")

        if not head3 or not v147 then
          textButton6.Text = "¡PIEZA NO HALLADA!"
          task.wait(1.2)
          return
        else
          local v150, v151, v152 = f47()

          if not v150 then
            return
          else
            currentCamera = workspaceService.CurrentCamera
            cameraType = currentCamera.CameraType
            cameraSubject = currentCamera.CameraSubject
            v114 = true
            pcall(function() currentCamera.CameraType = Enum.CameraType.Scriptable end)
            local position8 = head3.Position
            local v153 = math.max(v150.Position.Y, position8.Y) + 300

            if v153 < 650 then
              v153 = 650
            end

            v150.CFrame = CFrame.new(v150.Position.X, v153, v150.Position.Z)
            task.wait(0.04)
            f46(v152, false)
            v150.CFrame = CFrame.new(position8 + Vector3.new(0, 0.5, 0))
            task.wait(0.05)

            pcall(function()
              if remoteEvent then
                remoteEvent:FireServer("steal_cancel", 83618240)
              end
            end)

            pcall(function()
              v147.Enabled = true
              v147.HoldDuration = 0
              v147.RequiresLineOfSight = false
              v147.MaxActivationDistance = 999
            end)

            local v154 = tick()

            while tick() - v154 < 0.45 do
              if v147 and v147.Parent and fireproximityprompt then
                pcall(fireproximityprompt, v147)
              end

              task.wait(0.015)
            end

            local v155 = f47()

            if v155 and cframe3 then
              v155.CFrame = cframe3
            end

            task.wait(0.05)
            f46(localPlayer.Character, true)

            pcall(function()
              currentCamera.CameraType = cameraType

              local humanoid9 = localPlayer.Character
                and localPlayer.Character:FindFirstChildOfClass("Humanoid")

              if humanoid9 then
                currentCamera.CameraSubject = humanoid9
              elseif cameraSubject then
                currentCamera.CameraSubject = cameraSubject
              end
            end)

            return
          end
        end
      end
    end)

    v114 = false
    f46(localPlayer.Character, true)

    pcall(function()
      local currentCamera2 = workspaceService.CurrentCamera
      currentCamera2.CameraType = Enum.CameraType.Custom

      local humanoid10 = localPlayer.Character
        and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid10 then
        currentCamera2.CameraSubject = humanoid10
      end
    end)

    if not v144 then
      warn("[Flash Steal]", v145)
      textButton6.Text = "ERROR"
      task.wait(1)
    end

    textButton6.Text = "FLASH STEAL"
    v116 = false
  end)
end)

local v156, position9, position10

textLabel4.InputBegan:Connect(function(input8)
  if input8.UserInputType == Enum.UserInputType.MouseButton1
    or input8.UserInputType == Enum.UserInputType.Touch then
    v156 = true
    position9 = input8.Position
    position10 = ssjPanelTP.Position
  end
end)

userInputService.InputEnded:Connect(function(input9)
  if input9.UserInputType == Enum.UserInputType.MouseButton1
    or input9.UserInputType == Enum.UserInputType.Touch then
    v156 = false
  end
end)

userInputService.InputChanged:Connect(function(input10)
  if not v156 or not position9 or not position10 then
    return
  end

  if input10.UserInputType ~= Enum.UserInputType.MouseMovement
    and input10.UserInputType ~= Enum.UserInputType.Touch then
    return
  else
    local v157 = input10.Position - position9

    ssjPanelTP.Position = UDim2.new(
      position10.X.Scale, position10.X.Offset + v157.X, position10.Y.Scale,
      position10.Y.Offset + v157.Y
    )

    return
  end
end)

print("[SCRIPTSSJ] TP OP v2 listo")
