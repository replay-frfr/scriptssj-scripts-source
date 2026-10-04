local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local localPlayer = players.LocalPlayer

local scriptSSJMultiHub = Instance.new("ScreenGui")
scriptSSJMultiHub.Name = "ScriptSSJ_MultiHub"
scriptSSJMultiHub.ResetOnSpawn = false
scriptSSJMultiHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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

local color = Color3.fromRGB(120, 40, 255)
local color2 = Color3.fromRGB(11, 11, 14)
local color3 = Color3.fromRGB(18, 18, 23)
local color4 = Color3.fromRGB(32, 32, 42)
local color5 = Color3.fromRGB(255, 255, 255)

local frame = Instance.new("Frame")
frame.Parent = scriptSSJMultiHub
frame.Size = UDim2.new(0, 360, 0, 370)
frame.Position = UDim2.new(0.5, -180, 0.5, -205)
frame.BackgroundColor3 = color2
frame.BorderSizePixel = 0
frame.ClipsDescendants = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = frame
uiStroke.Color = color
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.2

local frame2 = Instance.new("Frame")
frame2.Parent = frame
frame2.Size = UDim2.new(1, -24, 0, 45)
frame2.Position = UDim2.new(0, 12, 0, 8)
frame2.BackgroundTransparency = 1

local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame2
textLabel.Size = UDim2.new(0, 72, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SCRIPT"
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 22
textLabel.TextColor3 = color5
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Center

local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = frame2
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
textButton.Parent = frame2
textButton.BackgroundColor3 = color
textButton.Position = UDim2.new(1, -32, 0.5, -16)
textButton.Size = UDim2.new(0, 32, 0, 32)
textButton.Font = Enum.Font.GothamBold
textButton.Text = "-"
textButton.TextColor3 = color5
textButton.TextSize = 18
textButton.AutoButtonColor = false

Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 9)

local frame3 = Instance.new("Frame")
frame3.Parent = frame
frame3.Position = UDim2.new(0, 12, 0, 55)
frame3.Size = UDim2.new(1, -24, 0, 1)
frame3.BackgroundColor3 = color
frame3.BackgroundTransparency = 0.5
frame3.BorderSizePixel = 0

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Parent = frame
scrollingFrame.Active = true
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Position = UDim2.new(0, 12, 0, 64)
scrollingFrame.Size = UDim2.new(1, -24, 1, -74)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.ScrollBarThickness = 2
scrollingFrame.ScrollBarImageColor3 = color

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollingFrame
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 6)

local v1 = false
local udim = UDim2.new(0, 360, 0, 370)
local udim2 = UDim2.new(0, 360, 0, 60)

textButton.Activated:Connect(function()
  v1 = not v1

  if v1 then
    frame.Size = udim2
    scrollingFrame.Visible = false
    frame3.Visible = false
    textButton.Text = "+"
  else
    frame.Size = udim
    scrollingFrame.Visible = true
    frame3.Visible = true
    textButton.Text = "-"
  end
end)

local v2 = {
  ["Find OG"] = false,
  ["Fin Celestial"] = false,
  ["Collect Cash"] = false,
  ["Upgrade All"] = false,
  ["Buy Power +10"] = false,
  ["Auto Rebirth"] = false,
}

local function f1(p1, layoutOrder)
  local frame4 = Instance.new("Frame")
  frame4.Parent = scrollingFrame
  frame4.BackgroundColor3 = color3
  frame4.Size = UDim2.new(1, 0, 0, 42)
  frame4.BorderSizePixel = 0
  frame4.LayoutOrder = layoutOrder

  Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 9)

  local uiStroke3 = Instance.new("UIStroke")
  uiStroke3.Parent = frame4
  uiStroke3.Color = Color3.fromRGB(28, 28, 38)
  uiStroke3.Thickness = 1

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Parent = frame4
  textLabel3.BackgroundTransparency = 1
  textLabel3.Position = UDim2.new(0, 12, 0, 0)
  textLabel3.Size = UDim2.new(1, -95, 1, 0)
  textLabel3.Font = Enum.Font.GothamBold
  textLabel3.Text = p1
  textLabel3.TextColor3 = color5
  textLabel3.TextSize = 14
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.TextYAlignment = Enum.TextYAlignment.Center

  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame4
  textButton2.BackgroundColor3 = color4
  textButton2.Position = UDim2.new(1, -74, 0.5, -13)
  textButton2.Size = UDim2.new(0, 64, 0, 26)
  textButton2.Font = Enum.Font.GothamBold
  textButton2.Text = "OFF"
  textButton2.TextColor3 = Color3.fromRGB(140, 140, 155)
  textButton2.TextSize = 12
  textButton2.AutoButtonColor = false

  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 7)

  textButton2.Activated:Connect(function()
    v2[p1] = not v2[p1]

    if v2[p1] then
      textButton2.Text = "ON"
      textButton2.BackgroundColor3 = color
      textButton2.TextColor3 = color5
    else
      textButton2.Text = "OFF"
      textButton2.BackgroundColor3 = color4
      textButton2.TextColor3 = Color3.fromRGB(140, 140, 155)
    end
  end)
end

f1("Find OG", 1)
f1("Fin Celestial", 2)
f1("Collect Cash", 3)
f1("Upgrade All", 4)
f1("Buy Power +10", 5)
f1("Auto Rebirth", 6)

print("=== SCRIPTSSJ: Sistema Iniciado ===")
local v3 = {}
local v4 = 0

local function f2(p2, p3)
  local waitForChild

  if not v2[p3 == "OG" and "Find OG" or "Fin Celestial"] then
    return
  else
    local parent = p2.Parent

    while parent and parent ~= workspace do
      if string.lower(parent.Name):sub(1, 5) == "plot_" then
        return
      end

      parent = parent.Parent
    end

    if tick() - v4 < 1.2 then
      return
    else
      local character = localPlayer.Character

      if not character or not character:FindFirstChild("HumanoidRootPart") then
        character = localPlayer.CharacterAdded:Wait()
      end

      waitForChild = character:WaitForChild("HumanoidRootPart", 1)

      if waitForChild and p2 and p2:IsA("Model") then
        v4 = tick()
        local cframe = waitForChild.CFrame
        waitForChild.CFrame = p2:GetPivot() + Vector3.new(0, 2, 0)

        task.spawn(function()
          for i = 1, 4 do
            local parent2 = p2.Parent
            local v5 = false

            while parent2 and parent2 ~= workspace do
              if string.lower(parent2.Name):sub(1, 5) == "plot_" then
                v5 = true
                break
              end

              parent2 = parent2.Parent
            end



            if v5 then
              break
            end

            for index, value in ipairs(p2:GetDescendants()) do
              local v6 = value

              if v6:IsA("ProximityPrompt") then
                pcall(function()
                  v6.HoldDuration = 0
                  fireproximityprompt(v6)
                end)
              end

              if v6:IsA("BasePart") then
                pcall(function()
                  firetouchinterest(waitForChild, v6, 0)
                  firetouchinterest(waitForChild, v6, 1)
                end)
              end
            end

            task.wait(0.1)
          end
        end)

        task.wait(0.45)

        if character and character:FindFirstChild("HumanoidRootPart") then
          character.HumanoidRootPart.CFrame = cframe
        end
      end

      return
    end
  end
end

task.spawn(function()
  while true do
    pcall(function()
      for index2, value2 in ipairs(workspace:GetDescendants()) do
        if value2:IsA("TextLabel") and value2.Name == "Rarity" then
          local text = value2.Text

          local spawnedItem = value2:FindFirstAncestor("SpawnedItem")
            or value2:FindFirstAncestor("VisualItem")

          if spawnedItem and not v3[spawnedItem] then
            local v7 = false
            local parent3 = spawnedItem.Parent

            while parent3 and parent3 ~= workspace do
              if string.lower(parent3.Name):sub(1, 5) == "plot_" then
                v7 = true
                break
              end

              parent3 = parent3.Parent
            end

            if not v7 then
              if text == "OG" and v2["Find OG"] then
                v3[spawnedItem] = true
                f2(spawnedItem, "OG")
                task.delay(10, function() v3[spawnedItem] = nil end)
              elseif (text == "Fin Celestial" or text == "FIN CELESTIAL"
                  or text == "fin celestial" or text == "Celestial" or text == "CELESTIAL")
                and v2["Fin Celestial"] then
                v3[spawnedItem] = true
                f2(spawnedItem, "Fin Celestial")
                task.delay(10, function() v3[spawnedItem] = nil end)
              end
            end
          end
        end
      end
    end)

    task.wait(0.3)
  end
end)

task.spawn(function()
  local v8 = {}
  local v9 = 0

  while true do
    if v2["Collect Cash"] then
      pcall(function()
        local character2 = localPlayer.Character

        if character2 and character2:FindFirstChild("HumanoidRootPart") then
          local humanoidRootPart = character2.HumanoidRootPart

          if tick() - v9 > 10 or #v8 == 0 then
            v9 = tick()
            table.clear(v8)

            for index3, value3 in ipairs(workspace:GetDescendants()) do
              if value3:IsA("BasePart") or value3:IsA("Model") then
                local v10 = string.lower(value3.Name)

                if v10:find("collect") or v10:find("claim") or v10:find("income")
                  or v10:find("recolectar") or v10:find("pago") or v10:find("money")
                  or v10:find("cash") then
                  if value3:IsA("BasePart") then
                    table.insert(v8, value3)
                  elseif value3:IsA("Model") then
                    local primaryPart = value3.PrimaryPart

                    local basePart = primaryPart
                    basePart = primaryPart or value3:FindFirstChildWhichIsA("BasePart")

                    if basePart then
                      table.insert(v8, basePart)
                    end
                  end
                end
              end
            end
          end

          for index4, value4 in ipairs(v8) do
            if not v2["Collect Cash"] then
              break
            end

            if value4 and value4.Parent then
              firetouchinterest(humanoidRootPart, value4, 0)
              firetouchinterest(humanoidRootPart, value4, 1)
            end
          end
        end
      end)
    end

    task.wait(0.8)
  end
end)

task.spawn(function()
  while true do
    if v2["Upgrade All"] then
      pcall(function()
        local requestSlotUpgrade = replicatedStorage:FindFirstChild("Events")
          and replicatedStorage.Events:FindFirstChild("RequestSlotUpgrade")

        if requestSlotUpgrade then
          local count = 0

          while true do
            count = 1 + count

            if not (5 >= count) then
              break
            end

            local v11 = count

            for j = 1, 6 do
              if not v2["Upgrade All"] then
                break
              end

              requestSlotUpgrade:FireServer("Floor" .. v11, "Slot" .. j)
              task.wait(0.05)
            end
          end
        end
      end)
    end

    task.wait(0.5)
  end
end)

task.spawn(function()
  while true do
    if v2["Buy Power +10"] then
      pcall(function()
        local events = replicatedStorage:FindFirstChild("Events")

        if events then
          for index5, value5 in ipairs(events:GetChildren()) do
            local v12 = string.lower(value5.Name)

            if v12:find("power") or v12:find("strength") or v12:find("buy") then
              value5:FireServer(10)
              value5:FireServer("10")
              value5:FireServer()
            end
          end
        end
      end)
    end

    task.wait(0.3)
  end
end)

task.spawn(function()
  while true do
    if v2["Auto Rebirth"] then
      pcall(function()
        local events2 = replicatedStorage:FindFirstChild("Events")

        if events2 then
          for index6, value6 in ipairs(events2:GetChildren()) do
            local v13 = string.lower(value6.Name)

            if v13:find("rebirth") or v13:find("renacer") then
              value6:FireServer()
            end
          end
        end
      end)
    end

    task.wait(1.5)
  end
end)

local v14, position, position2

frame.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v14 = true
    position = input.Position
    position2 = frame.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        v14 = false
      end
    end)
  end
end)

local v15

frame.InputChanged:Connect(function(input2)
  if input2.UserInputType == Enum.UserInputType.MouseMovement
    or input2.UserInputType == Enum.UserInputType.Touch then
    v15 = input2
  end
end)

userInputService.InputChanged:Connect(function(input3)
  if v14 and input3 == v15 then
    local v16 = input3.Position - position

    frame.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v16.X, position2.Y.Scale,
      position2.Y.Offset + v16.Y
    )
  end
end)
