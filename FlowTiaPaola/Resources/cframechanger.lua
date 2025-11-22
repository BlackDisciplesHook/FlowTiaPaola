local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Heartbeat = RunService.Heartbeat

local Desync = {
    Config = {
        Enabled = false,

        Type = "Disabled",

        RandomX = 25,
        RandomY = 25,
        RandomZ = 25,

        CustomX = 25,
        CustomY = 25,
        CustomZ = 25,
    },

    Real = nil,
    Fake = nil,
    Connections = {}
}

table.insert(Desync.Connections, Heartbeat:Connect(function()
    if Desync.Config.Enabled and Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Head") then
        Desync.Real = LocalPlayer.Character.HumanoidRootPart.CFrame

        if Desync.Config.Type == "Void" then
            Desync.Fake = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0 / 0, math.huge, 2^1023)
        elseif Desync.Config.Type == "Custom" then
            Desync.Fake = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(Desync.Config.CustomX, Desync.Config.CustomY, Desync.Config.CustomZ)
        elseif Desync.Config.Type == "Random" then
            local RandomX = math.random(-Desync.Config.RandomX, Desync.Config.RandomX)
            local RandomY = math.random(-Desync.Config.RandomY, Desync.Config.RandomY)
            local RandomZ = math.random(-Desync.Config.RandomZ, Desync.Config.RandomZ)

            Desync.Fake = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(RandomX, RandomY, RandomZ)
        else
            Desync.Fake = LocalPlayer.Character.HumanoidRootPart.CFrame
        end

        LocalPlayer.Character.HumanoidRootPart.CFrame = Desync.Fake
        RunService.RenderStepped:Wait()
        LocalPlayer.Character.HumanoidRootPart.CFrame = Desync.Real
    end
end))

local Old
Old = hookmetamethod(workspace, "__index", function(Self, Key, Index)
    if Desync.Config.Enabled and not checkcaller() and Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Head") then
        if Key == "CFrame" then
            if Self == LocalPlayer.Character.HumanoidRootPart then
                return Desync.Real or CFrame.new()
            elseif Self == LocalPlayer.Character.Head then
                return Desync.Real + Vector3.new(0, CFrame.new(0, (LocalPlayer.Character.HumanoidRootPart.Size.Y / 2) + 0.5, 0), 0) or CFrame.new()
            end
        end
    end

    return Old(Self, Key, Index)
end)

return Desync