-- << Esp Settings >>
local ESP_SETTINGS = {
    ['MurdererColor'] = Color3.fromRGB(255, 0, 0),
    ['SheriffColor'] = Color3.fromRGB(0, 0, 255),
    ['GunColor'] = Color3.fromRGB(255, 255, 0)
}

-- << Check If Running >>
if _G.EspDestroy then
    _G.EspDestroy()
    _G.EspDestroy = nil
    return
end

-- << GetServices >>
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- << Variables >>
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local _RunServiceConnection;

-- << Esp Setup >>
local murdererLine, sheriffLine, gunLine = Drawing.new("Line"), Drawing.new("Line"), Drawing.new("Line")
murdererLine.Color = ESP_SETTINGS['MurdererColor'] murdererLine.Thickness = 2 murdererLine.Transparency = 1 murdererLine.Visible = false
sheriffLine.Color = ESP_SETTINGS['SheriffColor'] sheriffLine.Thickness = 2 sheriffLine.Transparency = 1 sheriffLine.Visible = false
gunLine.Color = ESP_SETTINGS['GunColor'] gunLine.Thickness = 2 gunLine.Transparency = 1 gunLine.Visible = false

-- << Functions >>
local function worldToScreenPoint(...)
    local vector, onScreen = Camera:WorldToScreenPoint(...)

    if onScreen then
        return {true, Vector2.new(vector.X - 2, vector.Y - 2)}
    else
        return {false}
    end
end

local function isGunDown()
    if workspace:FindFirstChild("GunDrop") then
        return true
    else
        return false
    end
end

local function getMurderer()
    for a,b in pairs(Players:GetPlayers()) do
        if b.Character then
            if b.Character:FindFirstChild("Knife") or b.Backpack:FindFirstChild("Knife") then
                return b
            end
        end
    end
    return nil
end

local function getSheriff()
    for a,b in pairs(Players:GetPlayers()) do
        if b.Character then
            if b.Character:FindFirstChild("Gun") or b.Backpack:FindFirstChild("Gun") then
                return b
            end
        end
    end
    return nil
end

-- << Create Destroy Function >>
_G.EspDestroy = function()
    _RunServiceConnection:Disconnect()
    murdererLine.Visible = false
    sheriffLine.Visible = false
    gunLine.Visible = false
end

-- << Esp Main >>
_RunServiceConnection = RunService.RenderStepped:Connect(function()
    -- << Cache Data For One Call >>
    local murdererCache = getMurderer()
    local sheriffCache = getSheriff()
    local isGunDownCache = isGunDown()

    -- << Murderer Esp >>
    pcall(function()
        if murdererCache and murdererCache.Character then
            if murdererCache.Name ~= LocalPlayer.Name then
                local onScreenPosition = worldToScreenPoint(murdererCache.Character.HumanoidRootPart.Position)
                if onScreenPosition[1] == true then
                    murdererLine.Visible = true
                    murdererLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    murdererLine.To = onScreenPosition[2]
                else
                    murdererLine.Visible = false
                end
            end
        else
            murdererLine.Visible = false
        end
    end)

    -- << Sheriff Esp >>
    pcall(function()
        if sheriffCache and sheriffCache.Character then
            if sheriffCache.Name ~= LocalPlayer.Name then
                local onScreenPosition = worldToScreenPoint(sheriffCache.Character.HumanoidRootPart.Position)
                if onScreenPosition[1] == true then
                    sheriffLine.Visible = true
                    sheriffLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    sheriffLine.To = onScreenPosition[2]
                else
                    sheriffLine.Visible = false
                end
            end
        else
            sheriffLine.Visible = false
        end
    end)

    -- << Gun Esp >>
    pcall(function()
        if isGunDownCache then
            if workspace:FindFirstChild("GunDrop") then
                local onScreenPosition = worldToScreenPoint(workspace.GunDrop.Position)
                if onScreenPosition[1] == true then
                    gunLine.Visible = true
                    gunLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    gunLine.To = onScreenPosition[2]
                else
                    gunLine.Visible = false
                end
            else
                gunLine.Visible = false
            end
        else
            gunLine.Visible = false
        end
    end)
end)
