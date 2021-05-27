local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "announce",
		Aliases = {"sm","ann"},
		Description = "Sends an announcement to the entire server",
		Usage = "announce [message]"
		
	},
	
	PermissionLevel = 3
	
}

function command:Execute(player,args)
	
	if args[2] then
		
		local message = API:FilterString(args[2],player)
	
		SN:FireAllClients({Text = message, Duration = 5, Color = Color3.fromRGB(255,255,255), ClickFunction = "Close"})
		
	end
	
end

return command
