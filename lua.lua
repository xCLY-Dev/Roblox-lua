getgenv().Drawing = false
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local Frame_3 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 315, 0, 85)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

Frame_2.Parent = Frame
Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame_2.BorderSizePixel = 0
Frame_2.ClipsDescendants = true
Frame_2.Position = UDim2.new(0.498412699, 0, 0.513683379, 0)
Frame_2.Size = UDim2.new(0, 10, 0, 2)

ImageLabel.Parent = Frame_2
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.ClipsDescendants = true
ImageLabel.Position = UDim2.new(0.49701494, 0, 0.495599657, 0)
ImageLabel.Size = UDim2.new(0, 11, 0, 9)
ImageLabel.Image = "rbxassetid://3570695787"
ImageLabel.ImageColor3 = Color3.fromRGB(15, 15, 15)

Frame_3.Parent = ImageLabel
Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.219367027, 0, 0.563370824, 2)
Frame_3.Size = UDim2.new(0, 12, 0, 1)
Frame_3.Visible = false

TextLabel.Parent = ImageLabel
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.LayoutOrder = -3
TextLabel.Position = UDim2.new(0.312825739, 0, 0.447257787, 2)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 22.000
TextLabel.TextTransparency = 1.000

-- Scripts:

local function CXEQQHC_fake_script() -- ImageLabel.LocalScript 
	local script = Instance.new('LocalScript', ImageLabel)

	local gui = script.Parent
	local ts = game:GetService("TweenService")
	
	local goal = {}
	wait(.5)
	local tween = gui:TweenSize(UDim2.new(0, 534,0, 507), Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.5,true)
	
		--{0, 25},{0, 23}
end
coroutine.wrap(CXEQQHC_fake_script)()
local function SEQCF_fake_script() -- Frame_3.LocalScript 
	local script = Instance.new('LocalScript', Frame_3)

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
	wait(3)
	script.Parent.Visible = true
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
		textt("Checking libraries")
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
	--[[
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
	
	--{0, 65},{0, 0}]]
end
coroutine.wrap(SEQCF_fake_script)()
local function CZLQQ_fake_script() -- Frame_3.Rainbower 
	local script = Instance.new('LocalScript', Frame_3)
end

coroutine.wrap(CZLQQ_fake_script)()
local function OXKSUXJ_fake_script() -- TextLabel.LocalScript 
	local script = Instance.new('LocalScript', TextLabel)

	local gui = script.Parent
	wait(2)
	for i = 1,50 do
		script.Parent.TextTransparency = script.Parent.TextTransparency - 0.05
		wait()
	end
end
coroutine.wrap(OXKSUXJ_fake_script)()
local function KHEGNEV_fake_script() -- Frame_2.LocalScript 
	local script = Instance.new('LocalScript', Frame_2)

	local gui = script.Parent
	wait(.1)
	local tween = gui:TweenSize(UDim2.new(0, 329,0, 100), Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.5,true)
	wait(9)
	local tween = gui:TweenSize(UDim2.new(0, 10,0, 2), Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.5,true)
	wait(1)
	script.Parent.Parent.Parent.Parent.ScreenGui:Destroy()
end
coroutine.wrap(KHEGNEV_fake_script)()
