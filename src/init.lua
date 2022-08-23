local UI = require(script.createGUI)
local API = require(script.api)(UI.scroll, UI.list)
local commandManager = require(script.commandManager)
local owner: Player = getfenv(1).owner
commandManager.addDefaultCommands()
UI.part.CFrame = CFrame.new(0, 10, -10)
API.createText("#### banner ####").TextColor3 = Color3.new(1, 0, 0)
API.createText(
	string.format(
		"hello %s, welcome to techos, commit %s",
		owner.Name,
		string.sub(getfenv(1).__COMPILEINFO.commit, 1, 7)
	)
)
API.createText("techos is still in development, some features are missing")
API.createText("repository: techs-sus/techos")
API.createText("for development: g/ps/techos-dev")
