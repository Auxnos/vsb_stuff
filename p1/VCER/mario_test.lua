-- Converted using Mokiros's Model to Script Version 3
-- Converted string size: 22132 characters

local ScriptFunctions = {
function(script,require)
while true do
	wait(0.1)
	script.Parent.TextureID = "rbxassetid://667900559"
	wait(5)
	script.Parent.TextureID = "http://www.roblox.com/asset/?id=673679186"
	wait(0.1)
	script.Parent.TextureID = "http://www.roblox.com/asset/?id=673679187"
	wait(0.1)
	script.Parent.TextureID = "http://www.roblox.com/asset/?id=673679186"
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


local Objects = Decode('AETWAiEFTW9kZWwhBE5hbWUhBFN0YXIhC1ByaW1hcnlQYXJ0IQpXb3JsZFBpdm90BBIASAJJAiEEUGFydCEIQW5jaG9yZWQiIQZDRnJhbWUhCkNhbkNvbGxpZGUCIQhNYXRlcmlhbAMAAAAAAABxQCELT3JpZW50YXRpb24KAAAAAAAAr8IAAAAAIQhQb3NpdGlvbgoA'
..'RK3BwRYEQd2qxEIhCFJvdGF0aW9uCgAAAAAfBa/CAAAAACEEU2l6ZQoAAIBAAACAQM3MTD4hCkF0dGFjaG1lbnQhC0F0dGFjaG1lbnQxBEoCSwJMAgri/h/ANf8fwO87KDYhClBvaW50TGlnaHQhCkJyaWdodG5lc3MDAAAAAAAAGEAhBVJhbmdlIQ9QYXJ0aWNsZUVt'
..'aXR0ZXIhBFJpbmchBUNvbG9yKAIAAAAAz/n/AACAP83/iiEITGlmZXRpbWURAACAQAAAoEAhDUxpZ2h0RW1pc3Npb24DAAAAAAAA8D8hDExvY2tlZFRvUGFydCEEUmF0ZSEIUm90U3BlZWQRAAAgwQAA8EEpAgAAAAAAAABBAAAAAAAAgD8AAABBAAAAACEFU3BlZWQR'
..'AAAAAAAAAAAhB1RleHR1cmUhFnJieGFzc2V0aWQ6Ly81NTkxNTc5MjQhDFRyYW5zcGFyZW5jeSkEAAAAAAAAgD8AAAAAzcxMPQAAgD4AAAAAAABAPwAAgD4AAAAAAACAPwAAgD8AAAAAIQtTcGVjaWFsTWVzaCEFU2NhbGUKAABAQAAAQEAAAEBAIQZNZXNoSWQhFnJi'
..'eGFzc2V0aWQ6Ly81MTYwMzI2NTIhCVRleHR1cmVJZCEWcmJ4YXNzZXRpZDovLzUxNjAzMjM0OCEITWVzaFR5cGUDAAAAAAAAFEAhBFdlbGQhAkMwBE0CTgJJAiECQzEETwJQAkkCIQVQYXJ0MCEFUGFydDEhBEV5ZXMhDUJvdHRvbVN1cmZhY2UDAAAAAAAAAAAhCkJy'
..'aWNrQ29sb3IH6wMETABRAkkCBhERESEMRnJvbnRTdXJmYWNlAwAAAAAAAABACgAAAAAAALlCAAAAAArWqqvB6HIDQWamxEIKAAA0wx8Fr0IAADTDCs3MTD7NzEw+zcxMPiEKVG9wU3VyZmFjZSEKTWFudWFsV2VsZARSAlACSQIhBk9mZnNldAoAAAAAAAAAAJqZGT8K'
..'ZmbmP2Zm5j9mZuY/IRZyYnhhc3NldGlkOi8vNTAyNDA2NDYxIQNSaWcEUwJUAlUCIQpSaWdodEZvb3QyBFYCVwJYAiEGTWlkZGxlIRZBc3NlbWJseUxpbmVhclZlbG9jaXR5CgAAAAAqBCs4AAAAACELQmFja1N1cmZhY2UDAAAAAAAAJEAHAwQEZABZAloCBp/z6SEL'
..'TGVmdFN1cmZhY2UKAAAAAAAAtEIAAAAACkRDMcFg5JE+oai/QiEMUmlnaHRTdXJmYWNlCgAAgD+mQtQ+AACAPwRKAlsCXAIEXQJeAl8CBGACYQJJAiEHTWlkZGxlMgRtAGICYwIKCtcnwQAAtMIAAAAACnn+MsHm+ZY+Wpy/QgoAALTCHwWfwgAAtMIhFnJieGFzc2V0'
..'aWQ6Ly8zODc5Mzk5MTIhCE1lc2hQYXJ0IQpSaWdodCBGb290BHUAZAJlAgMAAAAAAICUQAoAAKjAAAC0wgAAAAAK6p82wX53Gz8Lo79CCgAAtMIAgKnCAAC0wgrXo4A/4Xo0P99PzT8hFnJieGFzc2V0aWQ6Ly82Njc3OTcyMDMhCE1lc2hTaXplCvbHu0DwoINA5cYV'
..'QSEJVGV4dHVyZUlEIRZyYnhhc3NldGlkOi8vNjY3OTAwNTU5IQhMZWZ0Rm9vdAfqAwSBAFkCWgIGzc3NCkRDMcFg5JE+oajBQgoAAIA/oJmZPgAAgD8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9NTA4MjQ4MDA4IRZMZWZ0QW5rbGVSaWdBdHRhY2ht'
..'ZW50BIYAUAJJAgoAAIC0gM9MPfTvWDUhB01vdG9yNkQhCUxlZnRBbmtsZQSrAFACSQIhCExlZnRIYW5kBIwAWQJaAgpEQzHBijwSQKGow0IK/P9/P5mZmT7+/38/ISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTUwODI0Nzk5NSEWTGVmdFdyaXN0Umln'
..'QXR0YWNobWVudASRAFACSQIKABD7OZmZGT4AAIAzIRJMZWZ0R3JpcEF0dGFjaG1lbnQElQBQAmYCCgAAtMIAAACAAAAAAAoAAAC0gZkZvlIYHbQhCUxlZnRXcmlzdASgAFACSQIhDExlZnRMb3dlckFybQSaAFkCWgIKREMxwVcJP0ChqMNCCvz/fz+cmZk/AACAPyEp'
..'aHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD01MDgyNDc5OTYhFkxlZnRFbGJvd1JpZ0F0dGFjaG1lbnQEnwBQAkkCCgDg+jkBAIA+7YC0HwoA4Po5zMwMv+2AtB8hCUxlZnRFbGJvdwS2AFACSQIhDExlZnRMb3dlckxlZwSlAFkCWgIKREMxwYDfij+hqMFC'
..'Cv//fz8DAMA/AQCAPyEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD01MDgyNDgwMTUhFUxlZnRLbmVlUmlnQXR0YWNobWVudASqAFACSQIKAAAAgOj/fz4AAEC0CgAAQLTY/z+/9O8oNSEITGVmdEtuZWUExQBQAkkCIQxMZWZ0VXBwZXJBcm0EsABZAloC'
..'CkRDMcEl1ltAoajDQgr8/38/NjOzP///fz8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9NTA4MjQ3OTk5IRlMZWZ0U2hvdWxkZXJSaWdBdHRhY2htZW50BLUAUAJJAgpQDoA+YGbmPgAAwDMKADD7OdjMTL4AAMAzIRZMZWZ0U2hvdWxkZXJBdHRhY2ht'
..'ZW50BLkAUAJJAgoAAIA0ODMzP5DC6LIhDExlZnRTaG91bGRlcgRZAVACSQIEZwJQAkkCIQxMZWZ0VXBwZXJMZWcEvwBZAloCCkRDMcHjRdE/oajBQgoDAIA//v+/P/7/fz8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9NTA4MjQ4MDE2IRRMZWZ0SGlw'
..'UmlnQXR0YWNobWVudATEAFACSQIKAACAMwAAAD8AADC0CgAAgDOYmZm+AAAwtCEHTGVmdEhpcATTAFACSQIhCkxvd2VyVG9yc28EygBZAloCCkRDMcG+bxVAoajAQgr+//8/zMzMPgEAgD8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9NTA4MjQ4MDMx'
..'IRFSb290UmlnQXR0YWNobWVudATPAFACSQIKAAAAtJyZGT4AAACAIRJXYWlzdFJpZ0F0dGFjaG1lbnQE0gBQAkkCCgAAALTOzAw/7YC0HwoCAAC/ysxMvgAAAIAhFVJpZ2h0SGlwUmlnQXR0YWNobWVudATWAFACSQIK/P//PsrMTL4AAACAIRVXYWlzdENlbnRlckF0'
..'dGFjaG1lbnQE2QBQAkkCClyP4rQAAOCz+BcWMiEUV2Fpc3RGcm9udEF0dGFjaG1lbnQE3ABQAkkCClL4DbQAAEAzAQAAvyETV2Fpc3RCYWNrQXR0YWNobWVudATfAFACSQIKwjUdtAAAADMBAAA/IQRSb290IQ5SaWdodExvd2VyQXJtMgRoAlkCWgIE5ABZAloCCkRD'
..'McFXCT9Aoai9QgoAAIA/cvkzPwAAgD8ESgJpAmoCBGsCbAJtAgRuAmECSQIE6wBvAnACCgAAAAAAALTCAAAAAAoY6DDBVwk/QLievUIhFnJieGFzc2V0aWQ6Ly8zODc5Mzg5NzEhD1JpZ2h0IExvd2VyIEFybQTvAHECcgIKXK8twQeUPkB7R75CCtNNQj/l0EI/PQoX'
..'PyEWcmJ4YXNzZXRpZDovLzY2Nzg4Mzg5MApsrI1AfBGOQOptXEAhCVJpZ2h0Rm9vdAr//38/oJmZPgAAgD8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9NTA4MjQ4MDIzIRdSaWdodEFua2xlUmlnQXR0YWNobWVudAT4AFACSQIKAAAAgIDMTD3JeM44'
..'IQpSaWdodEFua2xlBBcBUAJJAiEJUmlnaHRIYW5kBP0AWQJaAgpEQzHBijwSQKGovUIK/v9/P5mZmT7+/38/ISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTUwODI0ODAwMSEXUmlnaHRXcmlzdFJpZ0F0dGFjaG1lbnQEAgFQAkkCCgAAwDSZmRk+AACA'
..'MyETUmlnaHRHcmlwQXR0YWNobWVudAQFAVACZgIKAAAAAIGZGb5SGB20IQpSaWdodFdyaXN0BA0BUAJJAiENUmlnaHRMb3dlckFybSEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD01MDgyNDgwMDMhF1JpZ2h0RWxib3dSaWdBdHRhY2htZW50BAwBUAJJ'
..'AgoAAAA0AQCAPu2AtB8KAAAANMzMDL/8Lf2iIQpSaWdodEVsYm93BCIBUAJJAiENUmlnaHRMb3dlckxlZwQSAVkCWgIKREMxwYDfij+hqL9CISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTUwODI0ODAyNiEWUmlnaHRLbmVlUmlnQXR0YWNobWVudAQW'
..'AVACSQIKAAAAgOj/fz6xjzY4CgAAAIAIAEC/yRjOOCEJUmlnaHRLbmVlBDABUAJJAiENUmlnaHRVcHBlckFybQQcAVkCWgIKREMxwSXWW0ChqL1CCvr/fz82M7M///9/PyEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD01MDgyNDgwMDQhGlJpZ2h0U2hv'
..'dWxkZXJSaWdBdHRhY2htZW50BCEBUAJJAgqoAoC+YGbmPgAAwDMKAAAgtdjMTL4AAMAzIRdSaWdodFNob3VsZGVyQXR0YWNobWVudAQlAVACSQIKAACAtTgzMz+QwuiyIQ1SaWdodFNob3VsZGVyBFoBUAJJAgRzAlACSQIhDVJpZ2h0VXBwZXJMZWcEKwFZAloCCkRD'
..'McHjRdE/oai/QgoEAIA//v+/P/7/fz8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9NTA4MjQ4MDI4BC8BUAJJAgoAAACAAAAAPwAA4LMKAAAAgJiZmb6x3zY4IQhSaWdodEhpcCEOUmlnaHRMb3dlckxlZzIEdAJ1AmMCCgAAgD+3QlQ/AACAPwR2Al4C'
..'XwIEdwJhAkkCBDgBYgJjAgqZLjHBHtCKP1qcv0IhFnJieGFzc2V0aWQ6Ly8zODc5Mzk0ODkhD1JpZ2h0IExvd2VyIExlZwQ8AWQCZQIKLOcxwWogmD8Lo79CCj5SZT/XBHU/UednPyEWcmJ4YXNzZXRpZDovLzY2MzQwMzI5NwolTadA7sCyQHIvqUAhC0xvd2VyVG9y'
..'c28yBHgCVAJVAgoAAIA/AACAPwAAgD8ESgJ5AnoCBHsCfAJ9AgR+AmECSQIERwF/AoACClz3L8GUbxVAX5/AQiEWcmJ4YXNzZXRpZDovLzM4Nzk0MTcxNSEFV2Fpc3QESwGBAoICCrRxMcHPogdATK3AQgpILvw/gVqGP9Njxz8hFnJieGFzc2V0aWQ6Ly82NjMzODc3'
..'MzkKgPo3QQoJxEAKdxFBIQpVcHBlclRvcnNvBFEBWQJaAgpEQzHBvm9VQKGowEIKAAAAQM7MzD8DAIA/ISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTUwODI0ODAwNwRVAVACSQIKAACAs2dm5r4AAAA0IRFOZWNrUmlnQXR0YWNobWVudARYAVACSQIK'
..'AACAs8zMTD8AAAA0CnD8n7/MzAw/AAAANApc/58/zMwMPwAAADQhE0JvZHlGcm9udEF0dGFjaG1lbnQEXQFQAkkCCgAAgLPQzEy+/P//viESQm9keUJhY2tBdHRhY2htZW50BGABUAJJAgoAAICz0MxMvgAAAD8hFExlZnRDb2xsYXJBdHRhY2htZW50BGMBUAJJAgr+'
..'/3+/0MxMPxg1nLMhFVJpZ2h0Q29sbGFyQXR0YWNobWVudARmAVACSQIK//9/P8zMTD8IIEYzBIMCUAJJAiEQSHVtYW5vaWRSb290UGFydARqAVkCWgIKREMxwVgJH0ChqMBCCgAAAEAAAABAAACAPyELVXBwZXJUb3JzbzIEhAJUAlUCBG8BfwKAAgpc9y/BlG81QF+f'
..'wEIhFnJieGFzc2V0aWQ6Ly8zODc5NDE0NjgEcgFZAloCCkRDMcG+bzVAoajAQgSFAmECSQIhBUNoZXN0BHYBgQKCAgq0cTHBwqI5QEytwEIK46XrP9V42T+ync8/IRZyYnhhc3NldGlkOi8vNjY3ODg1NTEzCvzlK0EqqR5BQHQXQSEOUmlnaHRVcHBlckxlZzIEhgKH'
..'AogCCgAAgD/IW0Y/AACAPwRKAokCigIEiwKMAo0CBI4CYQJJAgSCAY8CkAIKCtcjvAAAtMIAAAAACrj3L8FsRdE/Wpy/QiEWcmJ4YXNzZXRpZDovLzM4NzkzOTY0NSEPUmlnaHQgVXBwZXIgTGVnBIYBkQKSAgricTHBwUvPPwujv0IKk098P4xzpz/JmIM/IRZyYnhh'
..'c3NldGlkOi8vNjYzNDAxOTAzCsoSuEARVPRAVAPAQCEOUmlnaHRVcHBlckFybTIEkwKUApUCBI0BWQJaAgpEQzHBJdZbQIIjvUIKAACAP6jhKz8AAIA/BEoClgKXAgSYApkCmgIEmwJhAkkCBJQBnAKVAgrsUaDAAAC0wgAAAAAK428wwbS3W0CZGb1CCgAAtMLh+qnC'
..'AAC0wgoAAIA/ZRcsPwAAgD8hFnJieGFzc2V0aWQ6Ly8zODc5Mzg0NjghD1JpZ2h0IFVwcGVyIEFybQSbAZ0CngIK16MgwAAAtMIAAAAACvs8L8GtdUpAznG+QgoAALTC4fquwgAAtMIKrdJSP7uuTj82dkU/IRZyYnhhc3NldGlkOi8vNjYzMzk1ODM5ClDOmUAKyZZA'
..'7Q6QQCEESGVhZASiAVkCWgIKJkIxwayEl0ChqMBCCgAAAEAAAIA/AACAPwMAAACAFK7vPwoAAKA/AACgPwAAoD8hFEZhY2VDZW50ZXJBdHRhY2htZW50BKkBnwKgAgoc4tUoRnZDKn8g8rQKM7drswAAAAAAwI65IRNGYWNlRnJvbnRBdHRhY2htZW50BKwBnwKgAgoy'
..'t2uzAAAAAHKrGb8hDkhhaXJBdHRhY2htZW50BK8BnwKgAgpmbleznJkZPwDAjrkhDUhhdEF0dGFjaG1lbnQhDk5lY2tBdHRhY2htZW50BLMBnwKgAgrXQ1mzmJkZv3TGjrkEtQFQAkkCCgAAgLOamRm/AMCOuSEFRGVjYWwhBGZhY2UhKGh0dHA6Ly93d3cucm9ibG94'
..'LmNvbS9hc3NldC8/aWQ9MTA3NDc5MTEhBE5lY2shBVNvdW5kIQlHZXR0aW5nVXAhElJvbGxPZmZNYXhEaXN0YW5jZQMAAAAAAMBiQCESUm9sbE9mZk1pbkRpc3RhbmNlIQdTb3VuZElkISNyYnhhc3NldDovL3NvdW5kcy9hY3Rpb25fZ2V0X3VwLm1wMyEGVm9sdW1l'
..'AwAAAMDMzOQ/IQREaWVkIRtyYnhhc3NldDovL3NvdW5kcy91dWhoaC5tcDMhC0ZyZWVGYWxsaW5nIQZMb29wZWQhJHJieGFzc2V0Oi8vc291bmRzL2FjdGlvbl9mYWxsaW5nLm1wMyEHSnVtcGluZyEhcmJ4YXNzZXQ6Ly9zb3VuZHMvYWN0aW9uX2p1bXAubXAzIQdM'
..'YW5kaW5nISZyYnhhc3NldDovL3NvdW5kcy9hY3Rpb25fanVtcF9sYW5kLm1wMyEGU3BsYXNoISJyYnhhc3NldDovL3NvdW5kcy9pbXBhY3Rfd2F0ZXIubXAzIQdSdW5uaW5nIQ1QbGF5YmFja1NwZWVkAwAAAKCZmf0/IS5yYnhhc3NldDovL3NvdW5kcy9hY3Rpb25f'
..'Zm9vdHN0ZXBzX3BsYXN0aWMubXAzIQhTd2ltbWluZwMAAACgmZn5PyEhcmJ4YXNzZXQ6Ly9zb3VuZHMvYWN0aW9uX3N3aW0ubXAzIQhDbGltYmluZyEISHVtYW5vaWQhCUhpcEhlaWdodAMAAACgmZn1PyEHUmlnVHlwZSEIQW5pbWF0b3IhClJpZ2h0SGFuZDIEoQKi'
..'AqMCCgAAgD9i+bM+AACAPwSkAmwCbQIEpQJhAkkCBOEBbwJwAgoY6DDBXDwSQLievUIhFnJieGFzc2V0aWQ6Ly8zODc5MzkyMzMhClJpZ2h0IEhhbmQE5QFxAnICCkQOL8EeoBJATUC9QgpEdpo/9sWaP+oOkz8hFnJieGFzc2V0aWQ6Ly82NjMzOTk4MzkKIGDhQG7U'
..'4UCkktZAIQVIZWFkMgSmAlQCVQIEpwKoAkkCBKkCYQJJAgTuAaoCggIKUlUxwZeEl0Bfn8BCIRxyYnhhc3NldDovL3RleHR1cmVzL2ZhY2UucG5nBPEBgQKCAgoGfzPBLrmbQEytwEIK+FMrQCGwMkCYbkpAIRZyYnhhc3NldGlkOi8vNjY3ODk5MjQzCvr8eUESV4JB'
..'xLSTQSEGU2NyaXB0IQlMZWZ0Rm9vdDIEqwKsAq0CBEoCrgKvAgSwArECsgIEswJhAkkCBPwBtAK1Agp5/jLB5vmWPlicwUIhFnJieGFzc2V0aWQ6Ly8zODc5NDExOTYhCUxlZnQgRm9vdAQAArYCrQIK6p82wX13Gz+ItMFCCoXrgT9GtjM/PzXOPyEWcmJ4YXNzZXRp'
..'ZDovLzY2Nzc5NjYzMwr+m71Axi2DQNtyFkEhCUxlZnRIYW5kMgS3ArgCuQIESgK6ArsCBKQCvAK9AgS+AmECSQIECgK/AsACChjoMMFcPBJAuJ7DQiEWcmJ4YXNzZXRpZDovLzM4Nzk0MDU0OCEJTGVmdCBIYW5kBA4CwQLCAgpEDi/BK6ASQKUZxEIK2LedP08enD+o'
..'EZQ/IRZyYnhhc3NldGlkOi8vNjYzMzk4NzcwCmcg5kDeyuNAKwzYQCENTGVmdExvd2VyQXJtMgTDAlkCWgIEawK8Ar0CBMQCYQJJAgQXAr8CwAIKGOgwwVcJP0C4nsNCIRZyYnhhc3NldGlkOi8vMzg3OTQwMzU2IQ5MZWZ0IExvd2VyIEFybQQbAsECwgIKXK8twQeU'
..'PkB5EsNCCtb2OD8TR0I/TjscPyEWcmJ4YXNzZXRpZDovLzY2MzM5NzE5NArP8IZAPryNQCz1Y0AhDUxlZnRMb3dlckxlZzIExQLGArUCBCICtAK1AgqZLjHBHtCKP1qcwUIhFnJieGFzc2V0aWQ6Ly8zODc5NDA4MDIEdgKxArICBMcCYQJJAiEOTGVmdCBMb3dlciBM'
..'ZWcEKAK2Aq0CCiznMcFqIJg/irTBQgooRWU/plhyP/CbaD8hFnJieGFzc2V0aWQ6Ly82NjM0MDI1NDQKmUOnQMfNsEA4s6lAIQ1MZWZ0VXBwZXJBcm0yBMgCyQLKAgQvAlkCWgIKREMxwSXWW0DALcRCBEoCywLMAgTNAs4CzwIE0AJhAkkCBDQC0QLSAgoLcDDBQKpb'
..'QNcjxEIhFnJieGFzc2V0aWQ6Ly8zODc5NDAxMTMhDkxlZnQgVXBwZXIgQXJtBDgC0wLUAgr+PC/BB29KQCTowkIKPQpXP6JFVj9xPUo/IRZyYnhhc3NldGlkOi8vNjY3ODg0MTE1Cp7qnECuWZxAFpuTQCENTGVmdFVwcGVyTGVnMgTVAocCiAIE1gJhAkkCBEACjwKQ'
..'Agq49y/BbEXRP1qcwUIhFnJieGFzc2V0aWQ6Ly8zODc5NDA5NzYhDkxlZnQgVXBwZXIgTGVnBEQCkQKSAgricTHBwUvPP4q0wUIKjb5+P/RUpz/4eII/IRZyYnhhc3NldGlkOi8vNjYzNDAxMjc3CkjZuUBtJ/RAYF++QAq2qTI9AAAAACTCfz8KAAAAAAAAgD8AAAAA'
..'CgAAAAAAAAAAAAAAAAqiwX8/kL07M1ypMj0K7F35OqLBfz93fTK9CgAAAAAAAAAAzczMvQoAAIC/AAAAAAAAAAAKAAAAAADYIz0AwMy9CgAAgD8AAAAAAAAAAAq2qTK9AAAAACTCf78KAADAtgAAgLUAAMC2Cgd/M8E4ZUhAO7DAQgoAAICgAACApAAAgD8K/v9/KAAA'
..'gD8AAICkClIkNsHgVQI/faK/QgpmMj2uAOUrLAAAgD8KHEO7PXbtfj8AONMrCoA/tawnYwGwAACAvwryAFCzAACAPyhjAbAKgD+1rCJDu7127X4/CidjAbB27X4/IkO7PQoAcMQ8AOAiPACa3b0KCW63rhtDuz127X6/CvNuhrV27X4/G0O7PQoAwDI8SamUvgD0ub4K'
..'AAAAAAAAAAAAAIC/CuLxxLNw3oW1AACAPwpJejo+Jrh7PzvfhTUKZjI9rvXkKywAAIA/ChxDuz127X4/dzfTKwoAAAAAMjGNJAAAgL8KuB6FvgAAAAAAAAAACq4VMcEIlD5AP9S9QgqAP7WsAABQswAAgD8KJ2MBsAAAgD8AAFAzCgCQnjwAAAAAAFi2PAqlr5otAAA+'
..'lgEAgL8Kz9ncsAEAgD8AAD4WCgDanr4AoOo7APpkPgqkr5ot0NncsAAAgD8KAAByqwEAgD/Q2dwwCgAAwKFEk4CkAACAPwoAAHKrAACAP0STgKQKuB6FPgAAAAAAAAAACtMYMcHACJI/faK/Qgri8cSzb96FtQAAgD8KAHDEPADA77kAYKU7CgDAMjzgrMu9AABKvQq0'
..'cTHB+L0NQEutwEIKgD+1rPQAULMAAIA/CidjAbAAAIA/9QBQMwoAIJQ8AAAoNwD0pT0Kpa+aLXt9iR4AAIC/Cs/Z3LAAAIA/32aBngoAYBW88M5cPgDAObwKpa+aLdDZ3LAAAIA/CgAAQCgAAIA/ztncMAoAAAAARJOApAAAgD8KAABAKAAAgD9Ek4CkCgAAAAAAAAC/'
..'AAAAAAq0cTHBwKI5QEutwEIKAGAVvIBghr0AwDm8CoDRMMGgS88/faK/QgrAG1apAAAAJgAAgD8K9s/TOAAAgD8AACCmCoA/taz26dO4AACAPwonYwGwAACAP/bp0zgKAHDEPAAAELYAxqU9CqWvmi32z9M4AACAvwrP2dywAACAP/bP0zgKAMAyPAAWfTwAcDq8CiHX'
..'mC3a2dywAACAPwr2z1M5AACAP7vZ3DAKgBtWqdja/yUAAIA/CvbP0zgAAIA/KAkmpgqcRTHBEChSQB2vvUIK6lShruem3LAAAIA/Cv8Asz0xBX8/VrDcMAqAP7WsQUkzvTHBfz8KJ2MBsDHBfz9BSTM9CgCQnjwAUC67ADxTPQqlr5otmRAzPVnBf78Kz9ncsFnBfz+Z'
..'EDM9CgAmJ7+wC4g+AJ4NPgrqVKGu5qbcsAAAgD8Kiy+1relvPisAAIA/CjRJMz0xwX8/LQF+KgoAAIA/rToHskpVWqcKrToHMgAAgD/t6O4lCkyQL8EgoBJAAVq9QgoAAOChAACApAAAgD8KAABwqwAAgD8AAICkCgCQnjwAADg3AFi2PAoAqFA+ACjHuwBADT4KBn8z'
..'wSy5m0BLrcBCCgAglLwAACg3AGCZOwoAAAAAAAAAAAAAgD8KAGAVvECQBr4AOA++CgAAAABEk4AkAACAvwq+KzbBgC8CP1uqwUIKITzEswiohbUAAIA/ChxDuz127X4/yjeGNQo94dIuIkO7vXbtfj8K6UeGtXbtfj8iQ7s9CgCQxDwA4CI8AJrdvQqlr5otG0O7PXbt'
..'fr8Kz9ncsHbtfj8bQ7s9CgBwvrxJqZS+APS5vgpHg8SzEt+FtQAAgD8KSXo6Pia4ez+Z3oU1CiE8xLMJqIW1AACAPwo2iC/BKKASQOf5w0IKAAAQIgAAAKUAAIA/CgAAdKsBAIA/AAAApQqAP7WsAABQswEAgD8KJ2MBsAEAgD8AAFAzCqWvmi0AAECWAACAvwrP2dyw'
..'AACAPwAAQBYKAAhivgBCx7sAQA0+Cqevmi3S2dywAACAPwoAAHSrAQCAP9DZ3DAKAAAgIqJJAKUAAIA/CgAAdKsBAIA/okkApQpkCDHBCJQ+QBGBw0IKACiWPgCg6jsA+mQ+CrgaMcEAt5E/faLBQgpHg8SzEd+FtQAAgD8KAJC+vOCsy70AAEq9CvUzMcGYpFFAbZ/D'
..'QgrCFaGuEafcsAAAgD8KAAGzPTMFfz8ksNwwCoA/taynEDO9W8F/PwonYwGwW8F/P6cQMz0KAJCePAD48LoAYFM9CqWvmi00STM9McF/vwrP2dywMcF/PzRJMz0KAM4iP9BBiD4Ang0+CsIVoa4Qp9ywAACAPwoAAbM9MwV/PyOw3DAKWva0rekDPisAAIA/CpoQMz1b'
..'wX8/U/F8KgqByDDBoEvPP9GnwUIKAJC+vAAWfTwAcDq89wEAAAIAAgADAAUABgAHAAEIAAgACQAKAAYACwAMAA0ADgAPABAAEQASABMAFAAVABYAFwACAwACABgACgAZAA8AGgAbAAMCABwAHQAeAB0AHwADCwACACAAIQAiACMAJAAlACYAJwAJACgAJgApACoAFQAr'
..'ACwALQAuAC8AMAAxADIAAgQAMwA0ADUANgA3ADgAOQA6ADsAAgIAPAA9AD4APwAHAAENAAIAQgAIAAkAQwBEAEUARgAKAEcAIQBIAEkASgANAA4ADwBLABEATAATAE0AFQBOAE8ARABQAAgCAAIAOwA+AFEAMgAIBABSAFMAMwBUADUAVQA5ADoAAQAAAgACAFYABQBX'
..'AAEACwIAAgBYAAUAWQAHAAwSAAIAWgBbAFwAXQBeAEMAXgBFAF8ACgBgAAsADAAhAGEASQBeAGIAXgANAA4ADwBjABEAZABlAF4AEwBjABUAZgBPAF4AMAAmADsADQIAPABnAD4AZwA7AA0CADwAZwA+AGgAOwANAgA8AGcAPgBpAAcADAsAAgBqAFsAXABDAEQACgBr'
..'AAsADAAPAGwAEQBtABMAbgAVAGYATwBEADAAJgAyABECADUAbwA5ADoAcAAMDAACAHEAWwBcAAoAcgALAAwADQBzAA8AdAARAHUAEwB2ABUAdwA1AHgAeQB6AHsAfABwAAsNAAIAfQBbAFwARQB+AAoAfwALAAwAIQCAAA8AYwARAIEAEwBjABUAggAwACYANQCDAHkA'
..'ggAXABQDAAIAhAAKAIUAEQCGAIcAFAMAAgCIADwAiQA+AIUAOwAUAABwAAsNAAIAigBbAFwARQB+AAoAiwALAAwAIQCAAA8AYwARAIwAEwBjABUAjQAwACYANQCOAHkAjQAXABgDAAIAjwAKAJAAEQCRABcAGAQAAgCSAAoAkwAPAJQAEQCVAIcAGAMAAgCWADwAlwA+'
..'AJAAOwAYAABwAAsNAAIAmABbAFwARQB+AAoAmQALAAwAIQCAAA8AYwARAJoAEwBjABUAmwAwACYANQCcAHkAmwAXAB0DAAIAnQAKAJ4AEQCfABcAHQMAAgCPAAoAlwARAKAAhwAdAwACAKEAPACiAD4AngA7AB0AAHAACw0AAgCjAFsAXABFAH4ACgCkAAsADAAhAIAA'
..'DwBjABEApQATAGMAFQCmADAAJgA1AKcAeQCmABcAIgMAAgCoAAoAqQARAKoAFwAiAwACAIQACgCJABEAqwCHACIDAAIArAA8AK0APgCpADsAIgAAcAALDQACAK4AWwBcAEUAfgAKAK8ACwAMACEAgAAPAGMAEQCwABMAYwAVALEAMAAmADUAsgB5ALEAFwAnAwACALMA'
..'CgC0ABEAtQAXACcDAAIAnQAKAKIAEQC2ABcAJwMAAgC3AAoAuAARALkAhwAnAwACALoAPAC7AD4AtAA7ACcBADwAvABwAAsNAAIAvQBbAFwARQB+AAoAvgALAAwAIQCAAA8AYwARAL8AEwBjABUAwAAwACYANQDBAHkAwAAXAC0DAAIAwgAKAMMAEQDEABcALQMAAgCo'
..'AAoArQARAMUAhwAtAwACAMYAPADHAD4AwwA7AC0AAHAACwwAAgDIAFsAXABFAH4ACgDJACEAgAAPAGMAEQDKABMAYwAVAMsAMAAmADUAzAB5AMsAFwAyAwACAM0ACgDOABEAzwAXADIDAAIA0AAKANEAEQDSABcAMgMAAgDCAAoAxwARANMAFwAyAwACANQACgDVABEA'
..'1gAXADIDAAIA1wAKANgAEQDZABcAMgMAAgDaAAoA2wARANwAFwAyAwACAN0ACgDeABEA3wCHADICAAIA4AA+AM4AOwAyAAABAAsCAAIA4QAFAOIABwA8EgACAFoAWwBcAF0AXgBDAF4ARQBfAAoA4wALAAwAIQBhAEkAXgBiAF4ADQAOAA8AYwARAOQAZQBeABMAYwAV'
..'AOUATwBeADAAJgA7AD0CADwA5gA+AOYAOwA9AgA8AOYAPgDnADsAPQIAPADmAD4A6AAHADwLAAIAagBbAFwAQwBEAAoA6QALAAwADwDqABEA6wATAOoAFQDlAE8ARAAwACYAMgBBAgA1AOwAOQA6AHAAPAwAAgDtAFsAXAAKAO4ACwAMAA0AcwAPAOoAEQDvABMA6gAV'
..'APAANQDxAHkA8gB7AHwAcAALDQACAPMAWwBcAEUAfgAKAGAACwAMACEAgAAPAGMAEQBkABMAYwAVAPQAMAAmADUA9QB5APQAFwBEAwACAPYACgD3ABEA+ACHAEQDAAIA+QA8APoAPgD3ADsARAAAcAALDQACAPsAWwBcAEUAfgAKAPwACwAMACEAgAAPAGMAEQD9ABMA'
..'YwAVAP4AMAAmADUA/wB5AP4AFwBIAwACAAABCgABAREAAgEXAEgEAAIAAwEKAAQBDwCUABEABQGHAEgDAAIABgE8AAcBPgABATsASAAAcAALDQACAAgBWwBcAEUAfgAKAOMACwAMACEAgAAPAGMAEQDkABMAYwAVAJsAMAAmADUACQF5AJsAFwBNAwACAAoBCgALAREA'
..'DAEXAE0DAAIAAAEKAAcBEQANAYcATQMAAgAOATwADwE+AAsBOwBNAABwAAsNAAIAEAFbAFwARQB+AAoAEQELAAwAIQCAAA8AYwARABIBEwBjABUApgAwACYANQATAXkApgAXAFIDAAIAFAEKABUBEQAWARcAUgMAAgD2AAoA+gARABcBhwBSAwACABgBPAAZAT4AFQE7'
..'AFIAAHAACw0AAgAaAVsAXABFAH4ACgAbAQsADAAhAIAADwBjABEAHAETAGMAFQAdATAAJgA1AB4BeQAdARcAVwMAAgAfAQoAIAERACEBFwBXAwACAAoBCgAPAREAIgEXAFcDAAIAIwEKACQBEQAlAYcAVwMAAgAmATwAJwE+ACABOwBXAQA8ACgBcAALDQACACkBWwBc'
..'AEUAfgAKACoBCwAMACEAgAAPAGMAEQArARMAYwAVACwBMAAmADUALQF5ACwBFwBdAwACANQACgAuAREALwEXAF0DAAIAFAEKABkBEQAwAYcAXQMAAgAxATwA1QA+AC4BOwBdAAABAAsCAAIAMgEFADMBBwBiEgACAFoAWwBcAF0AXgBDAF4ARQBfAAoAEQELAAwAIQBh'
..'AEkAXgBiAF4ADQAOAA8AYwARABIBZQBeABMAYwAVADQBTwBeADAAJgA7AGMCADwAZwA+AGcAOwBjAgA8AGcAPgA1ATsAYwIAPABnAD4ANgEHAGILAAIAagBbAFwAQwBEAAoANwELAAwADwBsABEAOAETAG4AFQA0AU8ARAAwACYAMgBnAgA1ADkBOQA6AHAAYgwAAgA6'
..'AVsAXAAKADsBCwAMAA0AcwAPAHQAEQA8ARMAdgAVAD0BNQA+AXkAPwF7AHwAAQALAgACAEABBQBBAQcAahIAAgBaAFsAXABdAF4AQwBeAEUAXwAKAMkACwAMACEAYQBJAF4AYgBeAA0ADgAPAGMAEQDKAGUAXgATAGMAFQBCAU8AXgAwACYAOwBrAgA8AEMBPgBDATsA'
..'awIAPABDAT4ARAE7AGsCADwAQwE+AEUBBwBqCwACAGoAWwBcAEMARAAKAEYBCwAMAA8A6gARAEcBEwDqABUAQgFPAEQAMAAmADIAbwIANQBIATkAOgBwAGoMAAIASQFbAFwACgBKAQsADAANAHMADwDqABEASwETAOoAFQBMATUATQF5AE4BewB8AHAACwwAAgBPAVsA'
..'XABFAH4ACgBQASEAgAAPAGMAEQBRARMAYwAVAFIBMAAmADUAUwF5AFIBFwByAwACANAACgBUAREAVQEXAHIDAAIAVgEKAFcBEQBYARcAcgMAAgCzAAoAuwARAFkBFwByAwACAB8BCgAnAREAWgEXAHIDAAIAWwEKAFwBEQBdARcAcgMAAgBeAQoAXwERAGABFwByAwAC'
..'AGEBCgBiAREAYwEXAHIDAAIAZAEKAGUBEQBmAYcAcgMAAgBJATwA0QA+AFQBOwByAQA8AGcBBwALCAACAGgBWwBcAAoAaQEPAGMAEQBqARMAYwAVAGsBMAAmABcAfQEAAgDNAAEACwIAAgBsAQUAbQEHAH8LAAIAagBbAFwAQwBEAAoAbgELAAwADwDqABEAbwETAOoA'
..'FQBCAU8ARAAwACYAMgCAAgA1AHABOQA6AAcAfxIAAgBaAFsAXABdAF4AQwBeAEUAXwAKAHEBCwAMACEAYQBJAF4AYgBeAA0ADgAPAGMAEQByAWUAXgATAGMAFQBCAU8AXgAwACYAOwCCAgA8AEMBPgBEATsAggIAPABDAT4AQwE7AIICADwAQwE+AHMBcAB/DAACAHQB'
..'WwBcAAoAdQELAAwADQBzAA8A6gARAHYBEwDqABUAdwE1AHgBeQB5AXsAfAABAAsCAAIAegEFAHsBBwCHEgACAFoAWwBcAF0AXgBDAF4ARQBfAAoAKgELAAwAIQBhAEkAXgBiAF4ADQAOAA8AYwARACsBZQBeABMAYwAVAHwBTwBeADAAJgA7AIgCADwAfQE+AH0BOwCI'
..'AgA8AH0BPgB+ATsAiAIAPAB9AT4AfwEHAIcLAAIAagBbAFwAQwBEAAoAgAELAAwADwCBAREAggETAOoAFQB8AU8ARAAwACYAMgCMAgA1AIMBOQA6AHAAhwwAAgCEAVsAXAAKAIUBCwAMAA0AcwAPAIEBEQCGARMA6gAVAIcBNQCIAXkAiQF7AHwAAQALAgACAIoBBQCL'
..'AQcAjxIAAgBaAFsAXABdAF4AQwBeAEUAXwAKAIwBCwAMACEAYQBJAF4AYgBeAA0ADgAPAGMAEQCNAWUAXgATAGMAFQCOAU8AXgAwACYAOwCQAgA8AI8BPgCPATsAkAIAPACPAT4AkAE7AJACADwAjwE+AJEBBwCPCwACAGoAWwBcAEMARAAKAJIBCwAMAA8AkwERAJQB'
..'EwCVARUAlgFPAEQAMAAmADIAlAIANQCXATkAOgBwAI8MAAIAmAFbAFwACgCZAQsADAANAHMADwCaAREAmwETAJwBFQCdATUAngF5AJ8BewB8AAcACwwAAgCgAVsAXABDAEQARQB+AAoAoQEhAIAADwBjABEAogETAGMAFQCjAU8ARAAwAKQBMgCXAQAzAKUBFwCXBAAC'
..'AKYBCgCnAQ8AqAERAKkBFwCXBAACAKoBCgCrAQ8AqAERAKwBFwCXBAACAK0BCgCuAQ8AqAERAK8BFwCXBAACALABCgCuAQ8AqAERAK8BFwCXBAACALEBCgCyAQ8AqAERALMBFwCXAwACAFYBCgC0AREAtQG2AZcDAAIAtwEuALgBMAAmAIcAlwMAAgC5ATwAVwE+ALQB'
..'ugGXBQACALsBvAG9Ab4BOgC/AcABwQHCAboBlwUAAgDDAbwBvQG+AToAvwHEAcEBwgG6AZcGAAIAxQHGAQkAvAG9Ab4BOgC/AccBwQFEALoBlwUAAgDIAbwBvQG+AToAvwHJAcEBwgG6AZcFAAIAygG8Ab0BvgE6AL8BywHBAcIBugGXBQACAMwBvAG9Ab4BOgC/Ac0B'
..'wQHCAboBlwcAAgDOAcYBCQDPAdABvAG9Ab4BOgC/AdEBwQHCAboBlwcAAgDSAcYBCQDPAdMBvAG9Ab4BOgC/AdQBwQHCAboBlwYAAgDVAcYBCQC8Ab0BvgE6AL8B0QHBAcIBugGXBwACANIBxgEJAM8B0wG8Ab0BvgE6AL8B1AHBAcIBugGXBQACAMgBvAG9Ab4BOgC/'
..'AckBwQHCAboBlwUAAgDDAbwBvQG+AToAvwHEAcEBwgG6AZcHAAIAzgHGAQkAzwHQAbwBvQG+AToAvwHRAcEBwgG6AZcGAAIAxQHGAQkAvAG9Ab4BOgC/AccBwQHCAboBlwUAAgDMAbwBvQG+AToAvwHNAcEBwgG6AZcGAAIA1QHGAQkAvAG9Ab4BOgC/AdEBwQHCAboB'
..'lwUAAgDKAbwBvQG+AToAvwHLAcEBwgG6AZcFAAIAuwG8Ab0BvgE6AL8BwAHBAcIBOwCXAADWAQsCANcB2AHZASYA2gG0AAABAAsCAAIA2wEFANwBBwC2EgACAFoAWwBcAF0AXgBDAF4ARQBfAAoA/AALAAwAIQBhAEkAXgBiAF4ADQAOAA8AYwARAP0AZQBeABMAYwAV'
..'AN0BTwBeADAAJgA7ALcCADwA5gA+AOYAOwC3AgA8AOYAPgDeATsAtwIAPADmAD4A3wEHALYLAAIAagBbAFwAQwBEAAoA4AELAAwADwDqABEA4QETAOoAFQDdAU8ARAAwACYAMgC7AgA1AOIBOQA6AHAAtgwAAgDjAVsAXAAKAOQBCwAMAA0AcwAPAOoAEQDlARMA6gAV'
..'AOYBNQDnAXkA6AF7AHwAAQALAgACAOkBBQDqAQcAvhIAAgBaAFsAXABdAF4AQwBeAEUAXwAKAKEBCwAMACEAYQBJAF4AYgBeAA0ADgAPAGMAEQCiAWUAXgATAGMAFQBCAU8AXgAwACYAOwC/AgA8AEMBPgBDATsAvwIAPABDAT4A6wE7AL8CADwAQwE+AOwBBwC+CwAC'
..'AGoAWwBcAEMARAAKAO0BCwAMAA8AYwARAO4BEwBjABUAQgFPAEQAMAAmALYBwwEALgDvATIAwwEAMwClAXAAvgwAAgCgAVsAXAAKAPABCwAMAA0AcwAPAOoAEQDxARMA6gAVAPIBNQDzAXkA9AF7AHwA9QHGAAABAAsCAAIA9gEFAPcBBwDIEgACAFoAWwBcAF0AXgBD'
..'AF4ARQBfAAoAfwALAAwAIQBhAEkAXgBiAF4ADQAOAA8AYwARAIEAZQBeABMAYwAVAGYATwBeADAAJgA7AMkCADwA+AE+APgBOwDJAgA8APgBPgD5ATsAyQIAPAD4AT4A+gEHAMgLAAIAagBbAFwAQwBEAAoA+wELAAwADwBsABEA/AETAG4AFQBmAE8ARAAwACYAMgDN'
..'AgA1AP0BOQA6AHAAyAwAAgD+AVsAXAAKAP8BCwAMAA0AcwAPAHQAEQAAAhMAdgAVAAECNQACAnkAAwJ7AHwAAQALAgACAAQCBQAFAgcA0BIAAgBaAFsAXABdAF4AQwBeAEUAXwAKAIsACwAMACEAYQBJAF4AYgBeAA0ADgAPAGMAEQCMAGUAXgATAGMAFQDdAU8AXgAw'
..'ACYAOwDRAgA8AAYCPgAGAjsA0QIAPAAGAj4ABwI7ANECADwABgI+AAgCBwDQCwACAGoAWwBcAEMARAAKAAkCCwAMAA8A6gARAAoCEwDqABUA3QFPAEQAMAAmADIA1QIANQALAjkAOgBwANAMAAIADAJbAFwACgANAgsADAANAHMADwDqABEADgITAOoAFQAPAjUAEAJ5'
..'ABECewB8AAEACwIAAgASAgUAEwIHANgSAAIAWgBbAFwAXQBeAEMAXgBFAF8ACgCZAAsADAAhAGEASQBeAGIAXgANAA4ADwBjABEAmgBlAF4AEwBjABUA5QBPAF4AMAAmADsA2QIAPAAGAj4ABgI7ANkCADwABgI+ABQCOwDZAgA8AAYCPgAVAgcA2AsAAgBqAFsAXABD'
..'AEQACgAWAgsADAAPAOoAEQAXAhMA6gAVAOUATwBEADAAJgAyAN0CADUAGAI5ADoAcADYDAACABkCWwBcAAoAGgILAAwADQBzAA8A6gARABsCEwDqABUAHAI1AB0CeQAeAnsAfAABAAsCAAIAHwIFACACBwDgCwACAGoAWwBcAEMARAAKACECCwAMAA8AbAARACICEwBu'
..'ABUANAFPAEQAMAAmADIA4QIANQAjAjkAOgAHAOASAAIAWgBbAFwAXQBeAEMAXgBFAF8ACgCkAAsADAAhAGEASQBeAGIAXgANAA4ADwBjABEApQBlAF4AEwBjABUANAFPAF4AMAAmADsA4wIAPAD4AT4AJAI7AOMCADwA+AE+APgBOwDjAgA8APgBPgAlAnAA4AwAAgAm'
..'AlsAXAAKACcCCwAMAA0AcwAPAHQAEQAoAhMAdgAVACkCNQAqAnkAKwJ7AHwAAQALAgACACwCBQAtAgcA6BIAAgBaAFsAXABdAF4AQwBeAEUAXwAKAC4CCwAMACEAYQBJAF4AYgBeAA0ADgAPAGMAEQAvAmUAXgATAGMAFQCWAU8AXgAwACYAOwDpAgA8ADACPgAwAjsA'
..'6QIAPAAwAj4AMQI7AOkCADwAMAI+ADICBwDoCwACAGoAWwBcAEMARAAKADMCCwAMAA8AkwERADQCEwCVARUAjgFPAEQAMAAmADIA7QIANQA1AjkAOgBwAOgMAAIANgJbAFwACgA3AgsADAANAHMADwCaAREAOAITAJwBFQA5AjUAOgJ5ADsCewB8AAEACwIAAgA8AgUA'
..'PQIHAPASAAIAWgBbAFwAXQBeAEMAXgBFAF8ACgC+AAsADAAhAGEASQBeAGIAXgANAA4ADwBjABEAvwBlAF4AEwBjABUAfAFPAF4AMAAmADsA8QIAPAB9AT4AfQE7APECADwAfQE+AH4BOwDxAgA8AH0BPgA+AgcA8AsAAgBqAFsAXABDAEQACgA/AgsADAAPAIEBEQBA'
..'AhMA6gAVAHwBTwBEADAAJgAyAPUCADUAQQI5ADoAcADwDAACAEICWwBcAAoAQwILAAwADQBzAA8AgQERAEQCEwDqABUARQI1AEYCeQBHAnsAfACZAAEEAAIHQAACB0EACA5AAA0OQQAND0AADQ9BABEQQAANEEEAExZAACIWQQAUF0AAFBdBAMkbQAAdG0EAGBxAABgc'
..'QQDRIEAAJyBBAB0hQAAdIUEA2SVAAC0lQQAiJkAAIiZBAOMrQAByK0EAJyxAACcsQQDpMEAAMjBBAC0xQAAtMUEA8TpAAH06QQAyO0AAMjtBAGs+QAA9PkEAPT9AAD0/QQBBQEAAPUBBAENGQABSRkEAREdAAERHQQANS0AATUtBAEhMQABITEEAt1BAAFdQQQBNUUAA'
..'TVFBAD1VQABdVUEAUlZAAFJWQQBjW0AAcltBAFdcQABXXEEAkGBAADJgQQBdYUAAXWFBAIhkQABjZEEAY2VAAGNlQQBnZkAAY2ZBAGlsQABrbEEAa21AAGttQQBvbkAAa25BAHF7QAAye0EAcnxAAHJ8QQCCg0AAgoNBAICEQACChEEAgoVAAIKFQQCGiUAAiIlBAIiK'
..'QACIikEAjItAAIiLQQCOkUAAkJFBAJCSQACQkkEAlJNAAJCTQQCWoEAAcqBBAJezQACXs0EAv7hAALe4QQC3uUAAt7lBALu6QAC3ukEAvcBAAL/AQQC/wUAAv8FBAMPCQAC/wkEAxspAAMnKQQDJy0AAyctBAM3MQADJzEEAz9JAANHSQQDR00AA0dNBANXUQADR1EEA'
..'19pAANnaQQDZ20AA2dtBAN3cQADZ3EEA3+RAAOPkQQDh5UAA4+VBAOPmQADj5kEA5+pAAOnqQQDp60AA6etBAO3sQADp7EEA7/JAAPHyQQDx80AA8fNBAPX0QADx9EEA9w==')
for _,obj in pairs(Objects) do
	obj.Parent = script or workspace
end

RunScripts()
