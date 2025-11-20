getgenv().Whitelist = {}
local Whitelist = getgenv().Whitelist

local ESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Resources/esp.lua'))()
local Aimbot = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Resources/aimbot.lua'))()

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/FlowTiaPaola/refs/heads/main/FlowTiaPaola/Resources/library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/LinoriaLib/main/addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/BlackDisciplesHook/LinoriaLib/main/addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'FlowTiaPaola | ' .. os.date("%d %b %Y"),
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.1
})

local Tabs = {
    Legit = Window:AddTab('Legit'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    Settings = Window:AddTab('Settings'),
}

local AimbotMainSection = Tabs.Legit:AddLeftGroupbox('Aimbot')

AimbotMainSection:AddToggle('AimbotEnabled', {
    Text = "Enabled",
    Default = false,
    Callback = function(Value)
        Aimbot.Config.Enabled = Value
        Options.AimbotBind:SetNoUI(not Toggles.AimbotEnabled.Value)
    end
}):AddKeyPicker('AimbotBind', {
    Default = 'None',
    Text = 'Aimbot',
    Mode = 'Hold',
    NoUI = true,
})

Options.AimbotBind.NoUI = true

AimbotMainSection:AddSlider('AimbotSmoothness', {
    Text = 'Smoothness',
    Default = 1,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Aimbot.Config.Smoothness = Value / 100
    end
})

AimbotMainSection:AddDropdown('AimbotAimpart', {
    Values = {"Head", "Torso", "Left Leg", "Right Leg", "Left Arm", "Right Arm", "UpperTorso", "LowerTorso", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot", "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "LeftHand", "RightHand"},
    Multi = false,
    Text = 'Aimpart',
    Default = "Head",
    Callback = function(Value)
        Aimbot.Config.Aimpart = Value
    end
})

AimbotMainSection:AddDropdown('AimbotMethod', {
    Values = {"Camera", "Mouse"},
    Multi = false,
    Text = 'Method',
    Default = "Camera",
    Callback = function(Value)
        Aimbot.Config.Method = Value
    end
})

AimbotMainSection:AddDivider()

AimbotMainSection:AddToggle('AimbotWallCheckEnabled', {
    Text = "Wall Check",
    Default = false,
    Callback = function(Value)
        Aimbot.Config.WallCheck = Value
    end
})

AimbotMainSection:AddToggle('AimbotTeamCheckEnabled', {
    Text = "Team Check",
    Default = false,
    Callback = function(Value)
        Aimbot.Config.TeamCheck = Value
    end
})

AimbotMainSection:AddToggle('AimbotInvisibleCheckEnabled', {
    Text = "Invisible Check",
    Default = false,
    Callback = function(Value)
        Aimbot.Config.InvisCheck = Value
    end
})

AimbotMainSection:AddToggle('AimbotForceFieldCheckEnabled', {
    Text = "ForceField Check",
    Default = false,
    Callback = function(Value)
        Aimbot.Config.ForceFieldCheck = Value
    end
})

AimbotMainSection:AddDivider()

AimbotMainSection:AddToggle('AimbotFOVEnabled', {
    Text = "FOV Enabled",
    Default = false,
    Callback = function(Value)
        Aimbot.FOVConfig.Enabled = Value
    end
})

AimbotMainSection:AddToggle('AimbotFOVVisible', {
    Text = "FOV Visible",
    Default = false,
    Callback = function(Value)
        Aimbot.FOVConfig.Visible = Value
    end
})

AimbotMainSection:AddSlider('AimbotFOVRadius', {
    Text = 'Radius',
    Default = 100,
    Min = 1,
    Max = 1000,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Aimbot.FOVConfig.Radius = Value
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

MenuSection:AddToggle('Watermark', {
    Text = "Watermark",
    Default = true,
    Callback = function(Value)
        Library:SetWatermarkVisibility(Value)
    end
})

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

local FrameTimer = tick()
local FrameCounter = 0
local FPS = 60

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameTimer = tick()
        FrameCounter = 0
    end

    Library:SetWatermark(('FlowTiaPaola | FPS: %s | Ping: %sms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ))
end)

SaveManager:SetLibrary(Library)
SaveManager:SetFolder('FlowTiaPaola/Universal')
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs.Settings)

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder('FlowTiaPaola/Themes')
ThemeManager:ApplyToTab(Tabs.Settings)
ThemeManager:ApplyTheme("BDH")
