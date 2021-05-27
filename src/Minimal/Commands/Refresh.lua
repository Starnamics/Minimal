local API = require(script.Parent.Parent:WaitForChild("MinimalAPI"))
local SN = script.Parent.Parent:WaitForChild("Events"):WaitForChild("SendNotification")

local command = {}

command.Configuration = {
	
	Information = {
		
		Command = "refresh",
		Aliases = {"ref"},
		Description = "Refreshes the target player",
		Usage = "refresh [player]"
		
	},
	
	PermissionLevel = 2
	
}

function command:Execute(player,args)
	
	if args[2] then
		
		local target = API:GetPlayer(args[2],false)
		
		if target ~= nil then
			
			local PrevLocation = target.Character.HumanoidRootPart.CFrame

			target:LoadCharacter()

			wait(0.1)

			target.Character.HumanoidRootPart.CFrame = PrevLocation
			
		end
		
	else
		
		local PrevLocation = player.Character.HumanoidRootPart.CFrame
		
		player:LoadCharacter()
		
		wait(0.1)
		
		player.Character.HumanoidRootPart.CFrame = PrevLocation
		
	end
	
	SN:FireClient(player,{Text = "Player has been refreshed", Duration = 3, Color = Color3.fromRGB(100,250,100), ClickFunction = "Close"})
	
end

return command
