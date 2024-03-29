do
	local ui = game:GetService("CoreGui"):FindFirstChild("Skoldhub")
	if ui then ui:Destroy() end
end

local lib = {}
local themesettings = {
    Dark = {
        MainFrameColor = Color3.fromRGB(24,24,24),
        ItemsColor = Color3.fromRGB(18, 18, 18), 
		TextColor = Color3.fromRGB(255,255,255),      
		hovercolor = Color3.fromRGB(13, 13, 13),
		SliderCircleColor = Color3.fromRGB(28,28,28),
		ripplecolor = Color3.fromRGB(193, 193, 193)
    },
    Light = {
        MainFrameColor = Color3.fromRGB(235, 235, 235),
        ItemsColor = Color3.fromRGB(255,255,255), 
		TextColor = Color3.fromRGB(0,0,0),      
		hovercolor = Color3.fromRGB(211, 211, 211),
		SliderCircleColor = Color3.fromRGB(206, 206, 206),
ripplecolor = Color3.fromRGB(195,195,195)
    },
	midnight = {
        MainFrameColor = Color3.fromRGB(44, 62, 82),
        ItemsColor = Color3.fromRGB(52, 74, 95), 
		TextColor = Color3.fromRGB(255,255,255),      
		hovercolor = Color3.fromRGB(57, 81, 105),
		SliderCircleColor = Color3.fromRGB(44, 62, 82),
		ripplecolor = Color3.fromRGB(255,255,255)
    }  
}
local theme = "Dark"
local themesetting = "Dark"
pcall(function()
    theme = readfile("skoldhub.sk");
end);

if theme == "Light" then
	themesetting = "Light"
elseif theme == "Dark" then
	themesetting = "Dark"
elseif theme == "midnight" then
	themesetting = "midnight"
else
	themesetting = "Light"
    writefile("skoldhub.sk", "Light")
end	



local TweenService = game:GetService("TweenService")
function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end
local counter = 0
local rainbowcolor = Color3.fromHSV(zigzag(counter),0.6,1)
game:GetService('RunService').Stepped:Connect(function()
	rainbowcolor = Color3.fromHSV(zigzag(counter),0.6,1)
	counter = counter + 0.0010  
end)
local function ripple(obj, color)
	spawn(function()
		local Mouse = game.Players.LocalPlayer:GetMouse()
		local Circle = Instance.new("ImageLabel")
		Circle.Name = "Circle"
		Circle.Parent = obj
		Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Circle.BackgroundTransparency = 1.000
		Circle.ZIndex = 10
		Circle.Image = "rbxassetid://266543268"
		Circle.ImageColor3 = Color3.fromRGB(themesettings[themesetting].ripplecolor)
		Circle.ImageTransparency = 0.4
		local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
		Circle.Position = UDim2.new(0, NewX, 0, NewY)
		local Size = 0
		if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
			Size = obj.AbsoluteSize.X * 1.5
		elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
			Size = obj.AbsoluteSize.Y * 1.5
		elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
			Size = obj.AbsoluteSize.X * 1.5
		end
		Circle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, - Size / 2, 0.5, - Size / 2), "Out", "Quad", 0.5, false)
		for i = 1, 20 do
			Circle.ImageTransparency = Circle.ImageTransparency + 0.05
			wait(0.3 / 10)
		end
		Circle:Destroy()
	end)
end

local function makeDraggable(obj) 
	--// Original code by Tiffblocks, edited so that it has a cool tween to it. 
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")

	local gui = obj

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		local EndPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		local Tween = TweenService:Create(
			gui, 
			TweenInfo.new(0.2), 
			{Position = EndPos}
		)
		Tween:Play()
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

local skold = Instance.new("ScreenGui")
skold.Name = "Skold Hub"
skold.Parent = game.CoreGui
skold.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local usi = game:GetService("UserInputService")
local uitoggled = false
usi.InputBegan:Connect(function(io, p)
    if io.KeyCode == Enum.KeyCode.RightShift then
 if uitoggled == false then
	skold.Enabled = false
	   uitoggled = true
else
	skold.Enabled = true
	   uitoggled = false
	end
    end
end)

local function notification(text)
	for i,v in next, skold :GetChildren() do
		if v.Name == "notification" then
			v:Destroy()
		end
	end	
local notification = Instance.new("ImageButton")
local Glow = Instance.new("ImageLabel")
local top = Instance.new("Frame")
local title = Instance.new("TextLabel")
local button = Instance.new("TextButton")
local buttontext = Instance.new("TextLabel")
local corner = Instance.new("UICorner")
local desc = Instance.new("TextLabel")


notification.Name = "notification"
notification.Parent = skold
notification.BackgroundColor3 = themesettings[themesetting].MainFrameColor
notification.BackgroundTransparency = 1.000
notification.LayoutOrder = 1
notification.Position = UDim2.new(0.424479187, 0, 0.413428158, 0)
notification.Size = UDim2.new(0, 289, 0, 156)
notification.SizeConstraint = Enum.SizeConstraint.RelativeYY
notification.Image = "rbxassetid://2790389767"
notification.ImageColor3 = themesettings[themesetting].MainFrameColor
notification.ScaleType = Enum.ScaleType.Slice
notification.SliceCenter = Rect.new(8, 8, 248, 248)

Glow.Name = "Glow"
Glow.Parent = notification
Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Glow.BackgroundTransparency = 1.000
Glow.BorderSizePixel = 0
Glow.Position = UDim2.new(0, -15, 0, -15)
Glow.Size = UDim2.new(1, 30, 1, 30)
Glow.ZIndex = 0
Glow.Image = "rbxassetid://4996891970"
Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(20, 20, 280, 280)

top.Name = "top"
top.Parent = notification
top.AnchorPoint = Vector2.new(0.5, 0)
top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
top.BackgroundTransparency = 1.000
top.Position = UDim2.new(0.5, 0, 0, 25)
top.Size = UDim2.new(1, -40, 0, 20)

title.Name = "title"
title.Parent = top
title.BackgroundColor3 = themesettings[themesetting].TextColor
title.BackgroundTransparency = 1.000
title.Size = UDim2.new(1, 0, 1, 0)
title.Font = Enum.Font.SourceSans
title.Text = "Skold Hub"
title.TextColor3 = themesettings[themesetting].TextColor
title.TextSize = 25.000
title.TextXAlignment = Enum.TextXAlignment.Left

button.Name = "button"
button.Parent = notification
button.BackgroundColor3 = themesettings[themesetting].ItemsColor
button.BorderSizePixel = 0
button.Position = UDim2.new(0.0519031137, 0, 0.748603344, 0)
button.Size = UDim2.new(0.896193743, 0, -0.00558659201, 26)
button.AutoButtonColor = false
button.Font = Enum.Font.SourceSans
button.Text = ""
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.TextSize = 14.000

buttontext.Name = "buttontext"
buttontext.Parent = button
buttontext.AnchorPoint = Vector2.new(0, 0.5)
buttontext.BackgroundColor3 = themesettings[themesetting].TextColor
buttontext.BackgroundTransparency = 1.000
buttontext.Position = UDim2.new(0, 8, 0.5, 0)
buttontext.Size = UDim2.new(0, 49, 1, -8)
buttontext.Font = Enum.Font.SourceSans
buttontext.Text = "Okay"
buttontext.TextColor3 =themesettings[themesetting].TextColor
buttontext.TextSize = 13.000
buttontext.TextXAlignment = Enum.TextXAlignment.Left

corner.Name = "corner"
corner.Parent = button

desc.Name = "desc"
desc.Parent = notification
desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
desc.BackgroundTransparency = 1.000
desc.Position = UDim2.new(0.152249128, 0, 0.333333343, 0)
desc.Size = UDim2.new(0.698961914, 0, 0.339743733, 0)
desc.Font = Enum.Font.SourceSans
desc.Text = text
desc.TextColor3 = themesettings[themesetting].TextColor
desc.TextScaled = true
desc.TextSize = 20.000
desc.TextTransparency = 0.200
desc.TextWrapped = true

local MouseEntered = TweenService:Create(
	button,
	TweenInfo.new(
		0.3,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	),
	{
		BackgroundColor3 = themesettings[themesetting].hovercolor
	}
)

local MouseLeft = TweenService:Create(
	button,
	TweenInfo.new(
		0.3,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	),
	{
		
		BackgroundColor3 = themesettings[themesetting].ItemsColor
	}
)

button.MouseEnter:Connect(function()
	MouseEntered:Play()
end)
button.MouseLeave:Connect(function()
	MouseLeft:Play()
end)
button.MouseButton1Click:Connect(function()

	notification:Destroy()
end)


end	

function lib:MainWindow(size,name, gametext)

	
	local FirstTab = false
	local tabscontainer = Instance.new("Frame")
	local mainframe = Instance.new("ImageButton")
	local Glow = Instance.new("ImageLabel")
	local top = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	local tablist = Instance.new("UIListLayout")
	local gamename = Instance.new("TextLabel")
	local Vis = true;
	
mainframe.Name = "mainframe"
mainframe.Parent = skold
mainframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainframe.BackgroundTransparency = 1.000
mainframe.Position = UDim2.new(0.420833319, 0, 0.0150703797, 0)
mainframe.Size = size
mainframe.SizeConstraint = Enum.SizeConstraint.RelativeYY
mainframe.Image = "rbxassetid://2790389767"
mainframe.ImageColor3 = themesettings[themesetting].MainFrameColor
mainframe.ScaleType = Enum.ScaleType.Slice
mainframe.SliceCenter = Rect.new(8, 8, 248, 248)
mainframe.LayoutOrder = 2
makeDraggable(mainframe)	
	
Glow.Name = "Glow"
Glow.Parent = mainframe
Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Glow.BackgroundTransparency = 1.000
Glow.BorderSizePixel = 0
Glow.Position = UDim2.new(0, -15, 0, -15)
Glow.Size = UDim2.new(1, 30, 1, 30)
Glow.ZIndex = 0
Glow.Image = "rbxassetid://4996891970"
Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(20, 20, 280, 280)

top.Name = "top"
top.Parent = mainframe
top.AnchorPoint = Vector2.new(0.5, 0)
top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
top.BackgroundTransparency = 1.000
top.Position = UDim2.new(0.5, 0, 0, 25)
top.Size = UDim2.new(1, -40, 0, 20)

title.Name = "title"
title.Parent = top
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Size = UDim2.new(1, 0, 1, 0)
title.Font = Enum.Font.SourceSans
title.Text = name
title.TextColor3 = themesettings[themesetting].TextColor
title.TextSize = 25.000
	title.TextXAlignment = Enum.TextXAlignment.Left




gamename.Name = "gamename"
gamename.Parent = top
gamename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gamename.BackgroundTransparency = 1.000
gamename.Position = UDim2.new(0, 0, 0.797674537, 0)
gamename.Size = UDim2.new(1, 0, 0.702325463, 0)
gamename.Font = Enum.Font.SourceSans
gamename.Text = gametext
gamename.TextColor3 = themesettings[themesetting].TextColor
gamename.TextSize = 15.000
gamename.TextXAlignment = Enum.TextXAlignment.Left
	
	tabscontainer.Name = "tabscontainer"
	tabscontainer.Parent = top
	tabscontainer.AnchorPoint = Vector2.new(1, 0)
	tabscontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabscontainer.BackgroundTransparency = 1.000
	tabscontainer.Position = UDim2.new(1, 0, 0, 2)
	tabscontainer.Size = UDim2.new(1, 0, 1, 0)

	tablist.Name = "tablist"
	tablist.Parent = tabscontainer
	tablist.FillDirection = Enum.FillDirection.Horizontal
	tablist.HorizontalAlignment = Enum.HorizontalAlignment.Right
	tablist.SortOrder = Enum.SortOrder.LayoutOrder
	tablist.Padding = UDim.new(0, 14)
local tabholder = {}	
	
	function tabholder:Tab(name)
		local tab = Instance.new("TextButton")
		local container = Instance.new("Frame")
		local containerlist = Instance.new("UIListLayout")
		local tabcurrent = {}
		local scrollframe = Instance.new("ScrollingFrame")
		
		scrollframe.Name = "scrollframe"
		scrollframe.Parent = mainframe
		scrollframe.Active = true
		scrollframe.AnchorPoint = Vector2.new(0.5, 0)
		scrollframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		scrollframe.BackgroundTransparency = 1.000
		scrollframe.BorderSizePixel = 0
		scrollframe.Visible = Vis
		scrollframe.Position = UDim2.new(0.5, 4, 0, 63)
		scrollframe.Size = UDim2.new(1, -20, 1, -77)
		scrollframe.BottomImage = "rbxassetid://5234388158"
		scrollframe.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollframe.MidImage = "rbxassetid://5234388158"
		scrollframe.ScrollBarThickness = 6
		scrollframe.TopImage = "rbxassetid://5234388158"
		scrollframe.ScrollBarImageColor3 = themesettings[themesetting].ItemsColor

tab.Name = "tab"
tab.Parent = tabscontainer
tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tab.BackgroundTransparency = 1.000
tab.Position = UDim2.new(0.907380342, 0, 0, 0)
tab.Font = Enum.Font.GothamBold
tab.Text = name
tab.TextColor3 = themesettings[themesetting].TextColor
tab.TextSize = 14.000
tab.Size = UDim2.new(0, tab.TextBounds.X + 5, 1, 1, 0)
tab.TextTransparency = 0.3

container.Name = "container"
container.Parent = scrollframe
container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
container.BackgroundTransparency = 1.000
container.Size = UDim2.new(1, -11, 1.5831753, 0)
container.Visible = true

containerlist.Name = "containerlist"
containerlist.Parent = container
containerlist.SortOrder = Enum.SortOrder.LayoutOrder
containerlist.Padding = UDim.new(0, 4)
		
local CurrentPageName = ""
if FirstTab == false then
	CurrentPageName = title;
	FirstTab = true;
	Vis = false;
	tab.TextTransparency = 0
end
	
		tab.MouseButton1Click:Connect(function()	
			for i,v in next, mainframe:GetChildren() do
				if v.Name == "scrollframe" then
					v.Visible = false
				end
			end	
			for i,v in next, tabscontainer:GetChildren() do
				if v.ClassName == "TextButton" then
					v.TextTransparency = 0.3
				end
			end	
			tab.TextTransparency = 0

			scrollframe.Visible = true
end)
			

		
		function tabcurrent:Button(name, callback)	
			callback = callback or function(...) end
			local button = Instance.new("TextButton")
			local buttontext = Instance.new("TextLabel")
			local corner = Instance.new("UICorner")
			button.Name = "button"
			button.Parent = container
			button.BackgroundColor3 = themesettings[themesetting].ItemsColor
			button.BorderSizePixel = 0
			button.Size = UDim2.new(1, 0, 0, 26)
			button.AutoButtonColor = false
			button.Font = Enum.Font.SourceSans
			button.Text = ""
			button.ClipsDescendants = true
			button.TextColor3 = Color3.fromRGB(0, 0, 0)
			button.TextSize = 14.000

			buttontext.Name = "buttontext"
			buttontext.Parent = button
			buttontext.AnchorPoint = Vector2.new(0, 0.5)
			buttontext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			buttontext.BackgroundTransparency = 1.000
			buttontext.Position = UDim2.new(0, 8, 0.5, 0)
			buttontext.Size = UDim2.new(0, 49, 1, -8)
			buttontext.Font = Enum.Font.SourceSans
			buttontext.Text = name
			buttontext.TextColor3 = themesettings[themesetting].TextColor
			buttontext.TextSize = 13.000
			buttontext.TextXAlignment = Enum.TextXAlignment.Left
			
			
			local MouseEntered = TweenService:Create(
				button,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = themesettings[themesetting].hovercolor
				}
			)

			local MouseLeft = TweenService:Create(
				button,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					
					BackgroundColor3 = themesettings[themesetting].ItemsColor
				}
			)

			button.MouseEnter:Connect(function()
				MouseEntered:Play()
			end)
			button.MouseLeave:Connect(function()
				MouseLeft:Play()
			end)
			button.MouseButton1Click:Connect(function()
				pcall(callback)
				ripple(button, Color3.fromRGB(193, 193, 193))
				
			end)

			corner.Name = "corner"
			corner.Parent = button
			
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
		end
		
		function tabcurrent:Spliter()
			local spliter = Instance.new("Frame")
			spliter.Name = "spliter"
			spliter.Parent = container
			spliter.BackgroundColor3 = themesettings[themesetting].ItemsColor
			spliter.BorderColor3 = Color3.fromRGB(43, 42, 49)
			spliter.BorderSizePixel = 0
			spliter.Position = UDim2.new(0, 0, 1, 2)
			spliter.Size = UDim2.new(1, 0, 0, 1)
			
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
end
		
		function tabcurrent:Toggle(name,toggled, callback)		
			callback = callback or function(...) end
            local t = toggled
            
			local toggle = Instance.new("TextButton")
			local toggletext = Instance.new("TextLabel")
			local corner = Instance.new("UICorner")
			local box = Instance.new("Frame")
			local fill = Instance.new("Frame")
			local corner_2 = Instance.new("UICorner")
			local corner_3 = Instance.new("UICorner")


			toggle.Name = "toggle"
			toggle.Parent = container
			toggle.BackgroundColor3 = themesettings[themesetting].ItemsColor
			toggle.BorderSizePixel = 0
			toggle.Size = UDim2.new(1, 0, 0, 26)
			toggle.AutoButtonColor = false
			toggle.Font = Enum.Font.SourceSans
			toggle.Text = ""
			toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			toggle.TextSize = 14.000
			toggle.ClipsDescendants = true

			toggletext.Name = "toggletext"
			toggletext.Parent = toggle
			toggletext.AnchorPoint = Vector2.new(0, 0.5)
			toggletext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggletext.BackgroundTransparency = 1.000
			toggletext.Position = UDim2.new(0, 8, 0.5, 0)
			toggletext.Size = UDim2.new(0, 49, 1, -8)
			toggletext.Font = Enum.Font.SourceSans
			toggletext.Text = name
			toggletext.TextColor3 = themesettings[themesetting].TextColor
			toggletext.TextSize = 13.000
			toggletext.TextXAlignment = Enum.TextXAlignment.Left

			corner.Name = "corner"
			corner.Parent = toggle

			box.Name = "box"
			box.Parent = toggle
			box.AnchorPoint = Vector2.new(1, 0.5)
			box.BackgroundColor3 = themesettings[themesetting].MainFrameColor
			box.BorderSizePixel = 0
			box.Position = UDim2.new(1, -10, 0.5, 0)
			box.Size = UDim2.new(0, 36, 1, -8)

			fill.Name = "fill"
			fill.Parent = box
			fill.AnchorPoint = Vector2.new(0, 0.5)
			fill.BackgroundColor3 = 	themesettings[themesetting].ItemsColor
			fill.BorderSizePixel = 0
			fill.Position = UDim2.new(0, 2, 0.5, 0)
			fill.Size = UDim2.new(0.5, -4, 1, -4)

			corner_2.CornerRadius = UDim.new(0, 30)
			corner_2.Name = "corner"
			corner_2.Parent = fill

			corner_3.Name = "corner"
			corner_3.Parent = box
			
			local MouseEntered = TweenService:Create(
				toggle,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = 	themesettings[themesetting].hovercolor

				}
			)

			local MouseLeft = TweenService:Create(
				toggle,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = 	themesettings[themesetting].ItemsColor
				}
			)
			
			local truetoggle = TweenService:Create(
				box,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = Color3.fromRGB(59, 153, 253)
				}
			)

			local falsetoggle = TweenService:Create(
				box,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = 	themesettings[themesetting].MainFrameColor
				}
			)
			
			toggle.MouseEnter:Connect(function()
				MouseEntered:Play()
			end)
			toggle.MouseLeave:Connect(function()
				MouseLeft:Play()
			end)
	        toggle.MouseButton1Click:Connect(function()
				if t == true then
					fill:TweenPosition(UDim2.new(0, 2, 0.5, 0), "In", "Quint", 0.2)
                    falsetoggle:Play()
				elseif t == false then
					fill:TweenPosition(UDim2.new(0.528, 2,0.5, 0), "In", "Quint", 0.2)
                    truetoggle:Play()
				end
				t = not t
				ripple(toggle, Color3.fromRGB(193, 193, 193))
				pcall(callback, t)
            end)
            
            if toggled == true then
                pcall(callback, t)
                fill:TweenPosition(UDim2.new(0.528, 2,0.5, 0), "In", "Quint", 0.2)
                truetoggle:Play()
            end    

			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
		end
		
		function tabcurrent:Slider(name, min, max, callback)
			local dragging = false
			callback = callback or function(...) end
			local slider = Instance.new("TextButton")
			local slidertext = Instance.new("TextLabel")
			local corner = Instance.new("UICorner")
			local placetoslide = Instance.new("Frame")
			local corner_2 = Instance.new("UICorner")
			local actualslide = Instance.new("Frame")
			local corner_3 = Instance.new("UICorner")
			local Value = Instance.new("TextLabel")

			slider.Name = "slider"
			slider.Parent = container
			slider.BackgroundColor3 = themesettings[themesetting].ItemsColor
			slider.BorderSizePixel = 0
			slider.Position = UDim2.new(-0.0121703856, 0, 0.00985016767, 0)
			slider.Size = UDim2.new(1, 0, 0, 26)
			slider.AutoButtonColor = false
			slider.Font = Enum.Font.SourceSans
			slider.Text = ""
			slider.TextColor3 = Color3.fromRGB(0, 0, 0)
			slider.TextSize = 14.000

			slidertext.Name = "slidertext"
			slidertext.Parent = slider
			slidertext.AnchorPoint = Vector2.new(0, 0.5)
			slidertext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			slidertext.BackgroundTransparency = 1.000
			slidertext.Position = UDim2.new(0, 8, 0.5, 0)
			slidertext.Size = UDim2.new(0, 49, 1, -8)
			slidertext.Font = Enum.Font.SourceSans
			slidertext.Text = name
			slidertext.TextColor3 = themesettings[themesetting].TextColor
			slidertext.TextSize = 13.000
			slidertext.TextXAlignment = Enum.TextXAlignment.Left

			corner.Name = "corner"
			corner.Parent = slider

			placetoslide.Name = "placetoslide"
			placetoslide.Parent = slider
			placetoslide.AnchorPoint = Vector2.new(1, 0.5)
			placetoslide.BackgroundColor3 = themesettings[themesetting].MainFrameColor
			placetoslide.BorderSizePixel = 0
			placetoslide.Position = UDim2.new(1, -10, 0.5, 0)
			placetoslide.Size = UDim2.new(0.237322509, 36, 1.70000005, -40)

			corner_2.Name = "corner"
			corner_2.Parent = placetoslide

			actualslide.Name = "actualslide"
			actualslide.Parent = placetoslide
			actualslide.AnchorPoint = Vector2.new(0, 0.5)
			actualslide.BackgroundColor3 = themesettings[themesetting].SliderCircleColor
			actualslide.BorderSizePixel = 0
			actualslide.Position = UDim2.new(-0.00999999978, 2, 0.354999989, 0)
			actualslide.Size = UDim2.new(0.098718904, -4, 3.61909699, -4)

			corner_3.CornerRadius = UDim.new(1000, 100)
			corner_3.Name = "corner"
			corner_3.Parent = actualslide

			Value.Name = "Value"
			Value.Parent = slider
			Value.AnchorPoint = Vector2.new(0, 0.5)
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.Position = UDim2.new(0.575510263, 8, 0.5, 0)
			Value.Size = UDim2.new(-0.042857144, 49, 1, -8)
			Value.Font = Enum.Font.SourceSans
			Value.Text = min .. " / " .. max
			Value.TextColor3 = themesettings[themesetting].TextColor
			Value.TextSize = 13.000
			Value.TextTransparency = 1.000
			Value.TextXAlignment = Enum.TextXAlignment.Right
			
	
			
			local function move(input)
				local pos = UDim2.new(math.clamp((input.Position.X - placetoslide.AbsolutePosition.X) / placetoslide.AbsoluteSize.X, 0, 1), -6, 0.354999989, 0)
				actualslide:TweenPosition(pos, "Out", "Sine", 0.1, true);
				local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
				Value.Text = tostring(value).." / "..tostring(max);
				callback(value)
			end
			actualslide.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true;
					local b = game:GetService("TweenService"):Create(Value, TweenInfo.new(0.2), {TextTransparency = 0})
					b:Play()
				end
			end)
			actualslide.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false;
					wait(1)
					local b = game:GetService("TweenService"):Create(Value, TweenInfo.new(0.2), {TextTransparency = 1})
					b:Play()
				end
			end)
			actualslide.MouseEnter:Connect(function()
				local b = game:GetService("TweenService"):Create(Value, TweenInfo.new(0.2), {TextTransparency = 0})
				b:Play()
			end)
			actualslide.MouseLeave:Connect(function()

				wait(1)
				local b = game:GetService("TweenService"):Create(Value, TweenInfo.new(0.2), {TextTransparency = 1})
				b:Play()
			end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					move(input)
				end
			end)
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
		end
		
		function tabcurrent:Colorpicker(name,presetcolor, callback)
			callback = callback or function(...) end
			local c = false
			local r = false
			local colorpickerbutton = Instance.new("TextButton")
			local corner = Instance.new("UICorner")
			local color = Instance.new("Frame")
			local corner_2 = Instance.new("UICorner")
			local colortext = Instance.new("TextLabel")
			colorpickerbutton.Name = "colorpickerbutton"
			colorpickerbutton.Parent = container
			colorpickerbutton.BackgroundColor3 = themesettings[themesetting].ItemsColor
			colorpickerbutton.BorderSizePixel = 0
			colorpickerbutton.Size = UDim2.new(1, 0, 0, 26)
			colorpickerbutton.AutoButtonColor = false
			colorpickerbutton.Font = Enum.Font.SourceSans
			colorpickerbutton.Text = ""
			colorpickerbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
			colorpickerbutton.TextSize = 14.000
			colorpickerbutton.ClipsDescendants = true

			corner.Name = "corner"
			corner.Parent = colorpickerbutton

			color.Name = "color"
			color.Parent = colorpickerbutton
			color.AnchorPoint = Vector2.new(1, 0.5)
			color.BackgroundColor3 = presetcolor
			color.BorderSizePixel = 0
			color.Position = UDim2.new(0.995918632, -10, 0.5, 0)
			color.Size = UDim2.new(-0.0367344432, 36, 1, -8)

			corner_2.CornerRadius = UDim.new(0, 4)
			corner_2.Name = "corner"
			corner_2.Parent = color

			colortext.Name = "colortext"
			colortext.Parent = colorpickerbutton
			colortext.AnchorPoint = Vector2.new(0, 0.5)
			colortext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			colortext.BackgroundTransparency = 1.000
			colortext.Position = UDim2.new(0, 8, 0.5, 0)
			colortext.Size = UDim2.new(0, 49, 1, -8)
			colortext.Font = Enum.Font.SourceSans
			colortext.Text = name
			colortext.TextColor3 = themesettings[themesetting].TextColor
			colortext.TextSize = 13.000
			colortext.TextXAlignment = Enum.TextXAlignment.Left
			

			local colorpickerframe = Instance.new("Frame")
			local corner = Instance.new("UICorner")
			local ColourGradientFrame = Instance.new("TextButton")
			local ColourGradient = Instance.new("UIGradient")
			local Slider = Instance.new("TextButton")
			local Glow = Instance.new("ImageLabel")
			local DarknessGradientFrame = Instance.new("TextButton")
			local Slider_2 = Instance.new("TextButton")
			local DarknessGradient = Instance.new("UIGradient")
			local Glow_2 = Instance.new("ImageLabel")
			local Button = Instance.new("TextButton")
			local Title = Instance.new("TextLabel")
			local rainbow = Instance.new("TextButton")
			local rainbowtitle = Instance.new("TextLabel")
			local box = Instance.new("Frame")
			local fill = Instance.new("Frame")
			local corner_2 = Instance.new("UICorner")
			local corner_3 = Instance.new("UICorner")

			colorpickerframe.Name = "colorpickerframe"
			colorpickerframe.Parent = container
			colorpickerframe.BackgroundColor3 = themesettings[themesetting].ItemsColor
			colorpickerframe.BorderSizePixel = 0
			colorpickerframe.Position = UDim2.new(0, 0, 0.169431865, 0)
			colorpickerframe.Size = UDim2.new(1, 0, 0.00677727442, 78)
			colorpickerframe.Visible = false

			corner.Name = "corner"
			corner.Parent = colorpickerframe

			ColourGradientFrame.Name = "ColourGradientFrame"
			ColourGradientFrame.Parent = colorpickerframe
			ColourGradientFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColourGradientFrame.BorderSizePixel = 0
			ColourGradientFrame.Position = UDim2.new(0.0204498973, 0, 0.120481938, 0)
			ColourGradientFrame.Size = UDim2.new(0.963190079, 0, 0.209114, 0)
			ColourGradientFrame.AutoButtonColor = false
			ColourGradientFrame.Font = Enum.Font.SourceSans
			ColourGradientFrame.Text = ""
			ColourGradientFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
			ColourGradientFrame.TextSize = 14.000

			ColourGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255))}
			ColourGradient.Name = "ColourGradient"
			ColourGradient.Parent = ColourGradientFrame

			Slider.Name = "Slider"
			Slider.Parent = ColourGradientFrame
			Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0.00300000003, 0, 1, 0)
			Slider.AutoButtonColor = false
			Slider.Font = Enum.Font.SourceSans
			Slider.Text = ""
			Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slider.TextSize = 14.000
			Slider.BackgroundTransparency = 1

			Glow.Name = "Glow"
			Glow.Parent = ColourGradientFrame
			Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Glow.BackgroundTransparency = 1.000
			Glow.BorderSizePixel = 0
			Glow.Position = UDim2.new(0, -15, 0, -15)
			Glow.Size = UDim2.new(1, 30, 1, 30)
			Glow.ZIndex = 0
			Glow.Image = "rbxassetid://4996891970"
			Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
			Glow.ScaleType = Enum.ScaleType.Slice
			Glow.SliceCenter = Rect.new(20, 20, 280, 280)

			DarknessGradientFrame.Name = "DarknessGradientFrame"
			DarknessGradientFrame.Parent = colorpickerframe
			DarknessGradientFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DarknessGradientFrame.BorderSizePixel = 0
			DarknessGradientFrame.Position = UDim2.new(0.0204498973, 0, 0.364844948, 0)
			DarknessGradientFrame.Size = UDim2.new(0.963190079, 0, 0.209114, 0)
			DarknessGradientFrame.AutoButtonColor = false
			DarknessGradientFrame.Font = Enum.Font.SourceSans
			
			DarknessGradientFrame.Text = ""
			DarknessGradientFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
			DarknessGradientFrame.TextSize = 14.000

			Slider_2.Name = "Slider"
			Slider_2.Parent = DarknessGradientFrame
			Slider_2.BackgroundColor3 = Color3.fromRGB(255, 149, 0)
			Slider_2.BorderSizePixel = 0
			Slider_2.Size = UDim2.new(0.00300000003, 0, 1, 0)
			Slider_2.AutoButtonColor = false
			Slider_2.Font = Enum.Font.SourceSans
			Slider_2.Text = ""
			Slider_2.BackgroundTransparency = 1
			Slider_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slider_2.TextSize = 14.000

			DarknessGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
			DarknessGradient.Name = "DarknessGradient"
			DarknessGradient.Parent = DarknessGradientFrame

			Glow_2.Name = "Glow"
			Glow_2.Parent = DarknessGradientFrame
			Glow_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Glow_2.BackgroundTransparency = 1.000
			Glow_2.BorderSizePixel = 0
			Glow_2.Position = UDim2.new(0, -15, 0, -15)
			Glow_2.Size = UDim2.new(1, 30, 1, 30)
			Glow_2.ZIndex = 0
			Glow_2.Image = "rbxassetid://4996891970"
			Glow_2.ImageColor3 = Color3.fromRGB(15, 15, 15)
			Glow_2.ScaleType = Enum.ScaleType.Slice
			Glow_2.SliceCenter = Rect.new(20, 20, 280, 280)

			Button.Name = "Button"
			Button.Parent = colorpickerframe
			Button.AnchorPoint = Vector2.new(1, 0)
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BorderSizePixel = 0
			Button.BackgroundTransparency = 1
			Button.LayoutOrder = 1
			Button.Position = UDim2.new(0.145051107, -4, 0.330000073, 30)
			Button.Size = UDim2.new(0.548057258, -212, -0.0855988264, 26)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000

			Title.Name = "Title"
			Title.Parent = Button
			Title.AnchorPoint = Vector2.new(0, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.Position = UDim2.new(-0.140368864, 8, 0.5, 0)
			Title.Size = UDim2.new(0.0153690744, 55, 1, -8)
			Title.Font = Enum.Font.SourceSans
			Title.Text = "Confirm"
			Title.TextColor3 = themesettings[themesetting].TextColor
			Title.TextSize = 14.000
			Title.TextTransparency = 0.300

			rainbow.Name = "rainbow"
			rainbow.Parent = colorpickerframe
			rainbow.AnchorPoint = Vector2.new(1, 0)
			rainbow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			rainbow.BorderSizePixel = 0
			rainbow.BackgroundTransparency = 1
			rainbow.LayoutOrder = 1
			rainbow.Position = UDim2.new(0.991431355, -4, 0.330000073, 30)
			rainbow.Size = UDim2.new(0.662576675, -212, -0.0855988264, 26)
			rainbow.AutoButtonColor = false
			rainbow.Font = Enum.Font.SourceSans
			rainbow.Text = ""
			rainbow.TextColor3 = Color3.fromRGB(0, 0, 0)
			rainbow.TextSize = 14.000

			rainbowtitle.Name = "rainbowtitle"
			rainbowtitle.Parent = rainbow
			rainbowtitle.AnchorPoint = Vector2.new(0, 0.5)
			rainbowtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			rainbowtitle.BackgroundTransparency = 1.000
			rainbowtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			rainbowtitle.Position = UDim2.new(-0.0778688714, 8, 0.5, 0)
			rainbowtitle.Size = UDim2.new(-0.0917737857, 55, 1, -8)
			rainbowtitle.Font = Enum.Font.SourceSans
			rainbowtitle.Text = "Rainbow"
			rainbowtitle.TextColor3 = themesettings[themesetting].TextColor
			rainbowtitle.TextSize = 14.000
			rainbowtitle.TextTransparency = 0.300

			box.Name = "box"
			box.Parent = rainbow
			box.AnchorPoint = Vector2.new(1, 0.5)
			box.BackgroundColor3 = themesettings[themesetting].MainFrameColor
			box.BorderSizePixel = 0
			box.Position = UDim2.new(1.08928573, -10, 0.481620401, 0)
			box.Size = UDim2.new(0, 36, 0.9632411, 0)

			fill.Name = "fill"
			fill.Parent = box
			fill.AnchorPoint = Vector2.new(0, 0.5)
			fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			fill.BorderSizePixel = 0
			fill.Position = UDim2.new(0, 2, 0.5, 0)
			fill.Size = UDim2.new(0.5, -4, 1, -4)

			corner_2.CornerRadius = UDim.new(0, 30)
			corner_2.Name = "corner"
			corner_2.Parent = fill

			corner_3.Name = "corner"
			corner_3.Parent = box
			

			
			
			

			local MouseEntered = TweenService:Create(
				colorpickerbutton,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = themesettings[themesetting].hovercolor
				}
			)

			local MouseLeft = TweenService:Create(
				colorpickerbutton,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = themesettings[themesetting].ItemsColor
				}
			)
			
			local truetoggle = TweenService:Create(
				box,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = Color3.fromRGB(59, 153, 253)
				}
			)

			local falsetoggle = TweenService:Create(
				box,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = themesettings[themesetting].MainFrameColor
				}
			)

			colorpickerbutton.MouseEnter:Connect(function()
				MouseEntered:Play()
			end)
			colorpickerbutton.MouseLeave:Connect(function()
				MouseLeft:Play()
			end)
			colorpickerbutton.MouseButton1Click:Connect(function()
				if c == true then
					colorpickerframe.Visible = false
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
				elseif c == false then
					colorpickerframe.Visible = true
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
				end
				c = not c
				ripple(colorpickerbutton, Color3.fromRGB(193, 193, 193))
			end)
			
			Button.MouseButton1Click:Connect(function()
				if c == true then
				
					colorpickerframe.Visible = false
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
				elseif c == false then
				
					colorpickerframe.Visible = true
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
				end
				c = not c
			end)
			
			rainbow.MouseButton1Click:Connect(function()
				if r == true then
					fill:TweenPosition(UDim2.new(0, 2, 0.5, 0), "In", "Quint", 0.2)
					falsetoggle:Play()
				elseif r == false then
					fill:TweenPosition(UDim2.new(0.528, 2,0.5, 0), "In", "Quint", 0.2)
					truetoggle:Play()
				end

				
				r = not r
				
				while wait() do
					if r == true then
					callback(rainbowcolor)
					color.BackgroundColor3 = rainbowcolor
					end
				end
			end)
			
			local colourGradientFrame = ColourGradientFrame
			local colourSlider = Slider

			local darknessGradientFrame =  DarknessGradientFrame
			local darknessSlider = Slider_2

			local colourPreview = color


			local mouse = game.Players.LocalPlayer:GetMouse()

			local movingColourSlider = false
			local movingDarknessSlider = false


			colourSlider.MouseButton1Down:Connect(function()

				movingColourSlider = true
			end)
			colourGradientFrame.MouseButton1Down:Connect(function()

				movingColourSlider = true
			end)

			darknessSlider.MouseButton1Down:Connect(function()

				movingDarknessSlider = true
			end)
			darknessGradientFrame.MouseButton1Down:Connect(function()

				movingDarknessSlider = true
			end)


			colourSlider.MouseButton1Up:Connect(function()

				movingColourSlider = false
			end)
			colourGradientFrame.MouseButton1Up:Connect(function()

				movingColourSlider = false
			end)

			darknessSlider.MouseButton1Up:Connect(function()

				movingDarknessSlider = false
			end)
			darknessGradientFrame.MouseButton1Up:Connect(function()

				movingDarknessSlider = false
			end)


			mouse.Button1Up:Connect(function()

				movingColourSlider = false
				movingDarknessSlider = false
			end)



			mouse.Move:Connect(function()

				if movingColourSlider then

					local xOffset = (mouse.X - colourGradientFrame.AbsolutePosition.X)

					xOffset = math.clamp(xOffset, 0, colourGradientFrame.AbsoluteSize.X)

					local sliderPosNew = UDim2.new(0, xOffset, colourSlider.Position.Y)
					colourSlider.Position = sliderPosNew
				end

				if movingDarknessSlider then

					local xOffset = (mouse.X - colourGradientFrame.AbsolutePosition.X)

					xOffset = math.clamp(xOffset, 0, colourGradientFrame.AbsoluteSize.X)

					local sliderPosNew = UDim2.new(0, xOffset, colourSlider.Position.Y)
					darknessSlider.Position = sliderPosNew
				end
			end)



			function returnColour(percentage, gradientKeyPoints)

				local leftColour = gradientKeyPoints[1]
				local rightColour = gradientKeyPoints[#gradientKeyPoints]

				local lerpPercent = 0.5
				local colour = leftColour.Value


				for i = 1, #gradientKeyPoints - 1 do

					if gradientKeyPoints[i].Time <= percentage and gradientKeyPoints[i + 1].Time >= percentage then

						leftColour = gradientKeyPoints[i]
						rightColour = gradientKeyPoints[i + 1]

						lerpPercent = (percentage - leftColour.Time) / (rightColour.Time - leftColour.Time)

						colour = leftColour.Value:Lerp(rightColour.Value, lerpPercent)

						return colour
					end
				end
			end

			function updateColourPreview()

				local colourMinXPos = colourGradientFrame.AbsolutePosition.X
				local colourMaxXPos = colourMinXPos + colourGradientFrame.AbsoluteSize.X

				local colourXPixelSize = colourMaxXPos - colourMinXPos

				local colourSliderX = colourSlider.AbsolutePosition.X

				local colourXPos = (colourSliderX - colourMinXPos) / colourXPixelSize


				local darknessMinXPos = darknessGradientFrame.AbsolutePosition.X
				local darknessMaxXPos = darknessMinXPos + darknessGradientFrame.AbsoluteSize.X

				local darknessXPixelSize = darknessMaxXPos - darknessMinXPos

				local darknessSliderX = darknessSlider.AbsolutePosition.X

				local darknessXPos = (darknessSliderX - darknessMinXPos) / darknessXPixelSize


				local darkness = returnColour(darknessXPos, darknessGradientFrame.DarknessGradient.Color.Keypoints)
				local darknessR, darknessG, darknessB = 255 - math.floor(darkness.R * 255), 255 - math.floor(darkness.G * 255), 255 - math.floor(darkness.B * 255)


				local colour = returnColour(colourXPos, colourGradientFrame.ColourGradient.Color.Keypoints)
				local colourR, colourG, colourB = math.floor(colour.R * 255), math.floor(colour.G * 255), math.floor(colour.B * 255)

				local resultColour = Color3.fromRGB(colourR - darknessR, colourG - darknessG, colourB - darknessB)

				colourPreview.BackgroundColor3 = resultColour
				callback(resultColour)
			end


			colourSlider:GetPropertyChangedSignal("Position"):Connect(updateColourPreview)
			darknessSlider:GetPropertyChangedSignal("Position"):Connect(updateColourPreview)
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
		end
		
		function tabcurrent:Dropdown(name, list, callback)
			list = list or {}
			local d = false
			callback = callback or function(...) end
			local dropdown = Instance.new("TextButton")
			local dropdowntext = Instance.new("TextLabel")
			local corner = Instance.new("UICorner")
			local arrow = Instance.new("ImageLabel")
			dropdown.Name = "dropdown"
			dropdown.Parent = container
			dropdown.BackgroundColor3 = themesettings[themesetting].ItemsColor
			dropdown.BorderSizePixel = 0
			dropdown.Size = UDim2.new(1, 0, 0, 26)
			dropdown.AutoButtonColor = false
			dropdown.Font = Enum.Font.SourceSans
			dropdown.Text = ""
			dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
			dropdown.TextSize = 14.000
			dropdown.ClipsDescendants = true

			dropdowntext.Name = "dropdowntext"
			dropdowntext.Parent = dropdown
			dropdowntext.AnchorPoint = Vector2.new(0, 0.5)
			dropdowntext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdowntext.BackgroundTransparency = 1.000
			dropdowntext.Position = UDim2.new(0, 8, 0.5, 0)
			dropdowntext.Size = UDim2.new(0, 49, 1, -8)
			dropdowntext.Font = Enum.Font.SourceSans
			dropdowntext.Text = name
			dropdowntext.TextColor3 = themesettings[themesetting].TextColor
			dropdowntext.TextSize = 13.000
			dropdowntext.TextXAlignment = Enum.TextXAlignment.Left

			corner.Name = "corner"
			corner.Parent = dropdown

			arrow.Name = "arrow"
			arrow.Parent = dropdown
			arrow.AnchorPoint = Vector2.new(1, 0.5)
			arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			arrow.BackgroundTransparency = 1.000
			arrow.Position = UDim2.new(0.987730086, -3, 0.5, 0)
			arrow.Rotation = 90.000
			arrow.Size = UDim2.new(0, 22, 0, 22)
			arrow.Image = "http://www.roblox.com/asset/?id=5728209609"
			arrow.ImageColor3 = themesettings[themesetting].TextColor
			arrow.ScaleType = Enum.ScaleType.Fit
			


			local dropframe = Instance.new("Frame")
			local corner = Instance.new("UICorner")
			local dropscrollframe = Instance.new("ScrollingFrame")
			local droplist = Instance.new("UIListLayout")
			dropframe.Name = "dropframe"
			dropframe.Parent = container
			dropframe.BackgroundColor3 = themesettings[themesetting].ItemsColor
			dropframe.BorderSizePixel = 0
			dropframe.Position = UDim2.new(0, 0, 0.273882687, 0)
			dropframe.Size = UDim2.new(1, 0, 0.0256067105, 78)
			dropframe.Visible = false

			corner.Name = "corner"
			corner.Parent = dropframe

			dropscrollframe.Name = "dropscrollframe"
			dropscrollframe.Parent = dropframe
			dropscrollframe.Active = true
			dropscrollframe.AnchorPoint = Vector2.new(0.5, 0)
			dropscrollframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropscrollframe.BackgroundTransparency = 1.000
			dropscrollframe.BorderSizePixel = 0
			dropscrollframe.Position = UDim2.new(0.494887531, 4, -0.578894496, 63)
			dropscrollframe.Size = UDim2.new(1.00613499, -20, 1.60618436, -77)
			dropscrollframe.BottomImage = "rbxassetid://5234388158"
			dropscrollframe.CanvasSize = UDim2.new(0, 0, 0, 0)
			dropscrollframe.MidImage = "rbxassetid://5234388158"
			dropscrollframe.ScrollBarImageColor3 = themesettings[themesetting].MainFrameColor
			dropscrollframe.ScrollBarThickness = 6
			dropscrollframe.TopImage = "rbxassetid://5234388158"

			droplist.Name = "containerlist"
			droplist.Parent = dropscrollframe
			droplist.SortOrder = Enum.SortOrder.LayoutOrder
			droplist.Padding = UDim.new(0, 4)
			


			
			local closetween = TweenService:Create(
				arrow,
				TweenInfo.new(
					0.5,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.InOut
				),
				{
					Rotation = 90
				}
			)
			local opentween = TweenService:Create(
				arrow,
				TweenInfo.new(
					0.5,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.InOut
				),
				{
					Rotation = 0
				}
			)
			
			local MouseEntered = TweenService:Create(
				dropdown,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = themesettings[themesetting].hovercolor
				}
			)

			local MouseLeft = TweenService:Create(
				dropdown,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					BackgroundColor3 = themesettings[themesetting].ItemsColor
				}
			)

			dropdown.MouseEnter:Connect(function()
				MouseEntered:Play()
			end)
			dropdown.MouseLeave:Connect(function()
				MouseLeft:Play()
			end)
			dropdown.MouseButton1Click:Connect(function()
				if d == true then
					closetween:Play()
					dropframe.Visible = false
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
				elseif d == false then
					opentween:Play()
					dropframe.Visible = true
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
				end
				d = not d
				ripple(dropdown, Color3.fromRGB(193, 193, 193))
			end)
			
			for i,v in next, list do
				
				
				local Option = Instance.new("TextButton")
				local UICorner = Instance.new("UICorner")
				local optiontext = Instance.new("TextLabel")

				Option.Name = "Option"
				Option.Parent = dropscrollframe
				Option.BackgroundColor3 = themesettings[themesetting].ItemsColor
				Option.BorderSizePixel = 0
				Option.Position = UDim2.new(0, 0, -2.11020051e-07, 0)
				Option.Size = UDim2.new(0, 461, 0, 21)
				Option.AutoButtonColor = false
				Option.Font = Enum.Font.SourceSans
				Option.Text = ""
				Option.TextColor3 = Color3.fromRGB(0, 0, 0)
				Option.TextSize = 13.000
				Option.TextXAlignment = Enum.TextXAlignment.Left

				UICorner.Parent = Option

				optiontext.Name = "optiontext"
				optiontext.Parent = Option
				optiontext.AnchorPoint = Vector2.new(0, 0.5)
				optiontext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				optiontext.BackgroundTransparency = 1.000
				optiontext.Position = UDim2.new(0, 8, 0.5, 0)
				optiontext.Size = UDim2.new(0, 49, 1, -8)
				optiontext.Font = Enum.Font.SourceSans
				optiontext.Text = v
				optiontext.TextColor3 = themesettings[themesetting].TextColor
				optiontext.TextSize = 13.000
				optiontext.TextXAlignment = Enum.TextXAlignment.Left
				
				local MouseEntered = TweenService:Create(
					Option,
					TweenInfo.new(
						0.3,
						Enum.EasingStyle.Quad,
						Enum.EasingDirection.Out
					),
					{
						BackgroundColor3 = themesettings[themesetting].hovercolor
					}
				)

				local MouseLeft = TweenService:Create(
					Option,
					TweenInfo.new(
						0.3,
						Enum.EasingStyle.Quad,
						Enum.EasingDirection.Out
					),
					{
						BackgroundColor3 = themesettings[themesetting].ItemsColor
					}
				)

				Option.MouseEnter:Connect(function()
					MouseEntered:Play()
				end)
				Option.MouseLeave:Connect(function()
					MouseLeft:Play()
				end)
				
				Option.MouseButton1Click:Connect(function()
					d = not d
					dropdowntext.Text = name .. ": " .. v
					callback(v)
					closetween:Play()
					dropframe.Visible = false
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
				end)
				
				dropscrollframe.CanvasSize = UDim2.new(0, 0, 0, droplist.AbsoluteContentSize.Y)
			end
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
		end
		
		function tabcurrent:Textbox(name, disapper, callback)
			callback = callback or function(...) end
			local textbox = Instance.new("TextButton")
			local textboxtitle = Instance.new("TextLabel")
			local corner = Instance.new("UICorner")
			local Box = Instance.new("Frame")
			local corner_2 = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")

			textbox.Name = "textbox"
			textbox.Parent = container
			textbox.BackgroundColor3 = themesettings[themesetting].ItemsColor
			textbox.BorderSizePixel = 0
			textbox.Size = UDim2.new(1, 0, 0, 26)
			textbox.AutoButtonColor = false
			textbox.Font = Enum.Font.SourceSans
			textbox.Text = ""
			textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
			textbox.TextSize = 14.000

			textboxtitle.Name = "textboxtitle"
			textboxtitle.Parent = textbox
			textboxtitle.AnchorPoint = Vector2.new(0, 0.5)
			textboxtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textboxtitle.BackgroundTransparency = 1.000
			textboxtitle.Position = UDim2.new(0, 8, 0.5, 0)
			textboxtitle.Size = UDim2.new(0, 49, 1, -8)
			textboxtitle.Font = Enum.Font.SourceSans
			textboxtitle.Text = name
			textboxtitle.TextColor3 = themesettings[themesetting].TextColor
			textboxtitle.TextSize = 13.000
			textboxtitle.TextXAlignment = Enum.TextXAlignment.Left

			corner.Name = "corner"
			corner.Parent = textbox

			Box.Name = "Box"
			Box.Parent = textbox
			Box.AnchorPoint = Vector2.new(1, 0.5)
			Box.BackgroundColor3 = themesettings[themesetting].MainFrameColor
			Box.BorderSizePixel = 0
			Box.Position = UDim2.new(1, -5, 0.5, 0)
			Box.Size = UDim2.new(0.177914113, 36, 1, -8)

			corner_2.Name = "corner"
			corner_2.Parent = Box

			TextBox.Parent = Box
			TextBox.BackgroundColor3 = themesettings[themesetting].MainFrameColor
			TextBox.BackgroundTransparency = 1.000
			TextBox.Size = UDim2.new(0, 123, 0, 18)
			TextBox.Font = Enum.Font.SourceSans
			TextBox.Text = ""
			TextBox.TextColor3 = themesettings[themesetting].TextColor
			TextBox.TextSize = 14.000
			
			TextBox.FocusLost:Connect(function(ep)
				if ep then
					if #TextBox.Text > 0 then
						pcall(callback, TextBox.Text)
						if disapper then
							TextBox.Text = ""
						end
					end
				end
			end)
			
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
		end

		function tabcurrent:Label(name)

			local button = Instance.new("TextButton")
			local buttontext = Instance.new("TextLabel")
			local corner = Instance.new("UICorner")
			button.Name = "label"
			button.Parent = container
			button.BackgroundColor3 = themesettings[themesetting].ItemsColor
			button.BorderSizePixel = 0
			button.Size = UDim2.new(1, 0, 0, 26)
			button.AutoButtonColor = false
			button.Font = Enum.Font.SourceSans
			button.Text = ""
			button.ClipsDescendants = true
			button.TextColor3 = Color3.fromRGB(0, 0, 0)
			button.TextSize = 14.000

			buttontext.Name = "buttontext"
			buttontext.Parent = button
			buttontext.AnchorPoint = Vector2.new(0, 0.5)
			buttontext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			buttontext.BackgroundTransparency = 1.000
			buttontext.Position = UDim2.new(0, 8, 0.5, 0)
			buttontext.Size = UDim2.new(0, 49, 1, -8)
			buttontext.Font = Enum.Font.SourceSans
			buttontext.Text = name
			buttontext.TextColor3 = themesettings[themesetting].TextColor
			buttontext.TextSize = 13.000
			buttontext.TextXAlignment = Enum.TextXAlignment.Left

			corner.Name = "corner"
			corner.Parent = button
			scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
        end
        
        function tabcurrent:themeselector()
local themeselector = Instance.new("TextButton")
local themeselectortitle = Instance.new("TextLabel")
local corner = Instance.new("UICorner")
local Box = Instance.new("Frame")
local corner_2 = Instance.new("UICorner")
local dark = Instance.new("TextButton")
local light = Instance.new("TextButton")

themeselector.Name = "themeselector"
themeselector.Parent = container
themeselector.BackgroundColor3 = themesettings[themesetting].ItemsColor
themeselector.BorderSizePixel = 0
themeselector.Size = UDim2.new(1, 0, 0, 26)
themeselector.AutoButtonColor = false
themeselector.Font = Enum.Font.SourceSans
themeselector.Text = ""
themeselector.TextColor3 = Color3.fromRGB(0, 0, 0)
themeselector.TextSize = 14.000

themeselectortitle.Name = "themeselectortitle"
themeselectortitle.Parent = themeselector
themeselectortitle.AnchorPoint = Vector2.new(0, 0.5)
themeselectortitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
themeselectortitle.BackgroundTransparency = 1.000
themeselectortitle.Position = UDim2.new(0, 8, 0.5, 0)
themeselectortitle.Size = UDim2.new(0, 49, 1, -8)
themeselectortitle.Font = Enum.Font.SourceSans
themeselectortitle.Text = "Theme Selector"
themeselectortitle.TextColor3 = themesettings[themesetting].TextColor
themeselectortitle.TextSize = 13.000
themeselectortitle.TextXAlignment = Enum.TextXAlignment.Left

corner.Name = "corner"
corner.Parent = themeselector

Box.Name = "Box"
Box.Parent = themeselector
Box.AnchorPoint = Vector2.new(1, 0.5)
Box.BackgroundColor3 = themesettings[themesetting].MainFrameColor
Box.BorderSizePixel = 0
Box.Position = UDim2.new(1, -5, 0.5, 0)
Box.Size = UDim2.new(0.458077699, 36, 1, -8)

corner_2.Name = "corner"
corner_2.Parent = Box

dark.Name = "dark"
dark.Parent = themeselector
dark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dark.BackgroundTransparency = 1.000
dark.Position = UDim2.new(0.72188139, 0, 0.15384616, 0)
dark.Size = UDim2.new(0.116572998, 73, 0.692307711, 0)
dark.Font = Enum.Font.GothamBold
dark.Text = "Dark"
dark.TextColor3 = themesettings[themesetting].TextColor
dark.TextSize = 11.000
if themesetting == "Dark" then
dark.TextTransparency = 0
else
	dark.TextTransparency = 0.300
end
light.Name = "light"
light.Parent = themeselector
light.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
light.BackgroundTransparency = 1.000
light.Position = UDim2.new(0.472392619, 0, 0.153846145, 0)
light.Size = UDim2.new(0.116564445, 73, 0.692307889, 0)
light.Font = Enum.Font.GothamBold
light.Text = "Light"
light.TextColor3 = themesettings[themesetting].TextColor
light.TextSize = 11.000
light.TextWrapped = true
if themesetting == "Light" then
	light.TextTransparency = 0
	else
		light.TextTransparency = 0.300
	end

dark.MouseButton1Click:Connect(function()
light.TextTransparency = 0.3
dark.TextTransparency = 0
writefile("skoldhub.sk", "Dark")
notification("Next time you launch the script, the theme will be dark.")
end)	

light.MouseButton1Click:Connect(function()
dark.TextTransparency = 0.3
light.TextTransparency = 0
writefile("skoldhub.sk", "Light")
notification("Next time you launch the script, the theme will be light.")
end)	
scrollframe.CanvasSize = UDim2.new(0, 0, 0, containerlist.AbsoluteContentSize.Y)
end
	
return tabcurrent
end	
return tabholder
end
return lib
