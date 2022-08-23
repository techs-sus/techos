local __h = require(script.Parent.commandContext)
type Context = __h.Context

export type Command = {
	name: string,
	aliases: Array<string>,
	description: string,
	exec: (context: Context) -> (),
}
return nil
