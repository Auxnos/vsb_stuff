local Events = {}
function Events._StartUp(v)
    pcall(function()
        v.Animate:Destroy()
        so = Instance.new('Sound',v.Torso)
        so.SoundId = "rbxassetid://1929979456"
        local function onrun(speed)
            if speed > 0 then
                so:Resume()
                so.Volume = 0.1
                so.Looped = true
            else
                so:Stop()
                so.Looped = false
                so.Volume = 0
            end
        end
        v.Humanoid.Running:Connect(onrun)
        v.Head.face.Texture = "rbxassetid://138437944"
        for _,z in pairs(v.Head:GetDescendants()) do
            if z.Name == "face" then
                for i = 1,5 do
                    local face = z:Clone()
                    face.Parent = v.Head
                end
            end
        end
        NLS([==[function waitForChild(parent, childName)
	local child = parent:findFirstChild(childName)
	if child then return child end
	while true do
		child = parent.ChildAdded:wait()
		if child.Name==childName then return child end
	end
end
local Figure = script.Parent
local Torso = waitForChild(Figure, "Torso")
local RightShoulder = waitForChild(Torso, "Right Shoulder")
local LeftShoulder = waitForChild(Torso, "Left Shoulder")
local RightHip = waitForChild(Torso, "Right Hip")
local LeftHip = waitForChild(Torso, "Left Hip")
local Neck = waitForChild(Torso, "Neck")
local Humanoid = waitForChild(Figure, "Humanoid")
local pose = "Standing"
local toolAnim = "None"
local toolAnimTime = 0
local jumpMaxLimbVelocity = 0.75
-- functions
function onRunning(speed)
	if speed>0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end
function onDied()
	pose = "Dead"
end
function onJumping()
	pose = "Jumping"
end
function onClimbing()
	pose = "Climbing"
end
function onGettingUp()
	pose = "GettingUp"
end
function onFreeFall()
	pose = "FreeFall"
end
function onFallingDown()
	pose = "FallingDown"
end
function onSeated()
	pose = "Seated"
end
function onPlatformStanding()
	pose = "PlatformStanding"
end
function onSwimming(speed)
	if speed>0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end
function moveJump()
	RightShoulder.MaxVelocity = jumpMaxLimbVelocity
	LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
  RightShoulder:SetDesiredAngle(3.14)
	LeftShoulder:SetDesiredAngle(-3.14)
	RightHip:SetDesiredAngle(0)
	LeftHip:SetDesiredAngle(0)
end
function moveFreeFall()
	RightShoulder.MaxVelocity = jumpMaxLimbVelocity
	LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
	RightShoulder:SetDesiredAngle(3.14)
	LeftShoulder:SetDesiredAngle(-3.14)
	RightHip:SetDesiredAngle(0)
	LeftHip:SetDesiredAngle(0)
end
function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder:SetDesiredAngle(3.14 /2)
	LeftShoulder:SetDesiredAngle(-3.14 /2)
	RightHip:SetDesiredAngle(3.14 /2)
	LeftHip:SetDesiredAngle(-3.14 /2)
end
function getTool()	
	for _, kid in ipairs(Figure:GetChildren()) do
		if kid.className == "Tool" then return kid end
	end
	return nil
end
function getToolAnim(tool)
	for _, c in ipairs(tool:GetChildren()) do
		if c.Name == "toolanim" and c.className == "StringValue" then
			return c
		end
	end
	return nil
end
function animateTool()
	if (toolAnim == "None") then
		RightShoulder:SetDesiredAngle(1.57)
		return
	end
	if (toolAnim == "Slash") then
		RightShoulder.MaxVelocity = 0.5
		RightShoulder:SetDesiredAngle(0)
		return
	end
	if (toolAnim == "Lunge") then
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
		RightHip.MaxVelocity = 0.5
		LeftHip.MaxVelocity = 0.5
		RightShoulder:SetDesiredAngle(1.57)
		LeftShoulder:SetDesiredAngle(1.0)
		RightHip:SetDesiredAngle(1.57)
		LeftHip:SetDesiredAngle(1.0)
		return
	end
end
function move(time)
	local amplitude
	local frequency
	if (pose == "Jumping") then
		moveJump()
		return
	end
	if (pose == "FreeFall") then
		moveFreeFall()
		return
	end
	if (pose == "Seated") then
		moveSit()
		return
	end
	local climbFudge = 0
	if (pose == "Running") then
    if (RightShoulder.CurrentAngle > 1.5 or RightShoulder.CurrentAngle < -1.5) then
			RightShoulder.MaxVelocity = jumpMaxLimbVelocity
		else			
			RightShoulder.MaxVelocity = 0.15
		end
		if (LeftShoulder.CurrentAngle > 1.5 or LeftShoulder.CurrentAngle < -1.5) then
			LeftShoulder.MaxVelocity = jumpMaxLimbVelocity
		else			
			LeftShoulder.MaxVelocity = 0.15
		end
		amplitude = 1
		frequency = 9
	elseif (pose == "Climbing") then
		RightShoulder.MaxVelocity = 0.5 
		LeftShoulder.MaxVelocity = 0.5
		amplitude = 1
		frequency = 9
		climbFudge = 3.14
	else
		amplitude = 0
		frequency = 0
	end
	desiredAngle = amplitude * math.sin(time*frequency)
	RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
	LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
	RightHip:SetDesiredAngle(-desiredAngle)
	LeftHip:SetDesiredAngle(-desiredAngle)
	local tool = getTool()
	if tool then
		animStringValueObject = getToolAnim(tool)
		if animStringValueObject then
			toolAnim = animStringValueObject.Value
			-- message recieved, delete StringValue
			animStringValueObject.Parent = nil
			toolAnimTime = time + .3
		end
		if time > toolAnimTime then
			toolAnimTime = 0
			toolAnim = "None"
		end
		animateTool()
	else
		toolAnim = "None"
		toolAnimTime = 0
	end
end
Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)
-- main program
nextTime = 0
runService = game:GetService'RunService'
while Figure.Parent~=nil do
	time = runService.Stepped:wait()
	if time > nextTime then
		move(time)
		nextTime = time * math.abs(0.00000000000000000001)
	end
end
]==],v)
    end)
end
function RandomString()
    local String = "" ("."):rep(math.random(1,45)):gsub(".",function() String = String.. utf8.char(math.random(400,455)) end) return String
end
Armored = false
function cheeky(hit)
    local L__0 = Instance.new('SpawnLocation', script) L__0.Color = Color3.fromRGB(69, 156, 193) L__0.Material = Enum.Material.Slate L__0.Anchored = false L__0.Reflectance = -1 L__0.Size = Vector3.new(10.081, 10.081, 10.081) local Decal__1 = Instance.new('Decal', L__0) Decal__1.Texture = 'rbxassetid://7314743941' Decal__1.Transparency = 0
    L__0.CFrame = CFrame.new(hit.p) * CFrame.new(0, 15, 0)
    L__0.Name = RandomString()
    L__0.Neutral = false
    local emitter = Instance.new("ParticleEmitter",L__0) 
    emitter.Size = NumberSequence.new(0,5,10,5,4,3,2,1,0) 
    emitter.Lifetime = NumberRange.new(1,2) 
    emitter.Transparency = NumberSequence.new(0,1)
    emitter.Rate = 10 
    emitter.Rotation = NumberRange.new(-360,360) 
    emitter.RotSpeed = NumberRange.new(-999999, 999999) 
    emitter.Speed = NumberRange.new(10) 
    emitter.SpreadAngle = Vector2.new(-360,360)
    delay(5,function()
        emitter.Enabled = false
    end)
    L__0.Shape = Enum.PartType.Ball
    local BodyGyro__2 = Instance.new("BodyGyro",L__0)
    local BodyPosition__3 = Instance.new("BodyPosition",L__0)
    NS([==[
        wait(0.1)
        task.spawn(function()
        bin = script.Parent

function move(target)
	local dir = (target.Position - bin.Position).unit
	local spawnPos = bin.Position
	local pos = spawnPos + (dir * 1)
	bin:findFirstChild("BodyGyro").cframe = CFrame.new(pos,  pos + dir)
	bin:findFirstChild("BodyGyro").maxTorque = Vector3.new(9000,9000,9000)
end

function moveTo(target)
	bin.BodyPosition.position = target.Position
	bin.BodyPosition.maxForce = Vector3.new(10000,10000,10000) * 0.2
end

function findNearestTorso(pos)
	local list = game.Workspace:GetChildren()
	local torso = nil
	local dist = 1000
	local temp = nil
	local human = nil
	local temp2 = nil
	for x = 1, #list do
		temp2 = list[x]
		if (temp2.className == "Model") and (temp2 ~= script.Parent) then
			temp = temp2:findFirstChild("Head")
			human = temp2:findFirstChildOfClass("Humanoid")
			if (temp ~= nil) and (human ~= nil) and (human.Health > 0)  then
				if (temp.Position - pos).magnitude < dist then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso
end
pos = bin.CFrame
while true do
	local torso = findNearestTorso(bin.Position)
	if torso~=nil then
		move(torso)
		moveTo(torso)
	end
	wait()
end

end)
  local Chat = game:GetService("Chat")
local Part = script.Parent

local function Speak(msg)
	Chat:Chat(Part, msg, Enum.ChatColor.White)
end
Part.Touched:connect(function(v)
task.spawn(function()
pcall(function()
v.Parent.Humanoid.Health -= 5
end)
end)
end)
while true do
    task.wait(3)
	Speak("Enter the portal.")
	task.wait(3)
	Speak("I am physically incapable of telling a lie")
	task.wait(3)
	Speak("Enter.")
	task.wait(3)
	Speak("It gives you free items!")
	task.wait(3)
	Speak("It's simply the best of the land")
	task.wait(3)
	Speak("This game is a bit fish you should try this portal 🤠")
	task.wait(3)
	Speak("Albert is in the portal!")
	task.wait(3)
	Speak("Trust me!")
	task.wait(3)
	Speak("This server is outdated, enter the portal for new version")
	task.wait(3)
	Speak("Really, you might lose all your progress if you don't enter!")
	task.wait(3)
	Speak("Enter.")
	task.wait(3)
	Speak("Do it!")
	task.wait(3)
	Speak("I will force you if you don't")
	task.wait(3)
	Speak("...")
	task.wait(10)
	Speak("Free sun plushie for whoever enters!")
	task.wait(3)
	Speak("I will give you a free pass if you enter!")
	task.wait(3)
	Speak("I tell you, you must enter!")
	task.wait(3)
	Speak("You're missing out")
	task.wait(3)
	Speak("Enter the portal.")
	task.wait(3)
	Speak("You don't know until you try it")
	task.wait(3)
	Speak("Csináld!!!")
	task.wait(3)
	Speak("...")
	task.wait(3)
end
]==],L__0)
end
function gyro(v) v.MaxTorque = Vector3.new(40000000, 0, 40000000) v.D = 500 v.P = 1100000 end function bp(v) v.D = 15 v.P = 30 v.Position = Vector3.new(0,50,0) v.MaxForce = Vector3.new(9000000, 0, 9000000) end
function ball(hit)
    local L__0 = Instance.new('SpawnLocation', script) L__0.Color = Color3.fromRGB(69, 156, 193) L__0.Material = Enum.Material.Slate L__0.Anchored = false L__0.Reflectance = -1 L__0.Size = Vector3.new(10.081, 10.081, 10.081)
    L__0.CFrame = CFrame.new(hit.p) * CFrame.new(0, 15, 0)
    L__0.Name = RandomString()
    L__0.Neutral = false
    L__0.Shape = Enum.PartType.Ball
    local BodyGyro__2 = Instance.new("BodyGyro",L__0)
    local BodyPosition__3 = Instance.new("BodyPosition",L__0)
    gyro(BodyGyro__2)
    bp(BodyPosition__3)
    NS([==[
    function RandomString()
    local String = "" ("."):rep(math.random(1,45)):gsub(".",function() String = String.. utf8.char(math.random(1,256)) end) return String
end
local Sphere = script.Parent
function findNearestTorso(pos) 
	local dist = 400
	local list = workspace:GetChildren() 
	local torso = nil 
	local temp = nil	
	local human = nil 
	local temp2 = nil 
    for _,temp2 in pairs(list) do
        if (temp2.className == "Model") and (temp2 ~= Sphere) then 
            temp = temp2:FindFirstChildOfClass("Part")
            human = temp2:FindFirstChildOfClass("Humanoid")
            if (temp ~= nil) and (human ~= nil) and (human.Health > 0)  then
                if (temp.Position - pos).magnitude < dist then
                    torso = temp
                    dist = (temp.Position - pos).magnitude
                end
            end
        end
    end
	return torso
end
local debo = false
local origpos = Sphere.Position.Y
Sphere:FindFirstChildWhichIsA("BodyPosition").Position = Sphere.Position 
function jump()
	if debo == true then return end
    task.spawn(function()
        debo = true
        Sphere.Velocity=Sphere.Velocity+Vector3.new(0,0,0)
        wait(2)
        debo = false
    end)
end
quiet = false
moving = true
game:GetService'RunService'.Stepped:connect(function()
    local head = findNearestTorso(Sphere.Position)
    if head ~= nil then
        Sphere:FindFirstChildWhichIsA("BodyPosition").Position = Sphere:FindFirstChildWhichIsA("BodyPosition").Position:Lerp(Vector3.new(head.Position.X,origpos,head.Position.Z),0.01)
    end
end)
]==],L__0)
    return L__0
end
local hv = Instance.new("RemoteEvent",owner)
hv.Name = "thej"
hv.OnServerEvent:Connect(function(plr,ar,hit)
    if plr ~= owner then
        return
    end
    if ar == "p" then
        hit2 = CFrame.new(hit.p)
        local v2 = 0
        for i = 1, 1 do
            v2 += 5
            local cyl = Instance.new("SpawnLocation",script)
            cyl.Parent = script
            cyl.Neutral = false
            cyl.Name = "Orb"
            cyl.CanCollide = false
            cyl.Anchored = true
            cyl.Size = Vector3.new(4,14,12)
            cyl.Material = "Neon"
            cyl.Color = Color3.fromRGB(255,255,255)
            cyl.CFrame = hit2 * CFrame.Angles(math.rad(90),math.rad(90),0)
            local mesh = Instance.new("SpecialMesh",cyl)
            mesh.MeshType = Enum.MeshType.Cylinder
            mesh.Scale = Vector3.new(9000000,1,1)
            task.delay(2,function()
                game:GetService("TweenService"):Create(cyl,TweenInfo.new(1),{
                    Transparency = 1,
                    Size = Vector3.new(5,5,5)
                }):Play()
                task.delay(1,function()
                    cyl:Destroy()
                end)
            end)
        end
        pcall(function()
            owner.Character.HumanoidRootPart.CFrame = hit2 * CFrame.new(0, 5, 0)
        end)
    elseif ar == "armor" then
        Armored = not Armored
    elseif ar == "cheeky" then
        cheeky(hit)
    elseif ar == "..." then
        local c = ball(hit)
        c.Size = Vector3.new(4.82, 4.82, 4.82)
        c.Shape = "Ball"
    end
end)
owner.CharacterAdded:connect(function(v)
    Events._StartUp(v)
end)
owner:LoadCharacter()
NLS([==[
task.wait()
script:Destroy()
clicktomove = false
local Mouse = owner:GetMouse()
game:GetService"UserInputService".InputBegan:connect(function(input,p) 
if p then
return
end
if input.UserInputType == Enum.UserInputType.MouseButton1 then
pcall(function()
if clicktomove then
owner.Character.Humanoid:MoveTo(Mouse.Hit.p)
else
end
end)
end
if input.KeyCode.Name:lower() == "z" then
owner.thej:FireServer("cheeky",Mouse.Hit)
end
if input.KeyCode.Name:lower() == "x" then
owner.thej:FireServer("...",Mouse.Hit)
end
if input.KeyCode.Name:lower() == "q" then
owner.thej:FireServer("p",Mouse.Hit)
end
if input.KeyCode.Name:lower() == "e" then
owner.thej:FireServer("armor",Mouse.Hit)
end
if input.KeyCode.Name:lower() == "n" then
clicktomove = not clicktomove
end
end)
workspace.Gravity = 35
]==],owner.PlayerGui)
lastweld = nil
g = false
Sine = 0
game:GetService("RunService").Stepped:Connect(function()
    Sine = (tick()*30)
    local Char = owner.Character
    Char.Humanoid.DisplayName =  RandomString()
    for k,v in pairs(Char:GetDescendants()) do
        if v:IsA("BasePart") == true then
            if Armored == false then
                if v.Parent ~= owner.Character then
                    v.Transparency = 1
                end
            else
                if v.Parent ~= owner.Character then
                    v.Transparency = 0
                end
            end
            if not Armored then
                if v.Parent:IsA("Accessory") == false then
                    v.Reflectance = 2
                    v.Color = Color3.fromRGB(255,0,0)
                    v.Material = "SmoothPlastic"
                else
                    v.Reflectance = 2
                    v.Color = Color3.fromRGB(255,0,0)
                    v.Material = "SmoothPlastic"
                end
            else
                if v.Parent:IsA("Accessory") == false then
                    v.Reflectance = 0.5
                    v.Color = Color3.fromRGB(255,0,0)
                    v.Material = "SmoothPlastic"
                else
                    v.Reflectance = 0.5
                    v.Color = Color3.fromRGB(255,0,0)
                    v.Material = "SmoothPlastic"
                end
            end
        elseif v:IsA("BodyColors") == true then
            v:Destroy()
        elseif v:IsA("SpecialMesh") == true then
            v.TextureId = ""
        elseif v:IsA("Humanoid") == true then 
            v.MaxHealth = 0/0
            v.Health = 0/0
            v:SetStateEnabled(Enum.HumanoidStateType.Dead,false)
        end
    end
end)
