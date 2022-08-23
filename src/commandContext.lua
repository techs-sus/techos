local Players = game:GetService("Players")
local commandContext = {}
commandContext.__index = commandContext

type Context = typeof(commandContext) & {
	player: Player,
	arguments: Array<string>,
}

function commandContext.new(arguments: Array<string>, player: Player): Context
	return setmetatable({
		arguments = arguments,
		player = player,
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

return commandContext
