return function()
	local part = Instance.new("SpawnLocation")
	part.Enabled = false
	part.Locked = true
	part.CanTouch = false
	part.CanQuery = false
	part.CanCollide = false
	part.Locked = true
	return part
end
