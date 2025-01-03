local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "P6auls Doors Hub",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Never use my scripts without credit!",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
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

 local ExploitTab = Window:CreateTab("Instant Exploit", "badge-plus") -- Title, Image

 local SettingsTab = Window:CreateTab("Settings", "lock-open") -- Title, Image

 local shownotificationsforsuccess = true
 local entitynotify = false

 local shownotificationsforsuccessToggle = SettingsTab:CreateToggle({
    Name = "Show success messages",
    CurrentValue = true,
    Flag = "shownotificationsforsuccessToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
   shownotificationsforsuccess = Value
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

 function check_for_rush_moving()
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "RushMoving" and not notifiedModels[obj] then
            create_notification("Entity!", "Rush is comming! Hide quickly", 5, "warning")
            notifiedModels[obj] = true
        end
    end
end

while true do
    if entitynotify == true then
    check_for_rush_moving()
    end
    task.wait(0.2)
end
