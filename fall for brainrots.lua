local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local virtualInputManager = game:GetService("VirtualInputManager")
local players = game:GetService("Players")
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
main.Size = UDim2.new(0, 320, 0, 480)
main.Position = UDim2.new(0.5, -160, 0.5, -225)
main.BackgroundColor3 = color2
main.BorderSizePixel = 0
main.ClipsDescendants = true

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
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
    uiScale.Scale = math.clamp(currentCamera.ViewportSize.X / 430, 0.68, 1)
  end
end

f1()

if currentCamera then
  currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(f1)
end

local frame = Instance.new("Frame")
frame.Parent = main
frame.Size = UDim2.new(1, -24, 0, 45)
frame.Position = UDim2.new(0, 12, 0, 8)
frame.BackgroundTransparency = 1

local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame
textLabel.Size = UDim2.new(0, 75, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SCRIPT"
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 20
textLabel.TextColor3 = color5
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Center

local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = frame
textLabel2.Size = UDim2.new(0, 60, 1, 0)
textLabel2.Position = UDim2.new(0, 68, 0, 0)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "SSJ"
textLabel2.Font = Enum.Font.GothamBold
textLabel2.TextSize = 20
textLabel2.TextColor3 = color
textLabel2.TextXAlignment = Enum.TextXAlignment.Left
textLabel2.TextYAlignment = Enum.TextYAlignment.Center

local uiStroke2 = Instance.new("UIStroke")
uiStroke2.Parent = textLabel2
uiStroke2.Color = Color3.fromRGB(0, 0, 0)
uiStroke2.Thickness = 1.5
uiStroke2.Transparency = 0

local textButton = Instance.new("TextButton")
textButton.Parent = frame
textButton.Size = UDim2.new(0, 32, 0, 32)
textButton.Position = UDim2.new(1, -32, 0.5, -16)
textButton.BackgroundColor3 = color
textButton.BorderSizePixel = 0
textButton.Text = "-"
textButton.TextColor3 = color5
textButton.Font = Enum.Font.GothamBold
textButton.TextSize = 18
textButton.AutoButtonColor = false

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 9)
uiCorner2.Parent = textButton

local frame2 = Instance.new("Frame")
frame2.Parent = main
frame2.Position = UDim2.new(0, 12, 0, 55)
frame2.Size = UDim2.new(1, -24, 1, -63)
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
uiListLayout.Padding = UDim.new(0, 5)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local uiPadding = Instance.new("UIPadding")
uiPadding.Parent = scrollingFrame
uiPadding.PaddingTop = UDim.new(0, 2)
uiPadding.PaddingBottom = UDim.new(0, 4)

local v1 = {
  ["Find Celestial"] = false,
  ["Find Eternal"] = false,
  ["Find Abyssal"] = false,
  ["Find Transcendent"] = false,
  ["Find Supreme"] = false,
  ["Find Infinity"] = false,
  ["x4 Train"] = false,
  ["Collect Cash"] = false,
  ["Upgrade All"] = false,
  ["Auto Rebirth"] = false,
}

local function f2(p1, layoutOrder)
  local frame3 = Instance.new("Frame")
  frame3.Parent = scrollingFrame
  frame3.Size = UDim2.new(1, 0, 0, 37)
  frame3.BackgroundColor3 = color3
  frame3.BorderSizePixel = 0
  frame3.LayoutOrder = layoutOrder

  local uiCorner3 = Instance.new("UICorner")
  uiCorner3.CornerRadius = UDim.new(0, 8)
  uiCorner3.Parent = frame3

  local uiStroke3 = Instance.new("UIStroke")
  uiStroke3.Parent = frame3
  uiStroke3.Color = Color3.fromRGB(28, 28, 38)
  uiStroke3.Thickness = 1

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Parent = frame3
  textLabel3.Position = UDim2.new(0, 12, 0, 0)
  textLabel3.Size = UDim2.new(1, -95, 1, 0)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = p1
  textLabel3.Font = Enum.Font.GothamBold
  textLabel3.TextSize = 12
  textLabel3.TextColor3 = color5
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.TextYAlignment = Enum.TextYAlignment.Center

  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame3
  textButton2.Position = UDim2.new(1, -74, 0.5, -12)
  textButton2.Size = UDim2.new(0, 64, 0, 24)
  textButton2.BorderSizePixel = 0
  textButton2.AutoButtonColor = false
  textButton2.Font = Enum.Font.GothamBold
  textButton2.TextSize = 11

  local uiCorner4 = Instance.new("UICorner")
  uiCorner4.CornerRadius = UDim.new(0, 6)
  uiCorner4.Parent = textButton2

  local function f3()
    if v1[p1] then
      textButton2.BackgroundColor3 = color
      textButton2.TextColor3 = color5
      textButton2.Text = "ON"
    else
      textButton2.BackgroundColor3 = color4
      textButton2.TextColor3 = Color3.fromRGB(140, 140, 155)
      textButton2.Text = "OFF"
    end
  end

  f3()

  textButton2.Activated:Connect(function()
    v1[p1] = not v1[p1]
    f3()
  end)
end

f2("Find Celestial", 1)
f2("Find Eternal", 2)
f2("Find Abyssal", 3)
f2("Find Transcendent", 4)
f2("Find Supreme", 5)
f2("Find Infinity", 6)
f2("x4 Train", 7)
f2("Collect Cash", 8)
f2("Upgrade All", 9)
f2("Auto Rebirth", 10)

local v2 = {
  Celestial = Vector3.new(112.57, 5202.75, -2310.28),
  Eternal = Vector3.new(256.37, 2087.89, -2011.18),
  Abyssal = Vector3.new(267.19, -1912.23, -1984.32),
  Transcendent = Vector3.new(281.91, -6921.51, -1949.94),
  Supreme = Vector3.new(281.9, -11016.41, -1949.94),
  Infinity = Vector3.new(281.93, -15111.51, -1949.94),
}

local vector = Vector3.new(116.55, 14591.4, -2602.45)

local function f4(p2, p3)
  if not p2 then
    return false
  else
    local lower = p2:lower()

    for key, value in pairs(p3) do
      if lower:find(key:lower(), 1, true) then
        return true
      end
    end

    return false
  end
end

local function f5()
  local brainrotStorage = replicatedStorage:FindFirstChild("BrainrotStorage")
  local events = brainrotStorage and brainrotStorage:FindFirstChild("Events")
  return events and events:FindFirstChild("GetCarriedBrainrots")
end

local function f6(p4, p5, p6, p7)
  local count = 0

  while count < 5 and p5.Parent and p6.Parent and v1[p7] do
    p4.CFrame = p6.CFrame + Vector3.new(0, 1.5, 0)
    pcall(function()
      fireproximityprompt(p5)
    end)
    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.05)
    virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    count = count + 1
  end

  local v3 = f5()
  local count2 = 0

  while count2 < 10 and v1[p7] do
    p4.CFrame = CFrame.new(vector + Vector3.new(0, 3, 0))

    if v3 then
      pcall(function()
        v3:FireServer()
      end)
    end

    task.wait(0.3)
    count2 = count2 + 1
  end

  task.wait(0.5)
end

local function f7(p8)
  for index, value2 in ipairs(workspaceService:GetDescendants()) do
    if value2:IsA("ProximityPrompt") then
      local parent = value2.Parent

      if parent then
        local limitedItemPad = workspaceService:FindFirstChild("LimitedItemPad")
        local limitedItemPadSmall = workspaceService:FindFirstChild("LimitedItemPadSmall")
        local v4 = false

        if limitedItemPad and parent:IsDescendantOf(limitedItemPad)
          or limitedItemPadSmall and parent:IsDescendantOf(limitedItemPadSmall) then
          v4 = true
        end

        if not v4 then
          local model = parent:FindFirstAncestorWhichIsA("Model")

          if model and (model.Name == "LimitedItemPad" or model.Name == "LimitedItemPadSmall") then
            v4 = true
          end



          if not v4 then
            local v5 = parent.Name .. " " .. tostring(value2.ObjectText) .. " "
              .. tostring(value2.ActionText)

            if model then
              v5 = v5 .. " " .. model.Name
            end

            if f4(v5, p8) then
              local basePart = parent:IsA("BasePart") and parent
                or parent:FindFirstChildWhichIsA("BasePart", true)
                or model and model.PrimaryPart

              if basePart then
                return value2, basePart
              end
            end
          end
        end
      end
    end
  end

  return nil, nil
end

local function f8(p9, p10)
  task.spawn(function()
    while true do
      task.wait(0.3)

      pcall(function()
        if not v1[p9] then
          return
        else
          local character = localPlayer.Character

          if not character or not character:FindFirstChild("HumanoidRootPart") then
            return
          else
            local humanoidRootPart = character.HumanoidRootPart
            local v6, v7 = f7(p10)

            if v6 and v7 then
              f6(humanoidRootPart, v6, v7, p9)
            else
              for key2, value3 in pairs(v2) do
                if not v1[p9] then
                  break
                else
                  humanoidRootPart.CFrame = CFrame.new(value3 + Vector3.new(0, 5, 0))
                  task.wait(0.4)
                  local v8, v9 = f7(p10)

                  if v8 and v9 then
                    f6(humanoidRootPart, v8, v9, p9)
                    break
                  end
                end
              end
            end

            return
          end
        end
      end)
    end
  end)
end

f8("Find Celestial", {
  ["Pipi Potato"] = true,
  ["Strawberry Elephant"] = true,
  ["Ketupat Kepat"] = true,
  ["Karkerkar Kurkur"] = true,
  ["Tik Tak Sahur"] = true,
  ["Crazylone Pizaione"] = true,
  ["Spaghetti Tualetti"] = true,
})

f8("Find Eternal", {
  ["Guerriro Digitale"] = true,
  Pepe = true,
  ["Triplito Tralaleritos"] = true,
  Pakrahmatmamat = true,
  ["Banana Dancana"] = true,
  ["Chillin Chili"] = true,
  ["Zibra Zubra Zibralini"] = true,
  ["Pandaccini Bananini"] = true,
})

f8("Find Abyssal", {
  ["W Or L"] = true,
  Lerulerulerule = true,
  ["Quesadilla Crocodila"] = true,
  ["Swag Soda"] = true,
  ["Illuminato Triangolo"] = true,
  ["Noo My Examen"] = true,
  Pakrahmatmatina = true,
  ["Chicleteirina Bicicleteirina"] = true,
  ["Cachorrito Melonito"] = true,
})

f8("Find Transcendent", {
  ["Bananini Kittini"] = true,
  ["Nyannini Cattalini"] = true,
  ["Brri Brri Bicus Dicus"] = true,
  ["1x1x1x1"] = true,
  Tralaledon = true,
  ["Smurfo Gatto"] = true,
  Meowl = true,
  ["Tirilikalika Tirilikalako"] = true,
  ["Tralalita Tralala"] = true,
})

f8("Find Supreme", {
  ["Los Grande Combinatros"] = true,
  Madudung = true,
  ["Los Esok Sekolah"] = true,
  ["Bobrito Bandito"] = true,
  ["Trippi Troppi Troppa Trippa"] = true,
  Garamararam = true,
})

f8("Find Infinity", {
  ["Girafa Celeste"] = true,
  ["Guest 666"] = true,
  ["John Pork"] = true,
  ["Skibidi Toilet"] = true,
  ["Compactoroni Diskaloni"] = true,
})

task.spawn(function()
  while true do
    task.wait(0.2)

    pcall(function()
      local humanoidRootPart2

      if not v1["Collect Cash"] then
        return
      else
        local character2 = localPlayer.Character
        humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart2 then
          return
        end

        for index2, value4 in ipairs(workspaceService:GetDescendants()) do
          local v10 = value4

          if not v1["Collect Cash"] then
            break
          elseif v10:IsA("BasePart") and v10.Name == "CollectTouch" then
            pcall(function()
              firetouchinterest(humanoidRootPart2, v10, 0)
              firetouchinterest(humanoidRootPart2, v10, 1)
            end)
          end
        end

        return
      end
    end)
  end
end)

task.spawn(function()
  while true do
    task.wait(1)

    pcall(function()
      if not v1["Upgrade All"] then
        return
      else
        local events2 = replicatedStorage:FindFirstChild("BrainrotStorage")
          and replicatedStorage.BrainrotStorage:FindFirstChild("Events")

        if events2 then
          if events2:FindFirstChild("RequestSlotUpgrade") then
            task.spawn(function()
            end)
          end
        end

        return
      end
    end)
  end
end)

task.spawn(function()
  while true do
    task.wait(1)

    pcall(function()
      local requestRebirth

      if not v1["Auto Rebirth"] then
        return
      else
        local events3 = replicatedStorage:FindFirstChild("BrainrotStorage")
          and replicatedStorage.BrainrotStorage:FindFirstChild("Events")

        if events3 then
          requestRebirth = events3:FindFirstChild("RequestRebirth")

          if requestRebirth then
            pcall(function()
              requestRebirth:FireServer()
            end)
          end
        end

        return
      end
    end)
  end
end)

task.spawn(function()
  while true do
    pcall(function()
      local events4 = replicatedStorage:FindFirstChild("BrainrotStorage")
        and replicatedStorage.BrainrotStorage:FindFirstChild("Events")

      local portal4xClaim, portalKey

      if events4 and v1["x4 Train"] then
        portal4xClaim = events4:FindFirstChild("Portal4xClaim")

        if portal4xClaim then
          portalKey = nil
          local character3 = localPlayer.Character

          if character3 then
            for index3, value5 in ipairs(character3:GetChildren()) do
              if value5:IsA("Tool") and value5:GetAttribute("PortalKey") then
                portalKey = value5:GetAttribute("PortalKey")
                break
              end
            end
          end

          if not portalKey then
            local backpack = localPlayer:FindFirstChild("Backpack")

            if backpack then
              for index4, value6 in ipairs(backpack:GetChildren()) do
                if value6:IsA("Tool") and value6:GetAttribute("PortalKey") then
                  portalKey = value6:GetAttribute("PortalKey")
                  break
                end
              end
            end
          end

          if portalKey then
            pcall(function()
              portal4xClaim:FireServer(portalKey)
            end)
          end
        end
      end
    end)

    task.wait(0.35)
  end
end)

local v11 = false
local udim = UDim2.new(0, 320, 0, 480)
local udim2 = UDim2.new(0, 320, 0, 60)

textButton.Activated:Connect(function()
  v11 = not v11

  if v11 then
    frame2.Visible = false
    main.Size = udim2
    textButton.Text = "+"
  else
    frame2.Visible = true
    main.Size = udim
    textButton.Text = "-"
  end
end)

local v12 = false
local position, position2

main.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v12 = true
    position = input.Position
    position2 = main.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        v12 = false
      end
    end)
  end
end)

local v13

main.InputChanged:Connect(function(input2)
  if input2.UserInputType == Enum.UserInputType.MouseMovement
    or input2.UserInputType == Enum.UserInputType.Touch then
    v13 = input2
  end
end)

userInputService.InputChanged:Connect(function(input3)
  if input3 == v13 and v12 then
    local v14 = input3.Position - position

    main.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v14.X, position2.Y.Scale,
      position2.Y.Offset + v14.Y
    )
  end
end)
