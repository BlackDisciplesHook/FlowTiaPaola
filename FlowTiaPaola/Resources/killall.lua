local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local RenderStepped = RunService.RenderStepped

local KillAll = {
    Config = {
        Enabled = false,

        TeamCheck = false,
        ForceFieldCheck = false,

        Distance = 10,
    },

    Connections = {}
}

table.insert(KillAll.Connections, RenderStepped:Connect(function()
    if KillAll.Config.Enabled and Character and Character:FindFirstChild("HumanoidRootPart") then
        for _, Player in next, Players:GetPlayers() do
            if Player ~= LocalPlayer and (not KillAll.Config.TeamCheck or Player.Team ~= LocalPlayer.Team) then
                local character = Player.Character

                if character and (not KillAll.Config.ForceFieldCheck or not character:FindFirstChild("ForceField")) then
                    local Root = character:FindFirstChild("HumanoidRootPart")

                    if Root then
                        local NewPos = Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -KillAll.Config.Distance)
                        Root.CFrame = CFrame.new(NewPos.Position, Character.HumanoidRootPart.Position)
                    end
                end
            end
        end
    end
end))

return KillAll
