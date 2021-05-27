--[[

	Test Command
	
	You can use this command as a template to make other commands with
	
	Configuration must be filled out for the command to work.

--]]

local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")


local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "test", --// The string a user needs to type to execute this command
		Aliases = {"t"}, --// Command Aliases used to shorten the command
		Description = "Command used to test if Minimal is working", --// The description of the command
		Usage = "test [arg1 arg2 arg3]" --// The usage of the command (example: speed [player] [int])
		
	},
	
	PermissionLevel = 2 --// The minimum permission a player must have to execute the command (view Configuration module for more information)
	
}

function command:Execute(player,arguments) --// Player: Player - Arguments: Table
	
	--// Put your command here \\--

	for _,v in pairs (arguments) do
		print(v)
	end
	
end

return command







