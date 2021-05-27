local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {

	Information = {

		Command = "freeze",
		Aliases = {},
		Description = "Freezes the player in place",
		Usage = "freeze [player]"

	},

	PermissionLevel = 2

}

function command:Execute(player,args)

	if args[2] then

		if API:GetPlayer(args[2]) ~= nil then

			local target = API:GetPlayer(args[2])

			target.Character.HumanoidRootPart.Anchored = true

			SN:FireClient(player,{Text = "Target has been frozen", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})

		else

			if args[2] == nil then
				player.Character.HumanoidRootPart.Anchored = true

				SN:FireClient(player,{Text = "You have been frozen", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})
			else
				SN:FireClient(player,{Text = "Could not find player", Duration = 3, Color = Color3.fromRGB(250,100,100), ClickFunction = "Close"})
			end
		end


	end

end

return command
