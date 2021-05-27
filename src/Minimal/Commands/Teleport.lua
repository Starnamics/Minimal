local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {

	Information = {

		Command = "teleport",
		Aliases = {"tp"},
		Description = "Teleports a player to another player",
		Usage = "teleport [player] [player]"

	},

	PermissionLevel = 2

}

function command:Execute(player,args)

	if args[2] and not args[3] then

		local target = API:GetPlayer(args[2],false)

		if target ~= nil then

			player.Character:SetPrimaryPartCFrame(target.Character:GetPrimaryPartCFrame())

			SN:FireClient(player,{Text = "You have been teleported to "..target.Name.." successfully", Duration = 3, Color = Color3.fromRGB(100,255,100), ClickFunction = "Close"})

		end

	else if args[2] and args[3] then

			local target = API:GetPlayer(args[2],false)
			local target2 = API:GetPlayer(args[3],false)
			
			if target2 == nil and args[2] == "all" then

				for _,v in pairs(game.Players:GetChildren()) do

					v.Character:SetPrimaryPartCFrame(target2.Character:GetPrimaryPartCFrame())

				end

			end

			if target ~= nil and target2 ~= nil then

				target.Character:SetPrimaryPartCFrame(target2.Character:GetPrimaryPartCFrame())


				SN:FireClient(player,{Text = target.Name.." was teleported to "..target2.Name.." successfully", Duration = 3, Color = Color3.fromRGB(100,255,100), ClickFunction = "Close"})

			end
			
		end
	end

end

return command
