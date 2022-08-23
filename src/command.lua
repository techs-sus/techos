local commandContext = require(script.Parent.commandContext)
export type Command = {
	name: string,
	aliases: Array<string>,
	description: string,
	exec: (commandContext.Context) -> (),
}
return nil
