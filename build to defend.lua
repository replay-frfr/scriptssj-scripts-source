local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local virtualInputManager = game:GetService("VirtualInputManager")
local localPlayer = players.LocalPlayer

local scriptSSJUI = Instance.new("ScreenGui")
scriptSSJUI.Name = "ScriptSSJ_UI"
scriptSSJUI.ResetOnSpawn = false
scriptSSJUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
  if syn and syn.protect_gui then
    syn.protect_gui(scriptSSJUI)
    scriptSSJUI.Parent = coreGui
  elseif gethui then
    scriptSSJUI.Parent = gethui()
  else
    scriptSSJUI.Parent = coreGui
  end
end)

if not scriptSSJUI.Parent then
  scriptSSJUI.Parent = localPlayer:WaitForChild("PlayerGui")
end

local color = Color3.fromRGB(120, 40, 255)
local color2 = Color3.fromRGB(11, 11, 14)
local color3 = Color3.fromRGB(18, 18, 23)
local color4 = Color3.fromRGB(32, 32, 42)
local color5 = Color3.fromRGB(255, 255, 255)

local main = Instance.new("Frame")
main.Name = "Main"
main.Parent = scriptSSJUI
main.Size = UDim2.new(0, 260, 0, 465)
main.Position = UDim2.new(0.5, -130, 0.5, -200)
main.BackgroundColor3 = color2
main.BorderSizePixel = 0
main.ClipsDescendants = true

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 14)
uiCorner.Parent = main

local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = main
uiStroke.Color = color
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.2

local uiScale = Instance.new("UIScale")
uiScale.Parent = main

local currentCamera = workspaceService.CurrentCamera

local function f1()
  if not currentCamera then
    currentCamera = workspaceService.CurrentCamera
  end

  if currentCamera then
    uiScale.Scale = math.clamp(currentCamera.ViewportSize.X / 500, 0.5, 1)
  end
end

f1()

if currentCamera then
  currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(f1)
end

local frame = Instance.new("Frame")
frame.Parent = main
frame.Size = UDim2.new(1, -20, 0, 38)
frame.Position = UDim2.new(0, 10, 0, 6)
frame.BackgroundTransparency = 1

local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame
textLabel.Size = UDim2.new(0, 62, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SCRIPT"
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 17
textLabel.TextColor3 = color5
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Center

local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = frame
textLabel2.Size = UDim2.new(0, 50, 1, 0)
textLabel2.Position = UDim2.new(0, 58, 0, 0)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "SSJ"
textLabel2.Font = Enum.Font.GothamBold
textLabel2.TextSize = 17
textLabel2.TextColor3 = color
textLabel2.TextXAlignment = Enum.TextXAlignment.Left
textLabel2.TextYAlignment = Enum.TextYAlignment.Center

local uiStroke2 = Instance.new("UIStroke")
uiStroke2.Parent = textLabel2
uiStroke2.Color = Color3.fromRGB(0, 0, 0)
uiStroke2.Thickness = 1.5

local textButton = Instance.new("TextButton")
textButton.Parent = frame
textButton.Size = UDim2.new(0, 28, 0, 28)
textButton.Position = UDim2.new(1, -28, 0.5, -14)
textButton.BackgroundColor3 = color
textButton.BorderSizePixel = 0
textButton.Text = "-"
textButton.TextColor3 = color5
textButton.Font = Enum.Font.GothamBold
textButton.TextSize = 16
textButton.AutoButtonColor = false

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 8)
uiCorner2.Parent = textButton

local frame2 = Instance.new("Frame")
frame2.Parent = main
frame2.Position = UDim2.new(0, 10, 0, 46)
frame2.Size = UDim2.new(1, -20, 1, -52)
frame2.BackgroundTransparency = 1
frame2.ClipsDescendants = true

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Parent = frame2
scrollingFrame.Position = UDim2.new(0, 0, 0, 0)
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 0
scrollingFrame.ScrollBarImageColor3 = color
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollingFrame
uiListLayout.Padding = UDim.new(0, 4)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local uiPadding = Instance.new("UIPadding")
uiPadding.Parent = scrollingFrame
uiPadding.PaddingTop = UDim.new(0, 2)
uiPadding.PaddingBottom = UDim.new(0, 4)

local v1 = {
  COMMON = false,
  RARE = true,
  EPIC = true,
  LEGENDARY = true,
  MYTHIC = true,
  SECRET = true,
  LUCKY = true,
}

local v2 = {
  Noclip = false,
  Speed = false,
  ["ESP Items"] = false,
  ["ESP Players"] = false,
  ["Insta Grab"] = false,
}

local function f2()
  local character = localPlayer.Character

  if character then
    return character:FindFirstChild("HumanoidRootPart")
  end

  return nil
end

local function f3()
  local character2 = localPlayer.Character

  if character2 then
    return character2:FindFirstChildOfClass("Humanoid")
  end

  return nil
end

local function f4()
  local character3 = localPlayer.Character

  if not character3 then
    return false
  end

  return character3:FindFirstChildOfClass("Tool") ~= nil
end

local walkSpeed, connect

local function f5(p1)
  if connect then
    connect:Disconnect()
    connect = nil
  end

  if p1 then
    local v3 = f3()

    if v3 and walkSpeed == nil then
      walkSpeed = v3.WalkSpeed
    end

    connect = runService.Heartbeat:Connect(function()
      local v4 = f2()
      local v5 = f3()

      if v4 and v5 and v5.MoveDirection.Magnitude > 0.1 then
        local v6 = 60

        if f4() then
          v6 = 39
        end

        v4.AssemblyLinearVelocity = Vector3.new(
          v5.MoveDirection.X * v6, v4.AssemblyLinearVelocity.Y, v5.MoveDirection.Z * v6
        )
      end
    end)
  else
    local v7 = f3()

    if v7 then
      if walkSpeed then
        v7.WalkSpeed = walkSpeed
        walkSpeed = nil
      else
        v7.WalkSpeed = 16
      end
    end
  end

  return true
end

local ssjESPItems = Instance.new("Folder")
ssjESPItems.Name = "SSJ_ESP_Items"
ssjESPItems.Parent = scriptSSJUI

local v8 = {}

local v9 = {
  COMMON_ = { color = Color3.fromRGB(210, 210, 215), label = "COMMON" },
  RARE_ = { color = Color3.fromRGB(70, 150, 255), label = "RARE" },
  EPIC_ = { color = Color3.fromRGB(170, 70, 255), label = "EPIC" },
  LEGENDARY_ = { color = Color3.fromRGB(255, 175, 35), label = "LEGENDARY" },
  MYTHIC_ = { color = Color3.fromRGB(255, 55, 75), label = "MYTHIC" },
  SECRET_ = { color = Color3.fromRGB(255, 220, 50), label = "SECRET" },
}

local color6 = Color3.fromRGB(255, 55, 75)

local v10 = {
  MYTHIC = { color = color6, label = "MYTHIC LUCKY" },
  SECRET = { color = Color3.fromRGB(255, 220, 50), label = "SECRET LUCKY" },
  VAULTED = { color = Color3.fromRGB(255, 175, 35), label = "VAULTED LUCKY" },
  ADMIN = { color = Color3.fromRGB(255, 90, 210), label = "ADMIN LUCKY" },
  DIAMOND = { color = Color3.fromRGB(60, 230, 255), label = "DIAMOND LUCKY" },
  HACKED = { color = Color3.fromRGB(70, 255, 90), label = "HACKED LUCKY" },
  LAVA = { color = Color3.fromRGB(255, 95, 25), label = "LAVA LUCKY" },
  DIVINE = { color = Color3.fromRGB(255, 250, 200), label = "DIVINE LUCKY" },
}

local function makeHighlight(p2, fillColor, p3)
  local ssjItemGlow = Instance.new("Highlight")
  ssjItemGlow.Name = "SSJ_ItemGlow"
  ssjItemGlow.Adornee = p2
  ssjItemGlow.FillColor = fillColor
  ssjItemGlow.OutlineColor = Color3.fromRGB(255, 255, 255)

  if p3 then
    ssjItemGlow.FillTransparency = 0.45
  else
    ssjItemGlow.FillTransparency = 0.65
  end

  ssjItemGlow.OutlineTransparency = 0
  ssjItemGlow.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
  ssjItemGlow.Parent = p2

  return ssjItemGlow
end

local f6

local function f7(p4)
  local v11, v12 = f6(p4)

  if v11 then
    return "LUCKY " .. tostring(v12)
  else
    local v13 = string.gsub(p4.Name, "_placed_%-?%d+_%d+", "")

    for key in pairs(v9) do
      v13 = string.gsub(v13, "^" .. key, "")
    end

    return v13
  end
end

function f6(p5)
  if p5:GetAttribute("IsLuckyBlock") == true then
    return true, p5:GetAttribute("LBlockType") or "LUCKY"
  else
    local v14 = string.upper(p5.Name)

    if string.find(v14, "LUCKYBLOCK_") then
      for key2 in pairs(v10) do
        if string.find(v14, key2) then
          return true, key2
        end
      end

      return true, "LUCKY"
    end

    return false, nil
  end
end

local function f8(p6)
  local v15, v16 = f6(p6)

  if v15 then
    local v17 = v10[v16] or { color = Color3.fromRGB(255, 255, 200), label = "LUCKY BLOCK" }
    return v17.label, v17.color, true, "LUCKY"
  else
    local name = p6.Name

    for key3, value in pairs(v9) do
      if string.find(name, key3) then
        return value.label, value.color, false, value.label
      end
    end

    return "?", Color3.fromRGB(180, 180, 180), false, "?"
  end
end

local function makeTextLabel(value2)
  local v18 = f7(value2)
  local v19, v20, v21 = f8(value2)
  local v22 = v21 or v19 == "SECRET" or v19 == "MYTHIC"
  local v23 = makeHighlight(value2, v20, v22)

  local ssjESPItem = Instance.new("BillboardGui")
  ssjESPItem.Name = "SSJ_ESP_Item"
  ssjESPItem.Adornee = value2
  ssjESPItem.Size = UDim2.new(0, 180, 0, 36)
  ssjESPItem.StudsOffset = Vector3.new(0, 2.6, 0)
  ssjESPItem.AlwaysOnTop = true
  ssjESPItem.MaxDistance = 2200
  ssjESPItem.LightInfluence = 0
  ssjESPItem.Parent = ssjESPItems

  local rarity = Instance.new("TextLabel")
  rarity.Name = "Rarity"
  rarity.BackgroundTransparency = 1
  rarity.Size = UDim2.new(1, 0, 0, 12)
  rarity.Position = UDim2.new(0, 0, 0, 0)
  rarity.Font = Enum.Font.GothamBlack
  rarity.TextSize = 10
  rarity.TextColor3 = v20
  rarity.TextStrokeTransparency = 0
  rarity.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  rarity.TextXAlignment = Enum.TextXAlignment.Center
  rarity.Text = string.upper(v19)
  rarity.Parent = ssjESPItem

  local name2 = Instance.new("TextLabel")
  name2.Name = "Name"
  name2.BackgroundTransparency = 1
  name2.Size = UDim2.new(1, 0, 0, 12)
  name2.Position = UDim2.new(0, 0, 0, 11)
  name2.Font = Enum.Font.GothamBold
  name2.TextSize = 11
  name2.TextColor3 = Color3.fromRGB(255, 255, 255)
  name2.TextStrokeTransparency = 0
  name2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  name2.TextXAlignment = Enum.TextXAlignment.Center
  name2.Text = string.upper(v18)
  name2.Parent = ssjESPItem

  local dist = Instance.new("TextLabel")
  dist.Name = "Dist"
  dist.BackgroundTransparency = 1
  dist.Size = UDim2.new(1, 0, 0, 11)
  dist.Position = UDim2.new(0, 0, 0, 23)
  dist.Font = Enum.Font.GothamBold
  dist.TextSize = 10
  dist.TextColor3 = Color3.fromRGB(200, 200, 210)
  dist.TextStrokeTransparency = 0
  dist.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  dist.TextXAlignment = Enum.TextXAlignment.Center
  dist.Text = "-- m"
  dist.Parent = ssjESPItem

  if v22 then
    task.spawn(function()
      while v23 and v23.Parent do
        local create = tweenService:Create(v23, TweenInfo.new(
          0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut
        ), { FillTransparency = 0.35 })

        create:Play()
        create.Completed:Wait()

        if not v23.Parent then
          break
        else
          local create2 = tweenService:Create(v23, TweenInfo.new(
            0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut
          ), { FillTransparency = 0.6 })

          create2:Play()
          create2.Completed:Wait()
        end
      end
    end)
  end

  return ssjESPItem, dist, v23
end

local function f9(name3)
  return string.find(name3, "%-9999999_") ~= nil
end

local v24 = {
  "TRAP", "SPIKE", "WALL", "TURRET", "CANNON", "MINE", "FENCE", "LASER", "VAULT", "GUARD",
  "DEFENSE", "BEARTRAP", "ELECTRIC", "POISON", "FLAME", "ARROW", "CAGE", "ALARM", "SENSOR",
  "MOTION", "SHOCK", "DOOR", "HEAL", "HACK",
}

local function f10(p7)
  if f6(p7) then
    return false
  elseif p7:GetAttribute("BehaviorType") ~= nil then
    return true
  else
    local v25 = string.upper(p7.Name)

    for index, value3 in ipairs(v24) do
      if string.find(v25, value3) then
        return true
      end
    end

    return false
  end
end

local function f11(p8)
  local ownerId = p8:GetAttribute("OwnerId")

  if ownerId == nil then
    return false
  end

  if ownerId == localPlayer.UserId then
    return false
  end

  return true
end

local f12

local function f13(p9)
  if not f12(p9) then
    return false
  elseif f6(p9) then
    return true
  elseif f9(p9.Name) then
    return false
  elseif f10(p9) then
    return false
  else
    if not f11(p9) then
      return false
    end

    return true
  end
end

function f12(p10)
  local v26, v27, v28, v29 = f8(p10)

  if v29 == "?" then
    return false
  end

  return v1[v29] == true
end

local connect2, f14

local function f15(p11)
  if p11 then
    if not connect2 then
      connect2 = runService.Heartbeat:Connect(f14)
    end
  else
    if connect2 then
      connect2:Disconnect()
      connect2 = nil
    end

    for key4, value4 in pairs(v8) do
    end

    v8 = {}
  end

  return true
end

function f14()
  local placedItems = workspace:FindFirstChild("PlacedItems")
  local color7

  if not placedItems then
    return
  else
    for key5, value5 in pairs(v8) do
      if not key5.Parent or not f13(key5) then
        v8[key5] = nil
      end
    end

    for index2, value6 in ipairs(placedItems:GetChildren()) do
      if not v8[value6] and f13(value6) then
        local v30 = f6(value6)

        if value6:FindFirstChild("PlacedItemBillboard") ~= nil
          or value6:FindFirstChild("LBTimerBillboard") ~= nil or v30 then
          local billboard, distLabel, glow = makeTextLabel(value6)
          v8[value6] = { billboard = billboard, distLabel = distLabel, glow = glow }
        end
      end
    end

    local v31 = f2()

    for key6, value7 in pairs(v8) do
      if key6.Parent and value7.distLabel and v31 then
        local getPivot = key6:GetPivot()
        local v32 = math.floor((v31.Position - getPivot.Position).Magnitude)

        if v32 <= 50 then
          color7 = Color3.fromRGB(90, 255, 130)
        elseif v32 <= 200 then
          color7 = Color3.fromRGB(255, 210, 50)
        else
          color7 = Color3.fromRGB(255, 100, 100)
        end



        value7.distLabel.TextColor3 = color7
        value7.distLabel.Text = v32 .. " m"
      end
    end

    return
  end
end

local v33 = {}
local v34 = {}
local v35 = {}
local color8 = Color3.fromRGB(180, 30, 255)
local color9 = Color3.fromRGB(255, 255, 255)

local v36 = {
  Color3.fromRGB(255, 60, 60), Color3.fromRGB(255, 160, 40), Color3.fromRGB(255, 255, 60),
  Color3.fromRGB(60, 255, 100), Color3.fromRGB(60, 180, 255), Color3.fromRGB(160, 80, 255),
  Color3.fromRGB(255, 80, 200),
}

local function f16(p12)
  if p12 <= 30 then
    return Color3.fromRGB(255, 70, 80)
  end

  if p12 <= 100 then
    return Color3.fromRGB(255, 175, 50)
  end

  return Color3.fromRGB(100, 230, 140)
end

local function f17(player)
  if v35[player] then
    for index3, value8 in ipairs(v35[player]) do
      local v37 = value8
      pcall(function() v37:Disconnect() end)
    end

    v35[player] = nil
  end
end

local function f18(key7)
  if v33[key7] then
    pcall(function()
      if v33[key7].Parent then
        v33[key7]:Destroy()
      end
    end)

    v33[key7] = nil
  end

  if v34[key7] then
    pcall(function()
      if v34[key7].Parent then
        v34[key7]:Destroy()
      end
    end)

    v34[key7] = nil
  end
end

local f19

local function makeTextLabel2(value9, character4)
  f18(value9)

  if not v2["ESP Players"] or value9 == localPlayer or not character4 then
    return
  else
    local ssjESPPlayer = Instance.new("Highlight")
    ssjESPPlayer.Name = "SSJ_ESP_Player"
    ssjESPPlayer.Adornee = character4
    ssjESPPlayer.FillColor = color8
    ssjESPPlayer.OutlineColor = color9
    ssjESPPlayer.FillTransparency = 0.6
    ssjESPPlayer.OutlineTransparency = 0
    ssjESPPlayer.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ssjESPPlayer.Parent = character4

    v33[value9] = ssjESPPlayer
    local head = character4:FindFirstChild("Head")

    if not head then
      return
    else
      local ssjESPName = Instance.new("BillboardGui")
      ssjESPName.Name = "SSJ_ESP_Name"
      ssjESPName.Adornee = head
      ssjESPName.Size = UDim2.new(0, 200, 0, 34)
      ssjESPName.StudsOffset = Vector3.new(0, 2.6, 0)
      ssjESPName.AlwaysOnTop = true
      ssjESPName.MaxDistance = 2000
      ssjESPName.LightInfluence = 0
      ssjESPName.Parent = character4

      local name4 = value9.Name

      if value9.DisplayName ~= value9.Name then
        name4 = value9.DisplayName
      end

      local name5 = Instance.new("TextLabel")
      name5.Name = "Name"
      name5.BackgroundTransparency = 1
      name5.Size = UDim2.new(1, 0, 0, 17)
      name5.Position = UDim2.new(0, 0, 0, 0)
      name5.Font = Enum.Font.GothamBold
      name5.TextSize = 13
      name5.TextColor3 = v36[1]
      name5.TextStrokeTransparency = 0
      name5.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      name5.TextXAlignment = Enum.TextXAlignment.Center
      name5.TextYAlignment = Enum.TextYAlignment.Center
      name5.Text = string.upper(name4)
      name5.Parent = ssjESPName

      f19(name5)

      local dist2 = Instance.new("TextLabel")
      dist2.Name = "Dist"
      dist2.BackgroundTransparency = 1
      dist2.Size = UDim2.new(1, 0, 0, 15)
      dist2.Position = UDim2.new(0, 0, 0, 16)
      dist2.Font = Enum.Font.GothamMedium
      dist2.TextSize = 11
      dist2.TextColor3 = Color3.fromRGB(200, 190, 230)
      dist2.TextStrokeTransparency = 0
      dist2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      dist2.TextXAlignment = Enum.TextXAlignment.Center
      dist2.TextYAlignment = Enum.TextYAlignment.Center
      dist2.Text = "-- m"
      dist2.Parent = ssjESPName

      v34[value9] = ssjESPName
      return
    end
  end
end

function f19(p13)
  task.spawn(function()
    local v38 = 1

    while p13 and p13.Parent do
      local v39 = v38 % #v36 + 1

      local create3 = tweenService:Create(p13, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
        TextColor3 = v36[v39],
      })

      create3:Play()
      create3.Completed:Wait()

      v38 = v39
    end
  end)
end

local function f20(value10)
  if value10 == localPlayer then
    return
  else
    f17(value10)
    v35[value10] = {}
    local characterAdded = value10.CharacterAdded

    table.insert(v35[value10], characterAdded:Connect(function(p14)
      task.wait(0.3)

      if v2["ESP Players"] then
        makeTextLabel2(value10, p14)
      end
    end))

    if value10.Character and v2["ESP Players"] then
      makeTextLabel2(value10, value10.Character)
    end

    return
  end
end

for index4, value11 in ipairs(players:GetPlayers()) do
  f20(value11)
end

players.PlayerAdded:Connect(f20)

players.PlayerRemoving:Connect(function(player2)
  f18(player2)
  f17(player2)
end)

task.spawn(function()
  while true do
    task.wait(0.45)

    pcall(function()
      if not v2["ESP Players"] then
        for index5, value12 in ipairs(players:GetPlayers()) do
          f18(value12)
        end
      else
        local character5 = localPlayer.Character

        local humanoidRootPart = character5
        humanoidRootPart = character5 and character5:FindFirstChild("HumanoidRootPart")

        for index6, value13 in ipairs(players:GetPlayers()) do
          if value13 ~= localPlayer then
            local character6 = value13.Character

            if not character6 then
              f18(value13)
            else
              local v40 = false

              if not v33[value13] then
                v40 = true
              elseif v33[value13].Adornee ~= character6 then
                v40 = true
              end

              if v40 then
                makeTextLabel2(value13, character6)
              elseif humanoidRootPart and v34[value13] then
                local humanoidRootPart2 = character6:FindFirstChild("HumanoidRootPart")
                local dist3 = v34[value13]:FindFirstChild("Dist")

                if humanoidRootPart2 and dist3 then
                  local v41 = math.floor((humanoidRootPart.Position
                    - humanoidRootPart2.Position).Magnitude)

                  dist3.Text = v41 .. " m"
                  dist3.TextColor3 = f16(v41)
                end
              end
            end
          end
        end
      end
    end)
  end
end)

local connect3 = nil

local function f21(p15)
  if connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  if p15 then
    connect3 = runService.Stepped:Connect(function()
      if not v2.Noclip then
        return
      else
        local character7 = localPlayer.Character

        if not character7 then
          return
        end

        for index7, value14 in ipairs(character7:GetDescendants()) do
          if value14:IsA("BasePart") and value14.CanCollide then
            value14.CanCollide = false
          end
        end

        return
      end
    end)
  else
    local character8 = localPlayer.Character

    if character8 then
      for index8, value15 in ipairs(character8:GetDescendants()) do
        if value15:IsA("BasePart") then
          value15.CanCollide = true
        end
      end
    end
  end

  return true
end

local v42

local function f22(p16)
  if v42 then
    task.cancel(v42)
    v42 = nil
  end

  if p16 then
    v42 = task.spawn(function()
      while v2["Insta Grab"] do
        task.wait(0.05)
      end
    end)
  end

  return true
end

localPlayer.CharacterAdded:Connect(function()
  task.wait(1)

  if v2.Noclip then
    f21(true)
  end

  if v2.Speed then
    f5(true)
  end

  if v2["Insta Grab"] then
    f22(true)
  end
end)

local function makeTextButton(text, key8, color10)
  local frame3 = Instance.new("Frame")
  frame3.Parent = scrollingFrame
  frame3.Size = UDim2.new(1, 0, 0, 26)
  frame3.BackgroundColor3 = color3
  frame3.BorderSizePixel = 0
  frame3.LayoutOrder = 100

  local uiCorner3 = Instance.new("UICorner")
  uiCorner3.CornerRadius = UDim.new(0, 7)
  uiCorner3.Parent = frame3

  local uiStroke3 = Instance.new("UIStroke")
  uiStroke3.Parent = frame3
  uiStroke3.Color = Color3.fromRGB(28, 28, 38)
  uiStroke3.Thickness = 1

  local frame4 = Instance.new("Frame")
  frame4.BackgroundColor3 = color10
  frame4.BorderSizePixel = 0
  frame4.Size = UDim2.new(0, 7, 0, 7)
  frame4.Position = UDim2.new(0, 8, 0.5, -3.5)
  frame4.Parent = frame3

  local uiCorner4 = Instance.new("UICorner")
  uiCorner4.CornerRadius = UDim.new(1, 0)
  uiCorner4.Parent = frame4

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Parent = frame3
  textLabel3.Position = UDim2.new(0, 20, 0, 0)
  textLabel3.Size = UDim2.new(1, -85, 1, 0)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = text
  textLabel3.Font = Enum.Font.GothamBold
  textLabel3.TextSize = 11
  textLabel3.TextColor3 = color5
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.TextYAlignment = Enum.TextYAlignment.Center

  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame3
  textButton2.Position = UDim2.new(1, -64, 0.5, -9)
  textButton2.Size = UDim2.new(0, 56, 0, 18)
  textButton2.BorderSizePixel = 0
  textButton2.AutoButtonColor = false
  textButton2.Font = Enum.Font.GothamBold
  textButton2.TextSize = 9

  local uiCorner5 = Instance.new("UICorner")
  uiCorner5.CornerRadius = UDim.new(0, 5)
  uiCorner5.Parent = textButton2

  local function f23()
    if v1[key8] then
      textButton2.BackgroundColor3 = color10
      textButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
      textButton2.Text = "ON"
    else
      textButton2.BackgroundColor3 = color4
      textButton2.TextColor3 = Color3.fromRGB(140, 140, 155)
      textButton2.Text = "OFF"
    end
  end

  f23()

  textButton2.Activated:Connect(function()
    v1[key8] = not v1[key8]
    f23()
  end)
end

local function makeTextButton2(key9, layoutOrder, p17)
  local frame5 = Instance.new("Frame")
  frame5.Parent = scrollingFrame
  frame5.Size = UDim2.new(1, 0, 0, 32)
  frame5.BackgroundColor3 = color3
  frame5.BorderSizePixel = 0
  frame5.LayoutOrder = layoutOrder

  local uiCorner6 = Instance.new("UICorner")
  uiCorner6.CornerRadius = UDim.new(0, 7)
  uiCorner6.Parent = frame5

  local uiStroke4 = Instance.new("UIStroke")
  uiStroke4.Parent = frame5
  uiStroke4.Color = Color3.fromRGB(28, 28, 38)
  uiStroke4.Thickness = 1

  local textLabel4 = Instance.new("TextLabel")
  textLabel4.Parent = frame5
  textLabel4.Position = UDim2.new(0, 10, 0, 0)
  textLabel4.Size = UDim2.new(1, -85, 1, 0)
  textLabel4.BackgroundTransparency = 1
  textLabel4.Text = key9
  textLabel4.Font = Enum.Font.GothamBold
  textLabel4.TextSize = 11
  textLabel4.TextColor3 = color5
  textLabel4.TextXAlignment = Enum.TextXAlignment.Left
  textLabel4.TextYAlignment = Enum.TextYAlignment.Center

  local textButton3 = Instance.new("TextButton")
  textButton3.Parent = frame5
  textButton3.Position = UDim2.new(1, -64, 0.5, -10)
  textButton3.Size = UDim2.new(0, 56, 0, 20)
  textButton3.BorderSizePixel = 0
  textButton3.AutoButtonColor = false
  textButton3.Font = Enum.Font.GothamBold
  textButton3.TextSize = 10

  local uiCorner7 = Instance.new("UICorner")
  uiCorner7.CornerRadius = UDim.new(0, 5)
  uiCorner7.Parent = textButton3

  local function f24()
    if v2[key9] then
      textButton3.BackgroundColor3 = color
      textButton3.TextColor3 = color5
      textButton3.Text = "ON"
    else
      textButton3.BackgroundColor3 = color4
      textButton3.TextColor3 = Color3.fromRGB(140, 140, 155)
      textButton3.Text = "OFF"
    end
  end

  f24()

  textButton3.Activated:Connect(function()
    local v43 = not v2[key9]
    v2[key9] = v43
    f24()

    if p17 then
      local v44, v45 = pcall(p17, v43)

      if not v44 then
        warn("[SCRIPTSSJ] Error en '" .. key9 .. "':", v45)
        v2[key9] = not v43
        f24()
      elseif v45 == false then
        v2[key9] = not v43
        f24()
      end
    end
  end)
end

makeTextButton2("Noclip", 0, function(p18) return f21(p18) end)
makeTextButton2("Speed", 1, function(p19) return f5(p19) end)
makeTextButton2("ESP Items", 2, function(p20) return f15(p20) end)
makeTextButton2("ESP Players", 3, function(p21) return true end)
makeTextButton2("Insta Grab", 4, function(p22) return f22(p22) end)

local frame6 = Instance.new("Frame")
frame6.Parent = scrollingFrame
frame6.Size = UDim2.new(1, 0, 0, 20)
frame6.BackgroundTransparency = 1
frame6.LayoutOrder = 99

local textLabel5 = Instance.new("TextLabel")
textLabel5.Parent = frame6
textLabel5.Size = UDim2.new(1, 0, 1, 0)
textLabel5.BackgroundTransparency = 1
textLabel5.Text = "▼ FILTROS DE RAREZA"
textLabel5.Font = Enum.Font.GothamBold
textLabel5.TextSize = 10
textLabel5.TextColor3 = color
textLabel5.TextXAlignment = Enum.TextXAlignment.Left
textLabel5.TextYAlignment = Enum.TextYAlignment.Center

makeTextButton("COMMON", "COMMON", Color3.fromRGB(200, 200, 200))
makeTextButton("RARE", "RARE", Color3.fromRGB(80, 160, 255))
makeTextButton("EPIC", "EPIC", Color3.fromRGB(160, 80, 255))
makeTextButton("LEGENDARY", "LEGENDARY", Color3.fromRGB(255, 170, 40))
makeTextButton("MYTHIC", "MYTHIC", Color3.fromRGB(255, 70, 80))
makeTextButton("SECRET", "SECRET", Color3.fromRGB(255, 215, 60))
makeTextButton("LUCKY", "LUCKY", Color3.fromRGB(255, 255, 200))

local v46 = false
local udim = UDim2.new(0, 260, 0, 430)
local udim2 = UDim2.new(0, 260, 0, 52)

textButton.Activated:Connect(function()
  v46 = not v46

  if v46 then
    frame2.Visible = false
    main.Size = udim2
    textButton.Text = "+"
  else
    frame2.Visible = true
    main.Size = udim
    textButton.Text = "-"
  end
end)

local v47 = false
local position, position2

main.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v47 = true
    position = input.Position
    position2 = main.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        v47 = false
      end
    end)
  end
end)

local v48

main.InputChanged:Connect(function(input2)
  if input2.UserInputType == Enum.UserInputType.MouseMovement
    or input2.UserInputType == Enum.UserInputType.Touch then
    v48 = input2
  end
end)

userInputService.InputChanged:Connect(function(input3)
  if input3 == v48 and v47 then
    local v49 = input3.Position - position

    main.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v49.X, position2.Y.Scale,
      position2.Y.Offset + v49.Y
    )
  end
end)
