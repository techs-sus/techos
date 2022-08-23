local commandContext = require(script.Parent.Parent.commandContext)

return {
	name = "pkg",
	aliases = {},
	description = "Manages packages.",
	exec = function(self: commandContext.Context)
		print(self:findPlayer(self.arguments[1]))
	end,
}
