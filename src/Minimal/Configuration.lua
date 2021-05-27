--[[

	PERMISSIONS:

	Permission Levels:
		1 - None (Player)
		2 - Moderator (Limited Permissions)
		3 - Administrator (All Permissions)
	
	Custom Permission Levels:
		Custom Permission Levels are allowed. However, they must be an int.
		To use a custom permission level, simply change the permission of a User/Group to the permission you'd like then
		change whatever commands to have that permission level
		
	Type:
		Types can be one of the following:
			- Group
			- UserId
			- Username (not recommended)
	
	Minimum (group only):
		The minimum rank a user must have to receive the permission level
	
	Maximum (group only):
		The maximum rank a user must have to receive the permission level
		
	
	Examples:
	
		Group: [Int]
			
			[12345678] = {
				Type = "Group",
				Minimum = 1,
				Maximum = 255,
				Permission = 2
			}
		
		UserId: [Int]
			
			[12345678] = {
				Type = "UserId",
				Permission = 2
			}
			
		Username: [String]
			
			["ROBLOX"] = {
				Type = "Username",
				Permission = 2
			}

--]]


--[[

	SETTINGS:
	
	Keybinds: [Table]
		The key(s) used to open the command bar
	
	ArgumentSeperator: [String]
		The string used to seperate arguments
		
	RestrictCommandBar: [Bool]
		Should the command bar only be avaliable to moderators

--]]

local config = {

	Permissions = {

		[00000000] = {
			Type = "UserId",
			Permission = 3
		}

	},

	Settings = {

		Keybinds = {Enum.KeyCode.Semicolon},
		ArgumentSeperator = "/",
		RestrictCommandBar = false

	}
}

return config
