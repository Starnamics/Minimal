local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")


local command = {}

command.Configuration = {

	Information = {

		Command = "kick",
		Aliases = {},
		Description = "Kicks the target player from the server",
		Usage = "kick [player] [reason]"

	},

	PermissionLevel = 2

}

function command:Execute(player,args)

	if args[2] then
		local target = API:GetPlayer(args[2])
		if target then

			if args[3] == nil then
				args[3] = "No reason specified"
			end

			target:Kick(args[3])

			SN:FireClient(player,{Text = "Player has been kicked", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})

		else
			SN:FireClient(player,{Text = "Could not find player", Duration = 3, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})
		end

	else
		SN:FireClient(player,{Text = "You must specify a player", Duration = 3, Color = Color3.fromRGB(250,50,50), ClickFunction = "Close"})
	end

end

return command
