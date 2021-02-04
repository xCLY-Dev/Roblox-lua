-- Gui to Lua
-- Version: 3.2

-- Instances:

local Loader31sj = Instance.new("ScreenGui")
local emcan = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Frame = Instance.new("Frame")

--Properties:

Loader31sj.Name = "Loader31sj"
Loader31sj.Parent = game.CoreGui

emcan.Name = "emcan"
emcan.Parent = Loader31sj
emcan.AnchorPoint = Vector2.new(0.5, 0.5)
emcan.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
emcan.BackgroundTransparency = 1.000
emcan.ClipsDescendants = true
emcan.Position = UDim2.new(0.499497503, 0, 0.5, 0)
emcan.Size = UDim2.new(0, 65, 0, 0)
emcan.Image = "rbxassetid://3570695787"
emcan.ImageColor3 = Color3.fromRGB(33, 33, 33)
emcan.ScaleType = Enum.ScaleType.Slice
emcan.SliceCenter = Rect.new(100, 100, 100, 100)
emcan.SliceScale = 0.040

TextLabel.Parent = emcan
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.ClipsDescendants = true
TextLabel.Position = UDim2.new(0.212643683, 0, 0.25, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "Loading"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 25.000

Frame.Parent = emcan
Frame.BackgroundColor3 = Color3.fromRGB(123, 180, 255)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0, 15, 0.819999993, 0)
Frame.Size = UDim2.new(0, 12, 0, 2)

-- Scripts:

local function JPDNTQL_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local ld = 7
	local wt = 0.5
	local wd = 0.5
	local text = script.Parent.Parent.TextLabel
	local bar = script.Parent.Parent.Frame
	
	
	function textt(t)
		text.Text = t
	end
	
	function w(t)
		wait(t)
	end
	--{0, 348},{0, 100}
	script.Parent.Parent.Parent.emcan:TweenSize(UDim2.new(0,348,0,100),"Out","Sine",wd)
	w(1)
	script.Parent.Parent.Frame:TweenSize(UDim2.new(0,318,0,2),"Out","Sine",ld)
	textt("Loading")
	w(1)
	textt("Checking Game")
	w(1)
	textt("Checking Host")
	w(1)
	textt("Executing Script")
	w(1)
	textt("Enjoy :)")
	text.Visible = false
	script.Parent.Parent.Parent.emcan:TweenSize(UDim2.new(0,65,0,0),"Out","Sine",wt)
	
	--{0, 65},{0, 0}
end
coroutine.wrap(JPDNTQL_fake_script)()

wait(6)
