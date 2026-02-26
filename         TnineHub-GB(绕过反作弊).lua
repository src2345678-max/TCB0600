elseif game.PlaceId == 12334109280 then
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/ui.lua"))()
WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local rainbowBorderAnimation
local currentBorderColorScheme = "彩虹颜色"
local currentFontColorScheme = "彩虹颜色"
local borderInitialized = false
local animationSpeed = 2
local borderEnabled = true
local fontColorEnabled = false
local uiScale = 1
local blurEnabled = false
local soundEnabled = true

local FONT_STYLES = {
    "SourceSansBold","SourceSansItalic","SourceSansLight","SourceSans",
    "GothamSSm","GothamSSm-Bold","GothamSSm-Medium","GothamSSm-Light",
    "GothamSSm-Black","GothamSSm-Book","GothamSSm-XLight","GothamSSm-Thin",
    "GothamSSm-Ultra","GothamSSm-SemiBold","GothamSSm-ExtraLight","GothamSSm-Heavy",
    "GothamSSm-ExtraBold","GothamSSm-Regular","Gotham","GothamBold",
    "GothamMedium","GothamBlack","GothamLight","Arial","ArialBold",
    "Code","CodeLight","CodeBold","Highway","HighwayBold","HighwayLight",
    "SciFi","SciFiBold","SciFiItalic","Cartoon","CartoonBold","Handwritten"
}

local FONT_DESCRIPTIONS = {
    ["SourceSansBold"] = "标准粗体",["SourceSansItalic"] = "斜体",["SourceSansLight"] = "细体",
    ["SourceSans"] = "标准体",["GothamSSm"] = "哥特标准",["GothamSSm-Bold"] = "哥特粗体",
    ["GothamSSm-Medium"] = "哥特中等",["GothamSSm-Light"] = "哥特细体",["GothamSSm-Black"] = "哥特黑体",
    ["GothamSSm-Book"] = "哥特书本体",["GothamSSm-XLight"] = "哥特超细体",["GothamSSm-Thin"] = "哥特极细体",
    ["GothamSSm-Ultra"] = "哥特超黑体",["GothamSSm-SemiBold"] = "哥特半粗体",["GothamSSm-ExtraLight"] = "哥特特细体",
    ["GothamSSm-Heavy"] = "哥特粗重体",["GothamSSm-ExtraBold"] = "哥特特粗体",["GothamSSm-Regular"] = "哥特常规体",
    ["Gotham"] = "经典哥特体",["GothamBold"] = "经典哥特粗体",["GothamMedium"] = "经典哥特中等",
    ["GothamBlack"] = "经典哥特黑体",["GothamLight"] = "经典哥特细体",["Arial"] = "标准Arial体",
    ["ArialBold"] = "Arial粗体",["Code"] = "代码字体",["CodeLight"] = "代码细体",
    ["CodeBold"] = "代码粗体",["Highway"] = "高速公路体",["HighwayBold"] = "高速公路粗体",
    ["HighwayLight"] = "高速公路细体",["SciFi"] = "科幻字体",["SciFiBold"] = "科幻粗体",
    ["SciFiItalic"] = "科幻斜体",["Cartoon"] = "卡通字体",["CartoonBold"] = "卡通粗体",
    ["Handwritten"] = "手写体"
}

local currentFontStyle = "SourceSansBold"

local COLOR_SCHEMES = {
    ["彩虹颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),ColorSequenceKeypoint.new(1, Color3.fromHex("EE82EE"))}),"palette"},
    ["黑红颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("000000")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(1, Color3.fromHex("000000"))}),"alert-triangle"},
    ["蓝白颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FFFFFF")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("1E90FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFFFFF"))}),"droplet"},
    ["紫金颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FFD700")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("8A2BE2")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFD700"))}),"crown"},
    ["蓝黑颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("000000")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("0000FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("000000"))}),"moon"},
    ["绿紫颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("00FF00")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("800080")),ColorSequenceKeypoint.new(1, Color3.fromHex("00FF00"))}),"zap"},
    ["粉蓝颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF69B4")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("00BFFF")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF69B4"))}),"heart"},
    ["橙青颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF4500")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("00CED1")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF4500"))}),"sun"},
    ["红金颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FFD700")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF0000"))}),"award"},
    ["银蓝颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("C0C0C0")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("4682B4")),ColorSequenceKeypoint.new(1, Color3.fromHex("C0C0C0"))}),"star"},
    ["霓虹颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF00FF")),ColorSequenceKeypoint.new(0.25, Color3.fromHex("00FFFF")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FFFF00")),ColorSequenceKeypoint.new(0.75, Color3.fromHex("FF00FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("00FFFF"))}),"sparkles"},
    ["森林颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("228B22")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("32CD32")),ColorSequenceKeypoint.new(1, Color3.fromHex("228B22"))}),"tree"},
    ["火焰颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF4500")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF8C00"))}),"flame"},
    ["海洋颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("000080")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("1E90FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("00BFFF"))}),"waves"},
    ["日落颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF4500")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF8C00")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFD700"))}),"sunset"},
    ["银河颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("4B0082")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("8A2BE2")),ColorSequenceKeypoint.new(1, Color3.fromHex("9370DB"))}),"galaxy"},
    ["糖果颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF69B4")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF1493")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFB6C1"))}),"candy"},
    ["金属颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("C0C0C0")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("A9A9A9")),ColorSequenceKeypoint.new(1, Color3.fromHex("696969"))}),"shield"}
}

local fontColorAnimations = {}

local function applyFontColorGradient(textElement, colorScheme)
    if not textElement or not textElement:IsA("TextLabel") and not textElement:IsA("TextButton") and not textElement:IsA("TextBox") then
        return
    end
    
    local existingGradient = textElement:FindFirstChild("FontColorGradient")
    if existingGradient then
        existingGradient:Destroy()
    end
    
    if fontColorAnimations[textElement] then
        fontColorAnimations[textElement]:Disconnect()
        fontColorAnimations[textElement] = nil
    end
    
    if not fontColorEnabled then
        textElement.TextColor3 = Color3.new(1, 1, 1)
        return
    end
    
    local schemeData = COLOR_SCHEMES[colorScheme or currentFontColorScheme]
    if not schemeData then return end
    
    local fontGradient = Instance.new("UIGradient")
    fontGradient.Name = "FontColorGradient"
    fontGradient.Color = schemeData[1]
    fontGradient.Rotation = 0
    fontGradient.Parent = textElement
    
    textElement.TextColor3 = Color3.new(1, 1, 1)
    
    local animation
    animation = game:GetService("RunService").Heartbeat:Connect(function()
        if not textElement or textElement.Parent == nil then
            animation:Disconnect()
            fontColorAnimations[textElement] = nil
            return
        end
        
        if not fontGradient or fontGradient.Parent == nil then
            animation:Disconnect()
            fontColorAnimations[textElement] = nil
            return
        end
        
        local time = tick()
        fontGradient.Rotation = (time * animationSpeed * 30) % 360
    end)
    
    fontColorAnimations[textElement] = animation
end

local function applyFontStyleToWindow(fontStyle)
    if not Window or not Window.UIElements then 
        wait(0.5)
        if not Window or not Window.UIElements then
            return false
        end
    end
    
    local successCount = 0
    local totalCount = 0
    
    local function processElement(element)
        for _, child in ipairs(element:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                totalCount = totalCount + 1
                pcall(function()
                    child.Font = Enum.Font[fontStyle]
                    successCount = successCount + 1
                end)
            end
        end
    end
    
    processElement(Window.UIElements.Main)
    
    return successCount, totalCount
end

local function applyFontColorsToWindow(colorScheme)
    if not Window or not Window.UIElements then return end
    
    local function processElement(element)
        for _, child in ipairs(element:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                applyFontColorGradient(child, colorScheme)
            end
        end
    end
    
    processElement(Window.UIElements.Main)
end

local function createRainbowBorder(window, colorScheme, speed)
    if not window or not window.UIElements then
        wait(1)
        if not window or not window.UIElements then
            return nil, nil
        end
    end
    
    local mainFrame = window.UIElements.Main
    if not mainFrame then
        return nil, nil
    end
    
    local existingStroke = mainFrame:FindFirstChild("RainbowStroke")
    if existingStroke then
        local glowEffect = existingStroke:FindFirstChild("GlowEffect")
        if glowEffect then
            local schemeData = COLOR_SCHEMES[colorScheme or currentBorderColorScheme]
            if schemeData then
                glowEffect.Color = schemeData[1]
            end
        end
        return existingStroke, rainbowBorderAnimation
    end
    
    if not mainFrame:FindFirstChildOfClass("UICorner") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 16)
        corner.Parent = mainFrame
    end
    
    local rainbowStroke = Instance.new("UIStroke")
    rainbowStroke.Name = "RainbowStroke"
    rainbowStroke.Thickness = 1.5
    rainbowStroke.Color = Color3.new(1, 1, 1)
    rainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rainbowStroke.LineJoinMode = Enum.LineJoinMode.Round
    rainbowStroke.Enabled = borderEnabled
    rainbowStroke.Parent = mainFrame
    
    local glowEffect = Instance.new("UIGradient")
    glowEffect.Name = "GlowEffect"
    
    local schemeData = COLOR_SCHEMES[colorScheme or currentBorderColorScheme]
    if schemeData then
        glowEffect.Color = schemeData[1]
    else
        glowEffect.Color = COLOR_SCHEMES["彩虹颜色"][1]
    end
    
    glowEffect.Rotation = 0
    glowEffect.Parent = rainbowStroke
    
    return rainbowStroke, nil
end

local function startBorderAnimation(window, speed)
    if not window or not window.UIElements then
        return nil
    end
    
    local mainFrame = window.UIElements.Main
    if not mainFrame then
        return nil
    end
    
    local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
    if not rainbowStroke or not rainbowStroke.Enabled then
        return nil
    end
    
    local glowEffect = rainbowStroke:FindFirstChild("GlowEffect")
    if not glowEffect then
        return nil
    end
    
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
    
    local animation
    animation = game:GetService("RunService").Heartbeat:Connect(function()
        if not rainbowStroke or rainbowStroke.Parent == nil or not rainbowStroke.Enabled then
            animation:Disconnect()
            return
        end
        
        local time = tick()
        glowEffect.Rotation = (time * speed * 60) % 360
    end)
    
    rainbowBorderAnimation = animation
    return animation
end

local function initializeRainbowBorder(scheme, speed)
    speed = speed or animationSpeed
    
    local rainbowStroke, _ = createRainbowBorder(Window, scheme, speed)
    if rainbowStroke then
        if borderEnabled then
            startBorderAnimation(Window, speed)
        end
        borderInitialized = true
        return true
    end
    return false
end

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

local function playSound()
    if soundEnabled then
        pcall(function()
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://9047002353"
            sound.Volume = 0.3
            sound.Parent = game:GetService("SoundService")
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 2)
        end)
    end
end

local function applyBlurEffect(enabled)
    if enabled then
        pcall(function()
            local blur = Instance.new("BlurEffect")
            blur.Size = 8
            blur.Name = "UIXH HUBBlur"
            blur.Parent = game:GetService("Lighting")
        end)
    else
        pcall(function()
            local existingBlur = game:GetService("Lighting"):FindFirstChild("UIXH HUBBlur")
            if existingBlur then
                existingBlur:Destroy()
            end
        end)
    end
end

local function applyUIScale(scale)
    if Window and Window.UIElements and Window.UIElements.Main then
        local mainFrame = Window.UIElements.Main
        mainFrame.Size = UDim2.new(0, 600 * scale, 0, 400 * scale)
    end
end

local Confirmed = false
local username = game:GetService("Players").LocalPlayer.Name
local coloredUsername = ""
local gradientColors = {
    "#4169E1", 
    "#6A5ACD",  
    "#9370DB",  
    "#8A2BE2", 
    "#4B0082"   
}
local goldColor = "#FFD700"
for i = 1, #username do
    local char = username:sub(i, i)
    
    if char:match("[A-Za-z0-9]") then
        local colorIndex = (i - 1) % #gradientColors + 1
        coloredUsername = coloredUsername .. '<font color="' .. gradientColors[colorIndex] .. '">' .. char .. '</font>'
    else
        coloredUsername = coloredUsername .. '<font color="' .. goldColor .. '">' .. char .. '</font>'
    end
end

WindUI:Popup({
    Title = 'YG/TNINE SCRIPT',
    IconThemed = true,
    Icon = "crown",
    Content = "欢迎尊重的用户 " .. coloredUsername .. " \n感谢您使用我们的脚本\n加入我们QQ1015718032",
    Buttons = {
        {
            Title = "取消",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "执行",
            Icon = "arrow-right",
            Callback = function() 
                Confirmed = true
                createUI()
            end,
            Variant = "Primary",
        }
    }
})

function createUI()
    local Window = WindUI:CreateWindow({
        Title = 'YG/TNINE SCRIPT',
        Icon = "crown",
        IconThemed = true,
        Author = "怀/凌乱",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(375, 278),
        Transparent = true,
        Theme = "Rainbow",
        HideSearchBar = false,
        ScrollBarEnabled = true,
        Resizable = true,
        Background = "https://raw.githubusercontent.com/tnine-n9/TnineHubnb/refs/heads/main/1770443104414_edit_300225054024499.png",
        BackgroundImageTransparency = 0.45,
        User = {
            Enabled = true,
            Callback = function()
                WindUI:Notify({
                    Title = "点击了自己",
                    Content = "没什么", 
                    Duration = 1,
                    Icon = "4483362748"
                })
            end,
            Anonymous = false
        },
        SideBarWidth = 250,
        Search = {
            Enabled = true,
            Placeholder = "搜索...",
            Callback = function(searchText)
                print("搜索内容:", searchText)
            end
        },
        SidePanel = {
            Enabled = true,
            Content = {
                {
                    Type = "Button", 
                    Text = "",
                    Style = "Subtle", 
                    Size = UDim2.new(1, -20, 0, 30),
                    Callback = function()
                    end
                }
            }
        }
    })

Window:EditOpenButton({
    Title = "Paid user",
    Icon = "crown",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 4,
    Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
    Draggable = true,
})
Window:Tag({
    Title = "付费版",
    Color = Color3.fromHex("#FFA500") 
})
spawn(function()
    while true do
        for hue = 0, 1, 0.01 do  
            local color = Color3.fromHSV(hue, 0.8, 1)  
            Window:EditOpenButton({
                Color = ColorSequence.new(color)
            })
            wait(0.04)  
        end
    end
end)

if not borderInitialized then
    spawn(function()
        wait(0.5)
        initializeRainbowBorder("糖果颜色", animationSpeed)
        wait(1)
        applyFontStyleToWindow(currentFontStyle)
    end)
end

local windowOpen = true

Window:OnClose(function()
    windowOpen = false
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
end)

local originalOpenFunction = Window.Open
Window.Open = function(...)
    windowOpen = true
    local result = originalOpenFunction(...)
    
    if borderInitialized and borderEnabled and not rainbowBorderAnimation then
        wait(0.1)
        startBorderAnimation(Window, animationSpeed)
    end
    
    return result
end

local soundId = 115779793163732
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. soundId
sound.Parent = game:GetService("SoundService")
sound.Volume = 1
sound.Looped = false
sound:Play()
game:GetService("Debris"):AddItem(sound, sound.TimeLength + 1)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local AuraSettings = {
    silentaura = false,
    rotation = false,
    attackhead = false,
    barrel = false,
    attackRange = 19,
    pikeRange = 17,
    axeRange = 8,
    defaultRange = 10
}

local BayonetSettings = {
    silentaura = false,
    rotation = false,
    attackhead = false,
    barrel = false,
    attackRange = 15,
    thrustRange = 10
}

local function getCharacter()
    return player.Character
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getRootPart()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function distance(target)
    local root = getRootPart()
    if not root or not target or not target:FindFirstChild("HumanoidRootPart") then
        return math.huge
    end
    return (target.HumanoidRootPart.Position - root.Position).magnitude
end

local function IsAlive(model)
    if not (model and model.Parent) then return false end
    local humanoid = model:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.Health > 0
end

local function GetCurrentWeapon()
    local char = getCharacter()
    if not char then return nil end
    for _, item in pairs(char:GetChildren()) do if item:GetAttribute("Melee") then return item end end
    for _, item in pairs(player.Backpack:GetChildren()) do if item:GetAttribute("Melee") then return item end end
    return nil
end

local function GetWeaponByType()
    local char = getCharacter()
    if char then
        for _, item in pairs(char:GetChildren()) do 
            if item:GetAttribute("Melee") and item.Name ~= "Pike" then 
                return item 
            end 
        end
    end
    for _, item in pairs(player.Backpack:GetChildren()) do 
        if item:GetAttribute("Melee") and item.Name ~= "Pike" then 
            return item 
        end 
    end
    if char then
        for _, item in pairs(char:GetChildren()) do 
            if item:GetAttribute("Melee") and item.Name == "Pike" then 
                return item 
            end 
        end
    end
    for _, item in pairs(player.Backpack:GetChildren()) do 
        if item:GetAttribute("Melee") and item.Name == "Pike" then 
            return item 
        end 
    end
    return nil
end

local function GetDistance(target)
    local char = getCharacter()
    if char and char:FindFirstChild("HumanoidRootPart") and target and target.PrimaryPart then
        return (char.HumanoidRootPart.Position - target.PrimaryPart.Position).Magnitude
    end
    return math.huge
end

local function GetMusket()
    local char = getCharacter()
    for _, i in pairs(char:GetChildren()) do 
        if i.Name == "Musket" or i.Name == "Rifle" then 
            return i 
        end 
    end
    for _, i in pairs(player.Backpack:GetChildren()) do 
        if i.Name == "Musket" or i.Name == "Rifle" then 
            return i 
        end 
    end
    return nil
end

local function GetMeleeWeapon()
    local char = getCharacter()
    if char then
        for _, child in pairs(char:GetChildren()) do
            if child:GetAttribute("Melee") then return child end
        end
    end
    for _, child in pairs(player.Backpack:GetChildren()) do
        if child:GetAttribute("Melee") then return child end
    end
    return nil
end

local function AttackTarget(weapon, forceEquip, aim, target, ignoreDist)
    if not weapon then return end
    local char = getCharacter()
    if not char then return end
    
    local targetRoot = target:FindFirstChild("HumanoidRootPart")
    if not targetRoot then return end
    
    if (char.HumanoidRootPart.Position - targetRoot.Position).Magnitude < 5 then
        local oldParent = weapon.Parent
        local didEquip = false
        
        if forceEquip and weapon.Parent ~= char then
            weapon.Parent = char
            didEquip = true
        end
        task.wait()
        
        if aim then
             char.HumanoidRootPart.CFrame = CFrame.lookAt(char.HumanoidRootPart.Position, Vector3.new(targetRoot.Position.X, char.HumanoidRootPart.Position.Y, targetRoot.Position.Z))
        end
        
        local remote = char:WaitForChild(weapon.Name).RemoteEvent
        remote:FireServer("Swing", "Side")
        remote:FireServer("HitZombie", target, target.Head.CFrame.Position, true)
        task.wait()
        
        if didEquip and ignoreDist then
            weapon.Parent = oldParent
        end
    end
end

local function PerformAttack(target)
    local char = getCharacter()
    if not char then return false end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then
        tool = GetMeleeWeapon()
    end
    if not tool then return false end
    
    local remote = tool:FindFirstChild("RemoteEvent") or tool:FindFirstChild("RemoteFunction")
    if not remote then return false end
    
    local targetRoot = target:FindFirstChild("HumanoidRootPart") or target:FindFirstChild("Torso")
    if not targetRoot then return false end
    
    local myRoot = char.HumanoidRootPart
    local hitPos = targetRoot.Position
    local direction = (hitPos - myRoot.Position).Unit
    local force = direction * 25
    local knockback = -direction
    
    pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer("PrepareSwing")
            task.wait(0)
            remote:FireServer("Swing", "Side")
            remote:FireServer("HitZombie", target, hitPos, false, force, "Torso", knockback)
        else
            remote:InvokeServer("Attack", target, hitPos)
        end
    end)
    
    local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
    local gibRemote = remotes and remotes:FindFirstChild("Gib")
    if gibRemote then
        pcall(function() gibRemote:FireServer(target, "Torso", hitPos, knockback) end)
    end
    return true
end

local Tabs = {
    CombatTab = Window:Tab({ Title = gradient("杀戮类", Color3.fromHex("#FFFFFF"), Color3.fromHex("#FF0000")), Icon = "sword" }),
    SpeedTab = Window:Tab({ Title = gradient("移速控制", Color3.fromHex("#FFFFFF"), Color3.fromHex("#00FF00")), Icon = "gauge" }),
    AssistTab = Window:Tab({ Title = gradient("辅助功能", Color3.fromHex("#FFFFFF"), Color3.fromHex("#FFA500")), Icon = "settings" }),
}

local infoTab = Window:Tab({Title = "通知", Icon = "layout-grid", Locked = false})
local infoSection = infoTab:Section({Title = "详情信息",Icon = "info", Opened = true})
infoSection:Divider()
infoSection:Paragraph({
    Title = "您当前的服务器为",
    Desc = tostring(game.PlaceId) .. "\n欢迎使用YG/TNINE",
    ThumbnailSize = 190,
})
infoSection:Paragraph({
    Title = "持续更新 有bug请提出来",
    ThumbnailSize = 190,
})
infoSection:Paragraph({
    Title = "作者:怀 凌乱",
    ThumbnailSize = 190,
})

local LockSection = Window:Section({
    Title = "功能以及UI设置",
    Icon = "crown",
    Opened = true,
})

Tabs.CombatTab:Paragraph({
    Title = "公告",
    Desc = "死亡后你开启了那些功能全关闭再打开 不搞的话没效果",
    Image = "rbxassetid://4483345998",
    ImageSize = 42,
    ThumbnailSize = 120
})

Tabs.CombatTab:Section({Title = "杀戮光环"})
Tabs.CombatTab:Toggle({
    Title = "开启/关闭杀戮光环",
    Icon = "sword",
    Value = false,
    Callback = function(Value)
        AuraSettings.silentaura = Value
        if Value then
            local function AttackZombie(target, weapon, headshot)
                local char = getCharacter()
                local hitPos = headshot and target.Head.Position or target.PrimaryPart.Position
                hitPos = hitPos + char.Head.CFrame.LookVector * 2.55
                
                if weapon.Parent ~= char then 
                    weapon.Parent = char 
                end
                
                weapon.RemoteEvent:FireServer("Swing", "Side")
                local args
                if target:GetAttribute("Type") ~= "barrel" then
                    args = {"HitZombie", target, hitPos, true}
                else
                    args = {"HitZombie", target, target.L.CFrame.Position + char.Head.CFrame.LookVector * 2.55, false}
                end
                weapon.RemoteEvent:FireServer(unpack(args))
            end

            if _G.AuraLoop then 
                _G.AuraLoop:Disconnect() 
                _G.AuraLoop = nil
            end
            
            _G.AuraLoop = RunService.Heartbeat:Connect(function()
                local char = getCharacter()
                if AuraSettings.silentaura and char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                    pcall(function()
                        for _, zombie in pairs(workspace.Zombies:GetChildren()) do
                            if zombie and zombie.PrimaryPart and zombie:FindFirstChildOfClass("Humanoid") and zombie:FindFirstChild("State") and zombie.State.Value ~= "Spawn" and char.Humanoid.Health > 0 then
                                local dist = GetDistance(zombie)
                                if dist <= AuraSettings.attackRange then
                                    local isBarrel = zombie:GetAttribute("Type") == "Barrel"
                                    if AuraSettings.barrel or not isBarrel then
                                        local weapon = GetWeaponByType() or GetCurrentWeapon()
                                        if weapon then
                                            local range = weapon.Name == "Pike" and AuraSettings.pikeRange or (weapon.Name == "Axe" and AuraSettings.axeRange or AuraSettings.defaultRange)
                                            
                                            if AuraSettings.rotation then
                                                char.Humanoid.AutoRotate = false
                                                char.HumanoidRootPart.CFrame = CFrame.lookAt(char.HumanoidRootPart.Position, Vector3.new(zombie.PrimaryPart.Position.X, char.HumanoidRootPart.Position.Y, zombie.PrimaryPart.Position.Z))
                                                char.Humanoid.AutoRotate = true
                                            end
                                            
                                            if dist <= range then
                                                local headshot = AuraSettings.attackhead
                                                if headshot then headshot = not isBarrel end
                                                AttackZombie(zombie, weapon, headshot)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        else
            if _G.AuraLoop then 
                _G.AuraLoop:Disconnect() 
                _G.AuraLoop = nil
            end
        end
    end
})

Tabs.CombatTab:Section({Title = "刺刀光环"})
Tabs.CombatTab:Toggle({
    Title = "开启/关闭刺刀光环",
    Icon = "sword",
    Value = false,
    Callback = function(Value)
        BayonetSettings.silentaura = Value
        if Value then
            if _G.BayonetLoop then 
                _G.BayonetLoop:Disconnect() 
                _G.BayonetLoop = nil
            end
            
            _G.BayonetLoop = RunService.Heartbeat:Connect(function()
                local char = getCharacter()
                if BayonetSettings.silentaura and char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                    pcall(function()
                        local weapon = GetMusket()
                        if weapon then
                            for _, zombie in pairs(workspace.Zombies:GetChildren()) do
                                if zombie and zombie.PrimaryPart and zombie:FindFirstChildOfClass("Humanoid") and zombie:FindFirstChild("State") and zombie.State.Value ~= "Spawn" and char.Humanoid.Health > 0 then
                                    local dist = GetDistance(zombie)
                                    local isBarrel = zombie:GetAttribute("Type") == "Barrel"
                                    if (BayonetSettings.barrel or not isBarrel) and dist <= BayonetSettings.thrustRange then
                                        if dist > BayonetSettings.attackRange then
                                            weapon.RemoteEvent:FireServer("ThrustBayonet")
                                        else
                                            local hitPart = BayonetSettings.attackhead and "Head" or "Torso"
                                            local hitPos = BayonetSettings.attackhead and zombie.Head.Position or zombie.PrimaryPart.Position
                                            weapon.RemoteEvent:FireServer("Bayonet_HitZombie", zombie, hitPos, false, hitPart)
                                        end
                                        
                                        if BayonetSettings.rotation then
                                            char.Humanoid.AutoRotate = false
                                            char.HumanoidRootPart.CFrame = CFrame.lookAt(char.HumanoidRootPart.Position, Vector3.new(zombie.PrimaryPart.Position.X, char.HumanoidRootPart.Position.Y, zombie.PrimaryPart.Position.Z))
                                            char.Humanoid.AutoRotate = true
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        else
            if _G.BayonetLoop then 
                _G.BayonetLoop:Disconnect() 
                _G.BayonetLoop = nil
            end
        end
    end
})

Tabs.CombatTab:Section({Title = "杀戮光环设置"})
Tabs.CombatTab:Toggle({
    Title = "攻击头部",
    Icon = "target",
    Value = false,
    Callback = function(Value) 
        AuraSettings.attackhead = Value 
    end
})
Tabs.CombatTab:Toggle({
    Title = "攻击炸药桶",
    Icon = "bomb",
    Value = false,
    Callback = function(Value) 
        AuraSettings.barrel = Value 
    end
})
Tabs.CombatTab:Toggle({
    Title = "自动转向",
    Icon = "rotate-cw",
    Value = false,
    Callback = function(Value) 
        AuraSettings.rotation = Value 
    end
})
Tabs.CombatTab:Slider({
    Title = "自动转向触发范围",
    Value = {Min = 5, Max = 50, Default = 19},
    Callback = function(value)
        AuraSettings.attackRange = value
    end
})
Tabs.CombatTab:Slider({
    Title = "长矛攻击范围",
    Value = {Min = 5, Max = 30, Default = 17},
    Callback = function(value)
        AuraSettings.pikeRange = value
    end
})
Tabs.CombatTab:Slider({
    Title = "斧头攻击范围",
    Value = {Min = 5, Max = 20, Default = 8},
    Callback = function(value)
        AuraSettings.axeRange = value
    end
})
Tabs.CombatTab:Slider({
    Title = "其他武器攻击范围",
    Value = {Min = 5, Max = 20, Default = 10},
    Callback = function(value)
        AuraSettings.defaultRange = value
    end
})

Tabs.CombatTab:Section({Title = "刺刀光环设置"})
Tabs.CombatTab:Toggle({
    Title = "攻击头部",
    Icon = "target",
    Value = false,
    Callback = function(Value) 
        BayonetSettings.attackhead = Value 
    end
})
Tabs.CombatTab:Toggle({
    Title = "攻击炸药桶",
    Icon = "bomb",
    Value = false,
    Callback = function(Value) 
        BayonetSettings.barrel = Value 
    end
})
Tabs.CombatTab:Toggle({
    Title = "自动转向",
    Icon = "rotate-cw",
    Value = false,
    Callback = function(Value) 
        BayonetSettings.rotation = Value 
    end
})
Tabs.CombatTab:Slider({
    Title = "自动转向触发范围",
    Value = {Min = 5, Max = 30, Default = 15},
    Callback = function(value)
        BayonetSettings.attackRange = value
    end
})
Tabs.CombatTab:Slider({
    Title = "刺刀攻击范围",
    Value = {Min = 5, Max = 20, Default = 10},
    Callback = function(value)
        BayonetSettings.thrustRange = value
    end
})

Tabs.CombatTab:Section({Title = "高级战斗功能"})
Tabs.CombatTab:Toggle({
    Title = "自动打怪自救",
    Icon = "shield",
    Value = false,
    Callback = function(Value)
        if Value then
            if _G.SelfRescueLoop then 
                _G.SelfRescueLoop:Disconnect() 
                _G.SelfRescueLoop = nil
            end
            
            _G.SelfRescueLoop = RunService.Heartbeat:Connect(function()
                local weapon = GetMeleeWeapon()
                if weapon then
                    for _, zombie in pairs(workspace.Zombies:GetChildren()) do
                        pcall(function()
                            if zombie:GetAttribute("Type") ~= "Barrel" and zombie:FindFirstChild("HumanoidRootPart") then
                                AttackTarget(weapon, true, true, zombie, true)
                                task.wait(0.1)
                            end
                        end)
                    end
                end
            end)
        else
            if _G.SelfRescueLoop then 
                _G.SelfRescueLoop:Disconnect() 
                _G.SelfRescueLoop = nil
            end
        end
    end
})
Tabs.CombatTab:Toggle({
    Title = "自动攻击",
    Icon = "target",
    Value = false,
    Callback = function(Value)
        if Value then
            if _G.AutoAttackConnection then 
                _G.AutoAttackConnection:Disconnect() 
                _G.AutoAttackConnection = nil
            end
            
            local lastAttack = 0
            local cooldown = 0.5
            _G.AutoAttackConnection = RunService.Heartbeat:Connect(function()
                if tick() - lastAttack >= cooldown then
                    local targets = {}
                    local char = getCharacter()
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local myPos = char.HumanoidRootPart.Position
                        local range = 105
                        
                        local enemies = workspace:FindFirstChild("Zombies") or workspace:FindFirstChild("Enemies")
                        if enemies then
                            for _, enemy in ipairs(enemies:GetChildren()) do
                                if enemy:IsA("Model") and IsAlive(enemy) then
                                    local root = enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("Torso")
                                    if root and (myPos - root.Position).Magnitude <= range then
                                        table.insert(targets, {model = enemy, dist = (myPos - root.Position).Magnitude})
                                    end
                                end
                            end
                        end
                        
                        for _, child in ipairs(workspace:GetChildren()) do
                            if child:IsA("Model") and IsAlive(child) then
                                local root = child:FindFirstChild("HumanoidRootPart") or child:FindFirstChild("Torso")
                                if root and (myPos - root.Position).Magnitude <= range then
                                    table.insert(targets, {model = child, dist = (myPos - root.Position).Magnitude})
                                end
                            end
                        end
                        
                        table.sort(targets, function(a, b) return a.dist < b.dist end)
                        
                        if #targets > 0 and PerformAttack(targets[1].model) then
                            lastAttack = tick()
                        end
                    end
                end
            end)
        else
            if _G.AutoAttackConnection then 
                _G.AutoAttackConnection:Disconnect() 
                _G.AutoAttackConnection = nil
            end
        end
    end
})

Tabs.SpeedTab:Section({Title = "移速设置"})
Tabs.SpeedTab:Paragraph({
    Title = "移速功能说明",
    Desc = "开启后保持设定速度 死亡后这个功能也一样 关闭重开。",
    Image = "rbxassetid://4483345998",
    ImageSize = 42,
    ThumbnailSize = 120
})

local currentSpeed = 16
local speedToggle = false

Tabs.SpeedTab:Toggle({
    Title = "移速开关",
    Icon = "gauge",
    Value = false,
    Callback = function(state)
        speedToggle = state
        if state then
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = currentSpeed
            end
        else
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = 16
            end
        end
    end
})
Tabs.SpeedTab:Slider({
    Title = "移速大小",
    Value = {Min = 1, Max = 100, Default = 16},
    Callback = function(value)
        currentSpeed = value
        if speedToggle then
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = currentSpeed
            end
        end
    end
})
Tabs.SpeedTab:Toggle({
    Title = "无减速",
    Icon = "zap-off",
    Value = false,
    Callback = function(Value)
        if Value then
            local function EnforceSpeed()
                local char = getCharacter()
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                            if hum.WalkSpeed < 16 then hum.WalkSpeed = 16 end
                        end)
                        if hum.WalkSpeed < 16 then hum.WalkSpeed = 16 end
                    end
                end
            end
            EnforceSpeed()
            player.CharacterAdded:Connect(function() 
                task.wait(1) 
                EnforceSpeed() 
            end)
        end
    end
})

Tabs.AssistTab:Section({Title = "建筑与修复"})
Tabs.AssistTab:Toggle({
    Title = "自动修复建筑",
    Icon = "hammer",
    Value = false,
    Callback = function(Value)
        if Value then
            if _G.AutoRepairLoop then return end
            _G.AutoRepairLoop = true
            
            task.spawn(function()
                while _G.AutoRepairLoop do
                    local cam = workspace.CurrentCamera
                    local char = getCharacter()
                    if char then
                        local buildings = workspace:FindFirstChild("Buildings")
                        if buildings then
                            local closestDist = math.huge
                            local targetHealth = nil
                            local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
                            
                            local function CheckModel(model)
                                local health = model:FindFirstChild("BuildingHealth")
                                local hitbox = health and model:FindFirstChild("Hitbox")
                                if hitbox then
                                    local screenPos, onScreen = cam:WorldToScreenPoint(hitbox.CFrame.Position)
                                    if onScreen then
                                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                                        if dist < closestDist then
                                            closestDist = dist
                                            targetHealth = health
                                        end
                                    end
                                end
                            end
                            
                            for _, folder in ipairs(buildings:GetChildren()) do
                                if folder:IsA("Folder") then
                                    for _, model in ipairs(folder:GetChildren()) do
                                        if model:IsA("Model") then CheckModel(model) end
                                    end
                                end
                            end
                            
                            local caltrops = workspace:FindFirstChild("Caltrops")
                            if caltrops and caltrops:IsA("Model") then CheckModel(caltrops) end
                            local stakes = workspace:FindFirstChild("Stakes")
                            if stakes then CheckModel(stakes) end
                            
                            if targetHealth then
                                local hammer = char:FindFirstChild("Hammer")
                                local remote = hammer and hammer:FindFirstChild("RemoteEvent")
                                if remote then
                                    remote:FireServer("Repair", targetHealth)
                                end
                            end
                        end
                    end
                    task.wait(0.01)
                end
            end)
        else
            _G.AutoRepairLoop = false
        end
    end
})
Tabs.AssistTab:Toggle({
    Title = "自动挖雪",
    Icon = "shovel",
    Value = false,
    Callback = function(Value)
        local paths = {
            "Vardohus Fortress/Modes/Objective/DoorSnow/Diggable",
            "Vardohus Fortress/Modes/Objective/Diggable",
            "OLD Vardohus Fortress/Modes/Objective/DigSnow/Diggable"
        }
        
        local function GetShovel()
            local char = getCharacter()
            if not char then return nil end
            for _, child in pairs(char:GetChildren()) do
                if (child.Name == "Shovel" or child.Name == "Spade") and child:FindFirstChild("RemoteEvent") then return child end
            end
            for _, child in pairs(player.Backpack:GetChildren()) do
                if (child.Name == "Shovel" or child.Name == "Spade") and child:FindFirstChild("RemoteEvent") then return child end
            end
            return nil
        end
        
        local function GetSnowTarget()
            for _, path in ipairs(paths) do
                local parts = path:split("/")
                local current = workspace
                for _, name in ipairs(parts) do
                    current = current and current:FindFirstChild(name)
                end
                if current then return current end
            end
            return nil
        end
        
        if Value then
            if _G.AutoDigLoop then 
                _G.AutoDigLoop:Disconnect() 
                _G.AutoDigLoop = nil
            end
            
            _G.AutoDigLoop = RunService.Heartbeat:Connect(function()
                local target = GetSnowTarget()
                if target then
                    local shovel = GetShovel()
                    if shovel then
                        if shovel.Parent ~= player.Character then
                            shovel.Parent = player.Character
                            task.wait(0.2)
                        end
                        if shovel:FindFirstChild("RemoteEvent") then
                            shovel.RemoteEvent:FireServer("Dig", target, target.Position)
                        end
                    end
                end
            end)
        else
            if _G.AutoDigLoop then 
                _G.AutoDigLoop:Disconnect() 
                _G.AutoDigLoop = nil
            end
        end
    end
})
Tabs.AssistTab:Toggle({
    Title = "自动水桶灭火",
    Icon = "droplets",
    Value = false,
    Callback = function(Value)
        if Value then
            if _G.AutoBucketLoop then 
                _G.AutoBucketLoop:Disconnect() 
                _G.AutoBucketLoop = nil
            end
            
            _G.AutoBucketLoop = RunService.Heartbeat:Connect(function()
                local char = getCharacter()
                if not char then return end
                
                local bucket = char:FindFirstChild("Water Bucket") or player.Backpack:FindFirstChild("Water Bucket")
                
                if bucket then
                    if bucket.Parent ~= char then
                        bucket.Parent = char
                        task.wait(0.1)
                    end
                    if bucket:FindFirstChild("RemoteEvent") then
                        bucket.RemoteEvent:FireServer("Throw")
                        task.spawn(function()
                            task.wait(0.2)
                            if bucket and bucket.Parent == char then
                                bucket.Parent = player.Backpack
                            end
                        end)
                    end
                end
            end)
        else
            if _G.AutoBucketLoop then 
                _G.AutoBucketLoop:Disconnect() 
                _G.AutoBucketLoop = nil
            end
        end
    end
})
Tabs.AssistTab:Toggle({
    Title = "自动敲钟",
    Icon = "bell",
    Value = false,
    Callback = function(Value)
        if Value then
            if _G.AutoBellLoop then 
                _G.AutoBellLoop:Disconnect() 
                _G.AutoBellLoop = nil
            end
            
            _G.AutoBellLoop = RunService.Heartbeat:Connect(function()
                if workspace:FindFirstChild("Leipzig") and workspace.Leipzig:FindFirstChild("Modes") then
                    workspace.Leipzig.Modes.Objective.BellInteract.Interact:FireServer()
                end
            end)
        else
            if _G.AutoBellLoop then 
                _G.AutoBellLoop:Disconnect() 
                _G.AutoBellLoop = nil
            end
        end
    end
})

Tabs.AssistTab:Section({Title = "生存功能"})
Tabs.AssistTab:Toggle({
    Title = "自动移除摔落伤害",
    Icon = "shield",
    Value = false,
    Callback = function(Value)
        _G.AutoSelfDamage = Value
        if _G.AutoSelfDamage then
            task.spawn(function()
                while _G.AutoSelfDamage do
                    if getCharacter() and getCharacter():FindFirstChild("Health") then
                        getCharacter().Health.ForceSelfDamage:FireServer(0)
                    end
                    task.wait()
                end
            end)
        end
    end
})
Tabs.AssistTab:Toggle({
    Title = "保持物品栏",
    Icon = "package",
    Value = false,
    Callback = function(Value)
        if Value then
            if not player.PlayerGui:FindFirstChild("BackpackGui") then return end
            player.PlayerGui.BackpackGui.Enabled = true
            player.PlayerGui.BackpackGui:GetPropertyChangedSignal("Enabled"):Connect(function()
                player.PlayerGui.BackpackGui.Enabled = true
            end)
            player.CharacterAdded:Connect(function()
                task.wait(1)
                if player.PlayerGui:FindFirstChild("BackpackGui") then
                    player.PlayerGui.BackpackGui.Enabled = true
                end
            end)
        end
    end
})

Tabs.AssistTab:Section({Title = "成就功能"})
Tabs.AssistTab:Button({
    Title = "解锁复仇之刃成就",
    Icon = "trophy",
    Callback = function()
        local hidden = player:FindFirstChild("HiddenAchievements")
        if hidden then
            local ach = hidden:FindFirstChild("LeRevenant")
            if ach and ach:IsA("BoolValue") then
                ach.Value = true
                Window:Notify({
                    Title = "成就解锁成功",
                    Description = "复仇之刃成就已解锁！",
                    Duration = 5
                })
            else
                Window:Notify({
                    Title = "成就解锁失败",
                    Description = "未找到复仇之刃成就数据",
                    Duration = 5
                })
            end
        end
    end
})

player.CharacterAdded:Connect(function(character)
    if _G.AuraLoop then
        _G.AuraLoop:Disconnect()
        _G.AuraLoop = nil
    end
    
    if _G.BayonetLoop then
        _G.BayonetLoop:Disconnect()
        _G.BayonetLoop = nil
    end
    
    if _G.SelfRescueLoop then
        _G.SelfRescueLoop:Disconnect()
        _G.SelfRescueLoop = nil
    end
    
    if _G.AutoAttackConnection then
        _G.AutoAttackConnection:Disconnect()
        _G.AutoAttackConnection = nil
    end
    
    if _G.AutoBucketLoop then
        _G.AutoBucketLoop:Disconnect()
        _G.AutoBucketLoop = nil
    end
    
    if _G.AutoBellLoop then
        _G.AutoBellLoop:Disconnect()
        _G.AutoBellLoop = nil
    end
    
    if _G.AutoDigLoop then
        _G.AutoDigLoop:Disconnect()
        _G.AutoDigLoop = nil
    end
    
    AuraSettings.silentaura = false
    BayonetSettings.silentaura = false
    
    if not speedToggle then
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = 16
    end

    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local originalPosition = humanoidRootPart.Position

    RunService.Stepped:Connect(function()
        if humanoidRootPart.AssemblyLinearVelocity.Magnitude > 100 then
            humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            humanoidRootPart.CFrame = CFrame.new(originalPosition) * humanoidRootPart.CFrame.Rotation
        else
            originalPosition = humanoidRootPart.Position
        end
    end)

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = { 
        workspace:WaitForChild("Players"), 
        workspace:FindFirstChild("IgnoreParts"), 
        workspace:WaitForChild("Zombies") 
    }
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.IgnoreWater = true

    local lastPlatformCFrame = nil

    RunService.Heartbeat:Connect(function()
        local raycastResult = workspace:Raycast(humanoidRootPart.Position, Vector3.new(0, -10, 0), raycastParams)
        
        if raycastResult and raycastResult.Instance.Parent and raycastResult.Instance.Parent:HasTag("MovingPlatform") then
            local platform = raycastResult.Instance.Parent
            
            if platform.PrimaryPart then
                local currentPlatformCFrame = platform.PrimaryPart.CFrame
                
                if lastPlatformCFrame == nil then
                    lastPlatformCFrame = currentPlatformCFrame
                end
                
                local platformMovement = currentPlatformCFrame * lastPlatformCFrame:Inverse()
                lastPlatformCFrame = currentPlatformCFrame
                
                if not character:HasTag("OnCannon") then
                    humanoidRootPart.CFrame = platformMovement * humanoidRootPart.CFrame
                end
            else
                lastPlatformCFrame = nil
                return
            end
        else
            lastPlatformCFrame = nil
            return
        end
    end)
    
    if player.PlayerGui:FindFirstChild("BackpackGui") then
        player.PlayerGui.BackpackGui.Enabled = true
    end
end)

local Settings = Window:Tab({Title = "UI设置", Icon = "palette"})
Settings:Paragraph({
    Title = "UI设置",
    Desc = "绝妙二改WindUI",
    Image = "settings",
    ImageSize = 20,
    Color = "White"
})

Settings:Toggle({
    Title = "启用边框",
    Value = borderEnabled,
    Callback = function(value)
        borderEnabled = value
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if mainFrame then
            local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
            if rainbowStroke then
                rainbowStroke.Enabled = value
                if value and windowOpen and not rainbowBorderAnimation then
                    startBorderAnimation(Window, animationSpeed)
                elseif not value and rainbowBorderAnimation then
                    rainbowBorderAnimation:Disconnect()
                    rainbowBorderAnimation = nil
                end
                
                WindUI:Notify({
                    Title = "边框",
                    Content = value and "已启用" or "已禁用",
                    Duration = 2,
                    Icon = value and "eye" or "eye-off"
                })
            end
        end
    end
})

Settings:Toggle({
    Title = "启用字体颜色",
    Value = fontColorEnabled,
    Callback = function(value)
        fontColorEnabled = value
        applyFontColorsToWindow(currentFontColorScheme)
        
        WindUI:Notify({
            Title = "字体颜色",
            Content = value and "已启用" or "已禁用",
            Duration = 2,
            Icon = value and "type" or "type"
        })
    end
})

Settings:Toggle({
    Title = "启用音效",
    Value = soundEnabled,
    Callback = function(value)
        soundEnabled = value
        WindUI:Notify({
            Title = "音效",
            Content = value and "已启用" or "已禁用",
            Duration = 2,
            Icon = value and "volume-2" or "volume-x"
        })
    end
})

Settings:Toggle({
    Title = "启用背景模糊",
    Value = blurEnabled,
    Callback = function(value)
        blurEnabled = value
        applyBlurEffect(value)
        WindUI:Notify({
            Title = "背景模糊",
            Content = value and "已启用" or "已禁用",
            Duration = 2,
            Icon = value and "cloud-rain" or "cloud"
        })
    end
})

local colorSchemeNames = {}
for name, _ in pairs(COLOR_SCHEMES) do
    table.insert(colorSchemeNames, name)
end
table.sort(colorSchemeNames)

Settings:Dropdown({
    Title = "边框颜色方案",
    Desc = "选择喜欢的颜色组合",
    Values = colorSchemeNames,
    Value = "糖果颜色",
    Callback = function(value)
        currentBorderColorScheme = value
        local success = initializeRainbowBorder(value, animationSpeed)
        playSound()
    end
})

Settings:Dropdown({
    Title = "字体颜色方案",
    Desc = "选择文字颜色组合",
    Values = colorSchemeNames,
    Value = "彩虹颜色",
    Callback = function(value)
        currentFontColorScheme = value
        applyFontColorsToWindow(value)
        playSound()
    end
})

local fontOptions = {}
for _, fontName in ipairs(FONT_STYLES) do
    local description = FONT_DESCRIPTIONS[fontName] or fontName
    table.insert(fontOptions, {text = description, value = fontName})
end

table.sort(fontOptions, function(a, b)
    return a.text < b.text
end)

local fontValues = {}
local fontValueToName = {}
for _, option in ipairs(fontOptions) do
    table.insert(fontValues, option.text)
    fontValueToName[option.text] = option.value
end

Settings:Dropdown({
    Title = "字体样式",
    Desc = "选择文字字体样式 (" .. #FONT_STYLES .. " 种可用)",
    Values = fontValues,
    Value = "标准粗体",
    Callback = function(value)
        local fontName = fontValueToName[value]
        if fontName then
            currentFontStyle = fontName
            local successCount, totalCount = applyFontStyleToWindow(fontName)
            playSound()
        end
    end
})

Settings:Slider({
    Title = "边框转动速度",
    Desc = "调整边框旋转的快慢",
    Value = { 
        Min = 1,
        Max = 10,
        Default = 5,
    },
    Callback = function(value)
        animationSpeed = value
        if rainbowBorderAnimation then
            rainbowBorderAnimation:Disconnect()
            rainbowBorderAnimation = nil
        end
        if borderEnabled then
            startBorderAnimation(Window, animationSpeed)
        end
        
        applyFontColorsToWindow(currentFontColorScheme)
        playSound()
    end
})

Settings:Slider({
    Title = "UI整体缩放",
    Desc = "调整UI大小比例",
    Value = { 
        Min = 0.5,
        Max = 1.5,
        Default = 1,
    },
    Step = 0.1,
    Callback = function(value)
        uiScale = value
        applyUIScale(value)
        playSound()
    end
})

Settings:Divider()

Settings:Slider({
    Title = "UI透明度",
    Desc = "调整整个UI的透明度",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
        WindUI.TransparencyValue = tonumber(value)
        playSound()
    end
})

Settings:Slider({
    Title = "调整UI宽度",
    Desc = "调整窗口的宽度",
    Value = { 
        Min = 500,
        Max = 800,
        Default = 600,
    },
    Callback = function(value)
        if Window.UIElements and Window.UIElements.Main then
            Window.UIElements.Main.Size = UDim2.fromOffset(value, 400)
        end
        playSound()
    end
})

Settings:Slider({
    Title = "调整UI高度",
    Desc = "调整窗口的高度",
    Value = { 
        Min = 300,
        Max = 600,
        Default = 400,
    },
    Callback = function(value)
        if Window.UIElements and Window.UIElements.Main then
            local currentWidth = Window.UIElements.Main.Size.X.Offset
            Window.UIElements.Main.Size = UDim2.fromOffset(currentWidth, value)
        end
        playSound()
    end
})

Settings:Slider({
    Title = "边框粗细",
    Desc = "调整边框的粗细",
    Value = { 
        Min = 1,
        Max = 5,
        Default = 1.5,
    },
    Step = 0.5,
    Callback = function(value)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if mainFrame then
            local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
            if rainbowStroke then
                rainbowStroke.Thickness = value
            end
        end
        playSound()
    end
})

Settings:Slider({
    Title = "圆角大小",
    Desc = "调整UI圆角的大小",
    Value = { 
        Min = 0,
        Max = 20,
        Default = 16,
    },
    Callback = function(value)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if mainFrame then
            local corner = mainFrame:FindFirstChildOfClass("UICorner")
            if not corner then
                corner = Instance.new("UICorner")
                corner.Parent = mainFrame
            end
            corner.CornerRadius = UDim.new(0, value)
        end
        playSound()
    end
})

Settings:Button({
    Title = "恢复UI到原位",
    Icon = "rotate-ccw",
    Callback = function()
        if Window.UIElements and Window.UIElements.Main then
            Window.UIElements.Main.Position = UDim2.new(0.5, 0, 0.5, 0)
            playSound()
        end
    end
})

Settings:Button({
    Title = "重置UI大小",
    Icon = "maximize-2",
    Callback = function()
        if Window.UIElements and Window.UIElements.Main then
            Window.UIElements.Main.Size = UDim2.fromOffset(600, 400)
            playSound()
        end
    end
})

Settings:Button({
    Title = "随机字体",
    Icon = "shuffle",
    Callback = function()
        local randomFont = FONT_STYLES[math.random(1, #FONT_STYLES)]
        currentFontStyle = randomFont
        applyFontStyleToWindow(randomFont)
        playSound()
    end
})

Settings:Button({
    Title = "随机颜色",
    Icon = "palette",
    Callback = function()
        local randomColor = colorSchemeNames[math.random(1, #colorSchemeNames)]
        currentBorderColorScheme = randomColor
        initializeRainbowBorder(randomColor, animationSpeed)
        playSound()
    end
})

Settings:Divider()

Settings:Button({
    Title = "刷新字体颜色",
    Icon = "refresh-cw",
    Callback = function()
        applyFontColorsToWindow(currentFontColorScheme)
        playSound()
    end
})

Settings:Button({
    Title = "刷新字体样式",
    Icon = "refresh-cw",
    Callback = function()
        local successCount, totalCount = applyFontStyleToWindow(currentFontStyle)
        playSound()
    end
})

Settings:Button({
    Title = "测试所有字体",
    Icon = "check-circle",
    Callback = function()
        local workingFonts = {}
        local totalFonts = #FONT_STYLES
        
        for i, fontName in ipairs(FONT_STYLES) do
            local success = pcall(function()
                local test = Enum.Font[fontName]
            end)
            
            if success then
                table.insert(workingFonts, fontName)
            end
        end
        playSound()
    end
})

Settings:Button({
    Title = "导出设置",
    Icon = "download",
    Callback = function()
        local settings = {
            font = currentFontStyle,
            borderColor = currentBorderColorScheme,
            fontSize = currentFontColorScheme,
            speed = animationSpeed,
            scale = uiScale
        }
        setclipboard("YG/TNINE SCRIPT设置: " .. game:GetService("HttpService"):JSONEncode(settings))
        playSound()
    end
})

Window:OnClose(function()
    windowOpen = false
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
    applyBlurEffect(false)
end)

Window:OnDestroy(function()
    windowOpen = false
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
    for _, animation in pairs(fontColorAnimations) do
        animation:Disconnect()
    end
    fontColorAnimations = {}
    applyBlurEffect(false)
end)

task.spawn(function()
    wait(2)
    Window:Notify({
        Title = "TnineHub加载完成",
        Description = "tnine team",
        Duration = 5
    })
end)

end