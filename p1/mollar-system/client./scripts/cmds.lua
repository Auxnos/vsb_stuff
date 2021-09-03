local CommandInfo = Instance.new("ScreenGui")
local Commands = Instance.new("ScreenGui")
do
    local Info_Outer = Instance.new("Frame")
    local Info_Inner = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local TextButton = Instance.new("TextButton")
    local Outer_Commands = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local TextBox = Instance.new("TextBox")
    local Inner_Commands = Instance.new("Frame")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local ExampleButton = Instance.new("TextButton")
    CommandInfo.Name = "CommandInfo"
    CommandInfo.ResetOnSpawn = false
    CommandInfo.DisplayOrder = 949921214
    CommandInfo.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    CommandInfo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Info_Outer.Name = "Info_Outer"
    Info_Outer.Parent = CommandInfo
    Info_Outer.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
    Info_Outer.BorderSizePixel = 0
    Info_Outer.Position = UDim2.new(0.263078094, 0, 0.474327505, 0)
    Info_Outer.Size = UDim2.new(0.472327799, 0, 0.294376493, 0)
    Info_Inner.Name = "Info_Inner"
    Info_Inner.Parent = CommandInfo
    Info_Inner.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    Info_Inner.BorderSizePixel = 0
    Info_Inner.Position = UDim2.new(0.268385142, 0, 0.484107554, 0)
    Info_Inner.Size = UDim2.new(0.462471396, 0, 0.274816662, 0)
    TextLabel.Parent = Info_Inner
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(1, 0, 1.00000226, 0)
    TextLabel.Font = Enum.Font.RobotoMono
    TextLabel.Text = "[ExampleCommand]\\n\\n\\n Info: \\n\\n\\n"
    TextLabel.TextColor3 = Color3.fromRGB(165, 165, 165)
    TextLabel.TextSize = 14.000
    TextButton.Parent = Info_Inner
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.BorderSizePixel = 0
    TextButton.Size = UDim2.new(0.0442622676, 0, 0.100000001, 0)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "X"
    TextButton.TextColor3 = Color3.fromRGB(255, 5, 5)
    TextButton.TextSize = 14.000
    Commands.Name = "Commands"
    Commands.DisplayOrder = 949921214
    Commands.ResetOnSpawn = false
    Commands.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    Commands.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Outer_Commands.Name = "Outer_Commands"
    Outer_Commands.Parent = Commands
    Outer_Commands.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
    Outer_Commands.BorderSizePixel = 0
    Outer_Commands.Position = UDim2.new(0.874147058, 0, 0.556234598, 0)
    Outer_Commands.Size = UDim2.new(0.125852823, 0, 0.443765283, 0)
    UIListLayout.Parent = Outer_Commands
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TextBox.Parent = Outer_Commands
    TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.BackgroundTransparency = 1.000
    TextBox.BorderSizePixel = 0
    TextBox.Size = UDim2.new(0.824999988, 0, 0.100000001, 0)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.PlaceholderColor3 = Color3.fromRGB(143, 143, 143)
    TextBox.PlaceholderText = "Search for commands here."
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(186, 186, 186)
    TextBox.TextSize = 14.000
    Inner_Commands.Name = "Inner_Commands"
    Inner_Commands.Parent = Commands
    Inner_Commands.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    Inner_Commands.BorderSizePixel = 0
    Inner_Commands.Position = UDim2.new(0.879454136, 0, 0.596544325, 0)
    Inner_Commands.Size = UDim2.new(0.115238726, 0, 0.403455734, 0)
    ScrollingFrame.Parent = Inner_Commands
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame.BackgroundTransparency = 1.000
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(0, 0, -9.24700032e-08, 0)
    ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 8, 0)
    UIListLayout_2.Parent = ScrollingFrame
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0.00100000005, 0)
    ExampleButton.Name = "ExampleButton"
    ExampleButton.Parent = ScrollingFrame
    ExampleButton.BackgroundColor3 = Color3.fromRGB(148, 90, 91)
    ExampleButton.BackgroundTransparency = 1.000
    ExampleButton.BorderSizePixel = 0
    ExampleButton.Size = UDim2.new(0.936999977, 0, 0.00999999978, 0)
    ExampleButton.Font = Enum.Font.SourceSans
    ExampleButton.Text = "ExampleButton"
    ExampleButton.TextColor3 = Color3.fromRGB(171, 171, 171)
    ExampleButton.TextSize = 14.000
end
wait(1)
script.Parent = nil
local NewCommandInfo = CommandInfo:Clone()
NewCommandInfo.Parent = game:GetService("TestService")
local NewCommands = Commands:Clone()
NewCommands.Parent = game:GetService("TestService")
for _,v in next, {CommandInfo,Commands} do
    game:GetService("Debris"):AddItem(v,0)
end
function newInfo (cmdName,info)
    local Info = NewCommandInfo:Clone()
    Info.Parent = game:GetService("Players").LocalPlayer.PlayerGui
    Info.Info_Inner.TextLabel.Text = "[".. cmdName.. "]\n\n\n\n Info: ".. info.." \n\n\n"
    local close = Info.Info_Inner.TextButton
    local closed
    closed = close.Button1Down:connect(function()
        closed:Disconnect()
        Info:ClearAllChildren()
        game:GetService("Debris"):AddItem(Info,0.2)
    end)
end
local Commands = NewCommands:Clone()
local ScrollingFrame, ExampleButton, Searcher
for i,obj in pairs(Commands:GetDescendants()) do
    if obj:IsA("ScrollingFrame") == true then
        ScrollingFrame = obj
        ExampleButton = obj.ExampleButton
        ExampleButton.Visible = false
    elseif obj:IsA("TextBox") == true then
        Searcher = obj
    end
end
function NewButton (text)
    local NewButton = ExampleButton:Clone()
    NewButton.Visible = true
    NewButton.Parent = ScrollingFrame
    NewButton.Text = text
    NewButton.Name = text
end
local Data = {
    Commands = {
        "chat [msg]",
        "explode [plr]",
        "god [plr]"
    },
    Sizes = {
        Open = {
            Commands = {
                Inner_Commands = Commands.Inner_Commands.Size,
                Outer_Commands = Commands.Outer_Commands.Size
            },
        },
        Closed = {
            Commands = {
                Inner_Commands = UDim2.new(0.115, 0,0, 0),
                Outer_Commands = UDim2.new(0.126, 0,0, 0)
            },
        }
    },
    Positions = {
        Open = {
            Commands = {
                Inner_Commands = Commands.Inner_Commands.Position,
                Outer_Commands = Commands.Outer_Commands.Position
            },
        },
        Closed = {
            Commands = {
                Inner_Commands = UDim2.new(0.879, 0,1, 0),
                Outer_Commands = UDim2.new(0.874, 0,1, 0)
            },
        }
    }
}
function tween(instance, tweenInfo, propertyTable)
    return game:GetService("TweenService"):Create(instance, TweenInfo.new(unpack(tweenInfo)), propertyTable)
end
for _,v in pairs(Commands:GetDescendants()) do
    local success,value = pcall(function()
        return v.Text
    end)
    if success then
    end
end
function commandsOpen()
    tween(Commands.Inner_Commands,{1},{
        Size = Data.Sizes.Open.Commands.Inner_Commands,
        Position = Data.Positions.Open.Commands.Inner_Commands
    }):Play()
    tween(Commands.Outer_Commands,{1},{
        Size = Data.Sizes.Open.Commands.Outer_Commands,
        Position = Data.Positions.Open.Commands.Outer_Commands
    }):Play()
    for _,v in pairs(Commands:GetDescendants()) do
        local success,value = pcall(function()
            return v.Text
        end)
        if success then
            tween(v,{1},{
                TextTransparency = 0
            }):Play()
        end
    end
end
function commandsClose()
    tween(Commands.Inner_Commands,{1},{
        Size = Data.Sizes.Closed.Commands.Inner_Commands,
        Position = Data.Positions.Closed.Commands.Inner_Commands
    }):Play()
    tween(Commands.Outer_Commands,{1},{
        Size = Data.Sizes.Closed.Commands.Outer_Commands,
        Position = Data.Positions.Closed.Commands.Outer_Commands
    }):Play()
    for _,v in pairs(Commands:GetDescendants()) do
        local success,value = pcall(function()
            return v.Text
        end)
        if success then
            tween(v,{1},{
                TextTransparency = 1
            }):Play()
        end
    end
end
task.delay(2,function()
    for _,v in next, Data.Commands do
        NewButton(v)
    end
end)
Commands.Parent = game:GetService("Players").LocalPlayer.PlayerGui
Searcher:GetPropertyChangedSignal("Text"):connect(function ()
    for _,v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("TextButton") == true then
            if v.Text:match(Searcher.Text) then
                v.Visible = true
            else
                v.Visible = false
            end
        end
    end
end)
open = false
local System = game:GetService("ReplicatedStorage"):FindFirstChild("mollar-mollar-system")
local Events = System:FindFirstChild("mollar-events")
local Event = Events:FindFirstChild("TextRemote")
commandsClose()
Event.OnClientEvent:Connect(function(method)
    if method == "Cmds" then
        open = not open
        if not open then
            commandsOpen()
        else
            commandsClose()
        end
    end
end)
