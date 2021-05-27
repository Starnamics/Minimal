--[[

	Minimal API:
	
	You can use this API to find out if a command exists, to get a command or to check a players permission
	
	Usages:
	
		Minimal:FindCommand(COMMAND)
		
			COMMAND must be a string
			
			Returns: 
				true (if command exists)
				false (if command does not exist)
	
	
		Minimal:GetCommand(COMMAND)
			
			COMMAND must be a string
			
			Returns:
				Instance (if command exists)
				nil (if command does not exist)
				
		Minimal:FindAlias(ALIAS)
		
			ALIAS must be a string
			
			Returns: 
				true (if alias exists)
				false (if alias does not exist)
	
	
		Minimal:GetAlias(ALIAS)
			
			ALIAS must be a string
			
			Returns:
				Instance (if alias exists)
				nil (if alias does not exist)
		
		
		Minimal:GetPermission(Player)
		
			Player must be a Player instance
			
			Returns:
				int (if player exists)
				
		Minimal:GetPlayer(String,GetMultiplePlayers)
			
			String must be a string
			GetMultiplePlayers must be a bool (true/false)
			
			Returns:
				Instance (if player exists)
				nil (if player does not exist)
				
		Minimal:FilterString(String,Player)
		
			String must be a string
			Player must be a player instance
			
			Returns:
				string
	
	
--]]

local config = require(script.Parent.Configuration)

local CS = game:GetService("Chat")

local Minimal = {}

function Minimal:FindCommand(Command)

	if Command then

		local Commands = script.Parent.Commands:GetChildren()

		local IsValidCommand = false

		for _,v in pairs(Commands) do

			local cmd = require(v)

			local CommandN = cmd.Configuration.Information.Command 

			if CommandN and string.lower(CommandN) == string.lower(Command) then

				IsValidCommand = true

			end

		end

		return IsValidCommand

	else
		return nil
	end

end


function Minimal:GetCommand(Command)

	if Command then

		local Commands = script.Parent.Commands:GetChildren()

		local CommandInstance = nil

		for _,v in pairs(Commands) do

			local cmd = require(v)

			local CommandN = cmd.Configuration.Information.Command 

			if CommandN and string.lower(CommandN) == string.lower(Command) then

				CommandInstance = v

			end

		end

		return CommandInstance

	else
		return nil
	end

end


function Minimal:FindAlias(Alias)

	if Alias then

		local Commands = script.Parent.Commands:GetChildren()

		local IsValidAlias = false

		for _,v in pairs(Commands) do

			local cmd = require(v)

			local Aliases = cmd.Configuration.Information.Aliases 

			for _,AliasN in ipairs(Aliases) do

				if AliasN and string.lower(AliasN) == string.lower(Alias) then

					IsValidAlias = true

				end

			end
		end

		return IsValidAlias

	else
		return nil
	end

end


function Minimal:GetAlias(Alias)

	if Alias then

		local Commands = script.Parent.Commands:GetChildren()

		local CommandInstance = nil

		for _,v in pairs(Commands) do

			local cmd = require(v)

			local Aliases = cmd.Configuration.Information.Aliases 

			for _,AliasN in ipairs(Aliases) do

				if AliasN and string.lower(AliasN) == string.lower(Alias) then

					CommandInstance = v

				end

			end

		end

		return CommandInstance

	else
		return nil
	end

end

function Minimal:GetPermission(player)

	if player:IsA("Player") then

		local Permissions = config.Permissions

		for i,v in pairs(Permissions) do

			if v.Type == "Group" then

				local Permission = 1

				if player:GetRankInGroup(tonumber(i)) >= v.Minimum and player:GetRankInGroup(tonumber(i)) <= v.Maximum then

					Permission = v.Permission

				end

				return Permission

			end


			if v.Type == "Username" then

				local Permission = 1

				if player.Name == tostring(i) then

					Permission = v.Permission

				end
				
				return Permission
			end

			if v.Type == "UserId" then

				local Permission = 1

				if player.UserId == tonumber(i) then

					Permission = v.Permission

				end
				
				return Permission

			end


		end

	else
	return nil
	end
end

function Minimal:GetPlayer(str,m)

	if str then

		if m == true then

			local Targets = {}

			for _,v in ipairs(game.Players:GetChildren()) do

				if v:IsA("Player") then
					if string.sub(string.lower(v.Name),1,string.len(str)) == str then

						Targets[#Targets+1] = v

					end
				end
			end


			if #Targets > 0 then
				return Targets
			else
				return nil
			end
		else

			local Target = nil

			for _,v in ipairs(game.Players:GetChildren()) do

				if v:IsA("Player") then
					if string.sub(string.lower(v.Name),1,string.len(str)) == str then

						if Target == nil then
							Target = v
						end

					end
				end
			end

			return Target

		end
	else
		return nil
	end

end

function Minimal:FilterString(str,player)

	if str then

		str = tostring(str)

		local FilteredString = CS:FilterStringForBroadcast(str,player)
		return FilteredString

	else
		return nil
	end

end

return Minimal
