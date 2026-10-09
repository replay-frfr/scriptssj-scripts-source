local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = players.LocalPlayer

_G.Speed = 25
_G.SpeedCarry = 25

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
main.Size = UDim2.new(0, 260, 0, 270)
main.Position = UDim2.new(0.5, -130, 0.5, -130)
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
    uiScale.Scale = math.clamp(currentCamera.ViewportSize.X / 380, 0.55, 1)
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
textLabel.Size = UDim2.new(0, 65, 1, 0)
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
uiStroke2.Transparency = 0

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
frame2.Position = UDim2.new(0, 10, 0, 48)
frame2.Size = UDim2.new(1, -20, 1, -56)
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
uiPadding.PaddingTop = UDim.new(0, 1)
uiPadding.PaddingBottom = UDim.new(0, 3)

local eggRenderModels = workspaceService:FindFirstChild("EggRenderModels")

local v1 = {
  SPEED = false,
  ["AUTO HIT"] = false,
  ["COLLECT CASH"] = false,
  ["AUTO REBIRTH"] = false,
  ["UPGRADE ALL"] = false,
  ["ZONAS FREE"] = false,
}

_G.HitAura = false
_G.AutoCollect = false
_G.AutoRebirth = false
_G.AutoUpgrade = false
_G.BypassZones = false

local connect = nil
local f2

local function f3()
  if connect then
    connect:Disconnect()
  end

  connect = runService.RenderStepped:Connect(function()
    if not v1.SPEED then
      return
    else
      local character = localPlayer.Character

      if not character then
        return
      else
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if not humanoid then
          return
        else
          local speedCarry = f2() and _G.SpeedCarry or _G.Speed

          if humanoid.WalkSpeed ~= speedCarry then
            humanoid.WalkSpeed = speedCarry
          end

          return
        end
      end
    end
  end)
end

local function f4(humanoid2)
  if not getconnections then
    return
  end

  pcall(function()
    for key, value in pairs(getconnections(humanoid2:GetPropertyChangedSignal("WalkSpeed"))) do
      if value.Disconnect then
        value:Disconnect()
      end
    end
  end)
end

function f2()
  local character2 = localPlayer.Character

  if not character2 then
    return false
  elseif character2:FindFirstChildOfClass("Tool") then
    return true
  else
    local backpack = localPlayer:FindFirstChild("Backpack")

    if backpack and backpack:FindFirstChildOfClass("Tool") then
      return true
    end

    if character2:GetAttribute("Carrying") or character2:GetAttribute("IsCarrying") then
      return true
    end

    return false
  end
end

local function f5()
  if connect then
    connect:Disconnect()
    connect = nil
  end

  local character3 = localPlayer.Character

  if character3 then
    local humanoid3 = character3:FindFirstChildOfClass("Humanoid")

    if humanoid3 then
      humanoid3.WalkSpeed = 16
    end
  end
end

localPlayer.CharacterAdded:Connect(function(character4)
  task.wait(0.5)
  local humanoid4 = character4:FindFirstChildOfClass("Humanoid")

  if humanoid4 and v1.SPEED then
    f4(humanoid4)
    humanoid4.WalkSpeed = f2() and _G.SpeedCarry or _G.Speed
  end
end)

local v2, v3, v4

local function makeTextButton(key2, layoutOrder)
  local frame3 = Instance.new("Frame")
  frame3.Parent = scrollingFrame
  frame3.Size = UDim2.new(1, 0, 0, 32)
  frame3.BackgroundColor3 = color3
  frame3.BorderSizePixel = 0
  frame3.LayoutOrder = layoutOrder



  local uiCorner3 = Instance.new("UICorner")
  uiCorner3.CornerRadius = UDim.new(0, 7)
  uiCorner3.Parent = frame3

  local uiStroke3 = Instance.new("UIStroke")
  uiStroke3.Parent = frame3
  uiStroke3.Color = Color3.fromRGB(28, 28, 38)
  uiStroke3.Thickness = 1

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Parent = frame3
  textLabel3.Position = UDim2.new(0, 10, 0, 0)
  textLabel3.Size = UDim2.new(1, -82, 1, 0)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = key2
  textLabel3.Font = Enum.Font.GothamBold
  textLabel3.TextSize = 11
  textLabel3.TextColor3 = color5
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.TextYAlignment = Enum.TextYAlignment.Center

  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame3
  textButton2.Position = UDim2.new(1, -64, 0.5, -11)
  textButton2.Size = UDim2.new(0, 56, 0, 22)
  textButton2.BorderSizePixel = 0
  textButton2.AutoButtonColor = false
  textButton2.Font = Enum.Font.GothamBold
  textButton2.TextSize = 10

  local uiCorner4 = Instance.new("UICorner")
  uiCorner4.CornerRadius = UDim.new(0, 6)
  uiCorner4.Parent = textButton2

  local function f6()
    if v1[key2] then
      textButton2.BackgroundColor3 = color
      textButton2.TextColor3 = color5
      textButton2.Text = "ON"
    else
      textButton2.BackgroundColor3 = color4
      textButton2.TextColor3 = Color3.fromRGB(140, 140, 155)
      textButton2.Text = "OFF"
    end
  end

  f6()

  textButton2.Activated:Connect(function()
    v1[key2] = not v1[key2]
    f6()

    if key2 == "SPEED" then
      if v1.SPEED then
        local character5 = localPlayer.Character

        if character5 then
          character5:FindFirstChildOfClass("Humanoid")
        end

        f3()
      else
        f5()
      end
    elseif key2 == "AUTO HIT" then
      _G.HitAura = v1[key2]

      if _G.HitAura then
        task.spawn(function()
          while _G.HitAura do
            if v2 and eggRenderModels and localPlayer.Character then
              local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")

              if humanoidRootPart then
                for key3, value2 in pairs(eggRenderModels:GetChildren()) do
                  local v5 = value2
                  local primaryPart = nil

                  if v5:IsA("Model") then
                    primaryPart = v5.PrimaryPart
                  elseif v5:IsA("BasePart") then
                    primaryPart = v5
                  end

                  if primaryPart
                    and (primaryPart.Position - humanoidRootPart.Position).Magnitude < 50 then
                    pcall(function() v2:InvokeServer({ v5.Name }) end)
                  end
                end
              end
            end

            task.wait(0.1)
          end
        end)
      end
    elseif key2 == "COLLECT CASH" then
      _G.AutoCollect = v1[key2]

      if _G.AutoCollect then
        task.spawn(function()
          local v6 = {}
          local v7 = 0

          while _G.AutoCollect do
            local v8 = tick()

            if v8 - v7 > 1.5 then
              v6 = {}

              for index, value3 in ipairs(workspaceService:GetDescendants()) do
                if value3.Name == "Collect" and value3:IsA("BasePart") then
                  table.insert(v6, value3)
                end
              end

              v7 = v8
            end

            local character6 = localPlayer.Character

            local humanoidRootPart2 = character6
              and character6:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart2 then
              for i = #v6, 1, -1 do
                local v9 = v6[i]

                if v9 and v9.Parent then
                  if (v9.Position - humanoidRootPart2.Position).Magnitude < 80 then
                    pcall(function()
                      firetouchinterest(humanoidRootPart2, v9, 0)
                      task.wait()
                      firetouchinterest(humanoidRootPart2, v9, 1)
                    end)
                  end
                else
                  table.remove(v6, i)
                end
              end
            end

            task.wait(0.2)
          end
        end)
      end
    elseif key2 == "AUTO REBIRTH" then
      _G.AutoRebirth = v1[key2]

      if _G.AutoRebirth then
        task.spawn(function()
          while _G.AutoRebirth do
            if v3 then
              pcall(function() v3:InvokeServer() end)
            end

            task.wait(1)
          end
        end)
      end
    elseif key2 == "UPGRADE ALL" then
      _G.AutoUpgrade = v1[key2]

      if _G.AutoUpgrade then
        task.spawn(function()
          while _G.AutoUpgrade do
            if v4 then
              for j = 1, 20 do
                local v10 = j

                if not _G.AutoUpgrade then
                  break
                end

                pcall(function() v4:InvokeServer(v10) end)
              end
            end

            task.wait(1)
          end
        end)
      end
    elseif key2 == "ZONAS FREE" then
      _G.BypassZones = v1[key2]

      if _G.BypassZones then
        task.spawn(function()
          while _G.BypassZones do
            pcall(function()
              local world = workspaceService:FindFirstChild("World")

              if world then
                local purchaseWallZone2 = world:FindFirstChild("PurchaseWall_Zone2")
                local purchaseWallZone3 = world:FindFirstChild("PurchaseWall_Zone3")

                if purchaseWallZone2 then
                  purchaseWallZone2:Destroy()
                end

                if purchaseWallZone3 then
                  purchaseWallZone3:Destroy()
                end
              end
            end)

            task.wait(1.5)
          end
        end)
      end
    end
  end)
end

makeTextButton("SPEED", 1)
makeTextButton("AUTO HIT", 2)
makeTextButton("COLLECT CASH", 3)
makeTextButton("AUTO REBIRTH", 4)
makeTextButton("UPGRADE ALL", 5)
makeTextButton("ZONAS FREE", 6)

local v11 = false
local udim = UDim2.new(0, 260, 0, 270)
local udim2 = UDim2.new(0, 260, 0, 50)

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
