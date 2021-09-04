local cors = {}
Players = {
    LocalPlayer = owner
}
function load096Char()
    local runDummyScript = function(f,scri)
        if (not scri:IsA('Script')) or (not scri:IsA('LocalScript')) then return false; end;
        local Dummy_CoRoutine = coroutine.create(function()
            getfenv().script = scri
            pcall(function() f() end)
        end)
        table.insert(cors,Dummy_CoRoutine);
        coroutine.resume(Dummy_CoRoutine);
    end
    cors = {}
    mas = Instance.new("Model",game:GetService("Lighting")) 
    mas.Name = "M2S_Model"
    o1 = Instance.new("Model")
    o2 = Instance.new("Part")
    o3 = Instance.new("SpecialMesh")
    o4 = Instance.new("Motor6D")
    o5 = Instance.new("NumberValue")
    o6 = Instance.new("BrickColorValue")
    o7 = Instance.new("Part")
    o8 = Instance.new("SpecialMesh")
    o9 = Instance.new("NumberValue")
    o10 = Instance.new("BrickColorValue")
    o11 = Instance.new("Part")
    o12 = Instance.new("SpecialMesh")
    o13 = Instance.new("NumberValue")
    o14 = Instance.new("BrickColorValue")
    o15 = Instance.new("Part")
    o16 = Instance.new("SpecialMesh")
    o17 = Instance.new("Motor6D")
    o18 = Instance.new("NumberValue")
    o19 = Instance.new("BrickColorValue")
    o20 = Instance.new("Part")
    o21 = Instance.new("SpecialMesh")
    o22 = Instance.new("Motor6D")
    o23 = Instance.new("NumberValue")
    o24 = Instance.new("BrickColorValue")
    o25 = Instance.new("Part")
    o26 = Instance.new("SpecialMesh")
    o27 = Instance.new("Motor6D")
    o28 = Instance.new("NumberValue")
    o29 = Instance.new("BrickColorValue")
    o30 = Instance.new("Part")
    o31 = Instance.new("SpecialMesh")
    o32 = Instance.new("Motor6D")
    o33 = Instance.new("NumberValue")
    o34 = Instance.new("BrickColorValue")
    o35 = Instance.new("Part")
    o36 = Instance.new("SpecialMesh")
    o37 = Instance.new("NumberValue")
    o38 = Instance.new("BrickColorValue")
    o39 = Instance.new("Part")
    o40 = Instance.new("SpecialMesh")
    o41 = Instance.new("Motor6D")
    o42 = Instance.new("NumberValue")
    o43 = Instance.new("BrickColorValue")
    o44 = Instance.new("Part")
    o45 = Instance.new("SpecialMesh")
    o46 = Instance.new("Motor6D")
    o47 = Instance.new("NumberValue")
    o48 = Instance.new("BrickColorValue")
    o49 = Instance.new("Part")
    o50 = Instance.new("SpecialMesh")
    o51 = Instance.new("Motor6D")
    o52 = Instance.new("NumberValue")
    o53 = Instance.new("BrickColorValue")
    o54 = Instance.new("Part")
    o55 = Instance.new("SpecialMesh")
    o56 = Instance.new("NumberValue")
    o57 = Instance.new("BrickColorValue")
    o58 = Instance.new("Part")
    o59 = Instance.new("SpecialMesh")
    o60 = Instance.new("Motor6D")
    o61 = Instance.new("Motor6D")
    o62 = Instance.new("Motor6D")
    o63 = Instance.new("Motor6D")
    o64 = Instance.new("Motor6D")
    o65 = Instance.new("NumberValue")
    o66 = Instance.new("BrickColorValue")
    o67 = Instance.new("Part")
    o68 = Instance.new("SpecialMesh")
    o69 = Instance.new("NumberValue")
    o70 = Instance.new("BrickColorValue")
    o71 = Instance.new("Humanoid")
    o72 = Instance.new("Part")
    o73 = Instance.new("Motor6D")
    o74 = Instance.new("NumberValue")
    o75 = Instance.new("BrickColorValue")
    o76 = Instance.new("Model")
    o1.Parent = mas
    o2.Name = "RightArmLower"
    o2.Parent = o1
    o2.Material = Enum.Material.Neon
    o2.Position = Vector3.new(14.8076706, 2.37419605, -45.4945259)
    o2.Rotation = Vector3.new(0.00999999978, 0.00999999978, 31.7399998)
    o2.Size = Vector3.new(1.60193837, 1.93159568, 0.565040112)
    o2.CFrame = CFrame.new(14.8076706, 2.37419605, -45.4945259, 0.850471079, -0.526021838, 0.000204114069, 0.526021957, 0.85047102, -0.000178285627, -7.98105757e-05, 0.000258994754, 1.00000155)
    o2.Position = Vector3.new(14.8076706, 2.37419605, -45.4945259)
    o3.Name = "ConvertedMesh"
    o3.Parent = o2
    o3.MeshId = "rbxassetid://717384015"
    o3.TextureId = "rbxassetid://717323842"
    o3.MeshType = Enum.MeshType.FileMesh
    o4.Name = "RightHand"
    o4.Parent = o2
    o4.C0 = CFrame.new(-0.600000024, -0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o4.C1 = CFrame.new(-0.293547928, 0.459788084, 0.229317009, -0.995789468, -0.0916698948, -1.29965343e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497734e-07, -7.05893797e-07, -1)
    o4.Part0 = o2
    o4.Part1 = o7
    o5.Name = "_Transparency"
    o5.Parent = o2
    o6.Name = "_Color"
    o6.Parent = o2
    o7.Name = "RightHand"
    o7.Parent = o1
    o7.Material = Enum.Material.Neon
    o7.Position = Vector3.new(14.6552868, 1.00439239, -45.2654228)
    o7.Rotation = Vector3.new(-179.98999, -0.00999999978, 143)
    o7.Size = Vector3.new(0.930448115, 1.22681987, 0.798764527)
    o7.CFrame = CFrame.new(14.6552868, 1.00439239, -45.2654228, -0.798669815, -0.601769567, -0.000203576492, -0.601769686, 0.798669696, 0.000177788126, 5.5602537e-05, 0.000264499657, -1.00000155)
    o7.Position = Vector3.new(14.6552868, 1.00439239, -45.2654228)
    o8.Name = "ConvertedMesh"
    o8.Parent = o7
    o8.MeshId = "rbxassetid://717530975"
    o8.TextureId = "rbxassetid://717323842"
    o8.MeshType = Enum.MeshType.FileMesh
    o9.Name = "_Transparency"
    o9.Parent = o7
    o10.Name = "_Color"
    o10.Parent = o7
    o11.Name = "LeftHand"
    o11.Parent = o1
    o11.Material = Enum.Material.Neon
    o11.Position = Vector3.new(16.9349747, 1.10614121, -45.3095551)
    o11.Rotation = Vector3.new(-179.98999, -0.00999999978, -133.25)
    o11.Size = Vector3.new(1.1250149, 1.33122087, 0.902812898)
    o11.CFrame = CFrame.new(16.9349747, 1.10614121, -45.3095551, -0.685231805, 0.728325009, -0.000214684289, 0.72832495, 0.685231924, 0.000181457217, 0.000279267726, -3.20193903e-05, -1.00000155)
    o11.Position = Vector3.new(16.9349747, 1.10614121, -45.3095551)
    o12.Name = "ConvertedMesh"
    o12.Parent = o11
    o12.MeshId = "rbxassetid://717376234"
    o12.TextureId = "rbxassetid://717323842"
    o12.MeshType = Enum.MeshType.FileMesh
    o13.Name = "_Transparency"
    o13.Parent = o11
    o14.Name = "_Color"
    o14.Parent = o11
    o15.Name = "LeftArmLower"
    o15.Parent = o1
    o15.Material = Enum.Material.Neon
    o15.Position = Vector3.new(16.8057365, 2.35993576, -45.3621407)
    o15.Rotation = Vector3.new(-179.98999, -0.00999999978, -154.12999)
    o15.Size = Vector3.new(1.60193837, 1.93159568, 0.737662315)
    o15.CFrame = CFrame.new(16.8057365, 2.35993576, -45.3621407, -0.899774313, 0.436355531, -0.00022140966, 0.436355472, 0.899774373, 0.00018639733, 0.000280553591, 7.11022731e-05, -1.00000155)
    o15.Position = Vector3.new(16.8057365, 2.35993576, -45.3621407)
    o16.Name = "ConvertedMesh"
    o16.Parent = o15
    o16.MeshId = "rbxassetid://717384015"
    o16.TextureId = "rbxassetid://717323842"
    o16.MeshType = Enum.MeshType.FileMesh
    o17.Name = "LeftHand"
    o17.Parent = o15
    o17.C0 = CFrame.new(-0.600000024, -0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o17.C1 = CFrame.new(0.227301165, 0.418191254, 0.0528470166, 0.93436265, 0.356323451, 8.20644709e-06, -0.356323451, 0.93436265, -1.51312429e-06, -8.20695914e-06, -1.51034294e-06, 1)
    o17.Part0 = o15
    o17.Part1 = o11
    o18.Name = "_Transparency"
    o18.Parent = o15
    o19.Name = "_Color"
    o19.Parent = o15
    o20.Name = "Left Arm"
    o20.Parent = o1
    o20.Material = Enum.Material.Neon
    o20.Position = Vector3.new(16.4045982, 4.13049984, -45.4033623)
    o20.Rotation = Vector3.new(-179.98999, -0.00999999978, -144.860001)
    o20.Size = Vector3.new(2.20739508, 2.08767748, 0.930814564)
    o20.CFrame = CFrame.new(16.4045982, 4.13049984, -45.4033623, -0.817784429, 0.575524628, -0.000217051478, 0.575524569, 0.817784488, 0.000186147314, 0.000284633075, 2.73100741e-05, -1.00000155)
    o20.Position = Vector3.new(16.4045982, 4.13049984, -45.4033623)
    o21.Name = "ConvertedMesh"
    o21.Parent = o20
    o21.MeshId = "rbxassetid://717390476"
    o21.TextureId = "rbxassetid://717323842"
    o21.MeshType = Enum.MeshType.FileMesh
    o22.Name = "LeftLowerArm"
    o22.Parent = o20
    o22.C0 = CFrame.new(-0.599999964, -0.599999964, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o22.C1 = CFrame.new(0.637943864, 0.729294896, 0.0416403934, 0.986954808, -0.160997555, -4.03047716e-06, 0.160997555, 0.986954808, 1.67676535e-06, 3.70794373e-06, -2.30378851e-06, 1)
    o22.Part0 = o20
    o22.Part1 = o15
    o23.Name = "_Transparency"
    o23.Parent = o20
    o24.Name = "_Color"
    o24.Parent = o20
    o25.Name = "Right Arm"
    o25.Parent = o1
    o25.Material = Enum.Material.Neon
    o25.Position = Vector3.new(15.0871267, 4.13009262, -45.4473953)
    o25.Rotation = Vector3.new(0.00999999978, 0.00999999978, 37)
    o25.Size = Vector3.new(2.20739508, 2.08767748, 0.930814564)
    o25.CFrame = CFrame.new(15.0871267, 4.13009262, -45.4473953, 0.798669696, -0.601769686, 0.000203576492, 0.601769745, 0.798669636, -0.000177788126, -5.56025116e-05, 0.000264499628, 1.00000155)
    o25.Position = Vector3.new(15.0871267, 4.13009262, -45.4473953)
    o26.Name = "ConvertedMesh"
    o26.Parent = o25
    o26.MeshId = "rbxassetid://717390476"
    o26.TextureId = "rbxassetid://717323842"
    o26.MeshType = Enum.MeshType.FileMesh
    o27.Name = "RightLowerArm"
    o27.Parent = o25
    o27.C0 = CFrame.new(-0.600000024, -0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o27.C1 = CFrame.new(0.618834019, 0.693875492, 0.0468753539, 0.995789468, -0.0916699693, -1.95501926e-07, 0.0916699693, 0.995789468, 7.05883849e-07, 1.29970402e-07, -7.20833327e-07, 1)
    o27.Part0 = o25
    o27.Part1 = o2
    o28.Name = "_Transparency"
    o28.Parent = o25
    o29.Name = "_Color"
    o29.Parent = o25
    o30.Name = "LeftLegLower"
    o30.Parent = o1
    o30.Material = Enum.Material.Neon
    o30.Position = Vector3.new(16.1501522, 0.996969938, -45.4150963)
    o30.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o30.Size = Vector3.new(0.412060022, 2.09814644, 0.530124426)
    o30.CFrame = CFrame.new(16.1501522, 0.996969938, -45.4150963, -1, 5.9296548e-05, -0.000225622833, 5.92547476e-05, 1, 0.000185270736, 0.000225633252, 0.000185257144, -1.00000155)
    o30.Position = Vector3.new(16.1501522, 0.996969938, -45.4150963)
    o31.Name = "ConvertedMesh"
    o31.Parent = o30
    o31.MeshId = "rbxassetid://717444475"
    o31.TextureId = "rbxassetid://717323842"
    o31.MeshType = Enum.MeshType.FileMesh
    o32.Name = "LeftFoot"
    o32.Parent = o30
    o32.C0 = CFrame.new(0, -0.800000012, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o32.C1 = CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1)
    o32.Part0 = o30
    o32.Part1 = o54
    o33.Name = "_Transparency"
    o33.Parent = o30
    o34.Name = "_Color"
    o34.Parent = o30
    o35.Name = "RightFoot"
    o35.Parent = o1
    o35.Material = Enum.Material.Neon
    o35.Position = Vector3.new(15.3985758, 0.545261681, -45.2662354)
    o35.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o35.Size = Vector3.new(0.431742311, 1.46190119, 0.95269978)
    o35.CFrame = CFrame.new(15.3985758, 0.545261681, -45.2662354, -1, 5.9296548e-05, -0.000225624142, 5.92547476e-05, 1, 0.000185271332, 0.000225633426, 0.00018525729, -1.00000477)
    o35.Position = Vector3.new(15.3985758, 0.545261681, -45.2662354)
    o36.Name = "ConvertedMesh"
    o36.Parent = o35
    o36.MeshId = "rbxassetid://717528936"
    o36.TextureId = "rbxassetid://717323842"
    o36.MeshType = Enum.MeshType.FileMesh
    o37.Name = "_Transparency"
    o37.Parent = o35
    o38.Name = "_Color"
    o38.Parent = o35
    o39.Name = "RightLegLower"
    o39.Parent = o1
    o39.Material = Enum.Material.Neon
    o39.Position = Vector3.new(15.433774, 1.06749892, -45.430809)
    o39.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o39.Size = Vector3.new(0.396030277, 2.19844723, 0.483337462)
    o39.CFrame = CFrame.new(15.433774, 1.06749892, -45.430809, -1, 5.9296548e-05, -0.000225623022, 5.92547476e-05, 1, 0.000185270765, 0.000225633441, 0.000185257173, -1.00000155)
    o39.Position = Vector3.new(15.433774, 1.06749892, -45.430809)
    o40.Name = "ConvertedMesh"
    o40.Parent = o39
    o40.MeshId = "rbxassetid://717526812"
    o40.TextureId = "rbxassetid://717323842"
    o40.MeshType = Enum.MeshType.FileMesh
    o41.Name = "RightFoot"
    o41.Parent = o39
    o41.C0 = CFrame.new(0, -0.799999952, 0, 1, -1.63424829e-13, 2.03726813e-10, -1.63424829e-13, 1, -7.27595761e-11, 2.03726813e-10, -7.27595761e-11, 1.00000322)
    o41.C1 = CFrame.new(-0.0352039337, -0.277791142, 0.164661407, 1, 2.34479103e-13, -1.89174898e-10, -2.34479103e-13, 1, -4.36555792e-11, 1.89174898e-10, 4.36555792e-11, 1)
    o41.Part0 = o39
    o41.Part1 = o35
    o42.Name = "_Transparency"
    o42.Parent = o39
    o43.Name = "_Color"
    o43.Parent = o39
    o44.Name = "Left Leg"
    o44.Parent = o1
    o44.Material = Enum.Material.Neon
    o44.Position = Vector3.new(16.0359974, 2.68579745, -45.3909836)
    o44.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o44.Size = Vector3.new(0.720114648, 2.62362862, 1.02549541)
    o44.CFrame = CFrame.new(16.0359974, 2.68579745, -45.3909836, -1, 5.9296548e-05, -0.000225622818, 5.92547476e-05, 1, 0.000185270736, 0.000225633237, 0.000185257144, -1.00000155)
    o44.Position = Vector3.new(16.0359974, 2.68579745, -45.3909836)
    o45.Name = "ConvertedMesh"
    o45.Parent = o44
    o45.MeshId = "rbxassetid://717432569"
    o45.TextureId = "rbxassetid://717323842"
    o45.MeshType = Enum.MeshType.FileMesh
    o46.Name = "LeftLowerLeg"
    o46.Parent = o44
    o46.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o46.C1 = CFrame.new(0.11425972, 0.68882513, -0.0237731934, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1)
    o46.Part0 = o44
    o46.Part1 = o30
    o47.Name = "_Transparency"
    o47.Parent = o44
    o48.Name = "_Color"
    o48.Parent = o44
    o49.Name = "Right Leg"
    o49.Parent = o1
    o49.Material = Enum.Material.Neon
    o49.Position = Vector3.new(15.5492496, 2.61439037, -45.3940544)
    o49.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o49.Size = Vector3.new(0.733323395, 2.58686447, 0.981220067)
    o49.CFrame = CFrame.new(15.5492496, 2.61439037, -45.3940544, -1, 5.9296548e-05, -0.000225622891, 5.92547476e-05, 1, 0.000185270736, 0.00022563331, 0.000185257144, -1.00000155)
    o49.Position = Vector3.new(15.5492496, 2.61439037, -45.3940544)
    o50.Name = "ConvertedMesh"
    o50.Parent = o49
    o50.MeshId = "rbxassetid://717523858"
    o50.TextureId = "rbxassetid://717323842"
    o50.MeshType = Enum.MeshType.FileMesh
    o51.Name = "RightLowerLeg"
    o51.Parent = o49
    o51.C0 = CFrame.new(0, -0.899999976, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o51.C1 = CFrame.new(-0.115375519, 0.646905065, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -2.13162821e-13, 1, -2.9103768e-11, 1.30967237e-10, 2.9103768e-11, 1)
    o51.Part0 = o49
    o51.Part1 = o39
    o52.Name = "_Transparency"
    o52.Parent = o49
    o53.Name = "_Color"
    o53.Parent = o49
    o54.Name = "LeftFoot"
    o54.Parent = o1
    o54.Material = Enum.Material.Neon
    o54.Position = Vector3.new(16.1940975, 0.127916932, -45.2669182)
    o54.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o54.Size = Vector3.new(0.395887077, 0.410638571, 0.8867957)
    o54.CFrame = CFrame.new(16.1940975, 0.127916932, -45.2669182, -1, 5.9296548e-05, -0.000225622847, 5.92547476e-05, 1, 0.000185270736, 0.000225633266, 0.000185257144, -1.00000155)
    o54.Position = Vector3.new(16.1940975, 0.127916932, -45.2669182)
    o55.Name = "ConvertedMesh"
    o55.Parent = o54
    o55.MeshId = "rbxassetid://717450478"
    o55.TextureId = "rbxassetid://717323842"
    o55.MeshType = Enum.MeshType.FileMesh
    o56.Name = "_Transparency"
    o56.Parent = o54
    o57.Name = "_Color"
    o57.Parent = o54
    o58.Name = "Torso"
    o58.Parent = o1
    o58.Material = Enum.Material.Neon
    o58.Position = Vector3.new(15.7781448, 4.17874861, -45.346817)
    o58.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o58.Size = Vector3.new(1.5152961, 2.06046176, 1.22290897)
    o58.CFrame = CFrame.new(15.7781448, 4.17874861, -45.346817, -1, 5.9296548e-05, -0.000225622804, 5.92547476e-05, 1, 0.000185270736, 0.000225633223, 0.000185257144, -1.00000155)
    o58.Position = Vector3.new(15.7781448, 4.17874861, -45.346817)
    o59.Name = "ConvertedMesh"
    o59.Parent = o58
    o59.MeshId = "rbxassetid://717339870"
    o59.TextureId = "rbxassetid://717323842"
    o59.MeshType = Enum.MeshType.FileMesh
    o60.Name = "Neck"
    o60.Parent = o58
    o60.C0 = CFrame.new(0, 1.20000005, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o60.C1 = CFrame.new(-0.0724544525, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1)
    o60.Part0 = o58
    o60.Part1 = o67
    o61.Name = "Left Shoulder"
    o61.Parent = o58
    o61.C0 = CFrame.new(-0.400000036, 0.800000012, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o61.C1 = CFrame.new(0.67334199, 0.563364208, -0.0563961715, 0.817818582, 0.57547611, 6.50501306e-06, -0.57547611, 0.817818582, -5.64985976e-06, -8.57127998e-06, 8.77080709e-07, 1)
    o61.Part0 = o58
    o61.Part1 = o20
    o62.Name = "Left Hip"
    o62.Parent = o58
    o62.C0 = CFrame.new(-0.200000003, -0.800000012, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o62.C1 = CFrame.new(0.0579517335, 0.69294399, -0.0438308716, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1)
    o62.Part0 = o58
    o62.Part1 = o44
    o63.Name = "Right Shoulder"
    o63.Parent = o58
    o63.C0 = CFrame.new(0.400000036, 0.800000012, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o63.C1 = CFrame.new(0.743169308, 0.502686918, 0.100726619, -0.798633993, 0.601817071, -1.31049201e-05, 0.601817071, 0.798633993, 1.92429361e-05, 2.20467628e-05, 7.48129651e-06, -1)
    o63.Part0 = o58
    o63.Part1 = o25
    o64.Parent = o58
    o64.C0 = CFrame.new(0.200000003, -0.800000012, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    o64.C1 = CFrame.new(-0.0287921876, 0.764380395, -0.047000885, 1, 2.06057393e-13, -8.73114914e-11, -2.06057393e-13, 1, 2.39882315e-23, 8.73114914e-11, -5.99705313e-24, 1)
    o64.Part0 = o58
    o64.Name = "Right Hip"
    o64.Part1 = o49
    o65.Name = "_Transparency"
    o65.Parent = o58
    o66.Name = "_Color"
    o66.Parent = o58
    o67.Name = "Head"
    o67.Parent = o1
    o67.Material = Enum.Material.Neon
    o67.Position = Vector3.new(15.7057991, 5.67814207, -45.2593269)
    o67.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o67.Size = Vector3.new(0.683046341, 1.35615754, 1.04022193)
    o67.CFrame = CFrame.new(15.7057991, 5.67814207, -45.2593269, -1, 5.9296548e-05, -0.000225622818, 5.92547476e-05, 1, 0.000185270736, 0.000225633237, 0.000185257144, -1.00000155)
    o67.Position = Vector3.new(15.7057991, 5.67814207, -45.2593269)
    o68.Name = "ConvertedMesh"
    o68.Parent = o67
    o68.MeshId = "rbxassetid://717345105"
    o68.TextureId = "rbxassetid://717323842"
    o68.MeshType = Enum.MeshType.FileMesh
    o69.Name = "_Transparency"
    o69.Parent = o67
    o70.Name = "_Color"
    o70.Parent = o67
    o71.Parent = o1
    o71.DisplayDistanceType = "None"
    o71.HipHeight = 0.64
    o71.RightLeg = o49
    o71.LeftLeg = o44
    o71.Torso = o72
    o72.Name = "HumanoidRootPart"
    o72.Parent = o1
    o72.Material = Enum.Material.SmoothPlastic
    o72.Transparency = 1
    o72.Position = Vector3.new(15.8505878, 4.22609138, -45.434021)
    o72.Rotation = Vector3.new(-179.98999, -0.00999999978, -180)
    o72.Size = Vector3.new(2, 2, 1)
    o72.CFrame = CFrame.new(15.8505878, 4.22609138, -45.434021, -1, 6.11259238e-05, -0.000225620781, 6.10841234e-05, 1, 0.000185269164, 0.000225631928, 0.00018525531, -1.00000048)
    o72.Position = Vector3.new(15.8505878, 4.22609138, -45.434021)
    o73.Name = "Root Hip"
    o73.Parent = o72
    o73.C0 = CFrame.new(0, 0, 0, 1, -8.63309424e-13, 7.27595761e-11, -8.63309424e-13, 1, -2.91038305e-11, 7.27595761e-11, -2.91038305e-11, 1.00000107)
    o73.C1 = CFrame.new(-0.0724601746, 0.0473308563, 0.0871963501, 1, -1.82937538e-06, -1.70257153e-09, 1.82937538e-06, 1, -1.39698375e-09, 1.70257408e-09, 1.39698064e-09, 1)
    o73.Part0 = o72
    o73.Part1 = o58
    o74.Name = "_Transparency"
    o74.Parent = o72
    o74.Value = 1
    o75.Name = "_Color"
    o75.Parent = o72
    o76.Name = "AnimSaves"
    o76.Parent = o1
    mas.Parent = workspace
    local mas1 = mas:GetChildren()
    s=nil
    for i=1,#mas1 do
        mas1[i].Parent = workspace 
        mas1[i]:MoveTo(Players.LocalPlayer.Character.HumanoidRootPart.Position)
        s=mas1[i]
    end
    mas:Destroy()
    for i=1,#cors do
        coroutine.resume(cors[i])
    end
    return s
end

wait(1)
Players.LocalPlayer.Character=load096Char()

wait()
local Player,Mouse do
    Player= owner
    pcall(function()
        local OldMouseFolder = Player.MouseFolder
        for _,v in pairs(Player:GetDescendants()) do
            if v:IsDescendantOf(OldMouseFolder) then
                game:GetService("Debris"):AddItem(v,0)
            end
        end
        wait(0.1)
        OldMouseFolder:Destroy()
    end)
    task.wait()
    local MouseFolder = Instance.new("Folder",Player)
    MouseFolder.Name = "MouseFolder"
    local Remote = Instance.new("RemoteEvent",MouseFolder)
    Remote.Name = "MainRemote"
    function mouseEvent (name)
        local Bind = Instance.new("BindableEvent",MouseFolder)
        Bind.Name = name
        return Bind
    end
    FakeMouse = {KeyDown = mouseEvent("KeyDown"), KeyUp = mouseEvent("KeyUp"), Button1Down = mouseEvent("Button1Down"), Button1Up = mouseEvent("Button1Up")}
    Mouse = {Hit = CFrame.new(0, 0, 0), Target = nil, KeyDown = FakeMouse.KeyDown.Event, KeyUp = FakeMouse.KeyUp.Event, Button1Down = FakeMouse.Button1Down.Event, Button1Up = FakeMouse.Button1Up.Event}
    Remote.OnServerEvent:Connect(function(plr,Method,arg1,arg2)
        local Event = MouseFolder:FindFirstChild(Method)
        if Event then
            Event:Fire(arg1)
        end
    end)
    NLS([==[
task.wait()
script.Parent = nil

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local MouseFolder = Player.MouseFolder
local Event = nil
repeat wait()
Event = MouseFolder:FindFirstChild("MainRemote")
until Event ~= nil
warn("Loaded!")
local input = game:GetService("UserInputService")
warn(Event,MouseFolder)
local function oninput(io,k)
    if k then
        return
    end
    if io.UserInputState == Enum.UserInputState.Begin then
        if io.UserInputType == Enum.UserInputType.MouseButton1 then
            Event:FireServer("Button1Down")
        elseif io.UserInputType == Enum.UserInputType.Keyboard then
            Event:FireServer("KeyDown",io.KeyCode.Name:lower())
        end
    elseif io.UserInputState == Enum.UserInputState.End then
        if io.UserInputType == Enum.UserInputType.MouseButton1 then
            Event:FireServer("Button1Up")
        elseif io.UserInputType == Enum.UserInputType.Keyboard then
            Event:FireServer("KeyUp",io.KeyCode.Name:lower())
        end
    end
end
input.InputEnded:Connect(oninput)
input.InputBegan:Connect(oninput)
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        Event:FireServer("MouseData",Mouse.Hit,Mouse.Target)
    end)
end)
    ]==], Player.PlayerGui)
    --NLS(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/Auxnos/vsb_stuff/main/p1/movement2.lua"),Player.PlayerGui)
end
mouse = Mouse
local plr = Players.LocalPlayer
local char = plr.Character
local cam=workspace.CurrentCamera
hum=char.Humanoid
local torso = char.Torso
local rs = torso["Right Shoulder"]
local ls = torso["Left Shoulder"]
local rh = torso["Right Hip"]
local lh = torso["Left Hip"]
local rj = char.HumanoidRootPart['Root Hip']
local lla = char['Left Arm'].LeftLowerArm
local rla = char['Right Arm'].RightLowerArm
local lll = char['Left Leg'].LeftLowerLeg
local rll = char['Right Leg'].RightLowerLeg
local lha = char['LeftArmLower'].LeftHand
local lf = char['LeftLegLower'].LeftFoot
local rf = char['RightLegLower'].RightFoot
local rha = char['RightArmLower'].RightHand
local neck = torso.Neck
local animpose = "Idle"
evil=false
hum.WalkSpeed = 13
for i,v in pairs (char:GetChildren()) do
    if v.ClassName=="Part" then
        v.CanCollide=false
    end
end
function sound(id,loop)
    s=Instance.new("Sound",char.Torso)
    s.SoundId=id
    if loop==true then
        s.Looped=true
    end
    if loop==false then
        s.PlaybackSpeed=1+math.random(-100,100)/1000
        s.Volume = 2
    end
    wait()
    s:Play()
end
sound("rbxassetid://132476475",true)

function panic()
    if evil==false and sitting==false and cananim==true then
        for i,v in pairs (torso:GetChildren()) do
            if v.Name=="Sound" then
                v:Destroy()
            end
        end
        sound("rbxassetid://132820284",false)
        hum.WalkSpeed = 0
        hum.JumpPower = 0
        repeat swait()
            cananim = false
            for i=0,0.25,0.01 do
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.29354769, 0.459787697, 0.229317024, -0.967088938, 0.254438519, -3.686703e-07, 0.254438519, 0.967088938, -6.32919864e-07, 1.95497776e-07, -7.05893626e-07, -1), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.22730124, 0.418191642, 0.0528470166, 0.982042491, 0.188659757, 8.34452567e-06, -0.188659757, 0.982042491, -6.51023129e-08, -8.20695732e-06, -1.51034283e-06, 1), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.352487892, 0.413615525, 0.0416403711, -0.857645214, 0.506858468, 0.0868284926, -0.405339748, -0.770219624, 0.492403775, 0.316456079, 0.387112707, 0.866025031), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.3161605, 0.391137004, 0.0134935081, -0.995942175, 0.0899839103, -0.00154357078, -0.0713292137, -0.799698591, -0.596149504, -0.0548782274, -0.593620241, 0.802871883), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791113, 0.164661422, 1, 2.34479103e-13, -1.89174898e-10, 3.26189215e-11, 0.984807789, 0.17364797, 1.86341637e-10, -0.17364797, 0.984807789), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882513, -0.0237731934, 1, 1.10134124e-13, -1.45519152e-11, -5.08054362e-12, 0.939692557, -0.342020363, 1.36366586e-11, 0.342020363, 0.939692557), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905065, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -2.13162821e-13, 1, -2.9103768e-11, 1.30967237e-10, 2.9103768e-11, 1), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.0724544525, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.700875044, 0.487717897, 0.0238903761, 0.923476458, -0.183700353, -0.336815983, 0.288695663, -0.245466858, 0.925419211, -0.252676994, -0.95184046, -0.17364946), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517521, 0.69294405, -0.0438308232, 0.965444028, -0.090437606, -0.244414806, 0.0942148119, 0.995544672, 0.00378222764, 0.242983788, -0.0266789496, 0.969663262), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.743169188, 0.502686918, 0.100726545, -0.838672042, -0.544636846, -2.25606855e-05, -2.20039092e-05, -7.49570108e-06, 1, -0.544636846, 0.838672042, -5.74432943e-06), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287922174, 0.764380336, -0.047000885, 0.884364784, 0.259600818, -0.387951195, -0.376348585, 0.888195515, -0.263572216, 0.276152909, 0.379098952, 0.883189321), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724602044, 0.0473308414, 0.087196365, 0.917539477, -0.163047865, 0.36267975, 0.0811377391, 0.969647944, 0.230649695, -0.38927868, -0.182203174, 0.90291971), i)
                swait()
            end
            for i=0,0.25,0.01 do
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.29354769, 0.459787697, 0.229317024, -0.967088938, 0.254438519, -3.686703e-07, 0.254438519, 0.967088938, -6.32919864e-07, 1.95497776e-07, -7.05893626e-07, -1), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.22730124, 0.418191642, 0.0528470166, 0.982042491, 0.188659757, 8.34452567e-06, -0.188659757, 0.982042491, -6.51023129e-08, -8.20695732e-06, -1.51034283e-06, 1), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.352487892, 0.413615525, 0.0416403711, -0.857645214, 0.506858468, 0.0868284926, -0.405339748, -0.770219624, 0.492403775, 0.316456079, 0.387112707, 0.866025031), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.3161605, 0.391137004, 0.0134935081, -0.995942175, 0.0899839103, -0.00154357078, -0.0713292137, -0.799698591, -0.596149504, -0.0548782274, -0.593620241, 0.802871883), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791113, 0.164661422, 1, 2.34479103e-13, -1.89174898e-10, 3.26189215e-11, 0.984807789, 0.17364797, 1.86341637e-10, -0.17364797, 0.984807789), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882513, -0.0237731934, 1, 1.10134124e-13, -1.45519152e-11, -5.08054362e-12, 0.939692557, -0.342020363, 1.36366586e-11, 0.342020363, 0.939692557), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905065, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -2.13162821e-13, 1, -2.9103768e-11, 1.30967237e-10, 2.9103768e-11, 1), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.0724544525, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.700875044, 0.487717897, 0.0238903761, 0.923476458, -0.183700353, -0.336815983, 0.288695663, -0.245466858, 0.925419211, -0.252676994, -0.95184046, -0.17364946), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517111, 0.69294399, -0.0438309014, 0.974293172, -0.210014567, 0.0815265924, 0.111379176, 0.763602078, 0.636008263, -0.195824891, -0.610578179, 0.767363608), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.743169188, 0.502686918, 0.100726545, -0.838672042, -0.544636846, -2.25606855e-05, -2.20039092e-05, -7.49570108e-06, 1, -0.544636846, 0.838672042, -5.74432943e-06), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921801, 0.764380395, -0.047000885, 0.985723436, 0.168369591, 0.000888645591, -0.165816396, 0.969832778, 0.178687736, 0.029223742, -0.176284045, 0.983905435), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601969, 0.0473308563, 0.0871963426, 0.998181462, 0.010311312, 0.0593911707, 0.0103149191, 0.941511035, -0.336824059, -0.0593905449, 0.336824179, 0.939692616), i)
                swait()
            end
            for i=0,0.25,0.01 do
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.29354769, 0.459787697, 0.229317024, -0.967088938, 0.254438519, -3.686703e-07, 0.254438519, 0.967088938, -6.32919864e-07, 1.95497776e-07, -7.05893626e-07, -1), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.22730124, 0.418191642, 0.0528470166, 0.982042491, 0.188659757, 8.34452567e-06, -0.188659757, 0.982042491, -6.51023129e-08, -8.20695732e-06, -1.51034283e-06, 1), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.352487892, 0.413615525, 0.0416403711, -0.857645214, 0.506858468, 0.0868284926, -0.405339748, -0.770219624, 0.492403775, 0.316456079, 0.387112707, 0.866025031), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.3161605, 0.391137004, 0.0134935081, -0.995942175, 0.0899839103, -0.00154357078, -0.0713292137, -0.799698591, -0.596149504, -0.0548782274, -0.593620241, 0.802871883), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791113, 0.164661422, 1, 2.34479103e-13, -1.89174898e-10, 3.26189215e-11, 0.984807789, 0.17364797, 1.86341637e-10, -0.17364797, 0.984807789), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882513, -0.0237731934, 1, 1.10134124e-13, -1.45519152e-11, -5.08054362e-12, 0.939692557, -0.342020363, 1.36366586e-11, 0.342020363, 0.939692557), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905065, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -2.13162821e-13, 1, -2.9103768e-11, 1.30967237e-10, 2.9103768e-11, 1), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.0724544525, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.700875044, 0.487717897, 0.0238903761, 0.923476458, -0.183700353, -0.336815983, 0.288695663, -0.245466858, 0.925419211, -0.252676994, -0.95184046, -0.17364946), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.69294399, -0.0438308567, 0.940150678, -0.339422107, -0.0301536545, 0.329029411, 0.881210804, 0.339421719, -0.0886355117, -0.329029024, 0.940150857), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.743169188, 0.502686918, 0.100726545, -0.838672042, -0.544636846, -2.25606855e-05, -2.20039092e-05, -7.49570108e-06, 1, -0.544636846, 0.838672042, -5.74432943e-06), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287922025, 0.764380455, -0.0470008701, 0.999541819, -0.00259801745, -0.0301536545, -0.00259801745, 0.985265851, -0.171009868, 0.0301536545, 0.171009868, 0.984807789), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601895, 0.04733086, 0.0871963501, 0.984808028, 0.173646346, -1.91928917e-09, -0.173646346, 0.984808028, -1.080112e-09, 1.70257408e-09, 1.39698064e-09, 1), i)
                swait()
            end
        until torso:FindFirstChild("Sound")==nil or torso:WaitForChild("Sound").Playing == false
        for i,v in pairs (torso:GetChildren()) do
            if v.Name=="Sound" then
                v:Destroy()
            end
        end
        hum.JumpPower = 100
        sound("rbxassetid://134147361",true)
        cananim = true
        hum.WalkSpeed = 50
        evil = true
        n=0
        repeat n=n+1 wait(1) until n==100 or animpose == "Idle" and n>=10
        evil=false
        hum.JumpPower = 0
        for i,v in pairs (torso:GetChildren()) do
            if v.Name=="Sound" then
                v:Destroy()
            end
        end
        sound("rbxassetid://132476475",true)
    end
end

cananim = true
num=0
cam.CameraSubject = char.Head
local attacking = false
if char:FindFirstChild("Animate") then char.Animate:Destroy() end
if char:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator") then char:FindFirstChildOfClass("Humanoid").Animator:Destroy() end

local running = false
mouse.KeyDown:connect(function (key) -- Run function
    key = string.lower(key)
    if key == "e" and evil==false then
        sitting = not sitting
        if sitting==true then
            animpose = "Sitting"
            hum.WalkSpeed = 0
            hum.JumpPower = 0
        else
            hum.WalkSpeed = 13
            hum.JumpPower = 0
        end
    end
    if key == "m" and evil == false then
        panic()
    end
end)
sitting=false
hum.Running:connect(function(speed)
    if speed < 0.1 then
        if sitting==false then
            animpose = "Idle"
        else
            animpose = "Sitting"
        end
    elseif speed > 0.1 then
        if sitting==false then
            animpose = "Running"
        else
            animpose = "Sitting"
        end
    end
end)

hum.FreeFalling:connect(function(active)
    if active == true then
        if sitting==false then
            animpose = "Falling"
        else
            animpose = "Sitting"
        end
    end
end)
deb=true
char.Torso.Touched:connect(function(prt)
    huma=prt.Parent:FindFirstChildOfClass("Humanoid")
    if huma~=nil and evil==true and deb==true then
        jab()
        deb=false
        attacking=true
        huma.Parent:BreakJoints()
        sound("rbxassetid://347611423",false)
        wait(1)
        attacking=false
        deb=true
    end
end)


function swait(t)
    if t == nil or t == 0 then
        game:service('RunService').Stepped:wait(0)
        return true
    else
        for i = 0, t do
            game:service('RunService').Stepped:wait(0)
        end
        return true
    end
end

function jab()
    if evil == true and attacking == false then
        for i=0,1,0.1 do
            rha.C1 = rha.C1:Lerp(CFrame.new(-0.29354766, 0.459787697, 0.229317009, -0.995789468, -0.0916698948, -1.29965414e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497748e-07, -7.05893626e-07, -1), i)
            lha.C1 = lha.C1:Lerp(CFrame.new(0.22730127, 0.418191671, 0.0528470166, 0.93436265, 0.356323451, 8.206448e-06, -0.356323451, 0.93436265, -1.51312463e-06, -8.20695823e-06, -1.51034283e-06, 1), i)
            lla.C1 = lla.C1:Lerp(CFrame.new(0.637943864, 0.729294896, 0.0416403934, 0.986954808, -0.160997555, -4.03047716e-06, 0.160997555, 0.986954808, 1.67676558e-06, 3.70794373e-06, -2.30378828e-06, 1), i)
            rla.C1 = rla.C1:Lerp(CFrame.new(0.618833482, 0.693874836, 0.0468753539, 0.995789468, -0.0916699693, -1.95501926e-07, 0.0916699693, 0.995789468, 7.05883849e-07, 1.29970402e-07, -7.20833327e-07, 1), i)
            lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
            rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791142, 0.164661407, 1, 2.34479103e-13, -1.89174898e-10, -2.34479103e-13, 1, -4.36555792e-11, 1.89174898e-10, 4.36555792e-11, 1), i)
            lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882519, -0.023773253, 1, 1.10134124e-13, -1.45519152e-11, -8.69128207e-12, 0.806557178, -0.591156065, 1.16718449e-11, 0.591156065, 0.806557178), i)
            rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905124, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -9.41566686e-11, 0.696249545, -0.717799783, 9.10328687e-11, 0.717799783, 0.696249545), i)
            neck.C1 = neck.C1:Lerp(CFrame.new(-0.0724544525, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, 3.05891011e-12, 0.97603941, 0.217593715, 1.42272071e-11, -0.217593715, 0.97603941), i)
            ls.C1 = ls.C1:Lerp(CFrame.new(0.67334193, 0.563364267, -0.0563961864, 0.616153061, -0.667704582, 0.417763084, -0.526906133, 0.0448073, 0.848741651, -0.585427523, -0.743076622, -0.324209511), i)
            lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.69294399, -0.0438308902, 1, 1.10134124e-13, -1.45519152e-11, -2.00783552e-12, 0.99145174, -0.130473748, 1.44131521e-11, 0.130473748, 0.99145174), i)
            rs.C1 = rs.C1:Lerp(CFrame.new(0.743169308, 0.502686918, 0.100726783, -0.710828781, -0.545019269, 0.444608003, 0.55913043, -0.0543531664, 0.827296138, -0.42672652, 0.836659968, 0.343372703), i)
            rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380455, -0.047000885, 1, 2.06057393e-13, -8.73114914e-11, -1.45380756e-11, 0.986430347, -0.16418016, 8.60928759e-11, 0.16418016, 0.986430347), i)
            rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601746, 0.0473308265, 0.938160837, 1, -1.82937549e-06, -1.70259462e-09, 1.61666753e-06, 0.884161353, -0.467181593, 8.5615585e-07, 0.467181593, 0.884161353), i)
            swait()
        end

        for i=0,1,0.4 do
            rha.C1 = rha.C1:Lerp(CFrame.new(-0.29354766, 0.459787697, 0.229317009, -0.995789468, -0.0916698948, -1.29965414e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497748e-07, -7.05893626e-07, -1), i)
            lha.C1 = lha.C1:Lerp(CFrame.new(0.22730127, 0.418191671, 0.0528470166, 0.93436265, 0.356323451, 8.206448e-06, -0.356323451, 0.93436265, -1.51312463e-06, -8.20695823e-06, -1.51034283e-06, 1), i)
            lla.C1 = lla.C1:Lerp(CFrame.new(0.637943864, 0.729294896, 0.0416403934, 0.986954808, -0.160997555, -4.03047716e-06, 0.160997555, 0.986954808, 1.67676558e-06, 3.70794373e-06, -2.30378828e-06, 1), i)
            rla.C1 = rla.C1:Lerp(CFrame.new(0.618833482, 0.693874836, 0.0468753539, 0.995789468, -0.0916699693, -1.95501926e-07, 0.0916699693, 0.995789468, 7.05883849e-07, 1.29970402e-07, -7.20833327e-07, 1), i)
            lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
            rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791142, 0.164661407, 1, 2.34479103e-13, -1.89174898e-10, -2.34479103e-13, 1, -4.36555792e-11, 1.89174898e-10, 4.36555792e-11, 1), i)
            lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882519, -0.023773253, 1, 1.10134124e-13, -1.45519152e-11, -8.69128207e-12, 0.806557178, -0.591156065, 1.16718449e-11, 0.591156065, 0.806557178), i)
            rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905124, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -9.41566686e-11, 0.696249545, -0.717799783, 9.10328687e-11, 0.717799783, 0.696249545), i)
            neck.C1 = neck.C1:Lerp(CFrame.new(-0.0724544525, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, 3.05891011e-12, 0.97603941, 0.217593715, 1.42272071e-11, -0.217593715, 0.97603941), i)
            ls.C1 = ls.C1:Lerp(CFrame.new(0.67334193, 0.563364148, -0.0563963056, 0.616153061, -0.667704582, 0.417763084, -0.65804702, -0.144935519, 0.73889637, -0.43281582, -0.730180979, -0.528683484), i)
            lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.69294399, -0.0438308902, 1, 1.10134124e-13, -1.45519152e-11, -2.00783552e-12, 0.99145174, -0.130473748, 1.44131521e-11, 0.130473748, 0.99145174), i)
            rs.C1 = rs.C1:Lerp(CFrame.new(0.743169427, 0.502686918, 0.100726902, -0.583523989, -0.734647751, 0.346110135, 0.55913043, -0.0543531664, 0.827296138, -0.588959098, 0.67626816, 0.442480356), i)
            rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380455, -0.047000885, 1, 2.06057393e-13, -8.73114914e-11, -1.45380756e-11, 0.986430347, -0.16418016, 8.60928759e-11, 0.16418016, 0.986430347), i)
            rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601746, -0.474858135, 1.41019452, 1, -1.82937549e-06, -1.70259462e-09, 1.31083311e-06, 0.717195392, -0.696872056, 1.27606165e-06, 0.696872056, 0.717195392), i)
            swait()
        end
        wait()
    end
end

wait()


while swait() do
    num = num + 0.05
    local sin = math.sin(num)
    if animpose == "Falling" and cananim then

    end

    if animpose == "Idle" and cananim then print("idle")
        rha.C1 = rha.C1:Lerp(CFrame.new(-0.293547809, 0.459787965, 0.229317009, -0.995789468, -0.0916698948, -1.29965372e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497748e-07, -7.05893626e-07, -1), 0.2)
        lha.C1 = lha.C1:Lerp(CFrame.new(0.227301165, 0.418191493, 0.0528470166, 0.987125516, 0.159946054, 8.34287857e-06, -0.159946054, 0.987125516, 1.78226969e-07, -8.2069555e-06, -1.5103418e-06, 1), 0.2)
        lla.C1 = lla.C1:Lerp(CFrame.new(0.637944102, 0.729295135, 0.0416403934, 0.999917626, 0.0128312707, -3.67807729e-06, -0.0128312707, 0.999917626, 2.35117659e-06, 3.70794373e-06, -2.30378828e-06, 1), 0.2)
        rla.C1 = rla.C1:Lerp(CFrame.new(0.618834078, 0.693875313, 0.0468753539, 0.996579707, 0.0826397091, -6.99563856e-08, -0.0826397091, 0.996579707, 7.29108535e-07, 1.29970417e-07, -7.20833384e-07, 1), 0.2)
        lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, 4.87355902e-12, 0.939692557, 0.342020363, 1.37119942e-11, -0.342020363, 0.939692557), 0.2)
        rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791142, 0.164661407, 1, 2.34479103e-13, -1.89174898e-10, 6.44812953e-11, 0.939692616, 0.342020184, 1.7784646e-10, -0.342020184, 0.939692616), 0.2)
        lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.688825071, -0.023773104, 1, 1.10134124e-13, -1.45519152e-11, -9.43815772e-12, 0.766044438, -0.642787576, 1.10766205e-11, 0.642787576, 0.766044438), 0.2)
        rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905124, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -8.43474318e-11, 0.766044259, -0.642787755, 1.00189683e-10, 0.642787755, 0.766044259), 0.2)
        neck.C1 = neck.C1:Lerp(CFrame.new(0.0128192976, -0.158104718, 0.155680761, 1, 1.10134124e-13, -1.45519152e-11, -6.35894115e-12, 0.902757108, -0.430150717, 1.30894705e-11, 0.430150717, 0.902757108), 0.2)
        ls.C1 = ls.C1:Lerp(CFrame.new(0.67334193, 0.563364208, -0.056396246, 0.817818403, 0.575475991, 6.52994504e-06, -0.498381108, 0.708252072, 0.499995351, 0.287730753, -0.408908784, 0.86602807), 0.2)
        lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.606096148, 0.102941543, 1, 1.10134124e-13, -1.45519152e-11, 9.26942117e-12, 0.766044378, 0.642787516, 1.12182061e-11, -0.642787516, 0.766044378), 0.2)
        rs.C1 = rs.C1:Lerp(CFrame.new(0.68687731, 0.523756921, 0.104441702, -0.798633933, 0.601817131, -1.31341594e-05, 0.521177828, 0.691633582, 0.500016928, 0.300927788, 0.399323642, -0.866015673), 0.2)
        rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.649838805, 0.0892261863, 1, 2.06057393e-13, -8.73114914e-11, 5.59648751e-11, 0.766044497, 0.642787397, 6.70169337e-11, -0.642787397, 0.766044497), 0.2)
        rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601597, 0.204151258, 0.114848062, 1, -1.82937538e-06, -1.70256931e-09, 1.71846807e-06, 0.939692557, -0.342020124, 6.272831e-07, 0.342020124, 0.939692557), 0.2)
    end
    if animpose == "Sitting" and cananim then
        for i=0,0.03,0.0001 do
            if animpose == "Sitting" and cananim then
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.302775681, 0.318320155, 0.229316682, -0.861117244, 0.0278786272, 0.507642269, 0.500429809, 0.222665697, 0.836654305, -0.0897096992, 0.974496484, -0.205692425), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.220425308, 0.420326442, 0.150338039, 0.490519881, -0.453916073, 0.743875086, 0.826047778, 0.514080584, -0.231010988, -0.277552277, 0.727791905, 0.627123296), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.601134419, 0.509213328, 0.0416403934, 0.329934597, 0.944003522, 9.51406662e-07, -0.944003522, 0.329934597, 4.26041242e-06, 3.70794373e-06, -2.30378828e-06, 1), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.649315834, 0.449614406, 0.0468749404, 0.0916699395, 0.995789468, 7.06133562e-07, -0.862379313, 0.0793881938, 0.500000298, 0.497895032, -0.045835603, 0.86602515), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624935, 0.0690228939, 0.148349762, 0.999544144, 0.030191958, -1.45452816e-11, -0.0276830867, 0.916484714, -0.399110943, -0.0120499404, 0.398929, 0.916902661), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.320267409, 0.068168968, 1, 2.34479103e-13, -1.89174898e-10, -1.05376347e-10, 0.831181526, -0.556001127, 1.57108312e-10, 0.556001127, 0.831181526), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882525, -0.0237727761, 1, 1.10134124e-13, -1.45519152e-11, -1.45383384e-11, -0.0362804234, -0.999341607, -6.38010478e-13, 0.999341607, -0.0362804234), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905065, -0.0364951491, 1, 2.13162821e-13, -1.30967237e-10, -1.28854108e-10, 0.180519491, -0.98357141, 2.34324782e-11, 0.98357141, 0.180519491), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.0230499171, -0.179627061, 0.152214378, 1, 1.10134124e-13, -1.45519152e-11, -5.39207047e-12, 0.931598306, -0.363489598, 1.35165074e-11, 0.363489598, 0.931598306), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.678403199, 0.407945633, -0.0858472586, 0.850212395, 0.0582243912, 0.52320987, -0.489579618, 0.452796966, 0.745175421, -0.193520635, -0.889710307, 0.413479418), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.057951808, 0.692943513, -0.0438310504, 0.999898791, -0.0142210424, 0.000328212976, -0.00956585724, -0.655153573, 0.755435109, -0.0105280261, -0.755361795, -0.65522337), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.696939707, 0.422219247, 0.0335236788, -0.729678154, 0.385350525, 0.564867556, 0.638165534, 0.0870747864, 0.764959693, 0.245591909, 0.91865319, -0.309453785), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380395, -0.0470010042, 1, 2.06057393e-13, -8.73114914e-11, 7.07484904e-11, -0.58792913, 0.808912337, -5.11662934e-11, -0.808912337, -0.58792913), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601373, 3.06046629, -0.150215775, 0.999800622, 0.0199715495, -1.73014481e-09, -0.0199635159, 0.999398351, 0.0283600818, 0.000566397212, -0.0283544213, 0.999597669), i)
                swait()
            else
                break
            end
        end
        for i=0,0.03,0.0001 do
            if animpose == "Sitting" and cananim then
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.302775681, 0.318320155, 0.229316682, -0.861117244, 0.0278786272, 0.507642269, 0.500429809, 0.222665697, 0.836654305, -0.0897096992, 0.974496484, -0.205692425), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.220425308, 0.420326442, 0.150338039, 0.490519881, -0.453916073, 0.743875086, 0.826047778, 0.514080584, -0.231010988, -0.277552277, 0.727791905, 0.627123296), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.601134419, 0.509213328, 0.0416403934, 0.329934597, 0.944003522, 9.51406662e-07, -0.944003522, 0.329934597, 4.26041242e-06, 3.70794373e-06, -2.30378828e-06, 1), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.649315834, 0.449614406, 0.0468749404, 0.0916699395, 0.995789468, 7.06133562e-07, -0.862379313, 0.0793881938, 0.500000298, 0.497895032, -0.045835603, 0.86602515), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624935, 0.0690228939, 0.148349762, 0.999544144, 0.030191958, -1.45452816e-11, -0.0276830867, 0.916484714, -0.399110943, -0.0120499404, 0.398929, 0.916902661), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.320267409, 0.068168968, 1, 2.34479103e-13, -1.89174898e-10, -1.05376347e-10, 0.831181526, -0.556001127, 1.57108312e-10, 0.556001127, 0.831181526), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882525, -0.0237727761, 1, 1.10134124e-13, -1.45519152e-11, -1.45383384e-11, -0.0362804234, -0.999341607, -6.38010478e-13, 0.999341607, -0.0362804234), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905065, -0.0364951491, 1, 2.13162821e-13, -1.30967237e-10, -1.28854108e-10, 0.180519491, -0.98357141, 2.34324782e-11, 0.98357141, 0.180519491), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.0230499171, -0.179627061, 0.152214378, 1, 1.10134124e-13, -1.45519152e-11, -5.39207047e-12, 0.931598306, -0.363489598, 1.35165074e-11, 0.363489598, 0.931598306), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.668025076, 0.407945633, -0.0858021379, 0.732750475, -0.249585673, 0.633074701, -0.489579618, 0.452796966, 0.745175421, -0.472639561, -0.855968177, 0.209595338), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.057951808, 0.692943573, -0.043830961, 0.999898791, -0.0142210424, 0.000328212976, -0.0112487031, -0.776367545, 0.630180001, -0.00870698784, -0.63011992, -0.776448965), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.722712398, 0.422219247, 0.0217650533, -0.769670546, 0.0479131378, 0.636641264, 0.638165534, 0.0870747864, 0.764959693, -0.0187837724, 0.995049298, -0.0975953341), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380455, -0.0470008552, 1, 2.06057393e-13, -8.73114914e-11, 6.07887282e-11, -0.719463348, 0.694530368, -6.26743102e-11, -0.694530368, -0.719463348), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601448, 3.05591655, 0.471186966, 0.999800622, 0.0199715495, -1.73014625e-09, -0.0197585803, 0.989138961, -0.14564909, -0.00290883612, 0.145620048, 0.989336252), i)
                swait()
            else
                break
            end
        end
    end
    if animpose == "Running" and cananim and evil==false then
        for i = 0, 0.25, 0.01 do
            if animpose == "Running" and cananim then
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.293547511, 0.459787548, 0.229317009, -0.995789468, -0.0916698948, -1.29965414e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497748e-07, -7.05893626e-07, -1), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.227301285, 0.41819188, 0.0528470166, 0.93436265, 0.356323451, 8.20644982e-06, -0.356323451, 0.93436265, -1.51312497e-06, -8.20695186e-06, -1.51034135e-06, 1), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.637943864, 0.729294896, 0.0416403934, 0.986954808, -0.160997555, -4.03047716e-06, 0.160997555, 0.986954808, 1.67676558e-06, 3.70794396e-06, -2.30378691e-06, 1), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.618833244, 0.693874657, 0.0468753539, 0.995789468, -0.0916699693, -1.95501926e-07, 0.0916699693, 0.995789468, 7.05883849e-07, 1.29970402e-07, -7.20833327e-07, 1), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.356397212, 0.190687045, 1, 2.34479103e-13, -1.89174898e-10, 3.26189596e-11, 0.98480773, 0.173648179, 1.86341623e-10, -0.173648179, 0.98480773), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.688825309, -0.0237731338, 1, 1.10134124e-13, -1.45519152e-11, -5.08053452e-12, 0.939692736, -0.342019737, 1.36366612e-11, 0.342019737, 0.939692736), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905005, -0.0364952236, 1, 2.13162821e-13, -1.30967237e-10, -4.49936893e-11, 0.939692736, -0.342019737, 1.22996058e-10, 0.342019737, 0.939692736), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.00672721863, -0.141462967, 0.167072386, 1, 1.10134124e-13, -1.45519152e-11, -5.98394815e-12, 0.914630175, -0.40429154, 1.32650948e-11, 0.40429154, 0.914630175), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.673342645, 0.563364089, -0.0563965738, 0.804146111, 0.566940427, -0.178681284, -0.493248671, 0.804163933, 0.331701756, 0.331744373, -0.178602338, 0.926308155), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.692944169, -0.0438309908, 1, 1.10134124e-13, -1.45519152e-11, 1.10766188e-11, 0.642787695, 0.766044319, 9.43815946e-12, -0.766044319, 0.642787695), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.64956969, 0.43283233, 0.0666594729, -0.798634291, 0.60181731, -1.33603144e-05, 0.592670619, 0.786499918, 0.173667014, 0.104526274, 0.138688415, -0.984804451), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380634, -0.0470009148, 1, 2.06057393e-13, -8.73114914e-11, 1.49585205e-11, 0.984807789, 0.173647776, 8.60208224e-11, -0.173647776, 0.984807789), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601522, 0.0473308302, 0.087196365, 1, -1.82937538e-06, -1.70256542e-09, 1.75327102e-06, 0.958663523, -0.284542114, 5.22166545e-07, 0.284542114, 0.958663523), i)
                swait()				
                i=i*1.5
            else
                break
            end
        end

        for i = 0, 0.25, 0.01 do
            if animpose == "Running" and cananim then
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.293547511, 0.459787548, 0.229317009, -0.995789468, -0.0916698948, -1.29965414e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497748e-07, -7.05893626e-07, -1), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.227301285, 0.41819188, 0.0528470166, 0.93436265, 0.356323451, 8.20644982e-06, -0.356323451, 0.93436265, -1.51312497e-06, -8.20695186e-06, -1.51034135e-06, 1), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.637943864, 0.729294896, 0.0416403934, 0.986954808, -0.160997555, -4.03047716e-06, 0.160997555, 0.986954808, 1.67676558e-06, 3.70794396e-06, -2.30378691e-06, 1), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.618833244, 0.693874657, 0.0468753539, 0.995789468, -0.0916699693, -1.95501926e-07, 0.0916699693, 0.995789468, 7.05883849e-07, 1.29970402e-07, -7.20833327e-07, 1), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0118996948, 0.127558708, 1, 1.10134124e-13, -1.45519152e-11, -1.10137153e-13, 0.99999994, -2.08616257e-07, 1.45519144e-11, 2.08616257e-07, 0.99999994), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.29327926, 0.164371058, 1, 2.34479103e-13, -1.89174898e-10, -2.34470619e-13, 0.99999994, 4.46598278e-08, 1.89174884e-10, -4.46598278e-08, 0.99999994), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882519, -0.0237731785, 1, 1.10134124e-13, -1.45519152e-11, -5.08053452e-12, 0.939692736, -0.342019737, 1.36366612e-11, 0.342019737, 0.939692736), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905303, -0.0364951044, 1, 2.13162821e-13, -1.30967237e-10, -4.49937691e-11, 0.939692438, -0.342020363, 1.22996016e-10, 0.342020363, 0.939692438), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.00672721863, -0.141462967, 0.167072386, 1, 1.10134124e-13, -1.45519152e-11, -5.98394815e-12, 0.914630175, -0.40429154, 1.32650948e-11, 0.40429154, 0.914630175), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.673342645, 0.563364089, -0.0563965738, 0.804146111, 0.566940427, -0.178681284, -0.493248671, 0.804163933, 0.331701756, 0.331744373, -0.178602338, 0.926308155), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.692944288, -0.0438308865, 1, 1.10134124e-13, -1.45519152e-11, 2.41844869e-12, 0.98480773, 0.17364791, 1.43499631e-11, -0.17364791, 0.98480773), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.64956969, 0.43283233, 0.0666594729, -0.798634291, 0.60181731, -1.33603144e-05, 0.592670619, 0.786499918, 0.173667014, 0.104526274, 0.138688415, -0.984804451), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380693, -0.0470011234, 1, 2.06057393e-13, -8.73114914e-11, 5.59648751e-11, 0.766044497, 0.642787397, 6.70169337e-11, -0.642787397, 0.766044497), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601522, 0.0473308228, 0.0871963724, 1, -1.82937538e-06, -1.70256542e-09, 1.75327102e-06, 0.958663523, -0.284542114, 5.22166545e-07, 0.284542114, 0.958663523), i)
                swait()
                i=i*1.5
            else
                break
            end
        end
    end



    if animpose == "Running" and evil and attacking==false then
        for i = 0, 0.25, 0.01 do
            if animpose == "Running" and evil and attacking==false then
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.293547511, 0.459787607, 0.229317009, -0.995789468, -0.0916698948, -1.29965414e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497748e-07, -7.05893626e-07, -1), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.22730124, 0.418191761, 0.0528470166, 0.93436265, 0.356323451, 8.206448e-06, -0.356323451, 0.93436265, -1.51312395e-06, -8.20695186e-06, -1.51034078e-06, 1), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.637943864, 0.729294896, 0.0416403934, 0.986954808, -0.160997555, -4.03047716e-06, 0.160997555, 0.986954808, 1.67676558e-06, 3.70794396e-06, -2.30378737e-06, 1), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.618833303, 0.693874657, 0.0468753539, 0.995789468, -0.0916699693, -1.95501926e-07, 0.0916699693, 0.995789468, 7.05883849e-07, 1.29970402e-07, -7.20833327e-07, 1), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791142, 0.164661407, 1, 2.34479103e-13, -1.89174898e-10, -2.34479103e-13, 1, -4.36555792e-11, 1.89174898e-10, 4.36555792e-11, 1), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882513, -0.0237731636, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905065, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -8.43474318e-11, 0.766044319, -0.642787755, 1.0018969e-10, 0.642787755, 0.766044319), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.0218992196, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.744518757, 0.563365042, 0.028113246, 0.441472083, -0.279901952, -0.852500319, -0.379102796, 0.802947104, -0.459952623, 0.813254356, 0.52624166, 0.248367056), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.692943871, -0.0438308418, 1, 1.10134124e-13, -1.45519152e-11, -7.37133445e-12, 0.866025388, -0.499999851, 1.2547261e-11, 0.499999851, 0.866025388), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.913512647, 0.502686679, -0.046594739, -0.500908375, -0.326773942, -0.801442266, 0.38953504, 0.741784215, -0.54591167, 0.772886515, -0.585641265, -0.244275793), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380395, -0.0470008254, 1, 2.06057393e-13, -8.73114914e-11, 8.59492408e-11, 0.173648223, 0.98480767, 1.53644111e-11, -0.98480767, 0.173648223), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601448, 0.0473308191, 0.0871963426, 1, -1.82937538e-06, -1.7025531e-09, 1.71846818e-06, 0.939692616, -0.342020124, 6.272831e-07, 0.342020124, 0.939692616), i)
                swait()
                i=i*1.5
            else
                break
            end
        end
        for i = 0, 0.25, 0.01 do
            if animpose == "Running" and evil and attacking==false then
                rha.C1 = rha.C1:Lerp(CFrame.new(-0.293547511, 0.459787607, 0.229317009, -0.995789468, -0.0916698948, -1.29965414e-07, -0.0916698948, 0.995789468, -7.20842706e-07, 1.95497748e-07, -7.05893626e-07, -1), i)
                lha.C1 = lha.C1:Lerp(CFrame.new(0.22730124, 0.418191761, 0.0528470166, 0.93436265, 0.356323451, 8.206448e-06, -0.356323451, 0.93436265, -1.51312395e-06, -8.20695186e-06, -1.51034078e-06, 1), i)
                lla.C1 = lla.C1:Lerp(CFrame.new(0.637943864, 0.729294896, 0.0416403934, 0.986954808, -0.160997555, -4.03047716e-06, 0.160997555, 0.986954808, 1.67676558e-06, 3.70794396e-06, -2.30378737e-06, 1), i)
                rla.C1 = rla.C1:Lerp(CFrame.new(0.618833303, 0.693874657, 0.0468753539, 0.995789468, -0.0916699693, -1.95501926e-07, 0.0916699693, 0.995789468, 7.05883849e-07, 1.29970402e-07, -7.20833327e-07, 1), i)
                lf.C1 = lf.C1:Lerp(CFrame.new(0.0439624786, 0.0690228939, 0.148349762, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                rf.C1 = rf.C1:Lerp(CFrame.new(-0.0352039337, -0.277791142, 0.164661407, 1, 2.34479103e-13, -1.89174898e-10, -2.34479103e-13, 1, -4.36555792e-11, 1.89174898e-10, 4.36555792e-11, 1), i)
                lll.C1 = lll.C1:Lerp(CFrame.new(0.11425972, 0.68882513, -0.0237731934, 1, 1.10134124e-13, -1.45519152e-11, -9.43816032e-12, 0.766044319, -0.642787755, 1.10766188e-11, 0.642787755, 0.766044319), i)
                rll.C1 = rll.C1:Lerp(CFrame.new(-0.115375519, 0.646905065, -0.0364952087, 1, 2.13162821e-13, -1.30967237e-10, -2.13162821e-13, 1, -2.9103768e-11, 1.30967237e-10, 2.9103768e-11, 1), i)
                neck.C1 = neck.C1:Lerp(CFrame.new(-0.0153465196, -0.299405336, 0.0871963501, 1, 1.10134124e-13, -1.45519152e-11, -1.10134124e-13, 1, 3.20532468e-24, 1.45519152e-11, -1.60266224e-24, 1), i)
                ls.C1 = ls.C1:Lerp(CFrame.new(0.673341691, 0.563364983, -0.0563952327, 0.441472083, -0.279901981, -0.852500319, -0.379102767, 0.802947104, -0.459952623, 0.813254416, 0.52624166, 0.248367056), i)
                lh.C1 = lh.C1:Lerp(CFrame.new(0.0579517335, 0.69294399, -0.0438308716, 1, 1.10134124e-13, -1.45519152e-11, 1.43117141e-11, 0.173648089, 0.98480773, 2.63537326e-12, -0.98480773, 0.173648089), i)
                rs.C1 = rs.C1:Lerp(CFrame.new(0.743169427, 0.50268656, 0.100726545, -0.500908315, -0.326773912, -0.801442266, 0.38953498, 0.741784096, -0.54591167, 0.772886515, -0.585641265, -0.244275793), i)
                rh.C1 = rh.C1:Lerp(CFrame.new(-0.0287921876, 0.764380395, -0.047000885, 1, 2.06057393e-13, -8.73114914e-11, -4.38341967e-11, 0.866025388, -0.5, 7.55109378e-11, 0.5, 0.866025388), i)
                rj.C1 = rj.C1:Lerp(CFrame.new(-0.0724601448, 0.0473308191, 0.0871963426, 1, -1.82937538e-06, -1.7025531e-09, 1.71846818e-06, 0.939692616, -0.342020124, 6.272831e-07, 0.342020124, 0.939692616), i)
                swait()
                i=i*1.5
            else
                break
            end
        end
    end

    if animpose == "Jump" and cananim then
        for i = 0, 0.8, 0.1 do
            if animpose == "Jump" and cananim then
                swait()
            else
                break
            end
        end
    end
end
