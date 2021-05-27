local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")


local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "shutdown",
		Aliases = {},
		Description = "Shutdowns the current server",
		Usage = "shutdown [reason]"
		
	},
	
	PermissionLevel = 3
	
}

function command:Execute(player,args)
	
	SN:FireAllClients({Text = "Server is shutting down in 5 seconds", Duration = 5, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})
	
	wait(5)
	
	for _,v in ipairs(game.Players:GetChildren()) do
		
		if v:IsA("Player") then
			
			if args[2] == nil then
				args[2] = "No reason specified"
			end
			
			v:Kick("Server has been shutdown: ".. args[2])
			
		end
		
	end
	
end

return command
