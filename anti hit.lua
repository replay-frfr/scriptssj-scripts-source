local proximityPromptService = game:GetService("ProximityPromptService")
local runService = game:GetService("RunService")
local workspaceService = game:GetService("Workspace")
local statsService = game:GetService("Stats")
local userInputService = game:GetService("UserInputService")
local coreGui = game:GetService("CoreGui")
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local v1 = {}
local v2 = unpack or table.unpack

v1.value1 = tweenService
v1.value3 = proximityPromptService
v1.value4 = runService
v1.value5 = workspaceService
v1.value6 = statsService
v1.value9 = userInputService
v1.value10 = players.LocalPlayer
v1.value11 = v1.value5.CurrentCamera
v1.value2 = nil

pcall(function() v1.value2 = gethui() end)

if not v1.value2 then
  pcall(function() v1.value2 = coreGui end)
end

if not v1.value2 then
  v1.value2 = v1.value10:WaitForChild("PlayerGui")
end

v1.value18 = {
  CFrame.new(4747.71, 70.57, -335.25), CFrame.new(3520.94, 70.73, -343.74),
  CFrame.new(2446.02, 70.88, -351.18), CFrame.new(1352.11, 71.02, -358.75),
  v2({ CFrame.new(544.49, 71.13, -364.34) }),
}

v1.value19 = false
v1.value20 = nil
v1.value21 = {}
v1.value22 = {}

local function f1()
  local character = v1.value10.Character

  if not character then
    return
  end

  local humanoid = character:FindFirstChildOfClass("Humanoid")
  local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
  local cframe, connect, v3

  if not humanoid or not humanoidRootPart then
    return
  else
    cframe = v1.value11.CFrame
    local cameraType = v1.value11.CameraType

    v1.value11.CameraType = Enum.CameraType.Scriptable
    v1.value11.CFrame = cframe

    humanoid.BreakJointsOnDeath = false

    for index, value in ipairs(character:GetDescendants()) do
      if value:IsA("Motor6D") then
        value.Enabled = true
      end
    end

    connect = nil

    humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    humanoidRootPart.AssemblyAngularVelocity = Vector3.zero

    for index2, value2 in ipairs(v1.value18) do
      humanoid.PlatformStand = true
      humanoid.Health = 100

      humanoidRootPart.CFrame = value2
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero

      v1.value11.CFrame = cframe
      task.wait(0.02)
    end

    v3 = os.clock()

    connect = v1.value4.Heartbeat:Connect(function()
      if os.clock() - v3 > 0.35 then
        connect:Disconnect()
        return
      end

      humanoid.Health = 100
      humanoid.PlatformStand = true

      humanoidRootPart.CFrame = v1.value18[#v1.value18]
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
      humanoidRootPart.AssemblyAngularVelocity = Vector3.zero

      v1.value11.CFrame = cframe
    end)

    task.wait(0.35)
    humanoid.PlatformStand = false
    v1.value11.CameraType = cameraType
    return
  end
end

local function f2(p1)
  if not (p1 and typeof(p1) == "Instance" and p1:IsA("ProximityPrompt")) then
    return
  end

  if v1.value19 then
    if v1.value21[p1] == nil then
      v1.value21[p1] = p1.HoldDuration
    end

    p1.HoldDuration = 0
    p1.RequiresLineOfSight = false

    return
  end

  if v1.value21[p1] ~= nil then
    p1.HoldDuration = v1.value21[p1]
    v1.value21[p1] = nil
  end
end

local function f3(p2)
  if p2 then
    for index3, value3 in ipairs(v1.value5:GetDescendants()) do
      f2(value3)
    end

    local descendantAdded = v1.value5.DescendantAdded
    table.insert(v1.value22, descendantAdded:Connect(f2))
    local promptShown = v1.value3.PromptShown
    table.insert(v1.value22, promptShown:Connect(f2))
    return
  end

  for index4, value4 in ipairs(v1.value22) do
    if value4 then
      value4:Disconnect()
    end
  end

  v1.value22 = {}

  for key, value5 in pairs(v1.value21) do
    if key and key.Parent then
      key.HoldDuration = value5
    end
  end

  v1.value21 = {}
end

if v1.value2:FindFirstChild("DreyvidHub") then
  v1.value2.DreyvidHub:Destroy()
end

function v1.value24()
  local v4 = {}
  v4.value1 = Instance.new("ScreenGui")
  v4.value1.Name = "DreyvidHub"
  v4.value1.ResetOnSpawn = false
  v4.value1.Parent = v1.value2
  v4.value2 = Instance.new("Frame")
  v4.value2.Size = UDim2.new(0, 0, 0, 0)
  v4.value2.Position = UDim2.new(0.5, 0, 0.5, 0)
  v4.value2.AnchorPoint = Vector2.new(0.5, 0.5)
  v4.value2.BackgroundTransparency = 1
  v4.value2.ZIndex = 1
  v4.value2.Parent = v4.value1
  v4.value12 = Instance.new("Frame")
  v4.value12.Size = UDim2.new(0, 240, 0, 110)
  v4.value12.Position = UDim2.new(0.5, -120, 0.5, -55)
  v4.value12.BackgroundColor3 = Color3.fromRGB(8, 5, 15)
  v4.value12.BackgroundTransparency = 0.1
  v4.value12.BorderSizePixel = 0
  v4.value12.ZIndex = 1
  v4.value12.Parent = v4.value2

  local uiCorner = Instance.new("UICorner")
  uiCorner.CornerRadius = UDim.new(0, 14)
  uiCorner.Parent = v4.value12

  local uiStroke = Instance.new("UIStroke")
  uiStroke.Color = Color3.fromRGB(200, 0, 255)
  uiStroke.Thickness = 2.5
  uiStroke.Transparency = 0
  uiStroke.Parent = v4.value12

  task.spawn(function()
    while v4.value12.Parent do
      v1.value1:Create(
        uiStroke, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { Transparency = 0, Thickness = 3.5 }
      ):Play()



      task.wait(0.4)

      v1.value1:Create(
        uiStroke, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        { Transparency = 0.6, Thickness = 1.5 }
      ):Play()

      task.wait(0.4)
    end
  end)

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(1, 0, 0, 28)
  frame.BackgroundColor3 = Color3.fromRGB(15, 5, 25)
  frame.BackgroundTransparency = 0.3
  frame.BorderSizePixel = 0
  frame.ZIndex = 2
  frame.Parent = v4.value12

  local uiCorner2 = Instance.new("UICorner")
  uiCorner2.CornerRadius = UDim.new(0, 14)
  uiCorner2.Parent = frame

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(1, 0, 1, 0)
  frame2.BackgroundTransparency = 1
  frame2.ZIndex = 3
  frame2.Parent = frame

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(0.5, 0, 1, 0)
  textLabel.Position = UDim2.new(0, 0, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "SCRIPT"
  textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextSize = 18
  textLabel.TextXAlignment = Enum.TextXAlignment.Right
  textLabel.TextStrokeTransparency = 0.7
  textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textLabel.ZIndex = 3
  textLabel.Parent = frame2

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(0.5, 0, 1, 0)
  textLabel2.Position = UDim2.new(0.5, 1, 0, 0)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "SSJ"
  textLabel2.TextColor3 = Color3.fromRGB(170, 0, 255)
  textLabel2.Font = Enum.Font.GothamBold
  textLabel2.TextSize = 18
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.TextStrokeTransparency = 0.7
  textLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
  textLabel2.ZIndex = 3
  textLabel2.Parent = frame2

  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, -20, 1, -38)
  frame3.Position = UDim2.new(0, 10, 0, 32)
  frame3.BackgroundTransparency = 1
  frame3.ZIndex = 2
  frame3.Parent = v4.value12

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Size = UDim2.new(1, 0, 0, 22)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = "SCRIPTSSJ • ANTI-HIT"
  textLabel3.TextColor3 = Color3.fromRGB(240, 244, 255)
  textLabel3.Font = Enum.Font.GothamBold
  textLabel3.TextSize = 15
  textLabel3.TextXAlignment = Enum.TextXAlignment.Center
  textLabel3.ZIndex = 3
  textLabel3.Parent = frame3

  v4.value24 = Instance.new("TextButton")
  v4.value24.Size = UDim2.new(1, 0, 0, 32)
  v4.value24.Position = UDim2.new(0, 0, 1, -36)
  v4.value24.BackgroundColor3 = Color3.fromRGB(25, 20, 35)
  v4.value24.Text = "OFF"
  v4.value24.TextColor3 = Color3.fromRGB(200, 200, 200)
  v4.value24.Font = Enum.Font.GothamBold
  v4.value24.TextSize = 14
  v4.value24.AutoButtonColor = false
  v4.value24.ZIndex = 3
  v4.value24.Parent = frame3

  local uiCorner3 = Instance.new("UICorner")
  uiCorner3.CornerRadius = UDim.new(0, 8)
  uiCorner3.Parent = v4.value24

  local uiStroke2 = Instance.new("UIStroke")
  uiStroke2.Color = Color3.fromRGB(80, 60, 100)
  uiStroke2.Thickness = 1.5
  uiStroke2.Transparency = 0.4
  uiStroke2.Parent = v4.value24

  function v4.value26(p3)
    if p3 then
      v1.value1:Create(v4.value24, TweenInfo.new(0.25, Enum.EasingStyle.Cubic), {
        BackgroundColor3 = Color3.fromRGB(90, 0, 140),
        TextColor3 = Color3.fromRGB(230, 180, 255),
      }):Play()

      v1.value1:Create(uiStroke2, TweenInfo.new(0.25), {
        Color = Color3.fromRGB(200, 0, 255),
        Transparency = 0,
      }):Play()
    else
      v1.value1:Create(v4.value24, TweenInfo.new(0.25, Enum.EasingStyle.Cubic), {
        BackgroundColor3 = Color3.fromRGB(25, 20, 35),
        TextColor3 = Color3.fromRGB(200, 200, 200),
      }):Play()

      v1.value1:Create(uiStroke2, TweenInfo.new(0.25), {
        Color = Color3.fromRGB(80, 60, 100),
        Transparency = 0.4,
      }):Play()
    end
  end

  v4.value24.MouseButton1Click:Connect(function()
    v1.value19 = not v1.value19

    local value24 = v4.value24
    value24.Text = v1.value19 and "ON" or "OFF"

    v4.value26(v1.value19)
    f3(v1.value19)

    if v1.value19 then
      if not v1.value20 then
        v1.value20 = v1.value3.PromptTriggered:Connect(function(p4, p5)
          if p5 == v1.value10 then
            f1()
          end
        end)
      end
    elseif v1.value20 then
      v1.value20:Disconnect()
      v1.value20 = nil
    end
  end)

  v4.value24.MouseEnter:Connect(function()
    v1.value1:Create(v4.value24, TweenInfo.new(0.15), {
      BackgroundColor3 = v1.value19 and Color3.fromRGB(110, 0, 170)
        or Color3.fromRGB(40, 30, 55),
    }):Play()
  end)

  v4.value24.MouseLeave:Connect(function()
    v1.value1:Create(v4.value24, TweenInfo.new(0.15), {
      BackgroundColor3 = v1.value19 and Color3.fromRGB(90, 0, 140) or Color3.fromRGB(25, 20, 35),
    }):Play()
  end)

  local position, position2

  local function f4(p6)
    local v5 = p6.Position - position

    v4.value12.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v5.X, position2.Y.Scale, position2.Y.Offset + v5.Y
    )
  end

  local v6

  v4.value12.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
      or input.UserInputType == Enum.UserInputType.Touch then
      v6 = true
      position = input.Position
      position2 = v4.value12.Position

      input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
          v6 = false
        end
      end)
    end
  end)

  local v7

  v4.value12.InputChanged:Connect(function(input2)
    if input2.UserInputType == Enum.UserInputType.MouseMovement
      or input2.UserInputType == Enum.UserInputType.Touch then
      v7 = input2
    end
  end)

  v1.value9.InputChanged:Connect(function(input3)
    if input3 == v7 and v6 then
      f4(input3)
    end
  end)
end

v1.value24()
