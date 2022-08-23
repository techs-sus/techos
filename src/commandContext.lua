--!strict

local Players = game:GetService("Players")
local commandContext = {}
commandContext.__index = commandContext

export type Context = typeof(commandContext) & {
	player: Player,
	arguments: Array<string>,
	__create: (text: string) -> TextBox,
}

function commandContext.new(arguments: Array<string>, player: Player, createText: (text: string) -> TextBox): Context
	return setmetatable({
		arguments = arguments,
		player = player,
		__create = createText,
	}, commandContext)
end

function commandContext:findPlayer(name: string): Player?
	for _, player in pairs(Players:GetPlayers()) do
		if string.sub(string.lower(player.Name), 1, #name) == string.lower(name) then
			return player
		end
	end
end

function commandContext:findPlayers(search: string): Array<Player>
	local players = Players:GetPlayers()
	local result = {}
	if search == "@a" or search == "all" then
		result = players
	elseif search == "@s" or search == "me" then
		result = { self.player }
	elseif search == "@r" or search == "random" then
		result = { players[math.random(1, #players)] }
	elseif search == "@o" or search == "others" then
		for _, v in pairs(players) do
			if v ~= self.player then
				table.insert(result, v)
			end
		end
	elseif search == "@f" or search == "friends" then
		for _, v in pairs(players) do
			if v:IsFriendsWith(self.player) then
				table.insert(result, v)
			end
		end
	end
	return result
end

function commandContext:createText(text: string)
	return self.__create(text)
end

function commandContext:get(n: number, throw: boolean?): string
	throw = throw or true
	if throw then
		assert(self.arguments[n], "cmd context: failed getting arg " .. n)
	end
	return self.arguments[n]
end

return commandContext
