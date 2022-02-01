-- Gui to Lua
-- Version: 3.2

-- Instances:

local easyfovchanger = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")

--Properties:

easyfovchanger.Name = "easyfovchanger"
easyfovchanger.Parent = game.CoreGui
easyfovchanger.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
easyfovchanger.Position = UDim2.new(0.495976597, 0, 0.327510923, 0)
easyfovchanger.Size = UDim2.new(0, 138, 0, 200)

UICorner.Parent = easyfovchanger

TextBox.Parent = easyfovchanger
TextBox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
TextBox.Position = UDim2.new(0, 0, 0.229999989, 0)
TextBox.Size = UDim2.new(0, 138, 0, 40)
TextBox.Font = Enum.Font.SourceSansSemibold
TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(178, 178, 178)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = TextBox

TextButton.Parent = easyfovchanger
TextButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
TextButton.Position = UDim2.new(0, 0, 0.595000029, 0)
TextButton.Size = UDim2.new(0, 138, 0, 44)
TextButton.Font = Enum.Font.SourceSansSemibold
TextButton.Text = "set fov"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = TextButton

-- Scripts:

local function DFUKM_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local input = script.Parent.Parent.TextBox
	
	
	script.Parent.MouseButton1Down:Connect(function()
		workspace.CurrentCamera.FieldOfView = input.Text
	end)
end
coroutine.wrap(DFUKM_fake_script)()
local function WMCPI_fake_script() -- easyfovchanger.Dragify 
	local script = Instance.new('LocalScript', easyfovchanger)

	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
	    dragToggle = nil
	    local dragSpeed = 0
	    dragInput = nil
	    dragStart = nil
	    local dragPos = nil
	    function updateInput(input)
	        local Delta = input.Position - dragStart
	        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	    end
	    Frame.InputBegan:Connect(function(input)
	        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
	            dragToggle = true
	            dragStart = input.Position
	            startPos = Frame.Position
	            input.Changed:Connect(function()
	                if input.UserInputState == Enum.UserInputState.End then
	                    dragToggle = false
	                end
	            end)
	        end
	    end)
	    Frame.InputChanged:Connect(function(input)
	        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	            dragInput = input
	        end
	    end)
	    game:GetService("UserInputService").InputChanged:Connect(function(input)
	        if input == dragInput and dragToggle then
	            updateInput(input)
	        end
	    end)
	end
	
	dragify(script.Parent)
end
coroutine.wrap(WMCPI_fake_script)()
