local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
_G.gamenamegay = GetName.Name

local a = game:GetService("Players").LocalPlayer

function Getmetatable()
   Get_metatable = getrawmetatable or debug.getmetatable or a:Kick("Your exploit isn\'t compatible your missing , [Get_metatable]");
       print("Getmetatable : true")
end

function Drawingg()
   New = Drawing.new or a:Kick("Your exploit isn\'t compatible your missing , Hook [hookfunction]");
   print("Drawing : true")
end

Drawingg()
Getmetatable()
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local BAR = Instance.new("ImageLabel")
local TextButton = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local TEXT = Instance.new("ImageLabel")
local gamelabel = Instance.new("TextLabel")


ScreenGui.Parent = game.CoreGui

Frame.Name = "Frame"
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Image = "rbxassetid://3570695787"
Frame.ImageColor3 = Color3.fromRGB(25, 25, 25)
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.080

BAR.Name = "BAR"
BAR.Parent = Frame
BAR.AnchorPoint = Vector2.new(0.5, 0.5)
BAR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BAR.BackgroundTransparency = 1.000
BAR.ClipsDescendants = true
BAR.Position = UDim2.new(0.5, 0, 0.0900000036, 0)
BAR.Image = "rbxassetid://3570695787"
BAR.ImageColor3 = Color3.fromRGB(20, 20, 20)
BAR.ScaleType = Enum.ScaleType.Slice
BAR.SliceCenter = Rect.new(100, 100, 100, 100)
BAR.SliceScale = 0.080

TextButton.Parent = BAR
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Position = UDim2.new(0.886666656, 0, 0, 0)
TextButton.Size = UDim2.new(0, 34, 0, 27)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "X"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 20.000

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(-0.00169354677, 0, -0.0481034294, 0)
ImageLabel.Size = UDim2.new(0, 40, 0, 40)
ImageLabel.Image = "http://www.roblox.com/asset/?id=6567126195"

TEXT.Name = "TEXT"
TEXT.Parent = Frame
TEXT.AnchorPoint = Vector2.new(0.5, 0.5)
TEXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TEXT.BackgroundTransparency = 1.000
TEXT.ClipsDescendants = true
TEXT.Position = UDim2.new(0.498333335, 0, 0.562614977, 0)
TEXT.Image = "rbxassetid://3570695787"
TEXT.ImageColor3 = Color3.fromRGB(20, 20, 20)
TEXT.ScaleType = Enum.ScaleType.Slice
TEXT.SliceCenter = Rect.new(100, 100, 100, 100)
TEXT.SliceScale = 0.080

gamelabel.Name = "gamelabel"
gamelabel.Parent = TEXT
gamelabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gamelabel.BackgroundTransparency = 1.000
gamelabel.Position = UDim2.new(0, 0, 0.00849754736, 0)
gamelabel.Font = Enum.Font.Gotham
gamelabel.Text = _G.gamenamegay
gamelabel.TextColor3 = Color3.fromRGB(255, 255, 255)
gamelabel.TextSize = 25.000

-- Scripts:

local function SNTO_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	wait(2)
	local gui = script.Parent
	local tween = gui:TweenSize(UDim2.new(0, 100,0, 100), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(2)
	local tween = gui:TweenSize(UDim2.new(0, 300,0, 150), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 100,0, 100), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(3)
	local tween = gui:TweenSize(UDim2.new(0, 0,0, 0), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	
end
coroutine.wrap(SNTO_fake_script)()
local function QOUX_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local gui = script.Parent.Parent.Parent.Parent.Parent.ScreenGui
	local but = script.Parent
	but.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)
end
coroutine.wrap(QOUX_fake_script)()
local function ZBQZ_fake_script() -- BAR.LocalScript 
	local script = Instance.new('LocalScript', BAR)

	local gui = script.Parent
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 300,0, 27), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 0,0, 0), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	gui.Visible = false
	
end
coroutine.wrap(ZBQZ_fake_script)()
local function TSZDDPE_fake_script() -- ImageLabel.LocalScript 
	local script = Instance.new('LocalScript', ImageLabel)

	wait(2)
	local gui = script.Parent
	local tween = gui:TweenSize(UDim2.new(0, 100,0, 100), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(2)
	local tween = gui:TweenSize(UDim2.new(0, 40,0, 40), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 100,0, 100), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(3)
	local tween = gui:TweenSize(UDim2.new(0, 0,0, 0), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	
end
coroutine.wrap(TSZDDPE_fake_script)()
local function PWIJCZC_fake_script() -- TEXT.LocalScript 
	local script = Instance.new('LocalScript', TEXT)

	local gui = script.Parent
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 270,0, 105), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 0,0, 0), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	gui.Visible = false
	
	--270 105
end
coroutine.wrap(PWIJCZC_fake_script)()
local function YQOGKS_fake_script() -- gamelabel.LocalScript 
	local script = Instance.new('LocalScript', gamelabel)

	local gui = script.Parent
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 270,0, 105), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	wait(4)
	local tween = gui:TweenSize(UDim2.new(0, 0,0, 0), Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.2,true)
	gui.Visible = false
end
coroutine.wrap(YQOGKS_fake_script)()
