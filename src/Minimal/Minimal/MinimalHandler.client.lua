local CB = script.Parent:WaitForChild("CommandBar")

local Minimal = game:GetService("ReplicatedStorage"):WaitForChild("Minimal")
local Events = Minimal:WaitForChild("Events")
local API = require(Minimal:WaitForChild("MinimalAPI"))

local Config = require(Minimal:WaitForChild("Configuration"))

local IsOpen = false
local CanOpen = false

if Config.Settings.RestrictCommandBar == true then

	if API:GetPermission(game.Players.LocalPlayer) >= 2 then
		CanOpen = true
	end

else

	CanOpen = true

end

game:GetService("UserInputService").InputBegan:Connect(function(i,b)

	if CanOpen == true then
		for _,keycode in ipairs(Config.Settings.Keybinds) do
			if b == false and i.KeyCode == keycode then

				if IsOpen == false then

					CB:TweenPosition(UDim2.new(1,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.25)
					wait(0.25)
					IsOpen = true
					CB.Input:CaptureFocus()

				else

					CB:TweenPosition(UDim2.new(1.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.25)
					wait(0.25)
					IsOpen = false
					CB.Input:ReleaseFocus()


				end

			end
		end
	end

end)

script.Parent.CommandBar.Input.FocusLost:Connect(function(e) 

	local Input = CB:WaitForChild("Input")

	if e then

		Events.Execute:FireServer(Input.Text)

		CB:TweenPosition(UDim2.new(1.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.25)
		wait(0.25)
		IsOpen = false
		CB.Input:ReleaseFocus()

	end

end)

Events.Execute.OnClientEvent:Connect(function(res)

	if res then

		local Input = CB:WaitForChild("Input")

	end

end)