local players = game:GetService("Players")
local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = players.LocalPlayer
local v1 = table.unpack or unpack

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
main.Size = UDim2.new(0, 320, 0, 313)
main.Position = UDim2.new(0.5, -160, 0.5, -190)
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
textLabel2.Size = UDim2.new(0, 80, 1, 0)
textLabel2.Position = UDim2.new(0, 67, 0, 0)
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

local function f2(text, layoutOrder, p1, p2)
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
  textLabel3.Text = text
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

  local v2 = p1 or false

  local function f3()
    if v2 then
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
    v2 = not v2
    f3()

    if p2 then
      p2(v2)
    end
  end)
end

function Eggs()
  spawn(function()
    _G.Eggs = true

    while _G.Eggs do
      function v446()
        local v3 = -math.huge
        local eggField = workspace.EggField
        local v4

        for key, value in pairs(eggField:GetDescendants()) do
          if value.Name == "Hitbox" then
            local y = value.Position.Y

            if v3 < y then
              v4 = value
              v3 = y
            end
          end
        end

        if v4 then
          players.LocalPlayer.Character.HumanoidRootPart.CFrame = v4.CFrame
          wait(0.2)
          fireproximityprompt(v4.ProximityPrompt)
          wait(0.2)
          players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.REQUIRED.SpawnLocation.CFrame
        end

        wait(1)
      end

      wait()
    end
  end)
end



function Place()
  spawn(function()
    _G.Place = true

    while _G.Place do
      function v521()
        local localPlayer2 = players.LocalPlayer
        local character = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
        local v5, v6, v7 = pairs(localPlayer2.Backpack:GetChildren())
        local v8, v9, tool

        repeat
          v7, v9 = v5(v6, v7)

          if not v7 then
            v8 = true
          end

          if v8 then
            break
          end

          tool = v9:IsA("Tool")

          if tool then
            tool = string.find(v9.Name, "Egg")
          end
        until tool

        local v10

        if not v8 then
          v10 = v9
        end

        if not v10 then
          for key2, value2 in pairs(character:GetChildren()) do
            local tool2 = value2:IsA("Tool")

            if tool2 then
              tool2 = string.find(value2.Name, "Egg")
            end

            if tool2 then
              v10 = value2
              break
            end
          end
        end

        if v10 then
          local id = v10:GetAttribute("Id")
          local plot = localPlayer2:GetAttribute("Plot")

          replicatedStorage.Packages._Index:FindFirstChild("leifstout_networker@0.3.1").networker._remotes.EggService.RemoteEvent:FireServer(v1({
            unpack({ "placeEgg", id, workspace.REQUIRED.Instances.Plots[plot].Plate.Position }),
          }))
        end

        wait(0.2)
      end

      wait()
    end
  end)
end

function Hatch()
  spawn(function()
    _G.Hatch = true

    while _G.Hatch do
      function v575()
        local localPlayer3 = players.LocalPlayer

        for key3, value3 in pairs(workspace.REQUIRED.Instances.Plots[localPlayer3:GetAttribute("Plot")]:GetChildren()) do
          local v11 = value3.Name == "egg"

          if v11 then
            v11 = value3.Hitbox.ProximityPrompt.ActionText == "Hatch"
          end

          if v11 then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = value3.Hitbox.CFrame
            wait(0.2)
            fireproximityprompt(value3.Hitbox.ProximityPrompt)
            wait(0.2)
          end
        end

        wait(1)
      end

      wait()
    end
  end)
end

function Equip()
  spawn(function()
    _G.Equip = true

    while _G.Equip do
      function v599()
        replicatedStorage.Packages._Index:FindFirstChild("leifstout_networker@0.3.1").networker._remotes.PenService.RemoteEvent:FireServer(v1({
          unpack({ "equipBest" }),
        }))

        wait(2)
      end

      wait()
    end
  end)
end

function Upgrade()
  spawn(function()
    _G.Upgrade = true

    while _G.Upgrade do
      function v619()
        replicatedStorage.Packages._Index:FindFirstChild("leifstout_networker@0.3.1").networker._remotes.UpgradeService.RemoteEvent:FireServer(v1({
          unpack({ "tryUpgrade", "pen" }),
        }))

        replicatedStorage.Packages._Index:FindFirstChild("leifstout_networker@0.3.1").networker._remotes.UpgradeService.RemoteEvent:FireServer(unpack({
          "tryUpgrade", "training",
        }))

        wait(1)
      end

      wait()
    end
  end)
end

function ClaimBonus()
  spawn(function()
    _G.ClaimBonus = true

    while _G.ClaimBonus do
      wait()

      pcall(function()
        replicatedStorage.Packages._Index:FindFirstChild("leifstout_networker@0.3.1").networker._remotes.TrainingService.RemoteEvent:FireServer("claimBonus")
        wait(0.5)
      end)
    end
  end)
end

f2("Find Eggs", 1, false, function(p3)
  _G.Eggs = p3
  print("Eggs:", p3)

  if p3 then
    Eggs()
  end
end)

f2("Auto Place", 2, false, function(p4)
  _G.Place = p4
  print("Place:", p4)

  if p4 then
    Place()
  end
end)

f2("Auto Hatch", 3, false, function(p5)
  _G.Hatch = p5
  print("Hatch:", p5)

  if p5 then
    Hatch()
  end
end)

f2("Equip Best", 4, false, function(p6)
  _G.Equip = p6
  print("Equip:", p6)

  if p6 then
    Equip()
  end
end)

f2("Upgrade All", 5, false, function(p7)
  _G.Upgrade = p7
  print("Upgrade:", p7)

  if p7 then
    Upgrade()
  end
end)

f2("Claim Bonus x2", 6, false, function(p8)
  _G.ClaimBonus = p8
  print("ClaimBonus:", p8)

  if p8 then
    ClaimBonus()
  end
end)

local v12 = false
local udim = UDim2.new(0, 320, 0, 313)
local udim2 = UDim2.new(0, 320, 0, 60)

textButton.Activated:Connect(function()
  v12 = not v12

  if v12 then
    frame2.Visible = false
    main.Size = udim2
    textButton.Text = "+"
  else
    frame2.Visible = true
    main.Size = udim
    textButton.Text = "-"
  end
end)

local v13 = false
local position, position2

main.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v13 = true
    position = input.Position
    position2 = main.Position
  end
end)

userInputService.InputChanged:Connect(function(input2)
  if v13
    and (input2.UserInputType == Enum.UserInputType.MouseMovement
      or input2.UserInputType == Enum.UserInputType.Touch) then
    local v14 = input2.Position - position

    main.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v14.X, position2.Y.Scale,
      position2.Y.Offset + v14.Y
    )
  end
end)

userInputService.InputEnded:Connect(function(input3)
  if input3.UserInputType == Enum.UserInputType.MouseButton1
    or input3.UserInputType == Enum.UserInputType.Touch then
    v13 = false
  end
end)
