local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "bring",
		Aliases = {},
		Description = "Teleports a player to you",
		Usage = "bring [player]"
		
	},
	
	PermissionLevel = 2
	
}

function command:Execute(player,args)
	
	if args[2] then
		
		local target = API:GetPlayer(args[2],false)
		
		if target == nil and args[2] == "all" then
			
			for _,v in pairs(game.Players:GetChildren()) do
				
				v.Character:SetPrimaryPartCFrame(player.Character:GetPrimaryPartCFrame())
				
			end
			
		end
		
		if target ~= nil then

			target.Character:SetPrimaryPartCFrame(player.Character:GetPrimaryPartCFrame())

		end
		
	end
	
end

return command
