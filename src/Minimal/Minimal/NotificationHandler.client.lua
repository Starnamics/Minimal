--[[

	Text: String
	Duration: Number
	Color: Color3
	ClickFunction: String ("Close") OR Instance (RemoteFunction)
	
	Usage:
	
	[SendNotificationEvent]:FireClient(Player,{Text = "Example", Duration = 5, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})

--]]

local RS = game:GetService("ReplicatedStorage")
local SN = RS:WaitForChild("Minimal"):WaitForChild("Events"):WaitForChild("SendNotification")
local NT = script.Parent:WaitForChild("Notifications"):WaitForChild("NT")

local DefaultInfo = {

	Text = "",
	Duration = 5,
	Color = Color3.fromRGB(255,255,255),
	ClickFunction = "Close"

}

local NotificationCount = 0

SN.OnClientEvent:Connect(function(NotificationInfo)

	local NI = {}

	if NotificationInfo["Text"] then

		NI["Text"] = NotificationInfo.Text

		if NotificationInfo["Duration"] == nil then
			NI["Duration"] = DefaultInfo.Duration
		else
			if typeof(NotificationInfo["Duration"]) == "number" then
				NI["Duration"] = NotificationInfo["Duration"]
			else
				NI["Duration"] = DefaultInfo.Duration
			end
		end

		if NotificationInfo["Color"] == nil then
			NI["Color"] = DefaultInfo.Color
		else
			if typeof(NotificationInfo["Color"]) == "Color3" then
				NI["Color"] = NotificationInfo["Color"]
			else
				NI["Color"] = DefaultInfo.Color
			end
		end

		if NotificationInfo["ClickFunction"] == nil then
			NI["ClickFunction"] = DefaultInfo.ClickFunction
		else
			if typeof(NotificationInfo["ClickFunction"] == "Instance") then
				if NotificationInfo["ClickFunction"].ClassName ~= "RemoteFunction" then
					NI["ClickFunction"] = DefaultInfo.ClickFunction
				else
					NI["ClickFunction"] = NotificationInfo["ClickFunction"]
				end
			end

			if typeof(NotificationInfo["ClickFunction"]) == "string" and NotificationInfo["ClickFunction"] == "Close" then
				NI["ClickFunction"] = NotificationInfo["ClickFunction"]
			end
		end

		local Notification = NT:Clone()
		Notification.Parent = script.Parent.Notifications
		Notification.Name = "Notification"..NotificationCount

		NotificationCount += 1

		local NotificationName = Notification.Name

		Notification.Text.Text = NI.Text
		Notification.Text.TextColor3 = NI["Color"]

		Notification.Visible = true
		
		Notification.Text.MouseButton1Click:Connect(function()

			if NI["ClickFunction"] == "Close" then
				Notification:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.35)
				Notification.Text.Visible = false

				wait(0.45)

				Notification:Destroy()
			else
				if typeof(NI["ClickFunction"])== "Instance" then

					if NI["ClickFunction"].ClassName == "RemoteFunction" then
						NI["ClickFunction"]:InvokeServer()
					end
				end
			end
		end)
		
		Notification.Text.Visible = true

		Notification:TweenSize(UDim2.new(1,0,0.1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.35)

		wait(NI.Duration)


		if script.Parent.Notifications:FindFirstChild(NotificationName) then

			Notification:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.35)
			Notification.Text.Visible = false

			wait(0.45)

			Notification:Destroy()

		end


	else
		warn("The 'Text' value is required")
	end

end)
