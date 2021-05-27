script.Parent.Parent.Close.MouseButton1Click:Connect(function()
	script.Parent.Parent.Visible = false
end)

script.Parent.Parent.Show.OnClientEvent:Connect(function()
	script.Parent.Parent.Visible = true
end)

local Minimal = game:GetService("ReplicatedStorage"):WaitForChild("Minimal")

local DragModule = require(Minimal:WaitForChild("Modules"):WaitForChild("DraggableObject"))

ListFrameDrag = DragModule.new(script.Parent.Parent)

ListFrameDrag:Enable()