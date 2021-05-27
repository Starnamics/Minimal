local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")


local command = {}

command.Configuration = {

	Information = {

		Command = "serverban",
		Aliases = {"sb"},
		Description = "Bans the target player from the server",
		Usage = "serverban [player] [reason]"

	},

	PermissionLevel = 2

}

command.Server_Bans = {}

function command:Execute(player,args)

	if args[2] then
		local target = API:GetPlayer(args[2])
		if target then

			if args[3] == nil then
				args[3] = "No reason specified"
			end
			
			local targetId = target.UserId
			
			table.insert(command.Server_Bans,#command.Server_Bans+1,{UserId=targetId,Reason=args[3]})
			
			target:Kick("You have been server banned: "..args[3])
			
			
			SN:FireClient(player,{Text = "Player has been server banned", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})

		else
			SN:FireClient(player,{Text = "Could not find player", Duration = 3, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})
		end

	else
		SN:FireClient(player,{Text = "You must specify a player", Duration = 3, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})
	end

end

game.Players.PlayerAdded:Connect(function(plr)
	
	for _,v in pairs(command.Server_Bans) do
		if plr.UserId == v.UserId then
			plr:Kick("You have been server banned: "..v.Reason)
		end
	end
	
end)

return command



