local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {

	Information = {

		Command = "speed",
		Aliases = {"walkspeed","ws"},
		Description = "Changes the target players speed",
		Usage = "speed [player] [number]"

	},

	PermissionLevel = 2

}

function command:Execute(player,args)

	if args[2] then

		if API:GetPlayer(args[2]) ~= nil then

			if args[3] then

				local speed = tonumber(args[3])

				local target = API:GetPlayer(args[2])

				target.Character.Humanoid.WalkSpeed = speed

				SN:FireClient(player,{Text = "Target speed has been changed", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})

			end

		else

			if args[3] == nil then

				local speed = tonumber(args[2])

				player.Character.Humanoid.WalkSpeed = speed

				SN:FireClient(player,{Text = "Your speed has been changed", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})
			else


				SN:FireClient(player,{Text = "Could not find player", Duration = 3, Color = Color3.fromRGB(250,100,100), ClickFunction = "Close"})

			end

		end

	end

end

return command
