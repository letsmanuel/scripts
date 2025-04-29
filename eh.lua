local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local RunService = game:GetService("RunService")

local Version = "1.0.1"

local Window = Fluent:CreateWindow({
    Title = "LetsNet - EH: " .. Version,
    SubTitle = "by Manuel",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightShift -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Practical = Window:AddTab({ Title = "Practical", Icon = "" }),
    VehicleTab = Window:AddTab({ Title = "Vehicle", Icon = "" }),
    Graphical = Window:AddTab({ Title = "Visuals", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options



-- VARIABLES
local player = game.Players.LocalPlayer
local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
local garagedoorpermanentopen = false
local deletealldoors = false
local whileloopcounter1 = 0
local teleportToLocation = nil
local hasTriggeredemergencyMove = false
local autoseattoggle = false
local savemybutt = false
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local PLAYERESP_main = false
local PLAYERESP_box = false
local PLAYERESP_highlight = false
local PLAYERESP_name = false
local PLAYERESP_distance = false
local PLAYERESP_team = false
local PLAYERESP_healthbar = false
local lastlightbank = false
local SENDNOTIFICTIONS = false
local LICENSEPLATE = "EH HUB"
local TUNINGLEVEL = vehicle:GetAttribute("engineLevel")
local GODCAR = false

if TUNINGLEVEL == nil then
    TUNINGLEVEL = 1
end

do
    Fluent:Notify({
        Title = "Thanks.",
        Content = "Welcome back "..game.Players.LocalPlayer.DisplayName.."!",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })

    local GarageDoorPernOpenToggle = Tabs.Practical:AddToggle("GarageDoorPernOpenToggle", {Title = "Hold Garages open", Default = false })

    GarageDoorPernOpenToggle:OnChanged(function()
        garagedoorpermanentopen = Options.GarageDoorPernOpenToggle.Value
        if garagedoorpermanentopen then
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "GarageDoor" then
                    model:SetAttribute("IsTriggered", true)
                end
            end
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "Bollards" then
                    model:SetAttribute("IsTriggered", true)
                end
            end
            for _, model in pairs(workspace.Gates:GetChildren()) do
                if model:IsA("Model") and model.Name == "Gate" then
                    model:SetAttribute("IsTriggered", false)
                    model:SetAttribute("IsTriggered", true)
                    model:SetAttribute("OpeningDuration", 0.1)
                end
            end
            Fluent:Notify({
                Title = "Garage Doors",
                Content = "Garage doors, Gates and Bollards will now stay open.",
                SubContent = "", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
        else
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "GarageDoor" then
                    model:SetAttribute("IsTriggered", false)
                end
            end
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "Bollards" then
                    model:SetAttribute("IsTriggered", false)
                end
            end
            for _, model in pairs(workspace.Gates:GetChildren()) do
                if model:IsA("Model") and model.Name == "Gate" then
                    model:SetAttribute("IsTriggered", false)
                end
            end
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "GarageDoor" then
                    model:SetAttribute("IsTriggered", true)
                end
            end
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "Bollards" then
                    model:SetAttribute("IsTriggered", true)
                end
            end
            for _, model in pairs(workspace.Gates:GetChildren()) do
                if model:IsA("Model") and model.Name == "Gate" then
                    model:SetAttribute("IsTriggered", false)
                    model:SetAttribute("IsTriggered", true)
                end
            end
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "GarageDoor" then
                    model:SetAttribute("IsTriggered", false)
                end
            end
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "Bollards" then
                    model:SetAttribute("IsTriggered", false)
                end
            end
            for _, model in pairs(workspace.Gates:GetChildren()) do
                if model:IsA("Model") and model.Name == "Gate" then
                    model:SetAttribute("IsTriggered", false)
                end
            end
            Fluent:Notify({
                Title = "Garage Doors",
                Content = "Garage doors, Gates and Bollards will now close.",
                SubContent = "", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })
            task.wait(0.3)
            for _, model in pairs(workspace.Gates:GetChildren()) do
                if model:IsA("Model") and model.Name == "Gate" then
                    model:SetAttribute("IsTriggered", false)
                end
            end
        end
        print("Toggle changed:", Options.GarageDoorPernOpenToggle.Value)
    end)

    local PlayerESPmain = Tabs.Graphical:AddToggle("playerespmain", {Title = "Player ESP", Default = false })

    PlayerESPmain:OnChanged(function()
        PLAYERESP_main = Options.playerespmain.Value
    end)

    local notifyToggle = Tabs.Practical:AddToggle("notifytoggle", {Title = "Notify Toggle", Default = false })

    notifyToggle:OnChanged(function()
        SENDNOTIFICTIONS = Options.notifytoggle.Value
    end)
    


    local MultiDropdown = Tabs.Graphical:AddDropdown("PlayerESP", {
        Title = "Player ESP Options",
        Description = "Select multiple ESP options to enable.",
        Values = {
            "box",
            "highlight",
            "name",
            "distance",
            "team",
            "healthbar"
        },
        Multi = true,  -- This enables multiple selection
        Default = {"box", "highlight", "name", "distance"}
    })

    -- You can update the PLAYERESP variables based on selected values
    MultiDropdown:OnChanged(function(Value)
        -- Reset all variables first
        PLAYERESP_box = false
        PLAYERESP_highlight = false
        PLAYERESP_name = false
        PLAYERESP_distance = false
        PLAYERESP_team = false
        PLAYERESP_healthbar = false
        
        -- Loop through selected values and update the corresponding variables
        for selectedOption, _ in next, Value do
            if selectedOption == "box" then
                PLAYERESP_box = true
            elseif selectedOption == "highlight" then
                PLAYERESP_highlight = true
            elseif selectedOption == "name" then
                PLAYERESP_name = true
            elseif selectedOption == "distance" then
                PLAYERESP_distance = true
            elseif selectedOption == "team" then
                PLAYERESP_team = true
            elseif selectedOption == "healthbar" then
                PLAYERESP_healthbar = true
            end
        end
        
        -- You can also print out the selected options to confirm
        local selectedOptions = {}
        for selectedOption, _ in next, Value do
            table.insert(selectedOptions, selectedOption)
        end
        print("Selected options: " .. table.concat(selectedOptions, ", "))
    end)

    Tabs.Practical:AddButton({
        Title = "Delete all Doors",
        Description = "Deletes all Glass, Sliding or Metal doors.",
        Callback = function()
            Window:Dialog({
                Title = "Warning:",
                Content = "This action cannot be undone. This will greatly decrease performance by causing ONE quick lag spike every 20 seconds.",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            local function deleteDoors(parent)
                                for _, obj in pairs(parent:GetChildren()) do
                                    if obj:IsA("Model") then
                                        if obj.Name == "SlidingDoor" or obj.Name == "MetalDoor" or obj.Name == "GlassDoor" or obj.Name == "Destroyable Door" or obj.Name == "HiddenExit" then
                                            obj:Destroy()
                                            task.wait() -- short pause to avoid lag
                                        else
                                            deleteDoors(obj)
                                        end
                                    elseif obj:IsA("Folder") then
                                        deleteDoors(obj)
                                    end
                                end
                            end
                            
                            task.spawn(function()
                                deleteDoors(workspace)
                            end)
                            deletealldoors = true
                            Fluent:Notify({
                                Title = "Door deletion",
                                Content = "All doors have been deleted.",
                                SubContent = "", -- Optional
                                Duration = 5 -- Set to nil to make the notification not disappear
                            })  
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    Tabs.Practical:AddButton({
        Title = "Door deletion stop",
        Description = "KILLS the thread deleting the doors.",
        Callback = function()
            deletealldoors = false
            Fluent:Notify({
                Title = "Door deletion",
                Content = "Thread should be killed.",
                SubContent = "", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })  
        end
    })

    Tabs.Practical:AddButton({
        Title = "Open Hidden Exit (Bank)",
        Description = "Deletes the concrete blocking the hidden exit in the bank.",
        Callback = function()
            
            for _, obj in pairs(parent:GetChildren()) do
                if obj:IsA("Model") then
                    if obj.Name == "HiddenExit" then
                        obj:Destroy()
                        task.wait() -- short pause to avoid lag
                    else
                        deleteDoors(obj)
                    end
                elseif obj:IsA("Folder") then
                    deleteDoors(obj)
                end
            end
            Fluent:Notify({
                Title = "Success!",
                Content = "The hidden Exit door should be open.",
                SubContent = "", -- Optional
                Duration = 5 -- Set to nil to make the notification not disappear
            })  
        end
    })


    local function teleportTo(target)
        local player = game.Players.LocalPlayer
        local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
        local seat = vehicle:WaitForChild("DriveSeat")

        if player.Character and player.Character:FindFirstChild("Humanoid") then
            if autoseattoggle then
                seat:Sit(player.Character.Humanoid)
            end
        end

        
        -- Ziel-CFrame eingeben
        local targetCFrame = CFrame.new(target)
        
        -- Werte für Bewegung
        local stepSize = 2.5
        local delayTime = 0.01
        
        -- Hilfsfunktion zur langsamen Bewegung entlang einer Achse
        local function moveAxis(start, goal, callback)
            local direction = (goal - start) >= 0 and 1 or -1
            local pos = start
            while (direction == 1 and pos < goal) or (direction == -1 and pos > goal) do
                pos += stepSize * direction
                if (direction == 1 and pos > goal) or (direction == -1 and pos < goal) then
                    pos = goal
                end
                callback(pos)
                task.wait(delayTime)
            end
        end
        
        if vehicle and vehicle:IsA("Model") and vehicle.PrimaryPart then
            local root = vehicle.PrimaryPart
            local currentPos = root.Position
            local targetPos = targetCFrame.Position
        
            -- 1. Langsam anheben auf Y + 10
            moveAxis(currentPos.Y, currentPos.Y + 100, function(y)
                vehicle:PivotTo(CFrame.new(Vector3.new(currentPos.X, y, currentPos.Z)))
            end)
        
            currentPos = vehicle.PrimaryPart.Position
        
            -- 2. Langsam bewegen auf X
            moveAxis(currentPos.X, targetPos.X, function(x)
                vehicle:PivotTo(CFrame.new(Vector3.new(x, currentPos.Y, currentPos.Z)))
                currentPos = vehicle.PrimaryPart.Position
            end)
        
            -- 3. Langsam bewegen auf Z
            moveAxis(currentPos.Z, targetPos.Z, function(z)
                vehicle:PivotTo(CFrame.new(Vector3.new(currentPos.X, currentPos.Y, z)))
                currentPos = vehicle.PrimaryPart.Position
            end)
        
            -- 4. Langsam absenken auf Ziel-Y
            moveAxis(currentPos.Y, targetPos.Y, function(y)
                vehicle:PivotTo(CFrame.new(Vector3.new(currentPos.X, y+3, currentPos.Z)))
            end)

            moveAxis(currentPos.Y, targetPos.Y, function(y)
                vehicle:PivotTo(CFrame.new(Vector3.new(currentPos.X, y+1, currentPos.Z)))
            end)
        else
            warn("Fahrzeug nicht gefunden oder kein PrimaryPart gesetzt!")
        end
        
    end


    local TuningLevelSlider = Tabs.VehicleTab:AddSlider("Slider", {
        Title = "Tuning Level",
        Description = "Tunes EVERY aspect of your vehicle.",
        Default = TUNINGLEVEL,
        Min = 1,
        Max = 6,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    TuningLevelSlider:OnChanged(function(Value)
        TUNINGLEVEL = Value
    end)

    local player = game.Players.LocalPlayer
    local vehicle = workspace.Vehicles:FindFirstChild(player.Name)


    local CustomLicensePlateInput = Tabs.VehicleTab:AddInput("Custom Licenseplate", {
        Title = "Input",
        Default = vehicle.Body.LicensePlates.Back.Gui.TextLabel.Text,
        Placeholder = "Enter Licenseplate here!",
        Numeric = false, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(Value)
            LICENSEPLATE = Value
            local player = game.Players.LocalPlayer
            local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
            vehicle.Body.LicensePlates.Back.Gui.TextLabel.Text = LICENSEPLATE
        end
    })

    local GodCarToggle = Tabs.VehicleTab:AddToggle("GodCarToggle", {Title = "Godcar", Default = false })

    GodCarToggle:OnChanged(function()
        GODCAR = Options.GodCarToggle.Value
    end)



    local TeleportLocationDropdown = Tabs.Main:AddDropdown("Teleport", {
        Title = "Teleport Locations",
        Values = {"Bank", "Jeweler", "Gas n Go", "Ares", "Toolshop", "Farming Shop", "Osso", "Clothing Store","Harbor","Cargo Ship", "Police Station", "Fire Department", "Bus Company", "Tuning Garage", "ADAC", "Prison", "Car Dealership", "Hospital","Safezone"},
        Multi = false,
        Default = 1,
    })

    local function calculateTeleportPosition()
        if teleportToLocation == "Bank" then
            teleportTo(Vector3.new(-1148, 2.75000191, 3210.625, 0, 0, 1, 0, 1, 0, -1, 0, 0))
         elseif teleportToLocation == "Fire Department" then
            teleportTo(Vector3.new(-970.25, 2.75, 3891.875, 0, 0, 1, 0, 1, -0, -1, 0, 0))
        elseif teleportToLocation == "Jeweler" then
            teleportTo(Vector3.new(-345, 2.25, 3539.25, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif teleportToLocation == "Police Station" then
            teleportTo(Vector3.new(-1655.75, 2.25, 2742.68799, -1, 0, 0, 0, 1, 0, 0, 0, -1))
        elseif teleportToLocation == "Harbor" then
            teleportTo(Vector3.new(584.250244, 2.12501335, 1705.625, 0, 0, 1, 0, 1, -0, -1, 0, 0))
        elseif teleportToLocation == "Bus Company" then
            teleportTo(Vector3.new(-1681.0625, 2.1249907, -1313.05396, 0, 0, -1, 0, 1, 0, 1, 0, 0))
        elseif teleportToLocation == "Tuning Garage" then
            teleportTo(Vector3.new(-1346.68811, 2.12501311, 136.750519, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif teleportToLocation == "ADAC" then
            teleportTo(Vector3.new(-325.4375, 2.125, 538, 0, 0, -1, 0, 1, 0, 1, 0, 0))
        elseif teleportToLocation == "Prison" then
            teleportTo(Vector3.new(-567.000488, 2.25496864, 2849.62549, 0, 0, -1, 0, 1, 0, 1, 0, 0))
        elseif teleportToLocation == "Car Dealership" then
            teleportTo(Vector3.new(-1431.75, 2.125, 915.324951, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif teleportToLocation == "Gas n Go" then
            teleportTo(Vector3.new(-1543.74829, 2.125, 3839.92505, -1, 0, 0, 0, 1, 0, 0, 0, -1))
        elseif teleportToLocation == "Ares" then
            teleportTo(Vector3.new(-871.75, 2.125, 1475.32495, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif teleportToLocation == "Toolshop" then
            teleportTo(Vector3.new(-740.5, 2.125, 708.770508, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif teleportToLocation == "Farming Shop" then
            teleportTo(Vector3.new(-857.5, 2.609375, -1142, 0, 0, 1, 0, 1, -0, -1, 0, 0))
        elseif teleportToLocation == "Osso" then
            teleportTo(Vector3.new(2.65355635, 2.125, -758.369995, 0, 0, -1, 0, 1, 0, 1, 0, 0))
        elseif teleportToLocation == "Clothing Store" then
            teleportTo(Vector3.new(495.0625, 2.109375, -1444.9375, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif teleportToLocation == "Cargo Ship" then
            teleportTo(Vector3.new(1032.25, 2.12499976, 2265.625, -1, 0, 0, 0, 1, 0, 0, 0, -1))
        elseif teleportToLocation == "Hospital" then
            teleportTo(Vector3.new(-257.628998, 2.75, 1184.06995, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif teleportToLocation == "Safezone" then
            teleportTo(Vector3.new(714.722168, 96.8313751, -645.928528, 0.967532575, -0.0304376129, 0.250906914, 0, 0.992722154, 0.120427497, -0.252746373, -0.116517529, 0.960491002))
        end
    end

    Tabs.Main:AddButton({
        Title = "Teleport now!",
        Description = "Teleports you to the selected location.",
        Callback = function()
            if autoseattoggle then
                calculateTeleportPosition()
            else
                Window:Dialog({
                    Title = "WARNING:",
                    Content = "This will move YOUR car to the location. Make sure to be in your vehicle.",
                    Buttons = {
                        {
                            Title = "Confirm",
                            Callback = function()
                                calculateTeleportPosition()
                            end
                        },
                        {
                            Title = "Cancel",
                            Callback = function()
                                print("Cancelled the dialog.")
                            end
                        }
                    }
                })
            end
        end
    })

    local TPinCarToggle = Tabs.Main:AddToggle("vehicletptoggle", {Title = "Auto TP to Vehicle", Default = false })

    TPinCarToggle:OnChanged(function()
        autoseattoggle = Options.vehicletptoggle.Value
    end)

    TeleportLocationDropdown:OnChanged(function(Value)
        teleportToLocation = Value
    end)

    
    local AutoTPondying = Tabs.Practical:AddToggle("autosaveplayer", {Title = "Teleport when low health", Default = false })

    AutoTPondying:OnChanged(function()
        savemybutt = Options.autosaveplayer.Value
    end)


    local bankstatusVIEWtoggle = Tabs.Main:AddToggle("bankstats", {Title = "Bank Status (read only): ", Default = false })


    Options.bankstats:SetValue(false)




    -- FUNCTIONS USED IN WHILE LOOP

    local function playerLowHealthMove(health)
        hasTriggeredemergencyMove = true
        Fluent:Notify({
            Title = "Emergency!",
            Content = "Due to low health, you will be teleported to the hospital.",
            SubContent = "Your health: "..health, -- Optional
            Duration = 15 -- Set to nil to make the notification not disappear
        })
        autoseattoggle = false
        local player = game.Players.LocalPlayer
        local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
        local seat = vehicle:WaitForChild("DriveSeat")
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            seat:Sit(player.Character.Humanoid)
        end
        wait(0.5)
        teleportTo(Vector3.new(-257.628998, 2.75, 1184.06995, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        wait(0.5)
        autoseattoggle = true
    end



    -- WHILE TRUEE LOOP 

    while true do
        if GODCAR then
            local player = game.Players.LocalPlayer
            local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
            vehicle:SetAttribute("armorLevel", 6)
            vehicle:SetAttribute("brakesLevel", 6)
            vehicle:SetAttribute("engineLevel", 6)
            vehicle:SetAttribute("currentFuel", 10000000)
            vehicle:SetAttribute("currentHealth", 500)
            vehicle:SetAttribute("IsOn", true)
        else
            local player = game.Players.LocalPlayer
            local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
            vehicle:SetAttribute("armorLevel", TUNINGLEVEL)
            vehicle:SetAttribute("brakesLevel", TUNINGLEVEL)
            vehicle:SetAttribute("engineLevel", TUNINGLEVEL)
        end


        whileloopcounter1 = whileloopcounter1 + 1
        wait(0.05)


        local lightBANK = game.Workspace:FindFirstChild("Robberies") 
                and game.Workspace.Robberies:FindFirstChild("BankRobbery")
                and game.Workspace.Robberies.BankRobbery:FindFirstChild("LightGreen")
                and game.Workspace.Robberies.BankRobbery.LightGreen:FindFirstChild("Light")

        if lightBANK then
            if lightBANK.Enabled then
                if lastlightbank == false then
                    if SENDNOTIFICTIONS then
                    Fluent:Notify({
                        Title = "Notify",
                        Content = "The bank is ready to rob!",
                        SubContent = "", -- Optional
                        Duration = 5 -- Set to nil to make the notification not disappear
                    })
                end
                end
                Options.bankstats:SetValue(true)
                lastlightbank = true
            else
            if SENDNOTIFICTIONS then
                if lastlightbank then
                    Fluent:Notify({
                        Title = "Notify",
                        Content = "The bank is not ready for robbery!",
                        SubContent = "", -- Optional
                        Duration = 5 -- Set to nil to make the notification not disappear
                    })
                end
            end
                Options.bankstats:SetValue(false)
                lastlightbank = false
            end
        else
            print("The light was not found.")
        end

        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

        if humanoid.Health < 50 then
            if savemybutt then
            playerLowHealthMove(humanoid.Health)
            end
        else
            hasTriggeredemergencyMove = false
        end

        if PLAYERESP_main then
                _G.espMarkers = _G.espMarkers or {}

                -- Clear old ESP drawings
                for _, marker in pairs(_G.espMarkers) do
                    for _, item in pairs(marker) do
                        if typeof(item) == "Instance" and item:IsA("Highlight") then
                            item:Destroy()
                        elseif typeof(item) == "table" and item.Remove then
                            item:Remove()
                        end
                    end
                end
                table.clear(_G.espMarkers)

                -- Draw ESP for each valid player
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = player.Character.HumanoidRootPart
                        local distance = (hrp.Position - Camera.CFrame.Position).Magnitude

                        if distance <= 1000 then
                            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                            if onScreen then
                                local marker = {}

                                -- Box
                                if PLAYERESP_box then
                                    local box = Drawing.new("Square")
                                    box.Size = Vector2.new(50, 100)
                                    box.Position = Vector2.new(screenPos.X - 25, screenPos.Y - 50)
                                    box.Color = Color3.new(1, 1, 1)
                                    box.Thickness = 1
                                    box.Filled = false
                                    box.Visible = true
                                    marker.box = box
                                end

                                -- Highlight + tracer
                                if PLAYERESP_highlight then
                                    local hl = Instance.new("Highlight")
                                    hl.Adornee = player.Character
                                    hl.FillTransparency = 1
                                    hl.OutlineColor = Color3.new(1, 1, 0)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Parent = player.Character
                                    marker.highlight = hl

                                    local tracer = Drawing.new("Line")
                                    tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                                    tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                                    tracer.Color = Color3.new(1, 1, 0)
                                    tracer.Thickness = 1
                                    tracer.Visible = true
                                    marker.tracer = tracer
                                end

                                -- Name (with team name included)
                                if PLAYERESP_name then
                                    local teamName = player.Team and player.Team.Name or "Neutral"
                                    local nameText = Drawing.new("Text")
                                    nameText.Text = string.format("%s [%s]", player.Name, teamName)
                                    nameText.Position = Vector2.new(screenPos.X, screenPos.Y - 60)
                                    nameText.Color = Color3.new(1, 1, 1)
                                    nameText.Size = 13
                                    nameText.Center = true
                                    nameText.Outline = true
                                    nameText.Visible = true
                                    marker.name = nameText
                                end

                                -- Distance
                                if PLAYERESP_distance then
                                    local distText = Drawing.new("Text")
                                    distText.Text = string.format("%.0f studs", distance)
                                    distText.Position = Vector2.new(screenPos.X, screenPos.Y + 60)
                                    distText.Color = Color3.new(0, 1, 0)
                                    distText.Size = 12
                                    distText.Center = true
                                    distText.Outline = true
                                    distText.Visible = true
                                    marker.distance = distText
                                end

                                -- Team (separate line)
                                if PLAYERESP_team then
                                    local teamText = Drawing.new("Text")
                                    local teamName = player.Team and player.Team.Name or "Neutral"
                                    teamText.Text = teamName
                                    teamText.Position = Vector2.new(screenPos.X, screenPos.Y + 75)
                                    teamText.Color = Color3.new(0, 0.5, 1)
                                    teamText.Size = 12
                                    teamText.Center = true
                                    teamText.Outline = true
                                    teamText.Visible = true
                                    marker.team = teamText
                                end

                                -- Healthbar
                                if PLAYERESP_healthbar and player.Character:FindFirstChild("Humanoid") then
                                    local hp = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth
                                    local bar = Drawing.new("Line")
                                    bar.From = Vector2.new(screenPos.X - 30, screenPos.Y + 50)
                                    bar.To = Vector2.new(screenPos.X - 30, screenPos.Y + 50 - (hp * 100))
                                    bar.Color = Color3.fromRGB(0, 255, 0)
                                    bar.Thickness = 2
                                    bar.Visible = true
                                    marker.healthbar = bar
                                end

                                table.insert(_G.espMarkers, marker)
                            end
                        end
                    end
                end
        end

        local function deleteDoors(parent)
            for _, obj in pairs(parent:GetChildren()) do
                if obj:IsA("Model") then
                    if obj.Name == "SlidingDoor" or obj.Name == "MetalDoor" or obj.Name == "GlassDoor" then
                        obj:Destroy()
                        task.wait() -- short pause to avoid lag
                    else
                        deleteDoors(obj)
                    end
                elseif obj:IsA("Folder") then
                    deleteDoors(obj)
                end
            end
        end
        if deletealldoors and whileloopcounter1 == 2000 then
            whileloopcounter1 = 0
            task.spawn(function()
                deleteDoors(workspace)
            end)
        end
        if garagedoorpermanentopen then
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "GarageDoor" then
                    model:SetAttribute("IsTriggered", false)
                    model:SetAttribute("IsTriggered", true)
                    model:SetAttribute("OpenForCitizen", true)
                    model:SetAttribute("OpenForPlayers", true)
                    model:SetAttribute("OpeningDuration", 0)
                end
            end
            for _, model in pairs(workspace.GarageDoors:GetChildren()) do
                if model:IsA("Model") and model.Name == "Bollards" then
                    model:SetAttribute("IsTriggered", false)
                    model:SetAttribute("IsTriggered", true)
                    model:SetAttribute("OpenForCitizen", true)
                    model:SetAttribute("OpenForPlayers", true)
                    model:SetAttribute("OpeningDuration", 0)
                end
            end
            for _, model in pairs(workspace.Gates:GetChildren()) do
                if model:IsA("Model") and model.Name == "Gate" then
                    model:SetAttribute("IsTriggered", false)
                    model:SetAttribute("IsTriggered", true)
                    model:SetAttribute("OpeningDuration", 0)
                end
            end
        end
    end


end



-- Addons:
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/eh")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

SaveManager:LoadAutoloadConfig()
