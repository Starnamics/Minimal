local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "commands",
		Aliases = {"help","cmds"},
		Description = "Displays a list of commands",
		Usage = "cmds"
		
	},
	
	PermissionLevel = 1
	
}

function command:Execute(player,args)
	
	player.PlayerGui.Minimal.Commands.Show:FireClient(player)
	
end

return command
