for _, thread in getreg() do
    if typeof(thread) ~= "thread" then
        continue
    end

    local Source = debug.info(thread, 1, "s")
    if Source and (Source:match(".Core.Anti") or Source:match(".Plugins.Anti_Cheat")) then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cutelilfemboy12/Resources/refs/heads/main/Bypass.lua"))()
        break
    end
end

getgenv().Whitelist = {}
local Whitelist = getgenv().Whitelist

local ESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Resources/esp.lua'))()
local SilentAim = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Resources/silentaim.lua'))()
local Desync = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Resources/cframechanger.lua'))()

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Library/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Library/addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Library/addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'FlowTiaPaola | ' .. os.date("%d %b %Y"),
    Center = true,
    AutoShow = true,
    TabPadding = 0,
    MenuFadeTime = 0.1
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Visuals = Window:AddTab('ESP'),
    Settings = Window:AddTab('Settings'),
}

local DesyncSection = Tabs.Main:AddLeftGroupbox('Desync')

DesyncSection:AddToggle('DesyncEnabled', {
    Text = "Enabled",
    Default = false,
    Callback = function(Value)
        Desync.Config.Enabled = Value
    end
})

DesyncSection:AddDivider()

DesyncSection:AddDropdown('DesyncPositionType', {
    Values = {"Disabled", "Void", "Custom", "Random"},
    Multi = false,
    Text = 'Position Type',
    Default = "Disabled",
    Callback = function(Value)
        Desync.Config.Type = Value
    end
})

DesyncSection:AddDivider()

DesyncSection:AddSlider('DesyncRandomX', {
    Text = 'Random X',
    Default = 25,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.RandomX = Value
    end
})

DesyncSection:AddSlider('DesyncRandomY', {
    Text = 'Random Y',
    Default = 25,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.RandomY = Value
    end
})

DesyncSection:AddSlider('DesyncRandomZ', {
    Text = 'Random Z',
    Default = 25,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.RandomZ = Value
    end
})

DesyncSection:AddDivider()

DesyncSection:AddSlider('DesyncCustomX', {
    Text = 'Custom X',
    Default = 25,
    Min = -100,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.CustomX = Value
    end
})

DesyncSection:AddSlider('DesyncCustomY', {
    Text = 'Custom Y',
    Default = 25,
    Min = -100,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.CustomY = Value
    end
})

DesyncSection:AddSlider('DesyncCustomZ', {
    Text = 'Custom Z',
    Default = 25,
    Min = -100,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.CustomZ = Value
    end
})

DesyncSection:AddDivider()

DesyncSection:AddDropdown('DesyncAngleType', {
    Values = {"Disabled", "Custom", "Random"},
    Multi = false,
    Text = 'Angle Type',
    Default = "Disabled",
    Callback = function(Value)
        Desync.Config.AngleType = Value
    end
})

DesyncSection:AddDivider()

DesyncSection:AddSlider('DesyncRandomYaw', {
    Text = 'Random Yaw',
    Default = 180,
    Min = 1,
    Max = 360,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.RandomYaw = Value
    end
})

DesyncSection:AddSlider('DesyncRandomPitch', {
    Text = 'Random Pitch',
    Default = 180,
    Min = 1,
    Max = 360,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.RandomPitch = Value
    end
})

DesyncSection:AddSlider('DesyncRandomRoll', {
    Text = 'Random Roll',
    Default = 180,
    Min = 1,
    Max = 360,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.RandomRoll = Value
    end
})

DesyncSection:AddDivider()

DesyncSection:AddSlider('DesyncCustomYaw', {
    Text = 'Custom Yaw',
    Default = 0,
    Min = -180,
    Max = 180,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.CustomYaw = Value
    end
})

DesyncSection:AddSlider('DesyncCustomPitch', {
    Text = 'Custom Pitch',
    Default = 0,
    Min = -180,
    Max = 180,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.CustomPitch = Value
    end
})

DesyncSection:AddSlider('DesyncCustomRoll', {
    Text = 'Custom Roll',
    Default = 0,
    Min = -180,
    Max = 180,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Desync.Config.CustomRoll = Value
    end
})

local SilentAimMainSection = Tabs.Main:AddLeftGroupbox('Silent Aim')

SilentAimMainSection:AddToggle('SilentAimEnabled', {
    Text = "Enabled",
    Default = false,
    Callback = function(Value)
        SilentAim.Config.Enabled = Value
    end
})

SilentAimMainSection:AddToggle('SilentAimWallbangEnabled', {
    Text = "Wallbang",
    Default = false,
    Callback = function(Value)
        SilentAim.Config.BulletTeleport = Value
    end
})

SilentAimMainSection:AddSlider('SilentAimSmoothness', {
    Text = 'Hitchance',
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        SilentAim.Config.Hitchance = Value
    end
})

SilentAimMainSection:AddDropdown('SilentAimPriorityHitpart', {
    Values = {"Head", "Torso", "Left Leg", "Right Leg", "Left Arm", "Right Arm", "UpperTorso", "LowerTorso", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot", "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "LeftHand", "RightHand"},
    Multi = false,
    AllowNull = true,
    Text = 'Priority Hitpart',
    Default = nil,
    Callback = function(Value)
        SilentAim.Config.PriorityPart = Value
    end
})

SilentAimMainSection:AddDropdown('SilentAimAimpart', {
    Values = {"Head", "Torso", "Left Leg", "Right Leg", "Left Arm", "Right Arm", "UpperTorso", "LowerTorso", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot", "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "LeftHand", "RightHand"},
    Multi = true,
    Text = 'Hitparts',
    Default = {"Head", "Torso"},
    Callback = function(Value)
        local T = {}

        for k, v in next, Value do
            if v then
                table.insert(T, k)
            end
        end

        SilentAim.Config.Hitparts = T
    end
})

SilentAimMainSection:AddDropdown('SilentAimMethod', {
    Values = {"Raycast", "FindPartOnRay", "FindPartOnRayWithIgnoreList", "FindPartOnRayWithWhitelist", "Spherecast"},
    Multi = false,
    Text = 'Method',
    Default = "Raycast",
    Callback = function(Value)
        SilentAim.Config.Method = Value
    end
})

SilentAimMainSection:AddDivider()

SilentAimMainSection:AddToggle('SilentAimWallCheckEnabled', {
    Text = "Wall Check",
    Default = false,
    Callback = function(Value)
        SilentAim.Config.WallCheck = Value
    end
})

SilentAimMainSection:AddToggle('SilentAimTeamCheckEnabled', {
    Text = "Team Check",
    Default = false,
    Callback = function(Value)
        SilentAim.Config.TeamCheck = Value
    end
})

SilentAimMainSection:AddToggle('SilentAimInvisibleCheckEnabled', {
    Text = "Invisible Check",
    Default = false,
    Callback = function(Value)
        SilentAim.Config.InvisCheck = Value
    end
})

SilentAimMainSection:AddToggle('SilentAimForceFieldCheckEnabled', {
    Text = "ForceField Check",
    Default = false,
    Callback = function(Value)
        SilentAim.Config.ForceFieldCheck = Value
    end
})

SilentAimMainSection:AddDivider()

SilentAimMainSection:AddToggle('SilentAimFOVEnabled', {
    Text = "FOV Enabled",
    Default = false,
    Callback = function(Value)
        SilentAim.FOVConfig.Enabled = Value
    end
})

SilentAimMainSection:AddToggle('SilentAimFOVVisible', {
    Text = "FOV Visible",
    Default = false,
    Callback = function(Value)
        SilentAim.FOVConfig.Visible = Value
    end
})

SilentAimMainSection:AddSlider('SilentAimFOVRadius', {
    Text = 'Radius',
    Default = 100,
    Min = 1,
    Max = 1000,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        SilentAim.FOVConfig.Radius = Value
    end
})

local ESPMainSection = Tabs.Visuals:AddLeftGroupbox('ESP')

ESPMainSection:AddToggle('ESPEnabled', {
    Text = "Enabled",
    Default = false,
    Callback = function(Value)
        ESP.Config.Enabled = Value
    end
})

ESPMainSection:AddToggle('ESPBoxEnabled', {
    Text = "Box",
    Default = false,
    Callback = function(Value)
        ESP.Config.Box = Value
    end
}):AddColorPicker('ESPBoxColor', {
    Title = 'Box Color',
    Default = Color3.fromRGB(255, 255, 255),
    Transparency = nil,
    Callback = function(Value)
        ESP.Config.BoxColor = Value
    end
})

ESPMainSection:AddToggle('ESPNameEnabled', {
    Text = "Name",
    Default = false,
    Callback = function(Value)
        ESP.Config.Name = Value
    end
}):AddColorPicker('ESPNameColor', {
    Title = 'Name Color',
    Default = Color3.fromRGB(255, 255, 255),
    Transparency = nil,
    Callback = function(Value)
        ESP.Config.NameColor = Value
    end
})

ESPMainSection:AddToggle('ESPTracersEnabled', {
    Text = "Tracers",
    Default = false,
    Callback = function(Value)
        ESP.Config.Tracers = Value
    end
}):AddColorPicker('ESPTracerColor', {
    Title = 'Tracer Color',
    Default = Color3.fromRGB(255, 255, 255),
    Transparency = nil,
    Callback = function(Value)
        ESP.Config.TracerColor = Value
    end
})

ESPMainSection:AddToggle('ESPDistanceEnabled', {
    Text = "Distance",
    Default = false,
    Callback = function(Value)
        ESP.Config.Distance = Value
    end
}):AddColorPicker('ESPDistanceColor', {
    Title = 'Distance Color',
    Default = Color3.fromRGB(255, 255, 255),
    Transparency = nil,
    Callback = function(Value)
        ESP.Config.DistanceColor = Value
    end
})

ESPMainSection:AddToggle('ESPHealthBarEnabled', {
    Text = "Healthbar",
    Default = false,
    Callback = function(Value)
        ESP.Config.HealthBar = Value
    end
}):AddColorPicker('ESPHighHealthColor', {
    Title = 'High Health Color',
    Default = Color3.fromRGB(0, 255, 0),
    Transparency = nil,
    Callback = function(Value)
        ESP.Config.HighHealthColor = Value
    end
}):AddColorPicker('ESPLowHealthColor', {
    Title = 'Low Health Color',
    Default = Color3.fromRGB(255, 0, 0),
    Transparency = nil,
    Callback = function(Value)
        ESP.Config.LowHealthColor = Value
    end
})

ESPMainSection:AddToggle('ESPHighlightEnabled', {
    Text = "Highlight",
    Default = false,
    Callback = function(Value)
        ESP.Config.Chams = Value
    end
}):AddColorPicker('ESPHighlightFillColor', {
    Title = 'Fill Color',
    Default = Color3.fromRGB(45, 125, 254),
    Transparency = 0.7,
    Callback = function(Value, Alpha)
        ESP.Config.ChamsFillColor = Value
        ESP.Config.ChamsFillTransparency = Alpha
    end
}):AddColorPicker('ESPHighlightOutlineColor', {
    Title = 'Outline Color',
    Default = Color3.fromRGB(45, 125, 254),
    Transparency = 0.5,
    Callback = function(Value, Alpha)
        ESP.Config.ChamsOutlineColor = Value
        ESP.Config.ChamsOutlineTransparency = Alpha
    end
})

ESPMainSection:AddDivider()

ESPMainSection:AddToggle('ESPTeamCheckEnabled', {
    Text = "Team Check",
    Default = false,
    Callback = function(Value)
        ESP.Config.TeamCheck = Value
    end
})

ESPMainSection:AddToggle('ESPInvisibleCheckEnabled', {
    Text = "Invisible Check",
    Default = false,
    Callback = function(Value)
        ESP.Config.InvisibleCheck = Value
    end
})

ESPMainSection:AddDivider()

ESPMainSection:AddDropdown('ESPFont', {
    Values = {"smallest_pixel-7", "ProggyClean"},
    Multi = false,
    Text = 'Font',
    Default = "ProggyClean",
    Callback = function(Value)
        getgenv().GlobalFont = Value .. ".font"

        ESP.UpdateFonts()
    end
})

local MenuSection = Tabs.Settings:AddLeftGroupbox('Menu')

MenuSection:AddToggle('Keybinds', {
    Text = "Keybinds",
    Default = false,
    Callback = function(Value)
        Library.KeybindFrame.Visible = Value
    end
})

MenuSection:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'RightShift',
    NoUI = true,
    Text = 'Menu'
})


Options.MenuKeybind.NoUI = true
Library.ToggleKeybind = Options.MenuKeybind

SaveManager:SetLibrary(Library)
SaveManager:SetFolder('FlowTiaPaola/Universal')
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs.Settings)

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder('FlowTiaPaola/Themes')
ThemeManager:ApplyToTab(Tabs.Settings)
ThemeManager:ApplyTheme("BDH")
