local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")
local localPlayer = players.LocalPlayer

local scriptSSJUI = Instance.new("ScreenGui")
scriptSSJUI.Name = "ScriptSSJ_UI"
scriptSSJUI.ResetOnSpawn = false
scriptSSJUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
scriptSSJUI.IgnoreGuiInset = true

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
local color6 = Color3.fromRGB(0, 200, 100)
local color7 = Color3.fromRGB(220, 50, 50)

local main = Instance.new("Frame")
main.Name = "Main"
main.Parent = scriptSSJUI
main.Size = UDim2.new(0, 270, 0, 230)
main.Position = UDim2.new(0.5, -math.floor(135), 0.5, -math.floor(115))
main.BackgroundColor3 = color2
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Active = true

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

  if not currentCamera then
    return
  else
    local viewportSize = currentCamera.ViewportSize
    local v1 = math.min(viewportSize.X / 430, viewportSize.Y / 620)
    local v2 = math.clamp(v1, 0.55, 1)
    uiScale.Scale = v2
    local v3 = 270 * v2
    local v4 = 230 * v2

    if main.Position.X.Offset + v3 > viewportSize.X then
      main.Position = UDim2.new(
        0, math.max(10, viewportSize.X - v3 - 10), main.Position.Y.Scale, main.Position.Y.Offset
      )
    end

    if main.Position.Y.Offset + v4 > viewportSize.Y then
      main.Position = UDim2.new(
        main.Position.X.Scale, main.Position.X.Offset, 0, math.max(10, viewportSize.Y - v4 - 10)
      )
    end

    return
  end
end

f1()

if currentCamera then
  currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(f1)
end

local frame = Instance.new("Frame")
frame.Parent = main
frame.Size = UDim2.new(1, -18, 0, 42)
frame.Position = UDim2.new(0, 9, 0, 6)
frame.BackgroundTransparency = 1

local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame
textLabel.Size = UDim2.new(0, 68, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SCRIPT"
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 17
textLabel.TextColor3 = color5
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Center

local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = frame
textLabel2.Size = UDim2.new(0, 55, 1, 0)
textLabel2.Position = UDim2.new(0, 60, 0, 0)
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
textButton.TextSize = 17
textButton.AutoButtonColor = false
textButton.Active = true

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 9)
uiCorner2.Parent = textButton

local frame2 = Instance.new("Frame")
frame2.Parent = main
frame2.Position = UDim2.new(0, 9, 0, 52)
frame2.Size = UDim2.new(1, -18, 1, -60)
frame2.BackgroundTransparency = 1
frame2.ClipsDescendants = true

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Parent = frame2
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 3
scrollingFrame.ScrollBarImageColor3 = color
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Never
scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollingFrame
uiListLayout.Padding = UDim.new(0, 5)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local uiPadding = Instance.new("UIPadding")
uiPadding.Parent = scrollingFrame
uiPadding.PaddingTop = UDim.new(0, 2)
uiPadding.PaddingBottom = UDim.new(0, 4)

local v5 = 0

local function makeTextLabel(text, color8)
  local textLabel3

  if v5 >= 3 then
    return
  else
    v5 = v5 + 1

    textLabel3 = Instance.new("TextLabel")
    textLabel3.Parent = main
    textLabel3.Size = UDim2.new(1, -18, 0, 28)
    textLabel3.Position = UDim2.new(0, 9, 1, 5)
    textLabel3.BackgroundColor3 = color8 or color
    textLabel3.BackgroundTransparency = 0.1
    textLabel3.Text = text
    textLabel3.TextColor3 = color5
    textLabel3.Font = Enum.Font.GothamBold
    textLabel3.TextSize = 11
    textLabel3.ZIndex = 10

    local uiCorner3 = Instance.new("UICorner")
    uiCorner3.CornerRadius = UDim.new(0, 8)
    uiCorner3.Parent = textLabel3

    tweenService:Create(textLabel3, TweenInfo.new(0.25), {
      Position = UDim2.new(0, 9, 1, -38),
    }):Play()

    task.delay(2, function()
      tweenService:Create(textLabel3, TweenInfo.new(0.25), {
        Position = UDim2.new(0, 9, 1, 5),
        BackgroundTransparency = 1,
        TextTransparency = 1,
      }):Play()

      task.wait(0.35)
      textLabel3:Destroy()
      v5 = v5 - 1
    end)

    return
  end
end

local v6 = {
  ["Auto Hit Speed"] = false,
  Noclip = false,
  ["Walk Speed"] = false,
  ["ESP Players"] = false,
}

local v7 = {}
local v8 = 0
local v9 = 0
local v10 = 0

local function f2()
  local character = localPlayer.Character

  if not character then
    return {}
  else
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart then
      return {}
    else
      local v11 = {}
      local build = workspaceService:FindFirstChild("Build")
      local zoneBuilds = build and build:FindFirstChild("ZoneBuilds")

      if not zoneBuilds then
        return v11
      end

      for index, value in ipairs(zoneBuilds:GetChildren()) do
        local eggs = value:FindFirstChild("Eggs")

        if eggs then
          for index2, value2 in ipairs(eggs:GetChildren()) do
            if value2:IsA("Model") then
              local egg = value2:FindFirstChild("Egg")

              if egg and egg:IsA("BasePart") then
                local magnitude = (egg.Position - humanoidRootPart.Position).Magnitude

                if magnitude <= 9000 then
                  table.insert(v11, {
                    modelo = value2,
                    parte = egg,
                    zona = value.Name,
                    distancia = math.floor(magnitude),
                    nombre = value2.Name,
                  })
                end
              end
            end
          end
        end
      end

      table.sort(v11, function(p1, p2) return p1.distancia < p2.distancia end)
      return v11
    end
  end
end

local v12 = {}
local v13 = {}
local v14 = {}
local color9 = Color3.fromRGB(180, 30, 255)
local color10 = Color3.fromRGB(255, 255, 255)

local v15 = {
  Color3.fromRGB(255, 60, 60), Color3.fromRGB(255, 160, 40), Color3.fromRGB(255, 255, 60),
  Color3.fromRGB(60, 255, 100), Color3.fromRGB(60, 180, 255), Color3.fromRGB(160, 80, 255),
  Color3.fromRGB(255, 80, 200),
}

local function f3(key)
  if v12[key] then
    pcall(function()
      if v12[key].Parent then
        v12[key]:Destroy()
      end
    end)

    v12[key] = nil
  end

  if v13[key] then
    pcall(function()
      if v13[key].Parent then
        v13[key]:Destroy()
      end
    end)

    v13[key] = nil
  end
end

local function f4(player)
  if v14[player] then
    for index3, value3 in ipairs(v14[player]) do
      local v16 = value3
      pcall(function() v16:Disconnect() end)
    end

    v14[player] = nil
  end
end

local function f5(p3)
  if p3 <= 30 then
    return Color3.fromRGB(255, 70, 80)
  end

  if p3 <= 100 then
    return Color3.fromRGB(255, 175, 50)
  end

  return Color3.fromRGB(100, 230, 140)
end

local f6

local function makeTextLabel2(value4, character2)
  f3(value4)

  if not v6["ESP Players"] or value4 == localPlayer or not character2 then
    return
  else
    local ssjESPPlayer = Instance.new("Highlight")
    ssjESPPlayer.Name = "SSJ_ESP_Player"
    ssjESPPlayer.Adornee = character2
    ssjESPPlayer.FillColor = color9
    ssjESPPlayer.OutlineColor = color10
    ssjESPPlayer.FillTransparency = 0.6
    ssjESPPlayer.OutlineTransparency = 0
    ssjESPPlayer.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ssjESPPlayer.Parent = character2

    v12[value4] = ssjESPPlayer
    local head = character2:FindFirstChild("Head")



    if not head then
      return
    else
      local ssjESPName = Instance.new("BillboardGui")
      ssjESPName.Name = "SSJ_ESP_Name"
      ssjESPName.Adornee = head
      ssjESPName.Size = UDim2.new(0, 180, 0, 32)
      ssjESPName.StudsOffset = Vector3.new(0, 2.6, 0)
      ssjESPName.AlwaysOnTop = true
      ssjESPName.MaxDistance = 500
      ssjESPName.LightInfluence = 0
      ssjESPName.Parent = character2

      local name = value4.Name

      if value4.DisplayName ~= value4.Name then
        name = value4.DisplayName
      end

      local name2 = Instance.new("TextLabel")
      name2.Name = "Name"
      name2.BackgroundTransparency = 1
      name2.Size = UDim2.new(1, 0, 0, 17)
      name2.Position = UDim2.new(0, 0, 0, 0)
      name2.Font = Enum.Font.GothamBold
      name2.TextSize = 12
      name2.TextColor3 = v15[1]
      name2.TextStrokeTransparency = 0
      name2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      name2.TextXAlignment = Enum.TextXAlignment.Center
      name2.TextYAlignment = Enum.TextYAlignment.Center
      name2.Text = string.upper(name)
      name2.Parent = ssjESPName

      f6(name2)

      local dist = Instance.new("TextLabel")
      dist.Name = "Dist"
      dist.BackgroundTransparency = 1
      dist.Size = UDim2.new(1, 0, 0, 15)
      dist.Position = UDim2.new(0, 0, 0, 16)
      dist.Font = Enum.Font.GothamMedium
      dist.TextSize = 10
      dist.TextColor3 = Color3.fromRGB(200, 190, 230)
      dist.TextStrokeTransparency = 0
      dist.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
      dist.TextXAlignment = Enum.TextXAlignment.Center
      dist.TextYAlignment = Enum.TextYAlignment.Center
      dist.Text = "-- m"
      dist.Parent = ssjESPName

      v13[value4] = ssjESPName
      return
    end
  end
end

function f6(p4)
  task.spawn(function()
    local v17 = 1

    while p4 and p4.Parent do
      local v18 = v17 % #v15 + 1

      local create = tweenService:Create(p4, TweenInfo.new(0.8, Enum.EasingStyle.Linear), {
        TextColor3 = v15[v18],
      })

      create:Play()
      create.Completed:Wait()

      v17 = v18
    end
  end)
end

local function f7(value5)
  if value5 == localPlayer then
    return
  else
    f4(value5)
    v14[value5] = {}
    local characterAdded = value5.CharacterAdded

    table.insert(v14[value5], characterAdded:Connect(function(p5)
      task.wait(0.3)

      if v6["ESP Players"] then
        makeTextLabel2(value5, p5)
      end
    end))

    if value5.Character and v6["ESP Players"] then
      makeTextLabel2(value5, value5.Character)
    end

    return
  end
end

for index4, value6 in ipairs(players:GetPlayers()) do
  f7(value6)
end

players.PlayerAdded:Connect(f7)

players.PlayerRemoving:Connect(function(player2)
  f3(player2)
  f4(player2)
end)

task.spawn(function()
  while true do
    task.wait(0.6)

    pcall(function()
      if not v6["ESP Players"] then
        for index5, value7 in ipairs(players:GetPlayers()) do
          f3(value7)
        end
      else
        local character3 = localPlayer.Character

        local humanoidRootPart2 = character3
        humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")

        for index6, value8 in ipairs(players:GetPlayers()) do
          if value8 ~= localPlayer then
            local character4 = value8.Character

            if not character4 then
              f3(value8)
            else
              local v19 = false

              if not v12[value8] then
                v19 = true
              elseif v12[value8].Adornee ~= character4 then
                v19 = true
              end

              if v19 then
                makeTextLabel2(value8, character4)
              elseif humanoidRootPart2 and v13[value8] then
                local humanoidRootPart3 = character4:FindFirstChild("HumanoidRootPart")
                local dist2 = v13[value8]:FindFirstChild("Dist")

                if humanoidRootPart3 and dist2 then
                  local v20 = math.floor((humanoidRootPart2.Position
                    - humanoidRootPart3.Position).Magnitude)

                  dist2.Text = v20 .. " m"
                  dist2.TextColor3 = f5(v20)
                end
              end
            end
          end
        end
      end
    end)
  end
end)

local function makeTextButton(key2, layoutOrder, p6)
  local frame3 = Instance.new("Frame")
  frame3.Parent = scrollingFrame
  frame3.Size = UDim2.new(1, 0, 0, 36)
  frame3.BackgroundColor3 = color3
  frame3.BorderSizePixel = 0
  frame3.LayoutOrder = layoutOrder

  local uiCorner4 = Instance.new("UICorner")
  uiCorner4.CornerRadius = UDim.new(0, 8)
  uiCorner4.Parent = frame3

  local uiStroke3 = Instance.new("UIStroke")
  uiStroke3.Parent = frame3
  uiStroke3.Color = Color3.fromRGB(28, 28, 38)
  uiStroke3.Thickness = 1

  local textLabel4 = Instance.new("TextLabel")
  textLabel4.Parent = frame3
  textLabel4.Position = UDim2.new(0, 10, 0, 0)
  textLabel4.Size = UDim2.new(1, -82, 1, 0)
  textLabel4.BackgroundTransparency = 1
  textLabel4.Text = key2
  textLabel4.Font = Enum.Font.GothamBold
  textLabel4.TextSize = 12
  textLabel4.TextColor3 = color5
  textLabel4.TextXAlignment = Enum.TextXAlignment.Left
  textLabel4.TextYAlignment = Enum.TextYAlignment.Center

  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame3
  textButton2.Position = UDim2.new(1, -62, 0.5, -12)
  textButton2.Size = UDim2.new(0, 54, 0, 24)
  textButton2.BorderSizePixel = 0
  textButton2.AutoButtonColor = false
  textButton2.Font = Enum.Font.GothamBold
  textButton2.TextSize = 11
  textButton2.Active = true

  local uiCorner5 = Instance.new("UICorner")
  uiCorner5.CornerRadius = UDim.new(0, 6)
  uiCorner5.Parent = textButton2

  local function f8()
    if v6[key2] then
      textButton2.BackgroundColor3 = color
      textButton2.TextColor3 = color5
      textButton2.Text = "ON"
    else
      textButton2.BackgroundColor3 = color4
      textButton2.TextColor3 = Color3.fromRGB(140, 140, 155)
      textButton2.Text = "OFF"
    end
  end

  f8()

  textButton2.Activated:Connect(function()
    v6[key2] = not v6[key2]
    f8()

    if p6 then
      p6(v6[key2])
    end
  end)
end

makeTextButton("Auto Hit Speed", 1, function(p7)
  if p7 then
    makeTextLabel("🔥 Auto Hit Speed ACTIVADO", color6)
    v9 = 0

    v7.AutoHit = runService.Heartbeat:Connect(function()
      if os.clock() - v8 < 0.3 then
        return
      elseif not replicatedStorage:FindFirstChild("EggHitRequest") then
        return
      else
        local v21 = f2()

        if #v21 == 0 then
          return
        else
          local v22 = v21[1]
          v8 = os.clock()
          v9 = v9 + 1

          if os.clock() - v10 > 1.5 then
            v10 = os.clock()
            makeTextLabel("💥 " .. v22.nombre .. " (" .. v22.distancia .. " studs)", color6)
          end

          return
        end
      end
    end)
  else
    if v7.AutoHit then
      v7.AutoHit:Disconnect()
      v7.AutoHit = nil
    end

    makeTextLabel("Auto Hit Speed OFF (" .. v9 .. ")", color7)
  end
end)

makeTextButton("Noclip", 2, function(p8)
  if p8 then
    v7.Noclip = runService.Stepped:Connect(function()
      local character5 = localPlayer.Character

      if character5 then
        for index7, value9 in ipairs(character5:GetDescendants()) do
          if value9:IsA("BasePart") and value9.CanCollide then
            value9.CanCollide = false
          end
        end
      end
    end)
  else
    if v7.Noclip then
      v7.Noclip:Disconnect()
      v7.Noclip = nil
    end

    local character6 = localPlayer.Character

    if character6 then
      for index8, value10 in ipairs(character6:GetDescendants()) do
        if value10:IsA("BasePart") then
          value10.CanCollide = true
        end
      end
    end
  end
end)

makeTextButton("Walk Speed", 3, function(p9)
  local character7 = localPlayer.Character
  local humanoid = character7 and character7:FindFirstChildOfClass("Humanoid")

  if humanoid then
    humanoid.WalkSpeed = p9 and 60 or 16
  end
end)

makeTextButton("ESP Players", 4, nil)

local v23 = false
local udim = UDim2.new(0, 270, 0, 230)
local udim2 = UDim2.new(0, 270, 0, 52)

textButton.Activated:Connect(function()
  v23 = not v23

  if v23 then
    frame2.Visible = false
    main.Size = udim2
    textButton.Text = "+"
  else
    frame2.Visible = true
    main.Size = udim
    textButton.Text = "-"
  end
end)

local v24 = false
local position, position2

main.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v24 = true
    position = input.Position
    position2 = main.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        v24 = false
      end
    end)
  end
end)

local v25

main.InputChanged:Connect(function(input2)
  if input2.UserInputType == Enum.UserInputType.MouseMovement
    or input2.UserInputType == Enum.UserInputType.Touch then
    v25 = input2
  end
end)

userInputService.InputChanged:Connect(function(input3)
  if input3 == v25 and v24 then
    local v26 = input3.Position - position

    main.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v26.X, position2.Y.Scale,
      position2.Y.Offset + v26.Y
    )
  end
end)
