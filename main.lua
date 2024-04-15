--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88 
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER
]=]

-- Instances: 8 | Scripts: 1 | Modules: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["SafeAreaCompatibility"] = Enum.SafeAreaCompatibility.None;
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.None;
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.ScreenGui.LocalScript
G2L["2"] = Instance.new("LocalScript", G2L["1"]);


-- StarterGui.ScreenGui.LocalScript.TextLabel
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["TextStrokeTransparency"] = 0.7300000190734863;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Oswald.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 229, 222);
G2L["3"]["Size"] = UDim2.new(1, 0, 0.08404802531003952, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["BackgroundTransparency"] = 1;
G2L["3"]["Position"] = UDim2.new(0, 0, 0.7667238712310791, 0);

-- StarterGui.ScreenGui.LocalScript.Spawn
G2L["4"] = Instance.new("Sound", G2L["2"]);
G2L["4"]["Name"] = [[Spawn]];
G2L["4"]["SoundId"] = [[rbxassetid://2609981431]];

-- StarterGui.ScreenGui.Line
G2L["5"] = Instance.new("ViewportFrame", G2L["1"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["LightColor"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["Ambient"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["BackgroundTransparency"] = 1;
G2L["5"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Name"] = [[Line]];

-- StarterGui.ScreenGui.Line.WorldModel
G2L["6"] = Instance.new("WorldModel", G2L["5"]);


-- StarterGui.ScreenGui.Frame
G2L["7"] = Instance.new("Frame", G2L["1"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Size"] = UDim2.new(1, 0, 0.838765025138855, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.ScreenGui.Frame.UIListLayout
G2L["8"] = Instance.new("UIListLayout", G2L["7"]);
G2L["8"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
G2L["8"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["8"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- StarterGui.ScreenGui.LocalScript
local function C_2()
local script = G2L["2"];
	local ts = game:GetService("TweenService")
	local lighting = game.Lighting
	local player = game.Players.LocalPlayer
	local character = player.Character
	local hum = character:WaitForChild("Humanoid")
	local hrt = character:WaitForChild("HumanoidRootPart")
	local runService = game:GetService("RunService")
	local CurrentRooms:Folder = workspace:WaitForChild("CurrentRooms")
	local lineport = script.Parent.Line
	local worldModel = lineport.WorldModel
	lineport.CurrentCamera = workspace.CurrentCamera
	
	local function highlightModel(part:Model, color:Color3, thickness, Model:boolean)
		if Model == false then
			local returningFunctions = {}
			local highlight = Instance.new("Highlight")
			highlight.OutlineColor = color or Color3.fromRGB(255, 88, 183)
			highlight.FillColor = color or Color3.fromRGB(255, 88, 183)
			highlight.Parent = part
	
			local newlinepart = Instance.new("Part")
			newlinepart.Anchored = true
			newlinepart.Parent = worldModel
			newlinepart.Material = Enum.Material.Neon
			newlinepart.Color = color or Color3.fromRGB(255, 88, 183)
			newlinepart.Transparency = 0
	
			local connection
			local delete = false
	
			workspace.DescendantRemoving:Connect(function(ds)
				if ds == part then
					delete = true
				end
			end)
	
			connection = runService.Heartbeat:Connect(function()
			--	print(part.Parent)
				if not delete then
					local distance = (hrt.Position - part.Position).Magnitude
					local Center = (hrt.Position + part.Position) / 2
					newlinepart.CFrame = CFrame.new(Center,part.Position)
					newlinepart.Size = Vector3.new(thickness or 0.05, thickness or 0.05, distance)
				else
					connection:Disconnect()
					newlinepart:Destroy()
				end
	
			end)
			
			function returningFunctions:StopHighlight()
				delete = true
			end
			return returningFunctions
		else
			local highlight = Instance.new("Highlight")
			highlight.OutlineColor = color or Color3.fromRGB(255, 88, 183)
			highlight.FillColor = color or Color3.fromRGB(255, 88, 183)
			highlight.Parent = part
	
			local newlinepart = Instance.new("Part")
			newlinepart.Anchored = true
			newlinepart.Parent = worldModel
			newlinepart.Material = Enum.Material.Neon
			newlinepart.Color = color or Color3.fromRGB(255, 88, 183)
			newlinepart.Transparency = 0.5
	
			local connection
			local delete = false
			
			workspace.DescendantRemoving:Connect(function(ds)
				if ds == part then
					delete = true
				end
			end)
	
			connection = runService.Heartbeat:Connect(function()
			--	print(part.Parent)
				if not delete then
					local distance = (hrt.Position - part:GetPivot().Position).Magnitude
					local Center = (hrt.Position + part:GetPivot().Position) / 2
					newlinepart.CFrame = CFrame.new(Center,part:GetPivot().Position)
					newlinepart.Size = Vector3.new(thickness or 0.05, thickness or 0.05, distance)
				else
					connection:Disconnect()
					newlinepart:Destroy()
					highlight:Destroy()
				end
	
			end)
		end
	end
	
	runService.Heartbeat:Connect(function()
		hum.WalkSpeed = 21.3
		ts:Create(lighting , TweenInfo.new(0), {Ambient = Color3.new(1,1,1)}):Play()
	end)
	
	CurrentRooms.ChildAdded:Connect(function(Room:Model)
		local doorModel = Room:WaitForChild("Door")
		local highlight = highlightModel(doorModel:WaitForChild("Door"), Color3.fromRGB(255,255,255), nil, false)
		doorModel:GetAttributeChangedSignal("Opened"):Connect(function()
			highlight:StopHighlight()
		end)
		
		if Room.Name == "50" then
			task.wait(2)
		end
		
		for i, v:Model in pairs(Room:GetDescendants()) do
			if v.Name == "KeyObtain" then
				highlightModel(v, Color3.fromRGB(1,55,255))
			elseif v.Name == "LiveHintBook" then
				highlightModel(v, Color3.fromRGB(175, 223, 255))
			elseif v.Name == "LeverForGate" then
				highlightModel(v, Color3.fromRGB(252, 108, 42))
			end
		end
	end)
	
	local function notification(text, timea)
		script.Spawn:Play()
		local waititme = timea or 3
		local clone = script.TextLabel:Clone()
		clone.Text = text
		clone.Parent = script.Parent.Frame
		task.delay(waititme, function()
			ts:Create(clone, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
			task.wait(2)
			clone:Destroy()
		end)
	end
	
	workspace.ChildAdded:Connect(function(child)
		if child.Name == "RushMoving" then
			notification("Rush Spawned!")
		end
	end)
end;
task.spawn(C_2);

return G2L["1"], require;
