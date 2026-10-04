local coreGui = game:GetService("CoreGui")
local players = game:GetService("Players")
local teleportService = game:GetService("TeleportService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local localPlayer = players.LocalPlayer
local placeId = game.PlaceId

local scriptSSJServerScout = Instance.new("ScreenGui")
scriptSSJServerScout.Name = "ScriptSSJ_ServerScout"
scriptSSJServerScout.ResetOnSpawn = false
scriptSSJServerScout.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() scriptSSJServerScout.IgnoreGuiInset = true end)

pcall(function()
  if syn and syn.protect_gui then
    syn.protect_gui(scriptSSJServerScout)
    scriptSSJServerScout.Parent = coreGui
  elseif gethui then
    scriptSSJServerScout.Parent = gethui()
  else
    scriptSSJServerScout.Parent = coreGui
  end
end)

if not scriptSSJServerScout.Parent then
  scriptSSJServerScout.Parent = localPlayer:WaitForChild("PlayerGui")
end

local v1 = {
  bg = Color3.fromRGB(22, 22, 22),
  card = Color3.fromRGB(30, 30, 30),
  row = Color3.fromRGB(38, 38, 42),
  accent = Color3.fromRGB(140, 70, 255),
  off = Color3.fromRGB(50, 50, 50),
  text = Color3.fromRGB(220, 220, 220),
  dim = Color3.fromRGB(150, 150, 165),
  hot = Color3.fromRGB(45, 25, 70),
  ok = Color3.fromRGB(60, 40, 90),
}

local v2 = false
local v3 = 5
local v4 = {}

local frame = Instance.new("Frame")
frame.Parent = scriptSSJServerScout
frame.Size = UDim2.new(0, 230, 0, 400)
frame.Position = UDim2.new(0.5, -115, 0.5, -200)
frame.BackgroundColor3 = v1.bg
frame.BorderSizePixel = 0
frame.Active = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = frame
uiStroke.Color = v1.accent
uiStroke.Thickness = 1.5

local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(1, -40, 0, 26)
textLabel.Position = UDim2.new(0, 8, 0, 4)
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "SERVER SCOUT EXTREME"
textLabel.TextSize = 11
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.Active = true

local textButton = Instance.new("TextButton")
textButton.Parent = frame
textButton.Size = UDim2.new(0, 22, 0, 22)
textButton.Position = UDim2.new(1, -28, 0, 5)
textButton.BackgroundColor3 = v1.accent
textButton.Font = Enum.Font.GothamBold
textButton.Text = "X"
textButton.TextSize = 11
textButton.TextColor3 = Color3.new(1, 1, 1)

Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 5)

local frame2 = Instance.new("Frame")
frame2.Parent = frame
frame2.Position = UDim2.new(0, 8, 0, 32)
frame2.Size = UDim2.new(1, -16, 0, 1)
frame2.BackgroundColor3 = v1.accent
frame2.BorderSizePixel = 0

local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = frame
textLabel2.Size = UDim2.new(1, -16, 0, 20)
textLabel2.Position = UDim2.new(0, 8, 0, 38)
textLabel2.BackgroundColor3 = v1.card
textLabel2.Font = Enum.Font.GothamBold
textLabel2.TextSize = 10
textLabel2.TextColor3 = v1.text
textLabel2.Text = "Buscador Ultra Chetado (5+)"

Instance.new("UICorner", textLabel2).CornerRadius = UDim.new(0, 5)

local textLabel3 = Instance.new("TextLabel")
textLabel3.Parent = frame
textLabel3.Size = UDim2.new(1, -16, 0, 16)
textLabel3.Position = UDim2.new(0, 8, 0, 60)
textLabel3.BackgroundTransparency = 1
textLabel3.Font = Enum.Font.Gotham
textLabel3.TextSize = 9
textLabel3.TextColor3 = v1.dim
textLabel3.TextXAlignment = Enum.TextXAlignment.Left
textLabel3.Text = "Job: " .. string.sub(game.JobId, 1, 8) .. "..."

local function f1(text, p1, p2, p3, p4)
  local textButton2 = Instance.new("TextButton")
  textButton2.Parent = frame
  textButton2.Size = UDim2.new(0, p3, 0, p4 or 26)
  textButton2.Position = UDim2.new(0, p1, 0, p2)
  textButton2.BackgroundColor3 = v1.off
  textButton2.Font = Enum.Font.GothamBold
  textButton2.Text = text
  textButton2.TextSize = 10
  textButton2.TextColor3 = v1.text
  textButton2.AutoButtonColor = true

  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)
  return textButton2
end

local v5 = f1("Join OP", 8, 80, 106)
local v6 = f1("Players", 118, 80, 104)

local textLabel4 = Instance.new("TextLabel")
textLabel4.Parent = frame
textLabel4.BackgroundTransparency = 1
textLabel4.Size = UDim2.new(0, 90, 0, 20)
textLabel4.Position = UDim2.new(0, 8, 0, 114)
textLabel4.Font = Enum.Font.Gotham
textLabel4.TextSize = 9
textLabel4.TextColor3 = v1.dim
textLabel4.TextXAlignment = Enum.TextXAlignment.Left
textLabel4.Text = "Min players:"

local v7 = f1("-", 100, 112, 28, 22)

local textLabel5 = Instance.new("TextLabel")
textLabel5.Parent = frame
textLabel5.Size = UDim2.new(0, 28, 0, 22)
textLabel5.Position = UDim2.new(0, 130, 0, 112)
textLabel5.BackgroundColor3 = v1.card
textLabel5.Font = Enum.Font.GothamBold
textLabel5.TextSize = 11
textLabel5.TextColor3 = Color3.new(1, 1, 1)
textLabel5.Text = tostring(v3)

Instance.new("UICorner", textLabel5).CornerRadius = UDim.new(0, 5)
local v8 = f1("+", 160, 112, 28, 22)

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Parent = frame
scrollingFrame.Size = UDim2.new(1, -16, 0, 240)
scrollingFrame.Position = UDim2.new(0, 8, 0, 144)
scrollingFrame.BackgroundColor3 = v1.card
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 3
scrollingFrame.ScrollBarImageColor3 = v1.accent
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

Instance.new("UICorner", scrollingFrame).CornerRadius = UDim.new(0, 6)

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollingFrame
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 3)

local uiPadding = Instance.new("UIPadding")
uiPadding.Parent = scrollingFrame
uiPadding.PaddingTop = UDim.new(0, 4)
uiPadding.PaddingLeft = UDim.new(0, 4)
uiPadding.PaddingRight = UDim.new(0, 4)

local function f2(text2, p5)
  textLabel2.Text = text2
  textLabel2.BackgroundColor3 = p5 and v1.hot or v1.card
  textLabel2.TextColor3 = p5 and Color3.fromRGB(210, 180, 255) or v1.text
end

local function f3()
  for index, value in ipairs(scrollingFrame:GetChildren()) do
    if value:IsA("Frame") or value:IsA("TextButton") then
      value:Destroy()
    end
  end
end

local function f4(text3, p6, p7, p8, p9)
  local textButton3 = Instance.new("TextButton")
  textButton3.Parent = scrollingFrame
  textButton3.Size = UDim2.new(1, -4, 0, 34)
  textButton3.BackgroundColor3 = p8 and v1.ok or v1.row
  textButton3.BorderSizePixel = 0
  textButton3.LayoutOrder = p7 or 0
  textButton3.Text = ""
  textButton3.AutoButtonColor = p9 ~= nil

  Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 5)

  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Parent = textButton3
  textLabel6.BackgroundTransparency = 1
  textLabel6.Size = UDim2.new(1, -8, 0, 16)
  textLabel6.Position = UDim2.new(0, 6, 0, 2)
  textLabel6.Font = Enum.Font.GothamBold
  textLabel6.TextSize = 10
  textLabel6.TextColor3 = Color3.new(1, 1, 1)
  textLabel6.TextXAlignment = Enum.TextXAlignment.Left
  textLabel6.TextTruncate = Enum.TextTruncate.AtEnd
  textLabel6.Text = text3
  textLabel6.ZIndex = 2

  local textLabel7 = Instance.new("TextLabel")
  textLabel7.Parent = textButton3
  textLabel7.BackgroundTransparency = 1
  textLabel7.Size = UDim2.new(1, -8, 0, 12)
  textLabel7.Position = UDim2.new(0, 6, 0, 18)
  textLabel7.Font = Enum.Font.Gotham
  textLabel7.TextSize = 9
  textLabel7.TextColor3 = v1.dim
  textLabel7.TextXAlignment = Enum.TextXAlignment.Left
  textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
  textLabel7.Text = p6 or ""
  textLabel7.ZIndex = 2

  if p9 then
    textButton3.Activated:Connect(function() pcall(p9) end)
  end
end

local function f5()
  scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 10)
end

local function f6(p10)
  if not p10 then
    return
  else
    v4[p10] = true
    local count = 0

    for key in pairs(v4) do
      count = count + 1
    end

    if count > 60 then
      local count2 = 0

      for key2 in pairs(v4) do
        v4[key2] = nil
        count2 = count2 + 1

        if count2 >= math.floor(30) then
          break
        end
      end
    end

    return
  end
end

local function f7(p11)
  local v9 = {}

  pcall(function()
    if request then
      table.insert(v9, function()
        local v10 = request({ Url = p11, Method = "GET" })
        return v10.Body or v10.body
      end)
    end
  end)

  pcall(function()
    if http_request then
      table.insert(v9, function()
        local v11 = http_request({ Url = p11, Method = "GET" })
        return v11.Body or v11.body
      end)
    end
  end)

  pcall(function() table.insert(v9, function() return game:HttpGet(p11) end) end)

  for index2, value2 in ipairs(v9) do
    local v12, v13 = pcall(value2)

    if v12 and type(v13) == "string" and #v13 > 10 then
      return v13
    end
  end

  return nil
end

local function f8(p12)
  local v14 = not p12 or p12 == ""
  local v15, v16, v17



  if v14 then
    return 0
  else
    local gsub = string.upper((tostring(p12))):gsub(",", ""):gsub("%$", "")

    if gsub:find("/S") then
      local v18, v19 = gsub:match("([%d%.]+)([KMBTQA]?)")

      if not v18 then
        return 0
      else
        local v20 = tonumber(v18) or 0

        if v19 == "K" or v19 == "" then
          return 0
        end

        if v19 == "M" then
          return v20 / 1000
        end

        v16, v15 = gsub:match("([%d%.]+)([KMBTQA]+)")
        v17 = not v16

        if v17 or not v15 then
          return 0
        else
          local v21 = tonumber(v16)

          if not v21 or v21 <= 0 then
            return 0
          elseif v15 == "K" then
            return v21 / 1000000
          elseif v15 == "M" then
            return v21 / 1000
          elseif v15 == "B" then
            return v21
          elseif v15 == "T" then
            return v21 * 1000
          else
            if v15 == "QA" then
              return v21 * 1000000
            end

            return 0
          end
        end
      end
    else
      v16, v15 = gsub:match("([%d%.]+)([KMBTQA]+)")
      v17 = not v16

      if v17 or not v15 then
        return 0
      else
        local v22 = tonumber(v16)

        if not v22 or v22 <= 0 then
          return 0
        elseif v15 == "K" then
          return v22 / 1000000
        elseif v15 == "M" then
          return v22 / 1000
        elseif v15 == "B" then
          return v22
        elseif v15 == "T" then
          return v22 * 1000
        else
          if v15 == "QA" then
            return v22 * 1000000
          end

          return 0
        end
      end
    end
  end
end

local function f9(p13)
  local v23 = f8(p13)

  if v23 <= 0 then
    return 0, nil, 0
  end

  local v24

  if v23 >= 1000 then
    v24 = string.format("%.1fT", v23 / 1000)
  else
    v24 = string.format("%.0fB", v23)
  end

  return v23, v24, v23
end

local function f10(p14)
  local v25 = 0
  local v26, v27

  if not p14 then
    return v25, v27, v26
  end

  for index3, value3 in ipairs(p14:GetDescendants()) do
    if (value3:IsA("TextLabel") or value3:IsA("TextButton")) and value3.Text
      and #value3.Text > 1 then
      local text4 = value3.Text

      if not text4:find("Regístrate") and not text4:find("MÁQUINA")
        and not text4:find("TRAIT") then
        local v28, v29 = f9(text4)

        if v28 > v25 then
          v26 = text4
          v27 = v29
          v25 = v28
        end
      end
    end
  end

  return v25, v27, v26
end

local function f11()
  local total = 0
  local count3 = 0
  local plots = workspaceService:FindFirstChild("Plots")

  if plots then
    for index4, value4 in ipairs(plots:GetChildren()) do
      local v30, v31, v32 = f10(value4)

      if v30 > 0 then
        total = total + v30
        count3 = count3 + 1
      end
    end
  end

  for index5, value5 in ipairs(players:GetPlayers()) do
    local character = value5.Character

    if character then
      local v33, v34, v35 = f10(character)

      if v33 > 0 then
        total = total + v33
      end
    end
  end

  return total, count3
end

local function f12()
  f3()
  local getPlayers = players:GetPlayers()
  local v36, v37 = f11()

  f4("Jugadores: " .. #getPlayers, "Bases detectadas: " .. v37, 1, v36 > 50)

  f4(
    "Riqueza total aprox:",
    v36 >= 1000 and string.format("%.1fT", v36 / 1000) or string.format("%.0fB", v36), 2,
    v36 > 50
  )

  f2("Server evaluado con éxito", v36 > 50)
  f5()
end

local function f13()
  local v38 = f7("https://games.roblox.com/v1/games/" .. placeId
    .. "/servers/Public?sortOrder=Desc&limit=100")

  if v38 then
    local v39, v40 = pcall(function() return httpService:JSONDecode(v38) end)

    if v39 and type(v40) == "table" and type(v40.data) == "table" then
      return v40.data
    end

    return {}
  end

  return {}
end

local function f14(p15)
  local jobId = game.JobId
  local v41 = {}

  for index6, value6 in ipairs(p15 or {}) do
    local v42 = tonumber(value6.playing) or 0
    local v43 = tonumber(value6.maxPlayers) or 99

    if value6.id and value6.id ~= jobId and not v4[value6.id] and v42 >= v3 and v42 < v43 then
      table.insert(v41, value6)
    end
  end

  if #v41 == 0 then
    for index7, value7 in ipairs(p15 or {}) do
      local v44 = tonumber(value7.playing) or 0

      if value7.id and value7.id ~= jobId and not v4[value7.id] and v44 >= 4 then
        table.insert(v41, value7)
      end
    end
  end

  table.sort(v41, function(p16, p17)
    return (tonumber(p16.playing) or 0) > (tonumber(p17.playing) or 0)
  end)

  if #v41 > 0 then
    return v41[1].id
  end

  for index8, value8 in ipairs(p15 or {}) do
    if value8.id and value8.id ~= jobId then
      return value8.id
    end
  end

  return nil
end

local function f15(p18)
  if v2 then
    return
  end

  v2 = true
  f2(p18 or "Buscando server muy chetado...", true)
  v5.Text = "..."

  task.spawn(function()
    local v45 = false

    pcall(function()
      f6(game.JobId)
      local v46 = f14((f13()))

      if v46 then
        f6(v46)
        teleportService:TeleportToPlaceInstance(placeId, v46, localPlayer)
        v45 = true
      end
    end)

    if not v45 then
      pcall(function() teleportService:Teleport(placeId, localPlayer) end)
    end

    task.wait(4)
    v2 = false
    v5.Text = "Join OP"
  end)
end

v5.Activated:Connect(function() f15("Buscando server chetado (5+)...") end)
v6.Activated:Connect(f12)
textButton.Activated:Connect(function() scriptSSJServerScout:Destroy() end)

v7.Activated:Connect(function()
  v3 = math.max(1, v3 - 1)
  textLabel5.Text = tostring(v3)
end)

v8.Activated:Connect(function()
  v3 = math.min(15, v3 + 1)
  textLabel5.Text = tostring(v3)
end)

local v47, position, position2

textLabel.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
    v47 = true
    position = input.Position
    position2 = frame.Position
  end
end)

userInputService.InputEnded:Connect(function(input2) v47 = false end)

userInputService.InputChanged:Connect(function(input3)
  if not v47 or not position or not position2 then
    return
  else
    local v48 = input3.Position - position

    frame.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v48.X, position2.Y.Scale,
      position2.Y.Offset + v48.Y
    )

    return
  end
end)

f6(game.JobId)
f12()
print("[SCRIPTSSJ] Join OP (Precisión Alta) listo")
