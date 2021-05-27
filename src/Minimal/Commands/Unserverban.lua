local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")


local command = {}

command.Configuration = {

	Information = {

		Command = "unserverban",
		Aliases = {"unsb"},
		Description = "Unbans the target player from the server",
		Usage = "unserverban [id]"

	},

	PermissionLevel = 2

}

local Server_Bans = require(script.Parent.Serverban).Server_Bans

function command:Execute(player,args)

	if args[2] then
		
		local target = tonumber(args[2])
		
		if target then
			
			local targetId = target
			
			for i,v in pairs(Server_Bans) do
				
				if v.UserId == targetId then
					
					table.remove(Server_Bans,i)
					
				end
				
			end
			
			SN:FireClient(player,{Text = "Player has been unserver banned", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})

		else
			SN:FireClient(player,{Text = "Could not find player", Duration = 3, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})
		end

	else
		SN:FireClient(player,{Text = "You must specify a player", Duration = 3, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})
	end

end

return command



