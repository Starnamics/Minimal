local module = {}

local MS = game:GetService("MessagingService")

local SN = script.Parent.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")


TOPIC = "GLOBAL_MESSAGES"

function module:Listen()

	local connection = MS:SubscribeAsync(TOPIC, function(message)
		SN:FireAllClients({Text = message.Data, Duration = 10, Color = Color3.fromRGB(255,255,255), ClickFunction = "Close"})
	end)

end

return module
