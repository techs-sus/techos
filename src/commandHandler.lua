--!strict

local commands = {}
local commandContext = require(script.Parent.CommandContext)
export type Command = {
	name: string,
	aliases: Array<string>,
	description: string,
	exec: (Context) -> (),
}
local function validateCommand(command: Command)
	if not command then
		return false
	end
	local isTable = type(command) == "table"
	local name = command.name and type(command.name) == "string"
	local aliases = command.aliases and type(command.aliases) == "table"
	local description = command.description and type(command.description) == "string"
	local exec = command.exec and type(command.exec) == "function"
	return isTable and name and aliases and description and exec
end

local function addCommand(command: Command)
	if validateCommand(command) then
		table.insert(commands, command)
	end
end

local function runCommand(command: Command, arguments: Array<string>, player: Player)
	if not validateCommand(command) then
		return
	end
	local context = commandContext.new(arguments, player)
	command.exec(context)
end

local function addDefaultCommands()
	for _, instance in pairs(script.Parent.commands:GetChildren()) do
		if instance:IsA("ModuleScript") then
			local module = require(instance)
			addCommand(module)
		end
	end
end

return {
	addDefaultCommands = addDefaultCommands,
	addCommand = addCommand,
	validateCommand = validateCommand,
	runCommand = runCommand,
}
