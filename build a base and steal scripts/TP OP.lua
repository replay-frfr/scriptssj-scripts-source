local coreGui = game:GetService("CoreGui")
local workspaceService = game:GetService("Workspace")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local findFirstChild = replicatedStorage.FindFirstChild
local localPlayer = players.LocalPlayer

local waitForChild = findFirstChild(replicatedStorage, "RemoteEvent")
  or replicatedStorage:WaitForChild("RemoteEvent", 5)

local v1 = {
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

local v2 = {
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

local v3 = false
local v4 = false
local v5 = false

local function f1(p1)
  local character = p1 or localPlayer.Character

  local humanoid = character
  humanoid = character and character:FindFirstChildOfClass("Humanoid")

  return humanoid and humanoid.RootPart, humanoid, character
end

local function f2(p2, canCollide)
  if not p2 then
    return
  end

  for index, value in ipairs(p2:GetDescendants()) do
    local v6 = value

    if v6:IsA("BasePart") then
      pcall(function()
        v6.CanCollide = canCollide
      end)
    end
  end
end

local cframe, connect

local function f3()
  if connect then
    connect:Disconnect()
  end

  connect = runService.Heartbeat:Connect(function()
    if v4 or v3 then
      return
    else
      local v7 = f1()

      if v7 then
        cframe = v7.CFrame
      end

      return
    end
  end)

  task.spawn(function()
    local v8 = f1(localPlayer.Character or localPlayer.CharacterAdded:Wait())

    if not v8 then
      return
    end

    v8:GetPropertyChangedSignal("CFrame"):Connect(function()
      if v3 or v4 then
        return
      end

      v4 = true

      if cframe and v8 and v8.Parent then
        v8.CFrame = cframe
      end

      runService.Heartbeat:Wait()
      v4 = false
    end)
  end)
end

localPlayer.CharacterAdded:Connect(function(character2)
  while true do
    runService.Heartbeat:Wait()

    if f1(character2) then
      break
    end
  end

  f3()
end)

task.spawn(f3)

local function f4(p3)
  return p3:FindFirstAncestorOfClass("Model") or p3.Parent
end

local function f5(p4)
  if not p4 then
    return 0
  else
    local v9, v10 = tostring(p4):lower():gsub("[$%,]", ""):match("([%d%.]+)%s*([kmbtq]?)/s")

    if not v9 then
      return 0
    end

    return (tonumber(v9) or 0) * (({
      k = 1000,
      m = 1000000,
      b = 1000000000,
      t = 1000000000000,
      q = 1000000000000000,
    })[v10 or ""] or 1)
  end
end

local function f6(p5)
  local v11 = 0

  if not p5 then
    return 0
  end

  for index2, value2 in ipairs(p5:GetDescendants()) do
    if value2:IsA("TextLabel") and value2.Text ~= "" and value2.Text:lower():find("/s") then
      local v12 = f5(value2.Text)

      if v12 > v11 then
        v11 = v12
      end
    end
  end

  return v11
end

local function f7(p6)
  if not p6 then
    return 0, 0
  else
    local v13 = 0
    local species = p6:GetAttribute("Species")



    if type(species) == "string" and v2[species] then
      v13 = v1[string.lower(v2[species])] or 0
    end

    if v13 == 0 then
      for index3, value3 in ipairs(p6:GetDescendants()) do
        if value3:IsA("ProximityPrompt") then
          local gsub = value3.Name:gsub(" Steal", ""):gsub("Steal", "")

          if v2[gsub] then
            v13 = v1[string.lower(v2[gsub])] or 0
            break
          end
        end

        if value3:IsA("TextLabel") and v2[value3.Text] then
          v13 = v1[string.lower(v2[value3.Text])] or 0
          break
        end
      end
    end

    if v13 == 0 and v2[p6.Name] then
      v13 = v1[string.lower(v2[p6.Name])] or 0
    end

    return v13, f6(p6)
  end
end

local function f8()
  local runtimePets = workspaceService:FindFirstChild("RuntimePets") or workspaceService
  local v14 = -1
  local v15 = -1
  local v16, v17

  for index4, value4 in ipairs(runtimePets:GetDescendants()) do
    if value4:IsA("ProximityPrompt") then
      if (value4.Name .. " " .. tostring(value4.ActionText) .. " " .. tostring(value4.ObjectText)):lower():find("steal") then
        local v18 = f4(value4)
        local v19, v20 = f7(v18)

        if v19 > v14 or v19 == v14 and v20 > v15 then
          v14 = v19
          v15 = v20
          v16 = value4
          v17 = v18
        end
      end
    end
  end

  return v17, v16
end

pcall(function()
  local playerGui = localPlayer:FindFirstChild("PlayerGui")

  if playerGui then
    local scriptssjTPOP = playerGui:FindFirstChild("Scriptssj_TP_OP")

    if scriptssjTPOP then
      scriptssjTPOP:Destroy()
    end
  end
end)

local scriptssjTPOP2 = Instance.new("ScreenGui")
scriptssjTPOP2.Name = "Scriptssj_TP_OP"
scriptssjTPOP2.ResetOnSpawn = false

pcall(function()
  if syn and syn.protect_gui then
    syn.protect_gui(scriptssjTPOP2)
    scriptssjTPOP2.Parent = coreGui
  elseif gethui then
    scriptssjTPOP2.Parent = gethui()
  else
    scriptssjTPOP2.Parent = coreGui
  end
end)

if not scriptssjTPOP2.Parent then
  scriptssjTPOP2.Parent = localPlayer:WaitForChild("PlayerGui")
end

local instance = Instance.new("Frame", scriptssjTPOP2)
instance.Size = UDim2.new(0, 240, 0, 165)
instance.Position = UDim2.new(0.5, -120, 0.4, -82)
instance.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
instance.BorderSizePixel = 0
instance.Active = true
instance.Draggable = true

Instance.new("UICorner", instance).CornerRadius = UDim.new(0, 8)

local instance2 = Instance.new("UIStroke", instance)
instance2.Color = Color3.fromRGB(140, 50, 230)
instance2.Thickness = 2

local instance3 = Instance.new("Frame", instance)
instance3.Size = UDim2.new(1, 0, 0, 32)
instance3.BackgroundColor3 = Color3.fromRGB(25, 22, 35)
instance3.BorderSizePixel = 0

Instance.new("UICorner", instance3).CornerRadius = UDim.new(0, 8)

local instance4 = Instance.new("TextLabel", instance3)
instance4.Size = UDim2.new(1, -30, 1, 0)
instance4.Position = UDim2.new(0, 10, 0, 0)
instance4.BackgroundTransparency = 1
instance4.Font = Enum.Font.GothamBold
instance4.TextSize = 12
instance4.TextColor3 = Color3.fromRGB(255, 255, 255)
instance4.TextXAlignment = Enum.TextXAlignment.Left
instance4.Text = "Scriptssj TP OP"

local instance5 = Instance.new("TextButton", instance)
instance5.Size = UDim2.new(1, -20, 0, 36)
instance5.Position = UDim2.new(0, 10, 0, 42)
instance5.BackgroundColor3 = Color3.fromRGB(30, 28, 42)
instance5.Font = Enum.Font.GothamBold
instance5.TextSize = 11
instance5.TextColor3 = Color3.fromRGB(220, 220, 220)
instance5.Text = "GUARDAR POSICIÓN"

Instance.new("UICorner", instance5).CornerRadius = UDim.new(0, 6)
local cframe2

instance5.Activated:Connect(function()
  local v21 = f1()

  if v21 then
    cframe2 = v21.CFrame
    cframe = v21.CFrame
    instance5.Text = "¡POSICIÓN GUARDADA!"
    task.wait(1.5)
    instance5.Text = "1. ACTUALIZAR POSICIÓN"
  end
end)

local instance6 = Instance.new("TextButton", instance)
instance6.Size = UDim2.new(1, -20, 0, 66)
instance6.Position = UDim2.new(0, 10, 0, 86)
instance6.BackgroundColor3 = Color3.fromRGB(110, 30, 200)
instance6.Font = Enum.Font.GothamBold
instance6.TextSize = 12
instance6.TextColor3 = Color3.fromRGB(255, 255, 255)
instance6.Text = "FLASH STEAL"

Instance.new("UICorner", instance6).CornerRadius = UDim.new(0, 6)

instance6.Activated:Connect(function()
  if v5 then
    return
  end

  if not cframe2 then
    instance6.Text = "¡PRIMERO GUARDA LA POSICIÓN!"
    task.wait(1.5)
    instance6.Text = "FLASH STEAL"
    return
  end

  v5 = true

  task.spawn(function()
    local v22, v23 = pcall(function()
      local v24, v25 = f8()
      local currentCamera, cameraType, cameraSubject

      if not v24 then
        instance6.Text = "¡SIN PETS DISPONIBLES!"
        task.wait(1.2)
        return
      else
        if not v25 then
          for index5, value5 in ipairs(v24:GetDescendants()) do
            if value5:IsA("ProximityPrompt") then
              v25 = value5
              break
            end
          end
        end

        local head = v24:FindFirstChild("Head") or v24:FindFirstChild("HumanoidRootPart")
          or v24:FindFirstChildWhichIsA("BasePart")

        if not head or not v25 then
          instance6.Text = "¡PIEZA NO HALLADA!"
          task.wait(1.2)
          return
        else
          local v26, v27, v28 = f1()

          if not v26 then
            return
          else
            currentCamera = workspaceService.CurrentCamera
            cameraType = currentCamera.CameraType
            cameraSubject = currentCamera.CameraSubject
            v3 = true
            local position = head.Position
            local v29 = math.max(v26.Position.Y, position.Y) + 300

            if v29 < 650 then
              v29 = 650
            end

            v26.CFrame = CFrame.new(v26.Position.X, v29, v26.Position.Z)
            task.wait(0.04)
            f2(v28, false)
            v26.CFrame = CFrame.new(position + Vector3.new(0, 0.5, 0))
            task.wait(0.05)

            pcall(function()
              if waitForChild then
                waitForChild:FireServer("steal_cancel", 83618240)
              end
            end)

            pcall(function()
              v25.Enabled = true
              v25.HoldDuration = 0
              v25.RequiresLineOfSight = false
              v25.MaxActivationDistance = 999
            end)

            local v30 = tick()

            while tick() - v30 < 0.45 do
              if v25 and v25.Parent and fireproximityprompt then
                pcall(fireproximityprompt, v25)
              end

              task.wait(0.015)
            end

            local v31 = f1()

            if v31 and cframe2 then
              v31.CFrame = cframe2
            end

            task.wait(0.05)
            f2(localPlayer.Character, true)

            pcall(function()
              currentCamera.CameraType = cameraType

              if localPlayer.Character then
                local humanoid2 = localPlayer.Character:FindFirstChildOfClass("Humanoid")

                if humanoid2 then
                  currentCamera.CameraSubject = humanoid2
                end
              elseif cameraSubject then
                currentCamera.CameraSubject = cameraSubject
              end
            end)

            return
          end
        end
      end
    end)

    v3 = false
    f2(localPlayer.Character, true)

    pcall(function()
      local currentCamera2 = workspaceService.CurrentCamera
      currentCamera2.CameraType = Enum.CameraType.Custom

      local humanoid3 = localPlayer.Character
        and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid3 then
        currentCamera2.CameraSubject = humanoid3
      end
    end)

    if not v22 then
      warn("[Flash Steal]", v23)
      instance6.Text = "ERROR"
      task.wait(1)
    end

    instance6.Text = "FLASH STEAL"
    v5 = false
  end)
end)

print("[SCRIPTSSJ] TP OP cielo + anti-TP listo")
