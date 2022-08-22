return function(container)
	local API = {}
	function API.createText(text: string)
		local box = Instance.new("TextBox")
		box.Text = text
		box.BackgroundTransparency = 1
		box.TextColor3 = Color3.new(1, 1, 1)
		box.RichText = true
		box.Font = Enum.Font.Code
		box.BorderSizePixel = 0
		box.AutomaticSize = Enum.AutomaticSize.XY
		box.TextSize = 35
		box.TextWrapped = true
		box.LayoutOrder = 9
		box.TextXAlignment = Enum.TextXAlignment.Left
		box.TextYAlignment = Enum.TextYAlignment.Top
		box.Parent = container
	end
	return API
end
