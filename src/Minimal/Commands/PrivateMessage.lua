local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "privatemessage",
		Aliases = {"pm","pmsg"},
		Description = "Sends a message to a specific player",
		Usage = "privatemessage [player] [message]"
	},
	
	PermissionLevel = 2
	
}

function command:Execute(player,args)
	
	if args[2] and args[3] then
		
		local target = API:GetPlayer(args[2])
		
		if target ~= nil then
		
			local message = API:FilterString(args[3],player)
	
			SN:FireClient(target,{Text = "[PM] "..player.Name..": "..message, Duration = 5, Color = Color3.fromRGB(255,255,255), ClickFunction = "Close"})
		else
			SN:FireClient(player,{Text = "Player not found!", Duration = 5, Color = Color3.fromRGB(250,100,100), ClickFunction = "Close"})
		end
	end
	
end

return command
