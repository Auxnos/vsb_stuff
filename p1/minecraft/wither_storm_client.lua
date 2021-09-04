if not game.Loaded then
    game.Loaded:Wait()
end
wait(1/60)
script.Parent = nil
local WalkSpeed = 36
local FlyMode = true
local CFrameValue = Instance.new("CFrameValue")
CFrameValue.Value = CFrame.new(0, 15, 0)
local LocalPlayer = game:GetService("Players").LocalPlayer
local owner do
    owner = LocalPlayer
end
local mainpos = CFrame.new(0,75,0)
local PotentialCFrame, OldCFrame, Moving, LastFrame = mainpos, mainpos, false, tick()
CFrameValue.Value = mainpos
local UserInputService = game:GetService("UserInputService")
local RayProperties = RaycastParams.new()
RayProperties.IgnoreWater,RayProperties.FilterType = true,Enum.RaycastFilterType.Blacklist
local function KeyDown(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) or false
end
local function KeyUp(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) or false
end
local MouseProps,Hit,Target = RaycastParams.new(),CFrame.new(),nil
game:GetService'UserInputService'.InputBegan:Connect(function(Input,sa)
    if sa then return end 
    if Input.KeyCode == Enum.KeyCode.F then
        FlyMode = not FlyMode
    elseif Input.KeyCode == Enum.KeyCode.P then
        pcall(function()
            owner.Remote:FireServer("refit")
        end)
    elseif Input.KeyCode == Enum.KeyCode.N then
        pcall(function()
            owner.Remote:FireServer("Mode")
        end)
    end
end)
warn("same")

local pos = Instance.new("BodyPosition", script)
local gyro = Instance.new("BodyGyro", script)
pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
pos.position = mainpos.p
gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
gyro.cframe = mainpos
game:GetService("RunService").RenderStepped:Connect(function()
    MouseProps.FilterType = Enum.RaycastFilterType.Blacklist
    pcall(function()
        owner.Remote:FireServer("mouse",Hit,Target)
    end)
    MouseProps.FilterDescendantsInstances = {workspace:FindFirstChild(LocalPlayer.Name),workspace.Terrain} -- add stuff if youy want loser
    local MousePosition = game:GetService("UserInputService"):GetMouseLocation()-game:GetService("GuiService"):GetGuiInset()
    local UnitRay = workspace.CurrentCamera:ScreenPointToRay(MousePosition.X,MousePosition.Y)
    local Ray_ = workspace:Raycast(UnitRay.Origin,UnitRay.Direction*1e3,MouseProps)
    Hit,Target = Ray_ and CFrame.new(Ray_.Position) or CFrame.new(),Ray_ and Ray_.Instance or nil
    local LookVector = workspace.CurrentCamera.CFrame.LookVector
    local Closest, __L = math.huge, nil
    local _Ray = nil
    local _Raycasts = {}
    if (UserInputService.MouseBehavior ~= Enum.MouseBehavior.Default) then
        if not FlyMode then
            mainpos = CFrame.new(mainpos.p,Vector3.new(mainpos.X+LookVector.X,mainpos.Y,mainpos.Z+LookVector.Z))
        else
            mainpos = CFrame.new(mainpos.p,mainpos.p+LookVector)
        end
    end
    for b,_Raycast in pairs(_Raycasts) do
        local Magnitude = (mainpos.Position-_Raycast.Position).Magnitude
        if Magnitude < Closest then
            Closest,_Ray = Magnitude,_Raycast
        end
    end
    table.clear(_Raycasts)
    pcall(function()
        game:GetService'TweenService':Create(CFrameValue,TweenInfo.new(0.1),{
            Value = mainpos
        }):Play()
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = mainpos.p
        gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
        gyro.cframe = mainpos
        owner.Remote:FireServer("stuff",CFrame.new(pos.Position) * gyro.CFrame,Moving)
        RayProperties.FilterDescendantsInstances = {workspace:FindFirstChild(LocalPlayer.Name)}
    end)
    pcall(function()
        Part = workspace:FindFirstChild(LocalPlayer.Name)["Wither Storm"].Heads["Main Head"]
        workspace.CurrentCamera.CameraSubject = Part
    end)
    if not FlyMode then
        pcall(function()
            local Ray = workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties)
            if Ray then
                mainpos = CFrame.new(0,(Ray.Position.Y-mainpos.Y)+3,0)*mainpos
            end
        end)
    end
    if FlyMode then
        PotentialCFrame = CFrame.new(mainpos.p,mainpos.p+LookVector)
    else
        PotentialCFrame = CFrame.new(mainpos.p,Vector3.new(mainpos.X+LookVector.X,mainpos.Y,mainpos.Z+LookVector.Z))
    end
    OldCFrame = mainpos
    if KeyDown("W") then
        PotentialCFrame = PotentialCFrame *  CFrame.new(0,0,-1)
    end
    if KeyDown("A") then
        PotentialCFrame   = PotentialCFrame *  CFrame.new(-1,0,0)
    end
    if KeyDown("S") then
        PotentialCFrame = PotentialCFrame * CFrame.new(0,0,1)
    end
    if KeyDown("D") then
        PotentialCFrame = PotentialCFrame * CFrame.new(1,0,0)
    end
    if KeyDown("Space") and _Ray and pcall(function()
            workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties)
        end) then
        PotentialCFrame = PotentialCFrame * CFrame.new(0,1,0)
    end
    if (PotentialCFrame.X ~= OldCFrame.X or PotentialCFrame.Z ~= OldCFrame.Z) then
        Moving = true
        mainpos = mainpos:Lerp(CFrame.new(mainpos.p,PotentialCFrame.p)*CFrame.new(0,0,(tick()-LastFrame)*-(WalkSpeed)), 0.65)
    else
        Moving = false
    end
    LastFrame = tick()
end)
