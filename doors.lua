local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "P6auls Doors Hub",
    Icon = "skull", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Never use my scripts without credit!",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "doorshub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "P6auls Doors Hub",
       Subtitle = "Key Verification",
       Note = "In Beta. If you want, here is a key: 67890", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"p6aulsadmin","345345","12345", "67890", "23456", "98765", "34567", "45678", "56789", "87654", "54321", "65432", "76543", "43210", "21098", "10987", "32109", "89012", "67812", "45123", "85236", "96325", "74152", "85214", "95173", "75314", "12435", "65789", "78963", "96314", "35714", "25814", "35914", "74163", "25893", "14725", "36982", "58462", "91435", "63582", "52684", "18395", "29486", "57813", "96732", "31685", "92463", "17538", "38652", "51924", "84639", "13574", "39285", "67421"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local function create_notification(title, content, duration, image)
    Rayfield:Notify({
        Title = title or "Success",
        Content = content or "Error",
        Duration = duration or 3,
        Image = image or "badge-plus",
    })
end


 Rayfield:Notify({
    Title = "Welcome",
    Content = "This script is still in Beta!",
    Duration = 6.5,
    Image = "badge-alert",
 })

 local MainTab = Window:CreateTab("Script Hub", "archive") -- Title, Image

 local ExploitsSection = MainTab:CreateSection("Exploits")

 local headlight = false
 local headlightBrightness = 2
 local headlightRange = 16
 local speedBoost = false
 local speedBoostValue = 16
 local speedBoostDuringSeek = false

 local BlackKingLaunchButton = MainTab:CreateButton({
    Name = "Bobhub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkDoorsKing/Doors/main/Main"))()
    end,
 })

 local msdoorsLaunchButton = MainTab:CreateButton({
    Name = "Ms Doors (Outdated)",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua"),true))()
    end,
 })

 local neverlooseLaunchButton = MainTab:CreateButton({
    Name = "NeverLoose.xyz (Outdated)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/neverlose.xyz/main/Doors.lua"))()
    end,
 })

 local VYNIXIUSLaunchButton = MainTab:CreateButton({
    Name = "VYNIXIUS Doors",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
    end,
 })

 local crucifixAssetId = "rbxassetid://12309588188" -- Asset ID of the crucifix

-- Function to give the player the crucifix as a tool
local function giveCrucifix(player)
    -- Load the asset
    local success, crucifixModel = pcall(function()
        return game:GetService("InsertService"):LoadAsset(12309588188)
    end)

    if success and crucifixModel then
        -- Ensure the model is a valid object
        local tool = Instance.new("Tool")
        tool.Name = "Crucifix"
        tool.RequiresHandle = true -- Crucifix tool requires a handle to work
        tool.CanBeDropped = true
        tool.Grip = CFrame.new()

        -- Find the handle (usually a part that should be used as the "handle" for the tool)
        local handle = crucifixModel:FindFirstChildWhichIsA("BasePart")
        if handle then
            handle.Name = "Handle"  -- The tool requires a part named "Handle"
            handle.Parent = tool
        else
            print("Crucifix does not have a valid handle part.")
            return
        end

        -- Parent the model as a child of the Tool
        crucifixModel.Parent = tool

        -- Set the tool's parent to the player's backpack
        tool.Parent = player:WaitForChild("Backpack")

        -- Activate the click-to-delete functionality
        tool.Activated:Connect(function()
            -- When the tool is activated (clicked), check for the target
            local mouse = player:GetMouse()
            local target = mouse.Target

            -- If the target is a model, delete it
            if target and target.Parent and target.Parent:IsA("Model") then
                target.Parent:Destroy()  -- Deletes the entire model
            end
        end)
    else
        warn("Failed to load crucifix asset.")
    end
end

 local espObjects = {}

 -- Define colors for each model type
 local modelColors = {
     KeyObtain = Color3.fromRGB(255, 0, 0), -- Red
     LiveHintBook = Color3.fromRGB(0, 255, 0), -- Green
     Wardrobe = Color3.fromRGB(0, 0, 255), -- Blue
     Door = Color3.fromRGB(255, 255, 0), -- Yellow
     Dresser = Color3.fromRGB(255, 165, 0), -- Orange
     LeverForGate = Color3.fromRGB(128, 0, 128), -- Purple
     FigureRig = Color3.fromRGB(0, 255, 255), -- Cyan
     RushMoving = Color3.fromRGB(255, 0, 255), -- Magenta
     SeekMovingNewClone = Color3.fromRGB(128, 128, 0), -- Olive
     AmbushMoving = Color3.fromRGB(128, 0, 0), -- Dark Red
 }
 
 -- Function to create an ESP highlight with label
 local function create_esp(object, modelName)
     if not object:IsA("BasePart") then return end
 
     -- Highlight box
     local adornment = Instance.new("BoxHandleAdornment")
     adornment.Name = "ESPAdornment"
     adornment.Adornee = object
     adornment.AlwaysOnTop = true
     adornment.ZIndex = 10
     adornment.Size = object.Size + Vector3.new(0.1, 0.1, 0.1) -- Slightly larger than the object
     adornment.Color3 = modelColors[modelName] or Color3.new(1, 1, 1) -- Default to white if no color is defined
     adornment.Transparency = 0.5
     adornment.Parent = object
 
     -- Label
     local billboard = Instance.new("BillboardGui")
     billboard.Name = "ESPLabel"
     billboard.Adornee = object
     billboard.Size = UDim2.new(0, 75, 0, 25) -- Smaller text
     billboard.StudsOffset = Vector3.new(0, 2, 0) -- Position above the object
     billboard.AlwaysOnTop = true
 
     local textLabel = Instance.new("TextLabel")
     textLabel.Text = modelName
     textLabel.Size = UDim2.new(1, 0, 1, 0)
     textLabel.BackgroundTransparency = 1
     textLabel.TextColor3 = modelColors[modelName] or Color3.new(1, 1, 1)
     textLabel.TextScaled = true
     textLabel.Font = Enum.Font.SourceSansBold
     textLabel.TextSize = 14 -- Reduced text size
     textLabel.Parent = billboard
 
     billboard.Parent = object
 
     -- Track the object
     espObjects[object] = {adornment, billboard}
 end
 
 -- Function to remove all ESP highlights and labels
 local function remove_esp()
     for object, components in pairs(espObjects) do
         for _, component in ipairs(components) do
             if component and component.Parent then
                 component:Destroy()
             end
         end
     end
     espObjects = {}
 end
 
 -- Function to check recursively and apply ESP
 local function check_and_highlight(object)
     if object:IsA("Model") then
         -- Handle KeyObtain
         if object.Name == "KeyObtain" then
             local hitbox = object:FindFirstChild("Hitbox")
             if hitbox and hitbox:IsA("BasePart") then
                 local key = hitbox:FindFirstChild("Key")
                 if key and key:IsA("BasePart") and not espObjects[key] then
                     create_esp(key, "KeyObtain")
                 end
             end
         -- Handle other models
         elseif modelColors[object.Name] then
             local part = object.PrimaryPart or object:FindFirstChildWhichIsA("BasePart")
             if part and not espObjects[part] then
                 create_esp(part, object.Name)
             end
         end
     end
 
     -- Recursively check children
     for _, child in ipairs(object:GetChildren()) do
         check_and_highlight(child)
     end
 end
 
 -- Function to toggle ESP on
 local function toggle_esp_on()
     check_and_highlight(workspace)
 end

 local originalLightingData = {}

-- Function to save the current lighting properties
local function saveLightingData()
    originalLightingData = {}
    for _, property in ipairs({
        "Ambient",
        "Brightness",
        "ColorShift_Bottom",
        "ColorShift_Top",
        "EnvironmentDiffuseScale",
        "EnvironmentSpecularScale",
        "ExposureCompensation",
        "FogColor",
        "FogEnd",
        "FogStart",
        "GlobalShadows",
        "OutdoorAmbient",
        "ShadowSoftness",
    }) do
        originalLightingData[property] = game.Lighting[property]
    end
end

-- Function to restore the original lighting properties
local function restoreLightingData()
    for property, value in pairs(originalLightingData) do
        game.Lighting[property] = value
    end
end

-- Function to enable fullbright
local function enableFullbright()
    game.Lighting.Ambient = Color3.new(1, 1, 1) -- Pure white ambient light
    game.Lighting.Brightness = 10
    game.Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
    game.Lighting.ColorShift_Top = Color3.new(0, 0, 0)
    game.Lighting.EnvironmentDiffuseScale = 1
    game.Lighting.EnvironmentSpecularScale = 1
    game.Lighting.ExposureCompensation = 0
    game.Lighting.FogColor = Color3.new(1, 1, 1)
    game.Lighting.FogEnd = 100000 -- Effectively disables fog
    game.Lighting.FogStart = 0
    game.Lighting.GlobalShadows = false
    game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    game.Lighting.ShadowSoftness = 0
end

-- Variables to track the fullbright state
local isFullbrightEnabled = false

-- Function to toggle fullbright on and off
local function toggleFullbright()
    if isFullbrightEnabled then
        restoreLightingData()
    else
        enableFullbright()
    end
    isFullbrightEnabled = not isFullbrightEnabled
end

local function setupFullbright()
    saveLightingData() -- Start with fullbright enabled
end

setupFullbright()

local function setSpeed(player, speed)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        local humanoid = character:FindFirstChild("Humanoid")
        humanoid.WalkSpeed = speed
    end
end


 local function create_head_light(player)
    if player and player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head

        if head:FindFirstChild("HeadLight") then
            warn("Head light already exists!")
            return
        end

        local light = Instance.new("PointLight")
        light.Name = "HeadLight"
        light.Parent = head
        light.Range = headlightRange -- Adjust the range of the light
        light.Brightness = headlightBrightness -- Adjust the brightness of the light
        light.Color = Color3.new(1, 1, 1) -- White light
        print("Head light created!")
    else
    end
end

local function delete_head_light(player)
    if player and player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head

        local light = head:FindFirstChild("HeadLight")
        if light then
            light:Destroy()
        else
        end
    else
        warn("Player does not have a valid character or head.")
    end
end

 local ExploitTab = Window:CreateTab("Instant Exploit", "badge-plus") -- Title, Image

 local PremiumTab = Window:CreateTab("Premium Features", "coins") -- Title, Image

 local SettingsTab = Window:CreateTab("Settings", "lock-open") -- Title, Image

 local shownotificationsforsuccess = true
 local entitynotify = false
 local thirdPerson = false
 local thirdPersonEverTriggerd = false
 local notifiedthirdPerson = 0
 local Esp = false
 local seekExists = false

 local shownotificationsforsuccessToggle = SettingsTab:CreateToggle({
    Name = "Show success messages",
    CurrentValue = true,
    Flag = "shownotificationsforsuccessToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   shownotificationsforsuccess = Value
    end,
 })

 local getFragmentButton = PremiumTab:CreateButton({
    Name = "Summon Glitch Fragment (Run before opening a door!)",
    Callback = function()
        Rayfield:Notify({
            Title = "INFOS SOON",
            Content = "Starting in 3 seconds.",
            Duration = 3,
            Image = "coins",
         })
         wait(2)
         Rayfield:Notify({
            Title = "WARNING:",
            Content = "We will teleport you ontop of the roof. JUMP DOWN AS FAST AS YOU CAN!!!",
            Duration = 5,
            Image = "coins",
         })
         wait(5)
         Rayfield:Notify({
            Title = "Good luck!",
            Content = "Starting in 1 second!!",
            Duration = 5,
            Image = "coins",
         })
         wait(1)
         Rayfield:Notify({
            Title = "One Moment...",
            Content = "Summoning the Glitch Fragment... Please wait!",
            Duration = 25,
            Image = "coins",
         })
         for i = 1, 8 do
         for i = 1, 100 do
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, -5000, 0))  -- You can adjust the Y value for deeper teleportation
            wait(0)  -- Wait for the specified delay before the next teleport
        end
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 0, 100))  -- You can adjust the Y value for deeper teleportation
            wait(5)
    end

        Rayfield:Notify({
            Title = "Finished.",
            Content = "The Fragment should now be spawned.",
            Duration = 5,
            Image = "coins",
         })
    end,
 })





 local knobstogive = 0

 local Slider = ExploitTab:CreateSlider({
    Name = "Amount of Gold",
    Range = {0, 10000},
    Increment = 100,
    Suffix = "Gold",
    CurrentValue = 100,
    Flag = "knobsajustwithbutton", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   knobstogive = Value
    end,
 })

 local GiveKnobsButton = ExploitTab:CreateButton({
    Name = "Give Gold!",
    Callback = function()
   game.Players.LocalPlayer.Gold.Value += knobstogive
   if shownotificationsforsuccess == true then

   create_notification("Success", "We gave you your gold!", 3, "badge-alert")

   end
    end,
 })

 local Divider = ExploitTab:CreateDivider()

 local rushNotifyToggle = ExploitTab:CreateToggle({
    Name = "Entity Notifier",
    CurrentValue = false,
    Flag = "shownotificationsforsuccessToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   entitynotify = Value
    end,
 })

 local thirdPersonToggle = ExploitTab:CreateToggle({
    Name = "Third Person Mode",
    CurrentValue = false,
    Flag = "thirdPersonToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        thirdPersonEverTriggerd = true
        thirdPerson = Value
    end,
 })

 local EspToggle = ExploitTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "EspToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Esp = Value
    end,
 })

 local FullbrightToggle = ExploitTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    	toggleFullbright()
    end,
 })

 local Divider1 = ExploitTab:CreateDivider()

 local MoveSpeedSlider = ExploitTab:CreateSlider({
    Name = "Player Speed",
    Range = {1, 60},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "MoveSpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        speedBoostValue = Value
    end,
 })

 local MoveSpeedToggle = ExploitTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = false,
    Flag = "MoveSpeedToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        speedBoost = Value
    end,
 })

 local MoveSpeedDuringSeekToggle = ExploitTab:CreateToggle({
    Name = "Apply during Seek Chase",
    CurrentValue = false,
    Flag = "MoveSpeedDuringSeekToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        speedBoostDuringSeek = Value
    end,
 })

 local Divider3 = ExploitTab:CreateDivider()

 local headLightPowerSlider = ExploitTab:CreateSlider({
    Name = "HeadLight Power",
    Range = {10, 100},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 16,
    Flag = "headLightPowerSlider", 
    Callback = function(Value)
    headLightPowerSlider = Value
    if headlight == true then
    delete_head_light(game.Players.LocalPlayer)
    create_head_light(game.Players.LocalPlayer)
    end
    end,
 })

 local headLightRangeSlider = ExploitTab:CreateSlider({
    Name = "HeadLight Range",
    Range = {10, 100},
    Increment = 1,
    Suffix = "Range",
    CurrentValue = 16,
    Flag = "headLightRangeSlider", 
    Callback = function(Value)
    headlightRange = Value
    if headlight == true then
    delete_head_light(game.Players.LocalPlayer)
    create_head_light(game.Players.LocalPlayer)
    end
    end,
 })

 local headLightToggle = ExploitTab:CreateToggle({
    Name = "Headlight",
    CurrentValue = false,
    Flag = "headLightToggle", 
    Callback = function(Value)
    if Value == false then
        headlight = false
        delete_head_light(game.Players.LocalPlayer)
    else
        headlight = true
        create_head_light(game.Players.LocalPlayer)
    end
    end,
 })

 local Divider2 = ExploitTab:CreateDivider()

 local CruzifixGiverButton = ExploitTab:CreateButton({
    Name = "Give yourself a cruzifix",
    Callback = function()
        local shadow = game:GetObjects("rbxassetid://11498423088")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")
        local Debris = game:GetService("Debris")
        local UserInputService = game:GetService("UserInputService")
        local Plr = Players.LocalPlayer
        local Char = Plr.Character or Plr.CharacterAdded:Wait()
        local Hum = Char:WaitForChild("Humanoid")
        local RightArm = Char:WaitForChild("RightUpperArm")
        local LeftArm = Char:WaitForChild("LeftUpperArm")
        local RightC1 = RightArm.RightShoulder.C1
        local LeftC1 = LeftArm.LeftShoulder.C1
        
        local toolActive = false
        
        local function setupCrucifix(tool)
            print("Setting up crucifix tool")
            RightArm.Name = "R_Arm"
            LeftArm.Name = "L_Arm"
        
            RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
            LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))
        
            print("Stopped current animations")
            for _, v in next, Hum:GetPlayingAnimationTracks() do
                v:Stop()
            end
        end
        
        local function crucifyObject(target)
            if not target:IsA("BasePart") and not target:IsA("Model") then 
                print("Invalid target clicked: ", target.Name)
                return 
            end
        
            print("Crucifying object: ", target.Name)
        
            -- Add visual effects
            local glow = Instance.new("SelectionBox")
            glow.Adornee = target
            glow.LineThickness = 0.05
            glow.Color3 = Color3.fromRGB(0, 255, 255)
            glow.Parent = target
            print("Added glow effect to: ", target.Name)
        
            local particleEmitter = Instance.new("ParticleEmitter")
            particleEmitter.Texture = "rbxassetid://258128463" -- Example texture for a holy effect
            particleEmitter.Rate = 20
            particleEmitter.Lifetime = NumberRange.new(1)
            particleEmitter.Speed = NumberRange.new(0.5, 1)
            particleEmitter.Parent = target
            print("Added particle effect to: ", target.Name)
        
            -- Animate object flying into the void
            local targetPosition = target.Position - Vector3.new(0, 100, 0)
            local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear)
            local tween = TweenService:Create(target, tweenInfo, {Position = targetPosition})
        
            print("Started tween animation for: ", target.Name)
            tween:Play()
            
            -- Cleanup after effect
            tween.Completed:Connect(function()
                print("Object reached void and is being destroyed: ", target.Name)
                target:Destroy()
            end)
        
            Debris:AddItem(glow, 3) -- Automatically remove the glow after 3 seconds
            Debris:AddItem(particleEmitter, 3) -- Automatically remove particles after 3 seconds
        end
        
        shadow.Equipped:Connect(function()
            print("Equipped the shadow tool")
            setupCrucifix(shadow)
            game.Players.LocalPlayer:SetAttribute("Hidden", true)
            toolActive = true
        
            -- Create a listener for tapping/clicking objects
            local function onInputBegan(input, gameProcessed)
                if gameProcessed then return end
        
                if toolActive and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    local mouse = Plr:GetMouse()
                    if mouse.Target then -- Check if the mouse or touch is pointing at something
                        print("Tapped/Clicked on: ", mouse.Target.Name)
                        crucifyObject(mouse.Target) -- Apply crucifix effect
                    else
                        print("No valid target tapped/clicked")
                    end
                end
            end
        
            UserInputService.InputBegan:Connect(onInputBegan)
        end)
        
        shadow.Unequipped:Connect(function()
            print("Unequipped the shadow tool")
            game.Players.LocalPlayer:SetAttribute("Hidden", false)
            RightArm.Name = "RightUpperArm"
            LeftArm.Name = "LeftUpperArm"
        
            RightArm.RightShoulder.C1 = RightC1
            LeftArm.LeftShoulder.C1 = LeftC1
            print("Reset arm names and positions")
            toolActive = false
        end)
        
    end,
 })






 local notifiedModels = {}

 function check_for_rush_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "RushMoving" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Rush has spawned! Hide quickly!", 5, "alert-circle")
            print("rush")
            -- Mark this model as notified
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

function check_for_ambush_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "AmbushMoving" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Ambush has spawned! Hide quickly!", 5, "alert-circle")
            print("ambush")
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

function check_for_a60_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "AmbushMoving" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Ambush has spawned! Hide quickly!", 5, "alert-circle")
            print("ambush")
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

function check_for_seek_moving()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "SeekMovingNewClone" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Seek has spawned! Run quickly!", 5, "alert-circle")
            if speedBoostDuringSeek == false and speedBoost == true then
                setSpeed(game.Players.LocalPlayer, 15)
                create_notification("Warning!", "Due to your settings, SpeedBoost is temporarily disabled.", 6, "alert-circle")
            end
            print("seek")
            seekExists = true
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       seekExists = false
    end
end

function check_for_eyes()
    local modelsFound = false
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "Eyes" and not notifiedModels[obj] then
            -- Trigger notification
            create_notification("Entity!", "Eyes has spawned! Look away!", 5, "alert-circle")
            print("eyes")
            -- Mark this model as notified
            notifiedModels[obj] = true
            modelsFound = true
        end
    end
    -- Optional: Log a message if no models are found
    if not modelsFound then
       
    end
end

while true do
    if entitynotify == true then
    check_for_rush_moving()
    check_for_seek_moving()
    check_for_ambush_moving()
    check_for_eyes()
    end
    if thirdPerson == true and thirdPersonEverTriggerd == true then
        if shownotificationsforsuccess == true and notifiedthirdPerson == 0 then
            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
            notifiedthirdPerson = 1
            create_notification("Success", "You are now in Third Person. If not, try to toggle again!", 3, "badge-alert")
        end
    elseif thirdPersonEverTriggerd == true then
        if shownotificationsforsuccess == true and notifiedthirdPerson ==  1 then
            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
            notifiedthirdPerson = 0
            create_notification("Success", "You are now in First Person. If not, try to toggle again!", 3, "badge-alert")
        end
    end
    if Esp == true then
        toggle_esp_on()
    else
        remove_esp()
    end
    if speedBoost == true then

        if seekExists == false or speedBoostDuringSeek == true then
            setSpeed(game.Players.LocalPlayer, speedBoostValue)
        end

    elseif seekExists == false then
        setSpeed(game.Players.LocalPlayer, 15)
    end
    task.wait(0.2)
end
