local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Heartbeat = RunService.Heartbeat

local Desync = {
    Config = {
        Enabled = false,

        Type = "Disabled", -- "Disabled", "Void", "Custom", "Random"

        -- Position
        RandomX = 25,
        RandomY = 25,
        RandomZ = 25,

        CustomX = 25,
        CustomY = 25,
        CustomZ = 25,

        -- Angles
        AngleType = "Disabled", -- "Disabled", "Custom", "Random"

        RandomYaw = 180,
        RandomPitch = 180,
        RandomRoll = 180,

        CustomYaw = 0,
        CustomPitch = 0,
        CustomRoll = 0,
    },

    Real = nil,
    Fake = nil,
    RealAngles = nil,
    FakeAngles = nil,
    Connections = {}
}

table.insert(Desync.Connections, Heartbeat:Connect(function()
    if Desync.Config.Enabled and Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Head") then
        Desync.Real = LocalPlayer.Character.HumanoidRootPart.CFrame
        Desync.RealAngles = {Desync.Real:ToEulerAnglesYXZ()}

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

        if Desync.Config.AngleType == "Custom" then
            Desync.FakeAngles = {
                math.rad(Desync.Config.CustomYaw),
                math.rad(Desync.Config.CustomPitch),
                math.rad(Desync.Config.CustomRoll)
            }
        elseif Desync.Config.AngleType == "Random" then
            local RandomYaw = math.random(-Desync.Config.RandomYaw, Desync.Config.RandomYaw)
            local RandomPitch = math.random(-Desync.Config.RandomPitch, Desync.Config.RandomPitch)
            local RandomRoll = math.random(-Desync.Config.RandomRoll, Desync.Config.RandomRoll)
            Desync.FakeAngles = {
                math.rad(RandomYaw),
                math.rad(RandomPitch),
                math.rad(RandomRoll)
            }
        else
            Desync.FakeAngles = {Desync.Fake:ToEulerAnglesYXZ()}
        end

        if Desync.Config.AngleType ~= "Disabled" and Desync.FakeAngles then
            Desync.Fake = CFrame.new(Desync.Fake.Position) * CFrame.fromEulerAnglesYXZ(
                Desync.FakeAngles[1],
                Desync.FakeAngles[2],
                Desync.FakeAngles[3]
            )
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
                if Desync.Real and Desync.Config.AngleType ~= "Disabled" and Desync.FakeAngles then
                    return CFrame.new(Desync.Real.Position) * CFrame.fromEulerAnglesYXZ(
                        Desync.FakeAngles[1],
                        Desync.FakeAngles[2],
                        Desync.FakeAngles[3]
                    )
                else
                    return Desync.Real or CFrame.new()
                end
            elseif Self == LocalPlayer.Character.Head then
                local HeadPosition = Desync.Real.Position + Vector3.new(0, (LocalPlayer.Character.HumanoidRootPart.Size.Y / 2) + 0.5, 0)

                if Desync.Real and Desync.Config.AngleType ~= "Disabled" and Desync.FakeAngles then
                    return CFrame.new(HeadPosition) * CFrame.fromEulerAnglesYXZ(
                        Desync.FakeAngles[1],
                        Desync.FakeAngles[2],
                        Desync.FakeAngles[3]
                    )
                else
                    return CFrame.new(HeadPosition)
                end
            end
        end
    end

    return Old(Self, Key, Index)
end)

return Desync
