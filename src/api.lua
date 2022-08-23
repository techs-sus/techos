--!strict

local TweenService = game:GetService("TweenService")
return function(container, list)
	local API = {}
	local boxes = {}
	local function scroll()
		TweenService:Create(container, TweenInfo.new(0.25), {
			CanvasPosition = Vector2.new(0, list.AbsoluteContentSize.Y - 125),
		}):Play()
	end

	function API.createText(text: string): TextBox
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
		table.insert(boxes, {
			created = os.clock(),
			box = box,
		})
		if #boxes > 30 then
			local oldest
			for _, v in boxes do
				if not oldest then
					oldest = v
				elseif oldest.created > v.created then
					oldest = v
				end
			end
			oldest.box:Destroy()
			table.remove(boxes, table.find(boxes, oldest))
		end
		scroll()
		return box
	end
	return API
end
