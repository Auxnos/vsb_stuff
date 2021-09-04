-- Converted using Mokiros's Model to Script Version 3
-- Converted string size: 12408 characters

local ScriptFunctions = {
function(script,require)
local npc = script.Parent
local torso = npc.HumanoidRootPart
local npchumanoid = npc:findFirstChildOfClass("Humanoid")
function findNearestTorso(pos)
	local list = game.Workspace:children()
	local torso = nil
	local dist = 999
	local temp = nil
	local human = nil
	local temp2 = nil
	for x = 1, #list do
		temp2 = list[x]
		if game.Players:GetPlayerFromCharacter(temp2) ~= nil and (temp2.className == "Model") and (temp2 ~= script.Parent) then
			temp = temp2:findFirstChild("HumanoidRootPart")
			human = temp2:findFirstChild("Humanoid")
			if (temp ~= nil) and (human ~= nil) and (human.Health > 0) then
				if (temp.Position - pos).magnitude < dist then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso
end
local walking = false
local attacking = false
function walkanim(walkspeed)
	if walkspeed > 2 then
		walking = true
	else
		walking = false
	end
end
npchumanoid.Running:connect(walkanim)
function chase()
	while wait(0.1) do
		if not walking then
			q = findNearestTorso(script.Parent.HumanoidRootPart.Position)
			if q ~= nil and q.Parent ~= nil and q.Parent:FindFirstChildWhichIsA("Humanoid") and q.Parent:FindFirstChildWhichIsA("Humanoid").Health > 0 then
				v = q.Parent
                if game:GetService("Players"):GetPlayerFromCharacter(v) and v:findFirstChildOfClass("Humanoid") and v:findFirstChild("Head") then
					if (v:findFirstChild("Head").Position - npc.Head.Position).magnitude < 999 then
						local thehumanoid = v:findFirstChildOfClass("Humanoid")
						local thehead = v:findFirstChild("Head")
						script.Parent.HumanoidRootPart.concrete:Play()
						while v ~= nil and npc ~= nil and thehumanoid ~= nil and (thehead.Position - npc.Head.Position).magnitude < 999 and thehumanoid.Health > 0 do
							npchumanoid:MoveTo(thehead.Position, thehead)
							local path = game:GetService("PathfindingService"):FindPathAsync(torso.Position, thehead.Position) --find the path from scp's torso to victims head
							local waypoints = path:GetWaypoints() --get the every point of the path
							if path.Status == Enum.PathStatus.Success then
								for q,w in pairs(waypoints) do --for every point existing..
									if q ~= 1 then
										local allow = 0
									 script.Parent:MoveTo(w.Position, thehead) --...walk to it
										while (torso.Position - w.Position).magnitude > 3.8 and allow < 20 do
											allow = allow + 1
											game:GetService("RunService").Heartbeat:wait()
										end
										if not game:GetService("Players"):GetPlayerFromCharacter(v) then
											break
										end
									end
								end
							else
                                        script.Parent:MoveTo(thehead.Position, thehead)
							wait()
						end
					end
				end
			end
		end
		wait()
	end
	end
end
spawn(chase)
end,
function(script,require)
function onTouched(hit)
        local human = hit.Parent:findFirstChild("Humanoid")
        if (human ~= nil) then
                human:TakeDamage(99) -- Change the amount to change the damage.
        end
end
script.Parent.Touched:connect(onTouched)
end,
function(script,require)
amount = 0
function checkhowmanycharactersseeme()
	while wait(0.1) do
		amount = 0
		for i,v in pairs(workspace:GetChildren()) do
			if v.ClassName == "Model" then
				local characterhumanoid = v:findFirstChildOfClass("Humanoid")
				local characterscpdet = v:findFirstChild("SCPDetection173")
				local characterhead = v:findFirstChild("Head")
				if characterhumanoid and characterscpdet then
					if characterhumanoid.Health > 0 then
						if (characterscpdet.Position - script.Parent.HumanoidRootPart.Position).magnitude < 60 then
							if characterhead.Orientation.y > characterscpdet.Orientation.y - 50 and characterhead.Orientation.y < characterscpdet.Orientation.y + 50 then
								amount = amount + 1
							else
								amount = 0
							end
						end
					end
				end
			end
		end
	end
end
function adddetectors()
	while wait(0.1) do
		for i,v in pairs(workspace:GetChildren()) do
			if v.ClassName == "Model" and v ~= script.Parent and game:GetService("Players"):GetPlayerFromCharacter(v) then
				local characterhumanoid = v:findFirstChildOfClass("Humanoid")
				local characterhead = v:findFirstChild("Head")
				if characterhumanoid and characterhead then
						if not v:findFirstChild("SCPDetection173") then
							local lookpart = Instance.new("Part", v)
							lookpart.CanCollide = false
							lookpart.Size = Vector3.new(1,1,1)
							lookpart.Anchored = true
							lookpart.Shape = "Cylinder"
							lookpart.Transparency = 1
							lookpart.Name = "SCPDetection173"
							local function lookatme()
								local hed = characterhead
								while wait(0.1) do
									lookpart.CFrame = CFrame.new(hed.Position, script.Parent.HumanoidRootPart.Position)
								end
							end
						spawn(lookatme)
					end
				end
			end
		end
	end
end
function freeze()
	while wait(0.1) do
		if amount > 0 then		
			for i,v in pairs(script.Parent:GetChildren()) do
				if v:IsA("MeshPart") then
					v.Anchored = true
					script.Parent.Humanoid.PlatformStand = false
					script.Parent.Humanoid.Sit = false
					script.Parent.HumanoidRootPart.concrete:Stop()
					end
			end
		elseif amount == 0 or amount < 0 then
			for i,v in pairs(script.Parent:GetChildren()) do
				if v:IsA("MeshPart") then
					v.Anchored = false
					script.Parent.Humanoid.PlatformStand = false
					script.Parent.Humanoid.Sit = false
				end
			end	
	end
	end
	end
spawn(adddetectors)
spawn(checkhowmanycharactersseeme)
spawn(freeze)
end,
function(script,require)
function onTouched(hit)
        local human = hit.Parent:findFirstChild("Humanoid")
        if (human ~= nil) then
                human:TakeDamage(99) -- Change the amount to change the damage.
        end
end
script.Parent.Touched:connect(onTouched)
end,
function(script,require)
function onTouched(hit)
        local human = hit.Parent:findFirstChild("Humanoid")
        if (human ~= nil) then
                human:TakeDamage(99) -- Change the amount to change the damage.
        end
end
script.Parent.Touched:connect(onTouched)
end,
function(script,require)
local Figure = script.Parent
local Humanoid = Figure:WaitForChild("Humanoid")
local pose = "Standing"

local currentAnim = ""
local currentAnimInstance = nil
local currentAnimTrack = nil
local currentAnimKeyframeHandler = nil
local currentAnimSpeed = 1.0
local animTable = {}
local animNames = { 
	idle = 	{	
				{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 }
			},
	walk = 	{ 	
				{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
			}, 
	run = 	{
				{ id = script.walk.WalkAnim.AnimationId, weight = 10 } 
			}, 
	wave = {
				{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
			},
	point = {
				{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
			},
	dance1 = {
				{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
			},
	dance2 = {
				{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
			},
	dance3 = {
				{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
			},
	laugh = {
				{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
			},
	cheer = {
				{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
			},
}
local dances = {"dance1", "dance2", "dance3"}

-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

function configureAnimationSet(name, fileList)
	if (animTable[name] ~= nil) then
		for _, connection in pairs(animTable[name].connections) do
			connection:disconnect()
		end
	end
	animTable[name] = {}
	animTable[name].count = 0
	animTable[name].totalWeight = 0	
	animTable[name].connections = {}

	-- check for config values
	local config = script:FindFirstChild(name)
	if (config ~= nil) then
--		print("Loading anims " .. name)
		table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
		table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
		local idx = 1
		for _, childPart in pairs(config:GetChildren()) do
			if (childPart:IsA("Animation")) then
				table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
				animTable[name][idx] = {}
				animTable[name][idx].anim = childPart
				local weightObject = childPart:FindFirstChild("Weight")
				if (weightObject == nil) then
					animTable[name][idx].weight = 1
				else
					animTable[name][idx].weight = weightObject.Value
				end
				animTable[name].count = animTable[name].count + 1
				animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
	--			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
				idx = idx + 1
			end
		end
	end

	-- fallback to defaults
	if (animTable[name].count <= 0) then
		for idx, anim in pairs(fileList) do
			animTable[name][idx] = {}
			animTable[name][idx].anim = Instance.new("Animation")
			animTable[name][idx].anim.Name = name
			animTable[name][idx].anim.AnimationId = anim.id
			animTable[name][idx].weight = anim.weight
			animTable[name].count = animTable[name].count + 1
			animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
		end
	end
end

-- Setup animation objects
function scriptChildModified(child)
	local fileList = animNames[child.Name]
	if (fileList ~= nil) then
		configureAnimationSet(child.Name, fileList)
	end	
end

script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)


for name, fileList in pairs(animNames) do 
	configureAnimationSet(name, fileList)
end	

-- ANIMATION

-- declarations
local jumpAnimTime = 0
local jumpAnimDuration = 0.3

local toolTransitionTime = 0.1
local fallTransitionTime = 0.3
local jumpMaxLimbVelocity = 0.75

-- functions

function stopAllAnimations()
	local oldAnim = currentAnim

	-- return to idle if finishing an emote
	if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
		oldAnim = "idle"
	end

	currentAnim = ""
	currentAnimInstance = nil
	if (currentAnimKeyframeHandler ~= nil) then
		currentAnimKeyframeHandler:disconnect()
	end

	if (currentAnimTrack ~= nil) then
		currentAnimTrack:Stop()
		currentAnimTrack:Destroy()
		currentAnimTrack = nil
	end
	return oldAnim
end

function setAnimationSpeed(speed)
	if speed ~= currentAnimSpeed then
		currentAnimSpeed = speed
		currentAnimTrack:AdjustSpeed(currentAnimSpeed)
	end
end

function keyFrameReachedFunc(frameName)
	if (frameName == "End") then

		local repeatAnim = currentAnim
		-- return to idle if finishing an emote
		if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
			repeatAnim = "idle"
		end
		
		local animSpeed = currentAnimSpeed
		playAnimation(repeatAnim, 0.0, Humanoid)
		setAnimationSpeed(animSpeed)
	end
end

-- Preload animations
function playAnimation(animName, transitionTime, humanoid) 
		
	local roll = math.random(1, animTable[animName].totalWeight) 
	local origRoll = roll
	local idx = 1
	while (roll > animTable[animName][idx].weight) do
		roll = roll - animTable[animName][idx].weight
		idx = idx + 1
	end
--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
	local anim = animTable[animName][idx].anim

	-- switch animation		
	if (anim ~= currentAnimInstance) then
		
		if (currentAnimTrack ~= nil) then
			currentAnimTrack:Stop(transitionTime)
			currentAnimTrack:Destroy()
		end

		currentAnimSpeed = 1.0
	
		-- load it to the humanoid; get AnimationTrack
		currentAnimTrack = humanoid:LoadAnimation(anim)
		 
		-- play the animation
		currentAnimTrack:Play(transitionTime)
		currentAnim = animName
		currentAnimInstance = anim

		-- set up keyframe name triggers
		if (currentAnimKeyframeHandler ~= nil) then
			currentAnimKeyframeHandler:disconnect()
		end
		currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)
		
	end

end


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


function onRunning(speed)
	if speed > 0.01 then
		playAnimation("walk", 0.1, Humanoid)
		if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
			setAnimationSpeed(speed / 14.5)
		end
		pose = "Running"
	else
		if emoteNames[currentAnim] == nil then
			playAnimation("idle", 0.1, Humanoid)
			pose = "Standing"
		end
	end
end

function onDied()
	pose = "Dead"
end

function onGettingUp()
	pose = "GettingUp"
end

function onFallingDown()
	pose = "FallingDown"
end

function onPlatformStanding()
	pose = "PlatformStanding"
end

function onSwimming(speed)
	if speed > 0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end

local lastTick = 0

function move(time)
	local amplitude = 1
	local frequency = 1
  	local deltaTime = time - lastTick
  	lastTick = time

	local climbFudge = 0
	local setAngles = false

  	if (jumpAnimTime > 0) then
  		jumpAnimTime = jumpAnimTime - deltaTime
  	end

	if (pose == "FreeFall" and jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	elseif (pose == "Seated") then
		playAnimation("sit", 0.5, Humanoid)
		return
	elseif (pose == "Running") then
		playAnimation("walk", 0.1, Humanoid)
	elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
--		print("Wha " .. pose)
		stopAllAnimations()
		amplitude = 0.1
		frequency = 1
		setAngles = true
	end
end

-- connect events
Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)

-- main program

-- initialize to idle
playAnimation("idle", 0.1, Humanoid)
pose = "Standing"

while Figure.Parent ~= nil do
	local _, time = wait(0.1)
	move(time)
end



end
}
local ScriptIndex = 0
local Scripts,ModuleScripts,ModuleCache = {},{},{}
local _require = require
function require(obj,...)
	local index = ModuleScripts[obj]
	if not index then
		local a,b = pcall(_require,obj,...)
		return not a and error(b,2) or b
	end
	
	local res = ModuleCache[index]
	if res then return res end
	res = ScriptFunctions[index](obj,require)
	if res==nil then error("Module code did not return exactly one value",2) end
	ModuleCache[index] = res
	return res
end
local function Script(obj,ismodule)
	ScriptIndex = ScriptIndex + 1
	local t = ismodule and ModuleScripts or Scripts
	t[obj] = ScriptIndex
end

function RunScripts()
	for script,index in pairs(Scripts) do
		coroutine.wrap(ScriptFunctions[index])(script,require)
	end
end


local function Decode(str)
	local StringLength = #str
	
	-- Base64 decoding
	do
		local decoder = {}
		for b64code, char in pairs(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/='):split('')) do
			decoder[char:byte()] = b64code-1
		end
		local n = StringLength
		local t,k = table.create(math.floor(n/4)+1),1
		local padding = str:sub(-2) == '==' and 2 or str:sub(-1) == '=' and 1 or 0
		for i = 1, padding > 0 and n-4 or n, 4 do
			local a, b, c, d = str:byte(i,i+3)
			local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]
			t[k] = string.char(bit32.extract(v,16,8),bit32.extract(v,8,8),bit32.extract(v,0,8))
			k = k + 1
		end
		if padding == 1 then
			local a, b, c = str:byte(n-3,n-1)
			local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40
			t[k] = string.char(bit32.extract(v,16,8),bit32.extract(v,8,8))
		elseif padding == 2 then
			local a, b = str:byte(n-3,n-2)
			local v = decoder[a]*0x40000 + decoder[b]*0x1000
			t[k] = string.char(bit32.extract(v,16,8))
		end
		str = table.concat(t)
	end
	
	local Position = 1
	local function Parse(fmt)
		local Values = {string.unpack(fmt,str,Position)}
		Position = table.remove(Values)
		return table.unpack(Values)
	end
	
	local Settings = Parse('B')
	local Flags = Parse('B')
	Flags = {
		--[[ValueIndexByteLength]] bit32.extract(Flags,6,2)+1,
		--[[InstanceIndexByteLength]] bit32.extract(Flags,4,2)+1,
		--[[ConnectionsIndexByteLength]] bit32.extract(Flags,2,2)+1,
		--[[MaxPropertiesLengthByteLength]] bit32.extract(Flags,0,2)+1,
		--[[Use Double instead of Float]] bit32.band(Settings,0b1) > 0
	}
	
	local ValueFMT = ('I'..Flags[1])
	local InstanceFMT = ('I'..Flags[2])
	local ConnectionFMT = ('I'..Flags[3])
	local PropertyLengthFMT = ('I'..Flags[4])
	
	local ValuesLength = Parse(ValueFMT)
	local Values = table.create(ValuesLength)
	local CFrameIndexes = {}
	
	local ValueDecoders = {
		--!!Start
		[1] = function(Modifier)
			return Parse('s'..Modifier)
		end,
		--!!Split
		[2] = function(Modifier)
			return Modifier ~= 0
		end,
		--!!Split
		[3] = function()
			return Parse('d')
		end,
		--!!Split
		[4] = function(_,Index)
			table.insert(CFrameIndexes,{Index,Parse(('I'..Flags[1]):rep(3))})
		end,
		--!!Split
		[5] = {CFrame.new,Flags[5] and 'dddddddddddd' or 'ffffffffffff'},
		--!!Split
		[6] = {Color3.fromRGB,'BBB'},
		--!!Split
		[7] = {BrickColor.new,'I2'},
		--!!Split
		[8] = function(Modifier)
			local len = Parse('I'..Modifier)
			local kpts = table.create(len)
			for i = 1,len do
				kpts[i] = ColorSequenceKeypoint.new(Parse('f'),Color3.fromRGB(Parse('BBB')))
			end
			return ColorSequence.new(kpts)
		end,
		--!!Split
		[9] = function(Modifier)
			local len = Parse('I'..Modifier)
			local kpts = table.create(len)
			for i = 1,len do
				kpts[i] = NumberSequenceKeypoint.new(Parse(Flags[5] and 'ddd' or 'fff'))
			end
			return NumberSequence.new(kpts)
		end,
		--!!Split
		[10] = {Vector3.new,Flags[5] and 'ddd' or 'fff'},
		--!!Split
		[11] = {Vector2.new,Flags[5] and 'dd' or 'ff'},
		--!!Split
		[12] = {UDim2.new,Flags[5] and 'di2di2' or 'fi2fi2'},
		--!!Split
		[13] = {Rect.new,Flags[5] and 'dddd' or 'ffff'},
		--!!Split
		[14] = function()
			local flags = Parse('B')
			local ids = {"Top","Bottom","Left","Right","Front","Back"}
			local t = {}
			for i = 0,5 do
				if bit32.extract(flags,i,1)==1 then
					table.insert(t,Enum.NormalId[ids[i+1]])
				end
			end
			return Axes.new(unpack(t))
		end,
		--!!Split
		[15] = function()
			local flags = Parse('B')
			local ids = {"Top","Bottom","Left","Right","Front","Back"}
			local t = {}
			for i = 0,5 do
				if bit32.extract(flags,i,1)==1 then
					table.insert(t,Enum.NormalId[ids[i+1]])
				end
			end
			return Faces.new(unpack(t))
		end,
		--!!Split
		[16] = {PhysicalProperties.new,Flags[5] and 'ddddd' or 'fffff'},
		--!!Split
		[17] = {NumberRange.new,Flags[5] and 'dd' or 'ff'},
		--!!Split
		[18] = {UDim.new,Flags[5] and 'di2' or 'fi2'},
		--!!Split
		[19] = function()
			return Ray.new(Vector3.new(Parse(Flags[5] and 'ddd' or 'fff')),Vector3.new(Parse(Flags[5] and 'ddd' or 'fff')))
		end
		--!!End
	}
	
	for i = 1,ValuesLength do
		local TypeAndModifier = Parse('B')
		local Type = bit32.band(TypeAndModifier,0b11111)
		local Modifier = (TypeAndModifier - Type) / 0b100000
		local Decoder = ValueDecoders[Type]
		if type(Decoder)=='function' then
			Values[i] = Decoder(Modifier,i)
		else
			Values[i] = Decoder[1](Parse(Decoder[2]))
		end
	end
	
	for i,t in pairs(CFrameIndexes) do
		Values[t[1]] = CFrame.fromMatrix(Values[t[2]],Values[t[3]],Values[t[4]])
	end
	
	local InstancesLength = Parse(InstanceFMT)
	local Instances = {}
	local NoParent = {}
	
	for i = 1,InstancesLength do
		local ClassName = Values[Parse(ValueFMT)]
		local obj
		local MeshPartMesh,MeshPartScale
		if ClassName == "UnionOperation" then
			obj = DecodeUnion(Values,Flags,Parse)
			obj.UsePartColor = true
		elseif ClassName:find("Script") then
			obj = Instance.new("Folder")
			Script(obj,ClassName=='ModuleScript')
		elseif ClassName == "MeshPart" then
			obj = Instance.new("Part")
			MeshPartMesh = Instance.new("SpecialMesh")
			MeshPartMesh.MeshType = Enum.MeshType.FileMesh
			MeshPartMesh.Parent = obj
		else
			obj = Instance.new(ClassName)
		end
		local Parent = Instances[Parse(InstanceFMT)]
		local PropertiesLength = Parse(PropertyLengthFMT)
		local AttributesLength = Parse(PropertyLengthFMT)
		Instances[i] = obj
		for i = 1,PropertiesLength do
			local Prop,Value = Values[Parse(ValueFMT)],Values[Parse(ValueFMT)]
			
			-- ok this looks awful
			if MeshPartMesh then
				if Prop == "MeshId" then
					MeshPartMesh.MeshId = Value
					continue
				elseif Prop == "TextureID" then
					MeshPartMesh.TextureId = Value
					continue
				elseif Prop == "Size" then
					if not MeshPartScale then
						MeshPartScale = Value
					else
						MeshPartMesh.Scale = Value / MeshPartScale
					end
				elseif Prop == "MeshSize" then
					if not MeshPartScale then
						MeshPartScale = Value
						MeshPartMesh.Scale = obj.Size / Value
					else
						MeshPartMesh.Scale = MeshPartScale / Value
					end
					continue
				end
			end
			
			obj[Prop] = Value
		end
		if MeshPartMesh then
			if MeshPartMesh.MeshId=='' then
				if MeshPartMesh.TextureId=='' then
					MeshPartMesh.TextureId = 'rbxasset://textures/meshPartFallback.png'
				end
				MeshPartMesh.Scale = obj.Size
			end
		end
		for i = 1,AttributesLength do
			obj:SetAttribute(Values[Parse(ValueFMT)],Values[Parse(ValueFMT)])
		end
		if not Parent then
			table.insert(NoParent,obj)
		else
			obj.Parent = Parent
		end
	end
	
	local ConnectionsLength = Parse(ConnectionFMT)
	for i = 1,ConnectionsLength do
		local a,b,c = Parse(InstanceFMT),Parse(ValueFMT),Parse(InstanceFMT)
		Instances[a][Values[b]] = Instances[c]
	end
	
	return NoParent
end


local Objects = Decode('AEDjASEFTW9kZWwhBE5hbWUhB1NDUC0xNzMhC1ByaW1hcnlQYXJ0IQpXb3JsZFBpdm90BG0BbgFvASEITWVzaFBhcnQhCUxlZnRUaHVtYiEXQXNzZW1ibHlBbmd1bGFyVmVsb2NpdHkKztRuO52uHUACEAC7IRZBc3NlbWJseUxpbmVhclZlbG9jaXR5Cjp/P8IKNVC/'
..'bQSkQCEGQ0ZyYW1lBBYAcAFxASEKQ2FuQ29sbGlkZQIhGEN1c3RvbVBoeXNpY2FsUHJvcGVydGllcxAzMzM/mpmZPgAAAAAAAMA/AACAPyELT3JpZW50YXRpb24KAAAAAAAAtEIAAAAAIQhQb3NpdGlvbgqDP+bCihNrQKAcl8IhCFJvdGF0aW9uIQRTaXplCpHI0z7a'
..'46w+H2GSPiEGTWVzaElkIRdyYnhhc3NldGlkOi8vNDg5MDQ0NjM2NyEITWVzaFNpemUKAHEnQPiwCEBqduc/IQlUZXh0dXJlSUQhF3JieGFzc2V0aWQ6Ly80ODMwMzcxMjIxIQdNb3RvcjZEIQVKb2ludCECQzAEcgFzAXQBIQJDMQR1AXMBdAEhBVBhcnQwIQVQYXJ0'
..'MSEISHVtYW5vaWQhEkJyZWFrSm9pbnRzT25EZWF0aCETRGlzcGxheURpc3RhbmNlVHlwZQMAAAAAAAAAQCEGSGVhbHRoAwAAAAAAF+FAIRFIZWFsdGhEaXNwbGF5VHlwZSEJSGlwSGVpZ2h0AwAAAMDMzAxAIQlNYXhIZWFsdGghDFJlcXVpcmVzTmVjayEJV2Fsa1Nw'
..'ZWVkAwAAAAAAAE5AIQhBbmltYXRvciEVUmlnaHRVcHBlckZpbmdlclJlYmFyIQpCcmlja0NvbG9yBxsABD8AdgF3ASEFQ29sb3IGbW5sEDMz+0DNzMw+AAAAAAAAwD8AAIA/IQhNYXRlcmlhbAMAAAAAAACRQApiE+XCdz2FQH78pMIK1y0YP+89xD7umT8+IRdyYnhh'
..'c3NldGlkOi8vNDg5MDQ0ODYyMgogonBAZCcbQCB8lz8EeAFzAXkBBHoBcwF5ASEKUmlnaHRUaHVtYgRHAHYBdwEKtlXlwuiwikC1rqTCCgi2xD6DGYo+wgtlPiEXcmJ4YXNzZXRpZDovLzQ4OTA0NDc5MzYKWIYbQMhe2j/uFrU/IRdyYnhhc3NldGlkOi8vNDgzMDM4'
..'MTgzNwR7AXMBfAEEfQFzAXwBIRBSaWdodExvd2VyRmluZ2VyBFAAdgF3AQo2A+XCe111QKTdpMIKs1MDP+CY4D4QWJM+IRdyYnhhc3NldGlkOi8vNDg5MDQ0NzcwOAowqU9Af5IxQOT86D8hF3JieGFzc2V0aWQ6Ly80ODMwMzc5ODcwBH4BcwF/AQSAAXMBfwEhD0xl'
..'ZnRVcHBlckZpbmdlcgRZAHABcQEKYijmwtWbUkAYk5bCCjUkDT9bBxw/Y7v8PiEXcmJ4YXNzZXRpZDovLzQ4OTA0NDY3MTEKGC5fQHm4dkD80EdAIRdyYnhhc3NldGlkOi8vNDgzMDM3MjY2MASBAXMBggEEgwFzAYIBIQZTY3JpcHQhClNDUC0xNzMgQUkhCExlZnRI'
..'YW5kBGQAcAFxAQpy2OXC0kRtQPO/l8IKNnNOP1tPUz+Qp+E+IRdyYnhhc3NldGlkOi8vNDg5MDQ0NTY2OQqEOaNALBGnQIJoMkAhF3JieGFzc2V0aWQ6Ly80ODMwMzY3OTcwBIQBcwGFAQSGAXMBhQEhDURhbWFnZSBTY3JpcHQhEUxlZnRMb3dlckFybVJlYmFyBG4A'
..'cAFxAQqu1+XC5OZ6QExSmMIKD9bkPkumyT6YNUY+IRdyYnhhc3NldGlkOi8vNDg5MDQ0NTg5MAp47DRA520fQJm1nD8EhwFzAYgBBIkBcwGIASERTGVmdFVwcGVyQXJtUmViYXIEdgCKAYsBCqaP5cLigphAaIKawgpIvgA/1nXdPso2Rz4hF3JieGFzc2V0aWQ6Ly80'
..'ODkwNDQ2NjAzClCTS0CYFy9A8oCdPwSMAY0BjgEEjwGNAY4BIRFMZWZ0TG93ZXJMZWdSZWJhcgR+AJABkQEKulHlwuZl3T+wSJ3CCi5EED6BKww/HnwqPiEXcmJ4YXNzZXRpZDovLzQ4OTA0NDYyNzcKDB9kP9SkXUAnyoY/BJIBkwGUAQSVAZMBlgEhCExlZnRGb290'
..'BIYAlwGYAQpmZuXCR/ZaP6AtncIKo6lIP3wy3D/R41k/IRdyYnhhc3NldGlkOi8vNDg5MDQ0NTU3NQolpp5A8hcuQfJErEAhF3JieGFzc2V0aWQ6Ly80ODMwMzY3MzkxBJkBkwGaAQSbAZwBnQEhDExlZnRVcHBlckxlZwSPAG4BngEKniLlwqYKMUB4P53CCm2tTj/R'
..'D/o/bYpbPyEXcmJ4YXNzZXRpZDovLzQ4OTA0NDY4MDgKi2ejQIq0RUESk61AIRdyYnhhc3NldGlkOi8vNDgzMDM3MzQyNASfAaABoQEEogGgAaEBIQlOZWNrUmViYXIEmACQAaMBCkaA5cILCbxAYFKewgpgsjE+1JVuPuwPLT4hF3JieGFzc2V0aWQ6Ly80ODkwNDQ3'
..'MjE4Ctp9jD+wobw/z9OIPwSkAZMBpQEEpgGTAaUBIQ1SaWdodExvd2VyQXJtBKAApwGoAQrmSeXCQo+ZQMCaosIKs3d8P/+hcD/gbxY/IRdyYnhhc3NldGlkOi8vNDg5MDQ0NzUyOAp4m8dAHEC+QPLgbUAhF3JieGFzc2V0aWQ6Ly80ODMwMzc4MDMwBKkBjQGqAQSr'
..'AY0BqgEhElJpZ2h0VXBwZXJBcm1SZWJhcgSpAJABrAEKVl/lwgR+pEBYlqHCCsF4rj7d+JM+hCgCPiEXcmJ4YXNzZXRpZDovLzQ4OTA0NDgxMzcKGPEJQCj76T8a0E0/BK0BrgGvAQSwAa4BrwEhDVJpZ2h0VXBwZXJBcm0EsQCxAbIBCuJl5cLKRbJAEGygwgrF9ZQ/'
..'UTyKPxZHFD8hF3JieGFzc2V0aWQ6Ly80ODkwNDQ4MDI2Cg6L60DRldpA2XZqQCEXcmJ4YXNzZXRpZDovLzQ4MzAzODIzMzgEswGuAbQBBLUBrgG0ASENU2hvdWxkZXJSZWJhcgS6AJABowEK1lHlwt7pt0AYFp7CCiiZIUDHu3M/V6YDPyEXcmJ4YXNzZXRpZDovLzQ4'
..'OTA0NDk0MTAKBod/QbGzwEDcK1BABLYBkwGlASEGRnJlZXplIQ9Mb3dlclRvcnNvUmViYXIEwgBuAW8BClZD5cKwx2lAyECewgpxdQRA+/j+PhpqKD8hF3JieGFzc2V0aWQ6Ly80ODkwNDQ3MDc3ClZzUUF8lklAHCeFQAS3AXMBuAEhDExlZnRVcHBlckFybQTJALEB'
..'sgEKKU7lwhVtrUBI5ZvCCkyJlD96gZE/OTgZPyEXcmJ4YXNzZXRpZDovLzQ4OTA0NDY1MTYKit/qQMYU5kBYR3JAIRdyYnhhc3NldGlkOi8vNDgzMDM3MTc2NwS5Aa4BugEEuwGuAboBIQlSaWdodEhhbmQE0gB2AXcBClYP5cL4M4lAMxWkwgrYhy0/WkMzP6xlxz4h'
..'F3JieGFzc2V0aWQ6Ly80ODkwNDQ3NDI4CqAyiUDguo1AA6YdQCEXcmJ4YXNzZXRpZDovLzQ4MzAzNzc0OTkEvAFzAb0BBL4BcwG9ASESUmlnaHRMb3dlckFybVJlYmFyBNsAdgF3AQpeHeXCwayQQMBio8IKLj2qPlg1mj6vFB0+IRdyYnhhc3NldGlkOi8vNDg5MDQ0'
..'NzYyMwpkmAZAmNfzP1pieD8EvwHAAcEBBMIBwAHBASEEUGFydCEQSHVtYW5vaWRSb290UGFydCENQm90dG9tU3VyZmFjZQMAAAAAAAAAAATnAG4BbwEhCkNhc3RTaGFkb3cK0qvlwtwrkUBwVp7CCoMUzj8qhes/z8ysPyEKVG9wU3VyZmFjZSEMVHJhbnNwYXJlbmN5'
..'AwAAAAAAAPA/IQlSb290Sm9pbnQhBVNvdW5kIQhjb25jcmV0ZSEGTG9vcGVkIiEHUGxheWluZyESUm9sbE9mZk1heERpc3RhbmNlAwAAAAAAAElAIQdTb3VuZElkIRZyYnhhc3NldGlkOi8vMTcxNzA1MTQwIQZWb2x1bWUDAAAAAAAAJEAhFExlZnRMb3dlckZpbmdl'
..'clJlYmFyBPoAcAFxAQom0+XCbBhMQGNDl8IK1tf+PooUJz8SF34+IRdyYnhhc3NldGlkOi8vNDg5MDQ0NjA3OApIfElAEBmEQODjyD8EwwFzAcQBBIYBcwHEASEJUmlnaHRGb290BAIBxQHGAQq2X+XCDINzP9A1n8IK57tDP/368z8KJDc/IRdyYnhhc3NldGlkOi8v'
..'NDg5MDQ0NzMxNQqWwJpAq+VAQbjLkEAhF3JieGFzc2V0aWQ6Ly80ODMwMzc3MDA4BMcBcwHIAQS4AXMByAEhB0FuaW1hdGUhC1N0cmluZ1ZhbHVlIQRpZGxlIQlBbmltYXRpb24hCElkbGVBbmltIQtBbmltYXRpb25JZCEXcmJ4YXNzZXRpZDovLzcyMDg5Mjk4Mzgh'
..'BHdhbGshCFdhbGtBbmltIRdyYnhhc3NldGlkOi8vNzIwODkyODE4NSEESGVhZAQVAcUByQEKgmHlwgOm1EC4RJ7CCoj8ij9NWsk/tFiLPyEXcmJ4YXNzZXRpZDovLzQ4OTA0NDU0NDYKwcXbQNIxH0F/V9xAIRdyYnhhc3NldGlkOi8vNDgzMDM2Njg4OQTKAcsBzAEE'
..'zQHLAcwBIQ1SaWdodFVwcGVyTGVnBB4BxQHGAQp6YOXCiIc+QGhBn8IKTQNQP9EnCkDVcXE/IRdyYnhhc3NldGlkOi8vNDg5MDQ0ODgzMwrWdaRAZnVaQW7kvkAhF3JieGFzc2V0aWQ6Ly80ODMwMzg0MjE5BM4BwAHPAQSiAcABzwEhEUxlZnRVcHBlckxlZ1JlYmFy'
..'BCcBbgGeAQoavOXC8FojQEBBncIK68CdPjwolT9h9Q8/IRdyYnhhc3NldGlkOi8vNDg5MDQ0NjkzNgqycvk/3drrQHCiY0AE0AFzAbgBIQxMZWZ0TG93ZXJBcm0ELgFwAXEBCna15cIAOYpAD1aZwgrGVYU/S3RcP3KvGT8hF3JieGFzc2V0aWQ6Ly80ODkwNDQ1NzU4'
..'ChDW0kD5S65A3ANzQCEXcmJ4YXNzZXRpZDovLzQ4MzAzNjg0NDQE0QHAAdIBBNMBwAHSASEQUmlnaHRVcHBlckZpbmdlcgQ3AXYBdwEKEiDlwhYQgkBWRKXCCkvjBT80l/A+BV+jPiEXcmJ4YXNzZXRpZDovLzQ4OTA0NDgyMzcK2LVTQJQ3PkBZKgFAIRdyYnhhc3Nl'
..'dGlkOi8vNDgzMDM4MzQyOATUAXMB1QEE1gFzAdUBIRJSaWdodFVwcGVyTGVnUmViYXIEQAHFAdcBCkMK5sI+wDBA8E6fwgrxgeE+WbaRP1zFDT8hF3JieGFzc2V0aWQ6Ly80ODkwNDQ5MDg3CsRKMkBgaOZA6ixgQATYAdkB2gEE2wHZAdoBIQ9VcHBlclRvcnNvUmVi'
..'YXIESAFuAW8BCtaE5cIyjJFAQEKewgoY6c8/I9+EP8zEeD8hF3JieGFzc2V0aWQ6Ly80ODkwNDUwMTMyCh5hJEF3GtJA067EQATcAXMBuAEhD0xlZnRMb3dlckZpbmdlcgRPAXABcQEKF93lwru/RUDjH5fCCiCqAz8AaBE/YCi4PiEXcmJ4YXNzZXRpZDovLzQ4OTA0'
..'NDU5NjkK2DFQQHzsZUCMmRFAIRdyYnhhc3NldGlkOi8vNDgzMDM2OTE3NATdAXMBggEE3gFzAYIBIRVSaWdodExvd2VyRmluZ2VyUmViYXIEWAF2AXcBCtr45MJMvnlApKqkwgqEEgc/mNH1PinpTD4hF3JieGFzc2V0aWQ6Ly80ODkwNDQ3ODUzClCVVUC+WUJA+AGi'
..'PwTfAXMB4AEE4QFzAeABIQZGaW5nZXIEYAFwAXEBCsIP5sL/eFxAMcqWwgobYQ4/XD8NPy2Sqj4hF3JieGFzc2V0aWQ6Ly80ODkwNDQ1MzA3CjAjYUAGWV9AmNsGQATiAXMBggEE4wFzAYIBIQpVcHBlclRvcnNvCm+Txz8qUCdAwCvVPyEXcmJ4YXNzZXRpZDovLzQ4'
..'OTA0NDk3NzgKMcodQTRIhEHSiShBIRdyYnhhc3NldGlkOi8vNDgzMDM4NTY0MyEKRm9yY2VGaWVsZCEHVmlzaWJsZQp4BMLC2FTsQVh5zsEKAACArQAAgK0AAIC/CgBGRa0VAIA/AACALQpoAICtaACArWgAgL8KZirWrxUAgD8AAIAtCgAyYL4AUgy9gCFOvgoAAIA/'
..'AAAAAAAAAAAKAAAAAAAAgD9dAKiwCgDkzD0AAAAAAAAANgpwAICtcACArXAAgL8KbyrmrxUAgD8AAIAtCgBWGz4AoP29AIABvAoAAAAAAACAP52CErIKAJ+ZvgAAAAAAAAAACgBczD0AeD49gMAMvgoAAAAAAACAP6EA0LAKANRMvgAAAAAAAAAACgCkzb0AZgE9AMCl'
..'vAoAAAAAAACAPxsBhrEKANJMvgDNzD0AAAAACgA8vT0AsF29AP5EvQoAAAAAAACAP0QAWLAKANBMPgDNzD0AAAA2CgC4r70AQFW8AADEugoAAAAAAACAP3BFlbIKANZMPgDNTD4AAAAACgBanb6A5Eu+AOCIvQoAAAAAAACAP7sBcLEKANBMPgDNTD4AAAAACiAAgK0g'
..'AICtIACAvwp4VAyvFQCAPwAAgC0KAHr8voA86L4A+gK+CgwAgD8AAAAAAAAAAAoAAAAAAACAP5cEQ7IKAMxMPgDNTD4AAAAAChAAgK0QAICtEACAvwquFXuwFQCAPwAAgC0KAICTPIArVr8AcLy9CggAgD8AAAAAAAAAAAoAAAAAAACAPycHqbIKAAAAAIDMTD4AAAAA'
..'CgAAAAAAAIA/JIeksgo4AICtOACArTgAgL8KHIuRsBUAgD8AAIAtCgAYQT2Ad4y+ADp0PQoAAAAAAACAP4VqELMKAMzMPaCZGT8Azcw9CiAAgD8AAAAAAAAAAAoAAAAAAACAP5LKELMKaSq2rxUAgD8AAIAtCgB8C79AZ3i/ADSJPgosAIA/AAAAAAAAAAAKAAAAAAAA'
..'gD+WAMSwCgAAAADAzEw/AAAAAArYqJiuFQCAPwAAgC0KAAACvKB0qz8AMK49CgAAAAAAAIA/AQAArgoAAAAAAAAAAAAAAAAKKACArSgAgK0oAIC/CoJULK8VAIA/AACALQoAnFU+AAsRvgCAKz0KAAAAAAAAgD+OBmiyCgCamb4AzUw+AAAAAArXqJiuFQCAPwAAgC0K'
..'AOLDPgBJqb4AgFE8CgQAgD8AAAAAAAAAAAoAAAAAAACAP4QDKrIKAMxMvgDNzD0AAAAACggAgK0IAICtCACAvwqVUTGuFQCAPwAAgC0KAJ1XP3A0kT+ARnI+CgAAAAAAAIA/zAWasgoAzEy+AM3MPQDNzD0KALAAvvD3mj8A+DM+CgBALb38P2K/APhQPgoAAAAAAACA'
..'PwAAAAAKQLCCv3Ceij8AUjs+CgAAAAAAAIA/AAQ1sgoAzkw+AM1MPgAAAAAKABQYPoCyCL4AgOA8CgAAAAAAAIA/RwCMsAoA0Ey+AM3MPQAAAAAKAM2UPoDpNb4AILI9CiQAgD8AAAAAAAAAAAoAAAAAAACAPzDFkbIKAMzMvQDNzD0AAAAACgAoMb2A/KK+AHgpPAoA'
..'AAAAAACAPzgFT7IKSACArUgAgK1IAIC/ClAqlq8VAIA/AACALQoAgLm8YE2DvwAAxDoKAAAAAAAAgD+QAMSwClgqlq8VAIA/AACALQoAgNq8AKT8vAAgdj0KHACAPwAAAAAAAAAACgAAAAAAAIA/lAAKsQoAAAAAwMxMvwAAAAAKAPjqPsBzQr8AsBY+CgAAAAAAAIA/'
..'VACUsAoAAGQ7QPtavgB8mb4KABY/vgAJFr4AQJe9CgAAAAAAAIA/Bt1zswoAzcw+gJmZPgAAAAAKAJIjvgBYy70AAMu8CgAAAAAAAIA/cwCwsAoAoZm+AAAAAAAAAAAKlBVrsBUAgD8AAIAtCgCA2DyAdFy+QMipvgpQAIA/AAAAAAAAAAAKAAAAAAAAgD8MAKCvCgAA'
..'AAAAAAAAAAAANgoAgCG9AKxAPADwmz0KADD7PACEzj0ADJ+8CgDMzD0AzUw+AAAAAAoAGLw9AM09vgDgMz0KAAAAAAAAgD9ATOCyCgDUTL4AzUw+AAAAAAoAjsK+gF6GvgBB3b0KAMzMPQAAAAAAAAAAUgEAAAIAAgADAAUABgAHAAENAAIACAAJAAoACwAMAA0ADgAP'
..'ABAAEQASABMAFAAVABYAFwAUABgAGQAaABsAHAAdAB4AHwAgAAIDAAIAIQAiACMAJAAlACgAAQgAKQAQACoAKwAsAC0ALgArAC8AMAAxAC0AMgAQADMANAA1AAQAAAcAAQ8AAgA2AAkACgALAAwANwA4AA0AOQAPABAAOgA7ABEAPAA9AD4AEwAUABUAPwAXABQAGABA'
..'ABoAQQAcAEIAIAAGAwACACEAIgBDACQARAAHAAENAAIARQAJAAoACwAMAA0ARgAPABAAEQASABMAFAAVAEcAFwAUABgASAAaAEkAHABKAB4ASwAgAAgDAAIAIQAiAEwAJABNAAcAAQ0AAgBOAAkACgALAAwADQBPAA8AEAARABIAEwAUABUAUAAXABQAGABRABoAUgAc'
..'AFMAHgBUACAACgMAAgAhACIAVQAkAFYABwABDQACAFcACQAKAAsADAANAFgADwAQABEAEgATABQAFQBZABcAFAAYAFoAGgBbABwAXAAeAF0AIAAMAwACACEAIgBeACQAXwBgAAEBAAIAYQAHAAENAAIAYgAJAAoACwAMAA0AYwAPABAAEQASABMAFAAVAGQAFwAUABgA'
..'ZQAaAGYAHABnAB4AaAAgAA8DAAIAIQAiAGkAJABqAGAADwEAAgBrAAcAAQ8AAgBsAAkACgALAAwANwA4AA0AbQAPABAAOgA7ABEAPAA9AD4AEwAUABUAbgAXABQAGABvABoAcAAcAHEAIAASAwACACEAIgByACQAcwAHAAEPAAIAdAAJAAoACwAMADcAOAANAHUADwAQ'
..'ADoAOwARADwAPQA+ABMAFAAVAHYAFwAUABgAdwAaAHgAHAB5ACAAFAMAAgAhACIAegAkAHsABwABDwACAHwACQAKAAsADAA3ADgADQB9AA8AEAA6ADsAEQA8AD0APgATABQAFQB+ABcAFAAYAH8AGgCAABwAgQAgABYDAAIAIQAiAIIAJACDAAcAAQ0AAgCEAAkACgAL'
..'AAwADQCFAA8AEAARABIAEwAUABUAhgAXABQAGACHABoAiAAcAIkAHgCKACAAGAMAAgAhACIAiwAkAIwABwABDQACAI0ACQAKAAsADAANAI4ADwAQABEAEgATABQAFQCPABcAFAAYAJAAGgCRABwAkgAeAJMAIAAaAwACACEAIgCUACQAlQAHAAEPAAIAlgAJAAoACwAM'
..'ADcAOAANAJcADwAQADoAOwARABIAPQA+ABMAFAAVAJgAFwAUABgAmQAaAJoAHACbACAAHAMAAgAhACIAnAAkAJ0ABwABDQACAJ4ACQAKAAsADAANAJ8ADwAQABEAEgATABQAFQCgABcAFAAYAKEAGgCiABwAowAeAKQAIAAeAwACACEAIgClACQApgAHAAEPAAIApwAJ'
..'AAoACwAMADcAOAANAKgADwAQADoAOwARADwAPQA+ABMAFAAVAKkAFwAUABgAqgAaAKsAHACsACAAIAMAAgAhACIArQAkAK4ABwABDQACAK8ACQAKAAsADAANALAADwAQABEAEgATABQAFQCxABcAFAAYALIAGgCzABwAtAAeALUAIAAiAwACACEAIgC2ACQAtwAHAAEP'
..'AAIAuAAJAAoACwAMADcAOAANALkADwAQADoAOwARADwAPQA+ABMAFAAVALoAFwAUABgAuwAaALwAHAC9ACAAJAMAAgAhACIAvgAkAJ0AYAABAQACAL8ABwABDwACAMAACQAKAAsADAA3ADgADQDBAA8AEAA6ADsAEQA8AD0APgATABQAFQDCABcAFAAYAMMAGgDEABwA'
..'xQAgACcCAAIAIQAiAMYABwABDQACAMcACQAKAAsADAANAMgADwAQABEAEgATABQAFQDJABcAFAAYAMoAGgDLABwAzAAeAM0AIAApAwACACEAIgDOACQAzwAHAAENAAIA0AAJAAoACwAMAA0A0QAPABAAEQASABMAFAAVANIAFwAUABgA0wAaANQAHADVAB4A1gAgACsD'
..'AAIAIQAiANcAJADYAGAAKwEAAgBrAAcAAQ8AAgDZAAkACgALAAwANwA4AA0A2gAPABAAOgA7ABEAPAA9AD4AEwAUABUA2wAXABQAGADcABoA3QAcAN4AIAAuAwACACEAIgDfACQA4ADhAAENAAIA4gAJAAoACwAMAOMA5AANAOUA5gAQABEAEgATABQAFQDnABcAFAAY'
..'AOgA6QDkAOoA6wAgADABAAIA7ABgADABAAIAawDtADAGAAIA7gDvAPAA8QDwAPIA8wD0APUA9gD3AAcAAQ8AAgD4AAkACgALAAwANwA4AA0A+QAPABAAOgA7ABEAPAA9AD4AEwAUABUA+gAXABQAGAD7ABoA/AAcAP0AIAA0AwACACEAIgD+ACQA/wAHAAENAAIAAAEJ'
..'AAoACwAMAA0AAQEPABAAEQASABMAFAAVAAIBFwAUABgAAwEaAAQBHAAFAR4ABgEgADYDAAIAIQAiAAcBJAAIAWAAAQEAAgAJAQoBOAEAAgALAQwBOQIAAgANAQ4BDwEKATgBAAIAEAEMATsCAAIAEQEOARIBBwABDAACABMBCQAKAAsADAANABQBEQASABMAFAAVABUB'
..'FwAUABgAFgEaABcBHAAYAR4AGQEgAD0DAAIAIQAiABoBJAAbAQcAAQ0AAgAcAQkACgALAAwADQAdAQ8AEAARABIAEwAUABUAHgEXABQAGAAfARoAIAEcACEBHgAiASAAPwMAAgAhACIAIwEkACQBBwABDwACACUBCQAKAAsADAA3ADgADQAmAQ8AEAA6ADsAEQA8AD0A'
..'PgATABQAFQAnARcAFAAYACgBGgApARwAKgEgAEECAAIAIQAiACsBBwABDQACACwBCQAKAAsADAANAC0BDwAQABEAEgATABQAFQAuARcAFAAYAC8BGgAwARwAMQEeADIBIABDAwACACEAIgAzASQANAEHAAENAAIANQEJAAoACwAMAA0ANgEPABAAEQASABMAFAAVADcB'
..'FwAUABgAOAEaADkBHAA6AR4AOwEgAEUDAAIAIQAiADwBJAA9AQcAAQ8AAgA+AQkACgALAAwANwA4AA0APwEPABAAOgA7ABEAPAA9AD4AEwAUABUAQAEXABQAGABBARoAQgEcAEMBIABHAwACACEAIgBEASQARQEHAAEPAAIARgEJAAoACwAMADcAOAANAEcBDwAQADoA'
..'OwARADwAPQA+ABMAFAAVAEgBFwAUABgASQEaAEoBHABLASAASQIAAgAhACIATAEHAAENAAIATQEJAAoACwAMAA0ATgEPABAAEQASABMAFAAVAE8BFwAUABgAUAEaAFEBHABSAR4AUwEgAEsDAAIAIQAiAFQBJABVAQcAAQ8AAgBWAQkACgALAAwANwA4AA0AVwEPABAA'
..'OgA7ABEAPAA9AD4AEwAUABUAWAEXABQAGABZARoAWgEcAFsBIABNAwACACEAIgBcASQAXQEHAAEMAAIAXgEJAAoACwAMAA0AXwEPABAAEQASABMAFAAVAGABFwAUABgAYQEaAGIBHABjASAATwMAAgAhACIAZAEkAGUBBwABDAACAGYBCQAKAAsADAANAOUAEQASABMA'
..'FAAVAOcAFwAUABgAZwEaAGgBHABpAR4AagFrAQEBAGwBEABDAQQAMAMmAA8DJwACByYAKwcnAAYJJgArCScACAsmAE0LJwAKDSYATw0nAAwQJgASECcADxMmAEMTJwASFSYAKRUnABQXJgAaFycAFhkmABYZJwAYGyYAURsnABodJgBRHScAHB8mACAfJwAeISYAIiEn'
..'ACAjJgBRIycAIiUmAFElJwAkKCYAUSgnACcqJgBRKicAKSwmAC4sJwArLyYAHi8nAC4xJgAwMScAUTUmAA81JwA0NyYAPzcnADY+JgAcPicAPUAmAFFAJwA/QiYAGkInAEFEJgAURCcAQ0YmAAZGJwBFSCYAP0gnAEdKJgBRSicASUwmADRMJwBLTiYAK04nAE1QJgAP'
..'UCcATw==')
for _,obj in pairs(Objects) do
	obj.Parent = script or workspace
end

RunScripts()
