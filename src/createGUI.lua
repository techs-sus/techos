local createPart = require(script.Parent.createPart)
local part = createPart()
local gui = Instance.new("SurfaceGui")
local main = Instance.new("Frame")
main.Size = UDim2.fromScale(1, 1)
main.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
main.BorderSizePixel = 0
main.Parent = gui
gui.Adornee = part
gui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
gui.PixelsPerStud = 100
part.Size = Vector3.new(10, 7, 0.01)
part.Material = Enum.Material.Glass
part.Transparency = 0.7
part.Color = Color3.new(0.5, 0.7, 0.5)
part.Anchored = true
part.CanQuery = true -- for workspace:Raycast
gui.Parent = script
part.Parent = script

return {
	part = part,
	main = main,
}
