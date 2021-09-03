local char = script.Parent
function Immortality(...)
    local c = ...
    pcall(function()
        c:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Dead,false)
    end)
end
while true do
    task.wait()
    if not char then
        break
    else
        Immortality(char)
    end
end
