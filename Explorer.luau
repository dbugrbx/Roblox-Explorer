local Selected = {}
local Hover = nil
local RunService = game:GetService("RunService")
local Background = Instance.new("Frame")
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.new(0.0980392, 0.101961, 0.121569)
Background.BorderSizePixel = 0
Background.Position = UDim2.fromScale(0.5, 0.5)
Background.Size = UDim2.fromScale(1, 1)
Background.ClipsDescendants = true
Background.Parent = Instance.new("ScreenGui", script.Parent)
local Container = Instance.new("Frame")
Container.BackgroundTransparency = 1
Container.Position = UDim2.fromOffset(1, 0)
Container.Size = UDim2.new(1, -1, 1, 0)
Container.Parent = Background
local ContainerList = Instance.new("UIListLayout", Container)
for _, GameInstance in ipairs(game:GetChildren()) do
  local ListInstance = Instance.new("Frame")
	ListInstance.BackgroundColor3 = Color3.new(0.14902, 0.152941, 0.172549)
	ListInstance.BackgroundTransparency = 1
	ListInstance.BorderSizePixel = 0
	ListInstance.Size = UDim2.new(1, -3, 0, 20)
	ListInstance.Parent = Container
	local CornerRadius = Instance.new("UICorner")
	CornerRadius.CornerRadius = UDim.new(0, 6)
	CornerRadius.Parent = ListInstance
	ListInstance.MouseEnter:Connect(function()
		for _, SelectedInstance in ipairs(Selected) do
			if ListInstance == SelectedInstance then
				return
			end
		end
		Hover = ListInstance
	end)
	ListInstance.MouseLeave:Connect(function()
		if Hover == ListInstance then
			Hover = nil
		end
	end)
end
RunService.RenderStepped:Connect(function()
	for _, Instance in Container:GetChildren() do
		if Instance:IsA("Frame") then
			if Hover ~= Instance then
				Instance.BackgroundTransparency = 1
			else
				Instance.BackgroundTransparency = 0
			end
		end
	end
end)
