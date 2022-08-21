local window = {}
window.__index = window

function window.new(parent: Frame, name: string?, size: UDim2?, resizeable: boolean?)
	local container = Instance.new("Frame")
	local decorations = Instance.new("Frame")
	local bar = Instance.new("TextBox")
	bar.Text = name
	bar.Size = UDim2.fromScale(1, 1)
	bar.BorderSizePixel = 0
	bar.BackgroundTransparency = 1
	bar.TextScaled = true
	bar.TextXAlignment = Enum.TextXAlignment.Center
	bar.TextYAlignment = Enum.TextYAlignment.Center
	bar.TextColor3 = Color3.new(1, 1, 1)
	bar.Font = Enum.Font.Code
	bar.Parent = decorations
	local close = Instance.new("ImageButton")
	close.BorderSizePixel = 0
	close.Image = "rbxassetid://7104731055"
	close.BackgroundTransparency = 1
	close.ImageColor3 = Color3.new(1, 0, 0)
	close.AutomaticSize = Enum.AutomaticSize.XY
	close.Position = UDim2.fromScale(0.9, 0)
	close.Parent = decorations
	decorations.Size = UDim2.fromScale(1, 0.05)
	decorations.Position = UDim2.fromScale(0, 0)
	decorations.BorderSizePixel = 0
	decorations.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	container.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
	container.BorderSizePixel = 0
	container.Size = size or UDim2.fromScale(0.1, 0.1)
	container.Position = UDim2.fromScale(0.5, 0.5)
	decorations.Parent = container
	container.Parent = parent
	return setmetatable({
		name = name or "generic-window",
		resizeable = resizeable or true,
		container = container,
		__bar = bar,
	}, window)
end

function window:setTitle(title: string)
	self.__bar.Text = title
	return window
end

return window
