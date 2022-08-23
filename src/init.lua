local UI = require(script.createGUI)
local API = require(script.api)(UI.scroll, UI.list)
local commandManager = require(script.commandManager)
commandManager.addDefaultCommands()
UI.part.CFrame = CFrame.new(0, 10, -10)
API.createText("#### banner ####")
API.createText(
	string.format("hello %s, welcome to techos, commit %s", getfenv(1).owner.Name, getfenv(1).__COMPILEINFO.commit)
).TextColor3 =
	Color3.new(1, 0, 0)
API.createText("techos is still in development, some features are missing")
API.createText("repository: techs-sus/techos")
