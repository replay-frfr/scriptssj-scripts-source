local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local tweenService = game:GetService("TweenService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local workspaceService = game:GetService("Workspace")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

pcall(function()
  local v1 = {
    "ScriptSSJ_PanelZ", "ScriptSSJ_PanelZ_Pets", "ScriptSSJ_PanelZ_Masivo",
    "ScriptSSJ_Autofarm",
  }

  for index, value in ipairs({ coreGui, localPlayer:FindFirstChild("PlayerGui") }) do
    if value then
      for index2, value2 in ipairs(v1) do
        local findFirstChild = value:FindFirstChild(value2)

        if findFirstChild then
          findFirstChild:Destroy()
        end
      end
    end
  end
end)

local v2

pcall(function()
  v2 = require(replicatedStorage:WaitForChild("Modules"):WaitForChild("Network"))
end)

local pets = replicatedStorage:FindFirstChild("Pets")
local defenses = replicatedStorage:FindFirstChild("Defenses")
local color = Color3.fromRGB(140, 70, 255)
local color2 = Color3.fromRGB(18, 18, 20)
local color3 = Color3.fromRGB(28, 28, 32)
local color4 = Color3.fromRGB(32, 32, 38)

local g = _G

g.SSJ_Auto = _G.SSJ_Auto or {
  ClaimMoney = false,
  RollPet = false,
  RollBlocks = false,
  Pets = {},
  Blocks = {},
  Defenses = {},
}

local v3 = {
  "ARM 1", "Alien Dumpling", "Ankylosaurus", "Archaeopteryx", "Archerfish", "Argentavis",
  "Azhdarchid", "Barracuda", "Bat", "Bear", "Big Foot", "Boxfish", "Brachiosaurus", "Bull",
  "Bunny", "Butterflyfish", "Caladrius", "Capybara", "Cat", "Cerberus", "Chicken", "Chirema",
  "Cobra", "Cockatrice", "Cookie Dough Dumpling", "Coral Goby", "Cow", "Cowfish", "Crab",
  "Crocodile", "Destroyer", "Dimetrodon", "Dog", "Dragon", "Elephant", "Fairy", "Firephoenix",
  "Frog", "Gallimimus", "Gargoyle Bat", "Garuda", "Giraffe", "Gnome", "Goat", "Goldfish",
  "Gorilla", "Griffin", "Guinea Pig", "Hamster", "Harpy", "Hawkfish", "Horse", "Hydra",
  "HydraTitan", "Jellyfish", "Jersey Devil", "Kangaroo", "Kitsune", "Koala", "Kraken",
  "Lava Dumpling", "Leprechaun", "Leviathan", "Lion", "Lionfish", "Lizard", "Llama", "Mammoth",
  "Mandarinfish", "Manticore", "Mapinguari", "Mech", "Megalodon", "Mermaid", "Microraptor",
  "Minotaur", "Moorish Idol", "Mosasaurus", "Mothman", "Mushroom Dumpling", "Neon Dumpling",
  "Ostrich", "Owl", "Parrot", "Pegasus", "Pigeon", "Plesiosaur", "Polar Bear", "Pony",
  "Prehistoric Dragonfly", "Prehistoric Moth", "Pteranodon", "Pterodactyl", "Pufferfish",
  "Qilin", "Quetzalcoatlus", "Rainbow Dumpling", "Regal", "Roc", "Saber Toothed Tiger",
  "Sailfish", "Seahorse", "Seal", "Shark", "Shenlong", "Simurgh", "Snail", "Snake", "Sphinx",
  "Spinosaurus", "Stegosaurus", "Stingray", "Stymphalianbird", "Surgeonfish", "Swordfish",
  "T Rex", "Thunderbird", "Tiger", "Triceratops", "Triple Cobra", "Trumpet", "Tuna", "Turtle",
  "UFO Alien", "Unicorn", "Velociraptor", "Werewolf", "Whale", "Winged Imp", "Wizard",
  "Wobbegong", "Wolf", "Wrasse", "Wyvern", "Yeti", "Yi Qi", "Zebra",
}

local v4 = {
  "Admin Block", "Ancient Block", "Angel Block", "Brick Block", "Copper Block", "Crystal Block",
  "Demon Block", "Diamond Block", "Dirt Block", "Emerald Block", "Frost Block", "Galaxy Block",
  "Glass Block", "Gold Block", "Granite Block", "Grass Block", "Gummy Block", "Hacker Block",
  "Ice Block", "Iron Block", "Lampstone Block", "Magma Block", "Moon Block", "Obsidian Block",
  "Quartz Block", "Radioactive Block", "Rock Block", "Ruby Block", "Sapphire Block",
  "Stone Block", "Stone Brick Block", "Sun Block", "Wood Block", "Wood Plank Block",
}

local v5 = {
  "Bounce Pad", "Dart Trap", "Furnace", "IcePad", "Laser Door", "LaunchPad", "Mine", "Mud Pit",
  "SpeedBoost", "Spike Ball", "Spikes", "Trap Door", "Tripwire",
}

local function f1()
  local plots = workspaceService:FindFirstChild("Plots")

  if not plots then
    return nil
  end

  for index3, value3 in ipairs(plots:GetChildren()) do
    if value3:GetAttribute("OwnerUserId") == localPlayer.UserId then
      return value3
    end
  end

  return nil
end

local function f2(p1, p2, p3)
  for index4, value4 in ipairs(p1:GetDescendants()) do
    if value4.Name == p2 then
      return true
    end

    if value4:IsA("StringValue") and value4.Value == p2 then
      return true
    end

    if value4:IsA("TextLabel") and string.find(tostring(value4.Text), p2, 1, true) then
      return true
    end
  end

  for key, value5 in pairs(p1:GetAttributes()) do
    if tostring(value5) == p2 then
      return true
    end
  end

  if p3 and p3:FindFirstChild(p2) then
    for index5, value6 in ipairs(p1:GetDescendants()) do
      if value6.Name == p2 then
        return true
      end
    end

    return false
  end

  return false
end

local function f3(p4)
  if not p4 then
    return nil
  else
    local findFirstChild2 = p4:FindFirstChild("EggCarpet", true)

    if findFirstChild2 then
      local button = findFirstChild2:FindFirstChild("Button")
      local pad = button and button:FindFirstChild("Pad")
      local proximityPrompt = pad and pad:FindFirstChildOfClass("ProximityPrompt")

      if proximityPrompt then
        return proximityPrompt
      end

      for index6, value7 in ipairs(findFirstChild2:GetDescendants()) do
        if value7:IsA("ProximityPrompt") then
          return value7
        end
      end

      for index7, value8 in ipairs(p4:GetDescendants()) do
        if value8:IsA("ProximityPrompt") then
          return value8
        end
      end

      return nil
    end

    for index8, value9 in ipairs(p4:GetDescendants()) do
      if value9:IsA("ProximityPrompt") then
        return value9
      end
    end

    return nil
  end
end

local function f4(p5)
  if not p5 or not p5:IsA("ProximityPrompt") then
    return
  end

  pcall(function()
    p5.Enabled = true
    p5.HoldDuration = 0
    p5.MaxActivationDistance = 999
    p5.RequiresLineOfSight = false
  end)

  if fireproximityprompt then
    pcall(function() fireproximityprompt(p5) end)
    pcall(function() fireproximityprompt(p5, 1) end)
  end
end

local scriptSSJAutofarm = Instance.new("ScreenGui")
scriptSSJAutofarm.Name = "ScriptSSJ_Autofarm"
scriptSSJAutofarm.ResetOnSpawn = false

pcall(function()
  if syn and syn.protect_gui then
    syn.protect_gui(scriptSSJAutofarm)
    scriptSSJAutofarm.Parent = coreGui
  elseif gethui then
    scriptSSJAutofarm.Parent = gethui()
  else
    scriptSSJAutofarm.Parent = coreGui
  end
end)

if not scriptSSJAutofarm.Parent then
  scriptSSJAutofarm.Parent = localPlayer:WaitForChild("PlayerGui")
end

local instance = Instance.new("Frame", scriptSSJAutofarm)
instance.Size = UDim2.new(0, 280, 0, 360)
instance.Position = UDim2.new(0.35, 0, 0.18, 0)
instance.BackgroundColor3 = color2
instance.BorderSizePixel = 0
instance.Active = true

Instance.new("UICorner", instance).CornerRadius = UDim.new(0, 12)

local instance2 = Instance.new("UIStroke", instance)
instance2.Color = color
instance2.Thickness = 2

local instance3 = Instance.new("TextLabel", instance)
instance3.BackgroundTransparency = 1
instance3.Size = UDim2.new(1, -24, 0, 38)
instance3.Position = UDim2.new(0, 12, 0, 6)
instance3.Font = Enum.Font.GothamBold
instance3.Text = "SCRIPT SSJ AUTOFARM"
instance3.TextSize = 15
instance3.TextColor3 = Color3.new(1, 1, 1)
instance3.TextXAlignment = Enum.TextXAlignment.Left

local instance4 = Instance.new("Frame", instance)
instance4.Position = UDim2.new(0, 12, 0, 44)
instance4.Size = UDim2.new(1, -24, 0, 1)
instance4.BackgroundColor3 = color
instance4.BorderSizePixel = 0

local instance5 = Instance.new("ScrollingFrame", instance)
instance5.BackgroundTransparency = 1
instance5.Position = UDim2.new(0, 12, 0, 52)
instance5.Size = UDim2.new(1, -24, 1, -60)
instance5.ScrollBarThickness = 3
instance5.ScrollBarImageColor3 = color
instance5.CanvasSize = UDim2.new(0, 0, 0, 0)
instance5.BorderSizePixel = 0
instance5.ClipsDescendants = true

local instance6 = Instance.new("UIListLayout", instance5)
instance6.SortOrder = Enum.SortOrder.LayoutOrder
instance6.Padding = UDim.new(0, 8)

instance6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
  instance5.CanvasSize = UDim2.new(0, 0, 0, instance6.AbsoluteContentSize.Y + 8)
end)

local function f5(text, layoutOrder, p6)
  local instance7 = Instance.new("TextButton", instance5)
  instance7.BackgroundColor3 = color3
  instance7.Size = UDim2.new(1, 0, 0, 42)
  instance7.BorderSizePixel = 0
  instance7.AutoButtonColor = false
  instance7.Text = ""
  instance7.LayoutOrder = layoutOrder

  Instance.new("UICorner", instance7).CornerRadius = UDim.new(0, 8)

  local instance8 = Instance.new("TextLabel", instance7)
  instance8.BackgroundTransparency = 1
  instance8.Position = UDim2.new(0, 12, 0, 0)
  instance8.Size = UDim2.new(1, -65, 1, 0)
  instance8.Font = Enum.Font.GothamBold
  instance8.Text = text
  instance8.TextColor3 = Color3.new(1, 1, 1)
  instance8.TextSize = 13
  instance8.TextXAlignment = Enum.TextXAlignment.Left

  local instance9 = Instance.new("Frame", instance7)
  instance9.BackgroundColor3 = Color3.fromRGB(48, 48, 52)
  instance9.Position = UDim2.new(1, -48, 0.5, -11)
  instance9.Size = UDim2.new(0, 38, 0, 22)

  Instance.new("UICorner", instance9).CornerRadius = UDim.new(1, 0)

  local instance10 = Instance.new("Frame", instance9)
  instance10.BackgroundColor3 = Color3.new(1, 1, 1)
  instance10.Position = UDim2.new(0, 2, 0.5, -9)
  instance10.Size = UDim2.new(0, 18, 0, 18)

  Instance.new("UICorner", instance10).CornerRadius = UDim.new(1, 0)
  local v6 = false

  local function f6(p7)
    v6 = p7
    _G.SSJ_Auto[p6] = p7

    if p7 then
      tweenService:Create(instance9, TweenInfo.new(0.18), { BackgroundColor3 = color }):Play()

      tweenService:Create(instance10, TweenInfo.new(0.18), {
        Position = UDim2.new(1, -20, 0.5, -9),
      }):Play()
    else
      tweenService:Create(instance9, TweenInfo.new(0.18), {
        BackgroundColor3 = Color3.fromRGB(48, 48, 52),
      }):Play()

      tweenService:Create(instance10, TweenInfo.new(0.18), {
        Position = UDim2.new(0, 2, 0.5, -9),
      }):Play()
    end
  end

  instance7.MouseButton1Click:Connect(function() f6(not v6) end)
end

local function f7(text2, p8, layoutOrder2, p9)
  local instance11 = Instance.new("Frame", instance5)
  instance11.Size = UDim2.new(1, 0, 0, 42)
  instance11.BackgroundTransparency = 1
  instance11.LayoutOrder = layoutOrder2
  instance11.ZIndex = 5

  local instance12 = Instance.new("TextButton", instance11)
  instance12.Size = UDim2.new(1, 0, 1, 0)
  instance12.BackgroundColor3 = color3
  instance12.Text = ""
  instance12.AutoButtonColor = false
  instance12.ZIndex = 5

  Instance.new("UICorner", instance12).CornerRadius = UDim.new(0, 8)

  local instance13 = Instance.new("TextLabel", instance12)
  instance13.BackgroundTransparency = 1
  instance13.Position = UDim2.new(0, 12, 0, 0)
  instance13.Size = UDim2.new(1, -50, 1, 0)
  instance13.Font = Enum.Font.GothamBold
  instance13.Text = text2
  instance13.TextColor3 = Color3.new(1, 1, 1)
  instance13.TextSize = 12
  instance13.TextXAlignment = Enum.TextXAlignment.Left
  instance13.ZIndex = 6

  local instance14 = Instance.new("TextLabel", instance12)
  instance14.BackgroundTransparency = 1
  instance14.Size = UDim2.new(0, 28, 1, 0)
  instance14.Position = UDim2.new(1, -32, 0, 0)
  instance14.Font = Enum.Font.GothamBold
  instance14.Text = "›"
  instance14.TextSize = 22
  instance14.TextColor3 = color
  instance14.ZIndex = 6

  local instance15 = Instance.new("Frame", scriptSSJAutofarm)
  instance15.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
  instance15.BorderSizePixel = 0
  instance15.ClipsDescendants = true
  instance15.Visible = false
  instance15.Size = UDim2.new(0, 0, 0, 0)
  instance15.ZIndex = 50

  Instance.new("UICorner", instance15).CornerRadius = UDim.new(0, 10)

  local instance16 = Instance.new("UIStroke", instance15)
  instance16.Color = color
  instance16.Thickness = 1.5

  local instance17 = Instance.new("ScrollingFrame", instance15)
  instance17.Size = UDim2.new(1, 0, 1, 0)
  instance17.BackgroundTransparency = 1
  instance17.ScrollBarThickness = 4
  instance17.ScrollBarImageColor3 = color
  instance17.BorderSizePixel = 0
  instance17.ZIndex = 51
  instance17.CanvasSize = UDim2.new(0, 0, 0, #p8 * 32 + 12)

  local instance18 = Instance.new("UIPadding", instance17)
  instance18.PaddingTop = UDim.new(0, 6)
  instance18.PaddingBottom = UDim.new(0, 6)

  local instance19 = Instance.new("UIListLayout", instance17)
  instance19.Padding = UDim.new(0, 4)
  instance19.HorizontalAlignment = Enum.HorizontalAlignment.Center
  instance19.SortOrder = Enum.SortOrder.LayoutOrder

  local v7 = false

  local function f8()
    local absolutePosition = instance12.AbsolutePosition

    instance15.Position = UDim2.new(
      0, absolutePosition.X + instance12.AbsoluteSize.X + 8, 0, absolutePosition.Y
    )
  end



  instance12.MouseButton1Click:Connect(function()
    v7 = not v7
    f8()
    local v8 = math.min(#p8 * 32 + 12, 240)

    if v7 then
      instance15.Visible = true

      tweenService:Create(
        instance15, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        { Size = UDim2.new(0, 190, 0, v8) }
      ):Play()

      tweenService:Create(instance14, TweenInfo.new(0.22), { Rotation = 90 }):Play()
    else
      tweenService:Create(instance15, TweenInfo.new(0.18), { Size = UDim2.new(0, 0, 0, 0) }):Play()
      tweenService:Create(instance14, TweenInfo.new(0.18), { Rotation = 0 }):Play()

      task.delay(0.2, function()
        if not v7 then
          instance15.Visible = false
        end
      end)
    end
  end)

  instance:GetPropertyChangedSignal("Position"):Connect(function()
    if v7 then
      f8()
    end
  end)

  for index9, value10 in ipairs(p8) do
    local v9 = value10

    local instance20 = Instance.new("TextButton", instance17)
    instance20.Size = UDim2.new(1, -12, 0, 28)
    instance20.BackgroundColor3 = color4
    instance20.Text = "  " .. v9
    instance20.TextColor3 = Color3.fromRGB(210, 210, 220)
    instance20.Font = Enum.Font.Gotham
    instance20.TextSize = 11
    instance20.TextXAlignment = Enum.TextXAlignment.Left
    instance20.LayoutOrder = index9
    instance20.ZIndex = 52
    instance20.AutoButtonColor = false

    Instance.new("UICorner", instance20).CornerRadius = UDim.new(0, 5)

    local instance21 = Instance.new("Frame", instance20)
    instance21.Size = UDim2.new(0, 12, 0, 12)
    instance21.Position = UDim2.new(1, -20, 0.5, -6)
    instance21.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    instance21.ZIndex = 53

    Instance.new("UICorner", instance21).CornerRadius = UDim.new(1, 0)
    local v10 = false

    instance20.MouseButton1Click:Connect(function()
      v10 = not v10
      _G.SSJ_Auto[p9][v9] = v10

      instance21.BackgroundColor3 = v10 and Color3.fromRGB(90, 255, 120)
        or Color3.fromRGB(50, 50, 55)

      instance20.TextColor3 = v10 and Color3.new(1, 1, 1) or Color3.fromRGB(210, 210, 220)
    end)
  end
end

f5("Auto Claim Pet Money", 1, "ClaimMoney")
f5("Auto Roll (Pet)", 2, "RollPet")

f7("AUTO BUY PETS", v3, 3, "Pets")
f5("Auto Roll (Blocks)", 4, "RollBlocks")

f7("AUTO BUY BLOCKS", v4, 5, "Blocks")
f7("AUTO BUY DEFENSE", v5, 6, "Defenses")

local v11, position, position2

instance3.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v11 = true
    position = input.Position
    position2 = instance.Position

    contextActionService:BindActionAtPriority(
      "SSJ_Autofarm_Cam", function() return Enum.ContextActionResult.Sink end, false,
      Enum.ContextActionPriority.High.Value, Enum.UserInputType.Touch,
      Enum.UserInputType.MouseButton1
    )

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        v11 = false
        contextActionService:UnbindAction("SSJ_Autofarm_Cam")
      end
    end)
  end
end)

userInputService.InputChanged:Connect(function(input2)
  if not v11 then
    return
  end

  if input2.UserInputType == Enum.UserInputType.MouseMovement
    or input2.UserInputType == Enum.UserInputType.Touch then
    local v12 = input2.Position - position

    instance.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v12.X, position2.Y.Scale,
      position2.Y.Offset + v12.Y
    )
  end
end)

task.spawn(function()
  local v13 = {}
  local v14 = 0
  local v15 = 1

  while true do
    task.wait(0.2)

    pcall(function()
      if not _G.SSJ_Auto.ClaimMoney then
        return
      else
        local character = localPlayer.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart then
          return
        else
          local v16 = tick()

          if v16 - v14 > 6 or #v13 == 0 then
            v13 = {}
            local v17 = f1()
            local v18 = {}

            if v17 then
              table.insert(v18, v17)
            else
              local plots2 = workspaceService:FindFirstChild("Plots")

              if plots2 then
                for index10, value11 in ipairs(plots2:GetChildren()) do
                  table.insert(v18, value11)
                end
              end
            end

            for index11, value12 in ipairs(v18) do
              for index12, value13 in ipairs(value12:GetDescendants()) do
                if value13.Name == "CollectModel" then
                  local button2 = value13:FindFirstChild("Button")
                  local pad2 = button2 and button2:FindFirstChild("Pad")

                  if pad2 and pad2:IsA("BasePart") then
                    table.insert(v13, pad2)
                  end
                end
              end
            end

            v14 = v16
            v15 = 1
          end

          if #v13 == 0 then
            return
          end

          for i = 1, 3 do
            local v19 = v13[v15]

            if v19 and v19.Parent and firetouchinterest then
              firetouchinterest(humanoidRootPart, v19, 0)
              firetouchinterest(humanoidRootPart, v19, 1)
            end

            v15 = v15 + 1

            if v15 > #v13 then
              v15 = 1
            end
          end

          return
        end
      end
    end)
  end
end)

task.spawn(function()
  while true do
    task.wait(0.35)

    pcall(function()
      local plots3

      if not _G.SSJ_Auto.RollPet then
        return
      elseif not fireproximityprompt then
        return
      else
        local v20 = f1()

        if v20 then
          local v21 = f3((v20:FindFirstChild("EggModel")))

          if v21 then
            f4(v21)
            return
          end

          plots3 = workspaceService:FindFirstChild("Plots")

          if not plots3 then
            return
          end

          for index13, value14 in ipairs(plots3:GetChildren()) do
            local v22 = f3((value14:FindFirstChild("EggModel")))

            if v22 then
              f4(v22)
              return
            end
          end

          return
        end

        plots3 = workspaceService:FindFirstChild("Plots")

        if not plots3 then
          return
        end

        for index14, value15 in ipairs(plots3:GetChildren()) do
          local v23 = f3((value15:FindFirstChild("EggModel")))

          if v23 then
            f4(v23)
            return
          end
        end

        return
      end
    end)
  end
end)

task.spawn(function()
  while true do
    task.wait(0.25)

    pcall(function()
      local plots4

      if not _G.SSJ_Auto.RollBlocks then
        return
      elseif not fireproximityprompt then
        return
      else
        local v24 = f1()

        if v24 then
          local v25 = f3((v24:FindFirstChild("CrateModel")))

          if v25 then
            f4(v25)
            return
          end

          plots4 = workspaceService:FindFirstChild("Plots")

          if not plots4 then
            return
          end

          for index15, value16 in ipairs(plots4:GetChildren()) do
            local v26 = f3((value16:FindFirstChild("CrateModel")))

            if v26 then
              f4(v26)
              return
            end
          end

          return
        end

        plots4 = workspaceService:FindFirstChild("Plots")

        if not plots4 then
          return
        end

        for index16, value17 in ipairs(plots4:GetChildren()) do
          local v27 = f3((value17:FindFirstChild("CrateModel")))

          if v27 then
            f4(v27)
            return
          end
        end

        return
      end
    end)
  end
end)

task.spawn(function()
  while true do
    task.wait(0.05)

    pcall(function()
      for index17, value18 in ipairs(workspaceService:GetChildren()) do
        if string.find(value18.Name, "HATCH_REVEAL") then
          local findFirstChild3 = value18:FindFirstChild("BuyWinnerPrompt", true)

          for key2, value19 in pairs(_G.SSJ_Auto.Pets) do
            local v28 = key2

            if value19 and f2(value18, v28, pets) then
              if findFirstChild3 and findFirstChild3:IsA("ProximityPrompt") then
                f4(findFirstChild3)
              end

              if v2 then
                pcall(function() v2.send("BuyPet", v28) end)
                pcall(function() v2.send("buy_pet", v28) end)
                pcall(function() v2.send("PurchasePet", v28) end)
                pcall(function() v2.send("BuyItem", v28) end)
              end

              break
            end
          end

          for key3, value20 in pairs(_G.SSJ_Auto.Blocks) do
            local v29 = key3

            if value20 and f2(value18, v29, nil) then
              if findFirstChild3 and findFirstChild3:IsA("ProximityPrompt") then
                f4(findFirstChild3)
              end

              if v2 then
                pcall(function() v2.send("BuyBlock", v29) end)
                pcall(function() v2.send("buy_block", v29) end)
                pcall(function() v2.send("PurchaseBlock", v29) end)
              end

              break
            end
          end

          for key4, value21 in pairs(_G.SSJ_Auto.Defenses) do
            local v30 = key4

            if value21 and f2(value18, v30, defenses) then
              if findFirstChild3 and findFirstChild3:IsA("ProximityPrompt") then
                f4(findFirstChild3)
              end

              if v2 then
                pcall(function() v2.send("BuyDefense", v30) end)
                pcall(function() v2.send("buy_defense", v30) end)
                pcall(function() v2.send("PurchaseDefense", v30) end)
                pcall(function() v2.send("BuyItem", v30) end)
              end

              break
            end
          end
        end
      end
    end)
  end
end)

print("[SCRIPT SSJ AUTOFARM] ready — RollPet uses your plot EggModel")
