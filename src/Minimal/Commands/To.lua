local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "to",
		Aliases = {"goto"},
		Description = "Teleports you to a player",
		Usage = "to [player]"
		
	},
	
	PermissionLevel = 2
	
}

function command:Execute(player,args)
	
	if args[2] then
	
		local target = API:GetPlayer(args[2],false)
		
		if target == nil and args[2] == "all" then

			for _,v in pairs(game.Players:GetChildren()) do

				player.Character:SetPrimaryPartCFrame(v.Character:GetPrimaryPartCFrame())

			end

		end

		if target ~= nil then

			player.Character:SetPrimaryPartCFrame(target.Character:GetPrimaryPartCFrame())

		end
		
	end
	
end

return command
