local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local MS = game:GetService("MessagingService")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "globalmessage",
		Aliases = {"gm","gmessage","gmsg"},
		Description = "Sends a message to every server",
		Usage = "globalmessage [message]"
		
	},
	
	PermissionLevel = 3
	
}

local TOPIC = "GLOBAL_MESSAGES"

require(script:WaitForChild("Listen")):Listen()

function command:Execute(player,args)
	
	if args[2] then
		
		local message = player.Name..": "..API:FilterString(args[2],player)
	
		local publishSuccess, publishResult = pcall(function()
			MS:PublishAsync(TOPIC, message)
			SN:FireClient(player,{Text = "Message sent!", Duration = 10, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})
		end)
		if not publishSuccess then
			SN:FireClient(player,{Text = "Could not send message", Duration = 10, Color = Color3.fromRGB(250,100,100), ClickFunction = "Close"})
		end
		
	end
	
end

return command
