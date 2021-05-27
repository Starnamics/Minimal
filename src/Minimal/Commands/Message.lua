local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "message",
		Aliases = {"msg","m"},
		Description = "Sends a message to the entire server",
		Usage = "message [message]"
	},
	
	PermissionLevel = 2
	
}

function command:Execute(player,args)
	
	if args[2] then
		
		local message = API:FilterString(args[2],player)
	
		SN:FireAllClients({Text = player.Name..": "..message, Duration = 5, Color = Color3.fromRGB(255,255,255), ClickFunction = "Close"})
		
	end
	
end

return command
