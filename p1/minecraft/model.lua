-- return ("get_parts")
-- Converted using Mokiros's Model to Script Version 3
-- Converted string size: 4760 characters
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


local Objects = Decode('AACNIQVNb2RlbCEETmFtZSEMV2l0aGVyIFN0b3JtIQRQYXJ0IQZDb2xsYXIhCEFuY2hvcmVkIiENQm90dG9tU3VyZmFjZQMAAAAAAAAAACEKQnJpY2tDb2xvcgfrAyEGQ0ZyYW1lBBN2dyEKQ2FuQ29sbGlkZQIhBUNvbG9yBhERESEIUG9zaXRpb24KAB93vWChDkAA'
..'eCk8IQRTaXplClnIBkEfMNM/lJW+PyEKVG9wU3VyZmFjZSEJQm9vbFZhbHVlIQtSb2Jsb3hNb2RlbCENUm9ibG94U3RhbXBlciEFRGVjYWwhBEZhY2UhB1RleHR1cmUhKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9MTIzODA0NjI5AwAAAAAAAAhAISlo'
..'dHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDYzNyEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ2NDgDAAAAAAAA8D8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9MTIzODA0NjYzAwAAAAAAAABAISlodHRw'
..'Oi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDY2OQMAAAAAAAAQQCEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ2NzUhBFJpYnMhCldvcmxkUGl2b3QEeHl6IQNSaWIELnt8IQtPcmllbnRhdGlvbgoAALTCAAA0wwAAAAAKBD/3'
..'PyATn78ABcI/IQhSb3RhdGlvbgoAALTCAAAAAAAANMMKnfgjQIkom0AepIc/ISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDg3MSEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ4MjghKWh0dHA6Ly93d3cucm9ibG94'
..'LmNvbS9hc3NldC8/aWQ9MTIzODA0OTA2ISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDg1MSEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ4ODkEOHt8CpSo7r9Q2RrAAAXCPwQ6fX4KBD/3PwBQeTzABcI/BDx7fApc'
..'z/O/AFB5PMAFwj8EPn18CuSp7j9w2BrAAAXCPwRAfX4KlKjuvyATn78ABcI/IQVTcGluZQR/gIEhCVNwaW5lUGFydARGgoMKAAAAAAAAtMIAAAAACgDp2zwAL7m/APXvvQogh5o/DAG5QMKtnz8hKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9MTIzODA0'
..'NzU2ISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDc2OSEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ3OTEhKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9MTIzODA0NzgzISlodHRwOi8vd3d3LnJvYmxv'
..'eC5jb20vYXNzZXQvP2lkPTEyMzgwNDgwNiEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ4MTMhClNwaW5lUGFydDIEUYSFCgAAAAAAALTCXI/+wQoA6ds8IOaawOAOHb8KXI/+QQAAtMIAAAAACiCHmj9WqxlAwq2fPyEFSGVhZHMEhnqHIQRI'
..'ZWFkBFh8iAo6FWzAgMJfQMBFTT8KtIQUQJPPGEBAPBZAISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDYwOCEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ1OTUhKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/'
..'aWQ9MTIzODA0NTgwISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDU1NSEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ1MzgEYHyICkIVbECAwl9AwEVNPyEJTWFpbiBIZWFkBGOJigqA5Fs9QEqTQICPDL4Ki09GQJ2+'
..'SUBcVFJAISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDUyOCEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ1MTkhKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9MTIzODA0NDk5ISlodHRwOi8vd3d3LnJv'
..'YmxveC5jb20vYXNzZXQvP2lkPTEyMzgwNDQ4OCEpaHR0cDovL3d3dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjM4MDQ0NjYhKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9MTIzODA0NDQ3IQxDb21tYW5kQmxvY2sEi4yNBG+MjQoAAAAAAAC0QgrXI7wK'
..'AMtMvUB/lb9gEN0/CgrXI7wAALRCAAAAAAoAAIBAAACAQAAAgEAhDUNvbW1hbmQgQmxvY2shKWh0dHA6Ly93d3cucm9ibG94LmNvbS9hc3NldC8/aWQ9MTE4NTU0MzgwISlodHRwOi8vd3d3LnJvYmxveC5jb20vYXNzZXQvP2lkPTE1MjQxMDM1NyEpaHR0cDovL3d3'
..'dy5yb2Jsb3guY29tL2Fzc2V0Lz9pZD0xMjk4MDQwMjAKAACAPwDA8CUAAPIqCgCg8CUAAIA/AAAAAAoAZAk9IGDQv4CkPL4KAACAvwCgNKYAgDWrCgDANSvw/zO3AgCAPwoAAIC/AADxpQAA8qoKAIDyKvD/M7cCAIA/CgAAgL8A4PClAADyqgoAAPIq8P8ztwEAgD8K'
..'AOjbPHBSB8BADQi/CgCAGiui+Qa/w4ZZPwoAAL8qwoZZP6H5Bj8KAADyKvD/NbcBAIA/CgAg8yUBAIA/8P81NwoAAM4qovkGv8KGWT8KAIB9KsGGWT+h+QY/Cj4VbMCwwl9AwEVNPwoAgDYmAgCAP/D/MzcKAGDzJQIAgD/w/zM3CgAA8yrw/zO3AwCAPwoAAPQlAwCA'
..'P/D/MzcKAADAP5C/ccAU5glBCgXbTDI7F3e5AACAvwrdxwq1AACAPzsXd7l4AQABAAIDBAEKAAIFBgcICQoLDA0ODxAREhMUFRYJFwIBAAIYFwIBAAIZGgICABsJHB0aAgIAGx4cHxoCAQAcIBoCAgAbIRwiGgICABsjHCQaAgIAGyUcJgEBAgACJygpBAsKAAIqBgcI'
..'CQwrDg8sLRIuLzAUMRYJFwwBAAIYFwwBAAIZGgwCABshHDIaDAIAGyUcMxoMAgAbIxwyGgwBABw0GgwCABsJHDUaDAIAGx4cNgQLCgACKgYHCAkMNw4PLC0SOC8wFDEWCRcVAQACGBcVAQACGRoVAgAbIRwyGhUCABslHDMaFQIAGyMcMhoVAQAcNBoVAgAbCRw1GhUC'
..'ABseHDYECwoAAioGBwgJDDkODywtEjovMBQxFgkXHgEAAhgXHgEAAhkaHgIAGyEcMhoeAgAbJRwzGh4CABsjHDIaHgEAHDQaHgIAGwkcNRoeAgAbHhw2BAsKAAIqBgcICQw7Dg8sLRI8LzAUMRYJFycBAAIYFycBAAIZGicCABshHDIaJwIAGyUcMxonAgAbIxwyGicB'
..'ABw0GicCABsJHDUaJwIAGx4cNgQLCgACKgYHCAkMPQ4PLC0SPi8wFDEWCRcwAQACGBcwAQACGRowAgAbIRwyGjACABslHDMaMAIAGyMcMhowAQAcNBowAgAbCRw1GjACABseHDYECwoAAioGBwgJDD8ODywtEkAvMBQxFgkXOQEAAhgXOQEAAhkaOQIAGyEcMho5AgAb'
..'JRwzGjkCABsjHDIaOQEAHDQaOQIAGwkcNRo5AgAbHhw2AQECAAJBKEIEQgwAAkMGBwgJCgsMRA4PEBEsRRJGL0UURxYJF0MBAAIYF0MBAAIZGkMCABslHEgaQwIAGyEcSRpDAQAcShpDAgAbCRxLGkMCABsjHEwaQwIAGx4cTQRCDAACTgYHCAkKCwxPDg8QESxQElEv'
..'UhRTFgkXTAEAAhgXTAEAAhkaTAIAGyUcSBpMAgAbIRxJGkwBABxKGkwCABsJHEsaTAIAGyMcTBpMAgAbHhxNAQECAAJUKFUEVQwAAlYGBwgJCgsMVw4PEBEsRRJYL0UUWRYJGlYCABshHFoaVgIAGx4cWhpWAgAbJRxbGlYBABxcGlYCABsjHF0aVgIAGwkcXhdWAQAC'
..'GRdWAQACGARVDAACVgYHCAkKCwxfDg8QESxFEmAvRRRZFgkaXwIAGyEcWhpfAgAbHhxaGl8CABslHFsaXwEAHFwaXwIAGyMcXRpfAgAbCRxeF18BAAIZF18BAAIYBFUMAAJhBgcICQoLDGIODxARLEUSYy9FFGQWCRpoAgAbIxxlGmgBABxmGmgCABslHGcaaAIAGyEc'
..'aBpoAgAbCRxpGmgCABseHGoXaAEAAhkXaAEAAhgBAQIAAmsobARxCgACawYHCAkMbQ4PLG4Sby9wFHEWCRpyAwACchsjHHMacgMAAnIbCRx0GnIDAAJyGx4cdBpyAwACchshHHQacgIAAnIcdRpyAwACchslHHMA')
for _,obj in pairs(Objects) do
	obj.Parent = script
end
