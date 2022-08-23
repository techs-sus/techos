--!strict
local commands = {}
local __command = require(script.Parent.command)
local __cmd = require(script.Parent.commandContext)
local Promise = require(script.Parent.Promise)
type Command = __command.Command
type Context = __cmd.Context

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

local function runCommand(command: Command, context: Context)
	if not validateCommand(command) then
		return
	end
	return Promise.new(function(resolve)
		resolve(command.exec(context))
	end)
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
