local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local runService = game:GetService("RunService")
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
main.Size = UDim2.new(0, 320, 0, 415)
main.Position = UDim2.new(0.5, -160, 0.5, -207)
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
textLabel.Size = UDim2.new(0, 85, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SCRIPT"
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 22
textLabel.TextColor3 = color5
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Center

local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = frame
textLabel2.Size = UDim2.new(0, 60, 1, 0)
textLabel2.Position = UDim2.new(0, 73, 0, 0)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "SSJ"
textLabel2.Font = Enum.Font.GothamBold
textLabel2.TextSize = 22
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
scrollingFrame.Size = UDim2.new(1, 0, 1, -50)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 2
scrollingFrame.ScrollBarImageColor3 = color
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollingFrame
uiListLayout.Padding = UDim.new(0, 6)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local uiPadding = Instance.new("UIPadding")
uiPadding.Parent = scrollingFrame
uiPadding.PaddingTop = UDim.new(0, 2)
uiPadding.PaddingBottom = UDim.new(0, 2)
uiPadding.PaddingLeft = UDim.new(0, 0)
uiPadding.PaddingRight = UDim.new(0, 0)

local function f2(text, p1, p2)
  local frame3 = Instance.new("Frame")
  frame3.Parent = scrollingFrame
  frame3.Size = UDim2.new(1, 0, 0, 40)
  frame3.BackgroundColor3 = color3
  frame3.BorderSizePixel = 0

  local uiCorner3 = Instance.new("UICorner")
  uiCorner3.CornerRadius = UDim.new(0, 9)
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
  textLabel3.TextSize = 14
  textLabel3.TextColor3 = color5
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.TextYAlignment = Enum.TextYAlignment.Center

  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame3
  textButton2.Position = UDim2.new(1, -74, 0.5, -13)
  textButton2.Size = UDim2.new(0, 64, 0, 26)
  textButton2.BorderSizePixel = 0
  textButton2.AutoButtonColor = false
  textButton2.Font = Enum.Font.GothamBold
  textButton2.TextSize = 12

  local uiCorner4 = Instance.new("UICorner")
  uiCorner4.CornerRadius = UDim.new(0, 7)
  uiCorner4.Parent = textButton2

  local v1 = p2 or false

  local function f3()
    if v1 then
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
    v1 = not v1
    f3()

    if p1 then
      task.spawn(function() pcall(function() p1(v1) end) end)
    end
  end)

  return function() return v1 end
end

local v2 = false
local v3 = false
local v4 = false
local v5 = false
f2("Kill Aura", function(p3) v5 = p3 end, false)

task.spawn(function()
  while true do
    if v5 then
      pcall(function()
        local character = localPlayer.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        local tool = character and character:FindFirstChildOfClass("Tool")

        if humanoidRootPart and tool then
          local v6 = {}

          for index, value in ipairs(workspaceService:GetDescendants()) do
            if value:IsA("Model") and value ~= character then
              local humanoid = value:FindFirstChildOfClass("Humanoid")

              local humanoidRootPart2 = value:FindFirstChild("HumanoidRootPart")
                or value:FindFirstChild("Torso") or value:FindFirstChild("UpperTorso")

              if humanoid and humanoid.Health > 0 and humanoidRootPart2 then
                local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

                if magnitude <= 300 then
                  table.insert(v6, { model = value, dist = magnitude })
                end
              end
            end
          end



          table.sort(v6, function(p4, p5) return p4.dist < p5.dist end)
          local count = 0

          for index2, value2 in ipairs(v6) do
            if count >= 1 then
              break
            end

            tool:Activate()

            pcall(function()
              virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
              task.wait()
              virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end)

            count = count + 1
          end
        end
      end)

      task.wait(0.2)
    else
      task.wait(0.5)
    end
  end
end)

f2("Fast Fire", function(p6)
  v2 = p6

  if p6 then
    task.spawn(function()
      while v2 do
        pcall(function()
          if not v2 then
            return
          else
            if type(getgc) == "function" then
              for key, value3 in pairs(getgc(true)) do
                local v7 = value3

                if type(v7) == "table" then
                  pcall(function()
                    if rawget(v7, "FireRate") then
                      v7.FireRate = 0
                    end

                    if rawget(v7, "Cooldown") then
                      v7.Cooldown = 0
                    end
                  end)
                end
              end
            end

            local character2 = localPlayer.Character

            local tool2 = character2
            tool2 = character2 and character2:FindFirstChildOfClass("Tool")

            if tool2 and v2 then
              for index3, value4 in ipairs(tool2:GetDescendants()) do
                local v8 = value4

                pcall(function()
                  if v8:IsA("NumberValue") or v8:IsA("DoubleConstrainedValue") then
                    local v9 = string.lower(v8.Name)

                    if v9:find("cooldown") or v9:find("rate") or v9:find("delay")
                      or v9:find("fire") then
                      v8.Value = 0
                    end
                  end
                end)
              end

              tool2:Activate()
            end

            return
          end
        end)

        task.wait(0.25)
      end
    end)
  end
end, false)

local part, connect

f2("SafeZone", function(p7)
  local character3 = localPlayer.Character
  local humanoidRootPart3 = character3 and character3:FindFirstChild("HumanoidRootPart")

  if p7 then
    if humanoidRootPart3 then
      part = Instance.new("Part")
      part.Size = Vector3.new(10, 1, 10)
      part.Position = humanoidRootPart3.Position + Vector3.new(0, 8, 0)
      part.Anchored = true
      part.CanCollide = true
      part.Transparency = 1
      part.Parent = workspaceService

      humanoidRootPart3.CFrame = part.CFrame + Vector3.new(0, 3, 0)

      connect = runService.Heartbeat:Connect(function()
        if humanoidRootPart3 and part then
          part.Position = Vector3.new(
            humanoidRootPart3.Position.X, humanoidRootPart3.Position.Y - 3.5,
            humanoidRootPart3.Position.Z
          )
        end
      end)
    end
  else
    if connect then
      connect:Disconnect()
      connect = nil
    end

    if part then
      part:Destroy()
      part = nil
    end

    if humanoidRootPart3 then
      humanoidRootPart3.AssemblyLinearVelocity = Vector3.new(0, -6, 0)
    end
  end
end, false)

f2("Velocidad", function(p8)
  local character4 = localPlayer.Character
  local humanoid2 = character4 and character4:FindFirstChildOfClass("Humanoid")

  if humanoid2 then
    humanoid2.WalkSpeed = p8 and 50 or 16
  end
end, false)

f2("Health Upgrade", function(p9)
  v3 = p9

  task.spawn(function()
    while v3 do
      pcall(function()
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
        task.wait(0.05)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
      end)

      task.wait(0.5)
    end
  end)
end, false)

f2("Weapon Upgrade", function(p10)
  v4 = p10

  task.spawn(function()
    while v4 do
      pcall(function()
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.V, false, game)
        task.wait(0.05)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.V, false, game)
      end)

      task.wait(0.5)
    end
  end)
end, false)

local textButton3 = Instance.new("TextButton")
textButton3.Parent = frame2
textButton3.Position = UDim2.new(0, 0, 1, -40)
textButton3.Size = UDim2.new(1, 0, 0, 38)
textButton3.BackgroundColor3 = color
textButton3.BorderSizePixel = 0
textButton3.Text = "Save Config"
textButton3.TextColor3 = color5
textButton3.Font = Enum.Font.GothamBold
textButton3.TextSize = 14
textButton3.AutoButtonColor = false

local uiCorner5 = Instance.new("UICorner")
uiCorner5.CornerRadius = UDim.new(0, 9)
uiCorner5.Parent = textButton3

local v10 = false
local udim = UDim2.new(0, 320, 0, 415)
local udim2 = UDim2.new(0, 320, 0, 60)

textButton.Activated:Connect(function()
  v10 = not v10

  if v10 then
    frame2.Visible = false
    main.Size = udim2
    textButton.Text = "+"
  else
    frame2.Visible = true
    main.Size = udim
    textButton.Text = "-"
  end
end)

local v11 = false
local position, position2

main.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v11 = true
    position = input.Position
    position2 = main.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        v11 = false
      end
    end)
  end
end)

local v12

main.InputChanged:Connect(function(input2)
  if input2.UserInputType == Enum.UserInputType.MouseMovement
    or input2.UserInputType == Enum.UserInputType.Touch then
    v12 = input2
  end
end)

userInputService.InputChanged:Connect(function(input3)
  if input3 == v12 and v11 then
    local v13 = input3.Position - position

    main.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v13.X, position2.Y.Scale,
      position2.Y.Offset + v13.Y
    )
  end
end)
