local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {

	Information = {

		Command = "jumppower",
		Aliases = {"jp"},
		Description = "Changes the target players jump power",
		Usage = "jumppower [player] [number]"

	},

	PermissionLevel = 2

}

function command:Execute(player,args)

	if args[2] then

		if API:GetPlayer(args[2]) ~= nil then

			if args[3] then

				local jumppower = tonumber(args[3])

				local target = API:GetPlayer(args[2])

				target.Character.Humanoid.JumpPower = jumppower
				
				SN:FireClient(player,{Text = "Target jump power has been changed", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})

			end

		else

			if args[3] == nil then
				
				local jumppower = tonumber(args[2])

				player.Character.Humanoid.JumpPower = jumppower
				
				SN:FireClient(player,{Text = "Your jump power has been changed", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})
			else
				
				SN:FireClient(player,{Text = "Could not find player", Duration = 3, Color = Color3.fromRGB(250,100,100), ClickFunction = "Close"})
				
			end

		end

	end

end

return command
