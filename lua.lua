
local Loader31sj = Instance.new("ScreenGui")
local emcan = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Frame = Instance.new("Frame")


Loader31sj.Name = "Loader31sj"
Loader31sj.Parent = game.CoreGui

emcan.Name = "emcan"
emcan.Parent = Loader31sj
emcan.AnchorPoint = Vector2.new(0.5, 0.5)
emcan.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
emcan.BackgroundTransparency = 1.000
emcan.ClipsDescendants = true
emcan.Position = UDim2.new(0.499497503, 0, 0.5, 0)
emcan.Size = UDim2.new(0, 68, 0, 0)
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
TextLabel.Text = "Text Function"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 25.000

Frame.Parent = emcan
Frame.BackgroundColor3 = Color3.fromRGB(123, 180, 255)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0, 15, 0.819999993, 0)
Frame.Size = UDim2.new(0, 12, 0, 2)

-- Scripts:

local function IBXS_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local ld = 0.01
	local wt = 0.01
	local wd = 0.5
	local text = script.Parent.Parent.TextLabel
	local bar = script.Parent.Parent.Frame
	local a = false
	
	function textt(t)
		text.Text = t
	end
	
	function w(t)
		wait(t)
	end
	--{0, 348},{0, 100}
	wait(1)
	script.Parent.Parent.Parent.emcan:TweenSize(UDim2.new(0,348,0,100),"Out","Sine",wd)
	wait(1)
	script.Parent.Parent.Frame:TweenSize(UDim2.new(0,59,0,2),"Out","Sine",0.5)
	textt("Loading")
	a = true
	wait(1)
	if a == true then 
	a = false
	script.Parent.Parent.Frame:TweenSize(UDim2.new(0,102,0,2),"Out","Sine",0.5) 
		textt("Checking Game")
		a = true
	end
	w(1)
	if a == true then 
		a = false
		script.Parent.Parent.Frame:TweenSize(UDim2.new(0,200,0,2),"Out","Sine",0.5) 
		textt("Checking Host")
		a = true
	end
	wait(1)
	if a == true then 
		a = false
		script.Parent.Parent.Frame:TweenSize(UDim2.new(0,250,0,2),"Out","Sine",0.5) 
		textt("Executing Script")
		a = true
	end
	wait(1)
	if a == true then 
		a = false
		script.Parent.Parent.Frame:TweenSize(UDim2.new(0,300,0,2),"Out","Sine",0.5) 
		textt("Enjoy :)")
		a = true
	end
	wait(1)
	script.Parent.Parent.Parent.emcan:TweenSize(UDim2.new(0,0,0,0),"Out","Sine",wd)
	wait(1)
	script.Parent.Parent.Parent.Parent.Loader31sj:Destroy()
	wait(10)
end
coroutine.wrap(IBXS_fake_script)()
