local Minimal = game:GetService("ReplicatedStorage"):WaitForChild("Minimal")
local Commands = Minimal:WaitForChild("Commands"):GetChildren()
local Config = require(Minimal:WaitForChild("Configuration"))
local List = script.Parent:WaitForChild("List")

local ASEP = Config.Settings.ArgumentSeperator

for _,v in ipairs(Commands) do

	if v:IsA("ModuleScript") then

		local CMD = require(v)

		local CommandInfo = CMD.Configuration.Information

		local Command = script.Parent.CmdInfo:WaitForChild("CMD"):Clone()

		Command.Parent = script.Parent.CmdInfo

		Command.Name = CommandInfo.Command

		local UsageArgs = string.split(CommandInfo.Usage," ")

		Command.Usage.Text = ""

		for _,v in ipairs(UsageArgs) do

			Command.Usage.Text = Command.Usage.Text..v..ASEP

		end

		for _,v in ipairs(CommandInfo.Aliases) do

			Command.Aliases.Text = Command.Aliases.Text..","..v

		end

		Command.Usage.Text = string.sub(Command.Usage.Text,1,string.len(Command.Usage.Text) - 1)
		Command.Aliases.Text = string.sub(Command.Aliases.Text,2)

		Command.Description.Text = CommandInfo.Description

	end

	wait()

	if v:IsA("ModuleScript") then


		local CMD = require(v)

		local CommandInfo = CMD.Configuration.Information

		local Command = List.CMD:Clone()

		Command.Name = CommandInfo.Command
		Command.Text = CommandInfo.Command


		Command.Parent = List
		Command.Visible = true

		Command.MouseEnter:Connect(function()

			local CmdInf = script.Parent.CmdInfo:WaitForChild(Command.Name)
			CmdInf.Visible = true

		end)

		Command.MouseLeave:Connect(function()

			local CmdInf = script.Parent.CmdInfo:WaitForChild(Command.Name)
			CmdInf.Visible = false

		end)

	end

end
