local Minimal = game:GetService("ReplicatedStorage"):WaitForChild("Minimal")

local Commands = Minimal:WaitForChild("Commands")
local Events = Minimal:WaitForChild("Events")

local API = require(Minimal.MinimalAPI)
local Configuration = require(Minimal.Configuration)

local Execute = Events.Execute
local SN = Events.SendNotification

Execute.OnServerEvent:Connect(function(player,command)
	
	local args = string.split(command,Configuration.Settings.ArgumentSeperator)
	
	local IsValidCommand = API:FindCommand(args[1])
	local IsValidAlias = API:FindAlias(args[1])
	
	if IsValidCommand == true or IsValidAlias == true then
		
		local CMD = nil
		if IsValidCommand == true then CMD = API:GetCommand(args[1]) else CMD = API:GetAlias(args[1]) end
		
		if CMD ~= nil then
			
			local c = require(CMD)
			
			if API:GetPermission(player) >= c.Configuration.PermissionLevel then
				
				
				
				c:Execute(player,args)
				
				Execute:FireClient(player,"Executed!")
				
			else
				
				SN:FireClient(player,{Text="Invalid Permission Level",Duration=3,Color=Color3.fromRGB(250,100,100),ClickFunction="Close"})
				
			end
			
		end
		
	else
		
		Execute:FireClient(player,"Invalid Command")
		SN:FireClient(player,{Text="Invalid Command",Duration=3,Color=Color3.fromRGB(250,100,100),ClickFunction="Close"})
		
	end
	
end)