local uilib = {}
local UserInputService = game:GetService"UserInputService"
function uilib:Init(config)
	local self = setmetatable({}, uilib)
	self.Shared = {}
	self.Theme = {
		BackgroundColor = Color3.fromRGB(31, 31, 31),
		TextColor = Color3.fromRGB(255, 255, 255),
		AccentColor = Color3.fromRGB(194, 164, 164),
		InactiveColor = Color3.fromRGB(48, 48, 48)
	}

	local base = {}
	base["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
	base["1"]["Name"] = "rojunkui!!"
	base["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

	base["2"] = Instance.new("Frame", base["1"])
	base["2"]["BorderSizePixel"] = 0
	base["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
	base["2"]["Size"] = UDim2.new(0, 480, 0, 320)
	base["2"]["Position"] = UDim2.new(0.31703, 0, 0.12672, 0)
	base["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	base["2"]["Name"] = "UI"

	base["3"] = Instance.new("UICorner", base["2"])
	base["3"]["CornerRadius"] = UDim.new(0, 2)

	base["4"] = Instance.new("TextLabel", base["2"])
	base["4"]["BorderSizePixel"] = 0
	base["4"]["TextXAlignment"] = Enum.TextXAlignment.Left
	base["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	base["4"]["TextSize"] = 14
	base["4"]["FontFace"] = Font.new("rbxassetid://11702779409", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	base["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	base["4"]["BackgroundTransparency"] = 1
	base["4"]["RichText"] = true
	base["4"]["Size"] = UDim2.new(0, 120, 0, 32)
	base["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	base["4"]["Text"] = "<font color=\"#c1a3a3\">rojunkies</font> <font color=\"#656565\">|</font> <font color=\"#999999\">" .. config.build .. "</font>"
	base["4"]["AutomaticSize"] = Enum.AutomaticSize.X
	base["4"]["Name"] = "label"
	base["4"]["Position"] = UDim2.new(0, 8, 0, 0)

	base["5"] = Instance.new("UIGradient", base["4"])
	base["5"]["Rotation"] = 90
	base["5"]["Offset"] = Vector2.new(0, 0.25)
	base["5"]["Color"] = ColorSequence.new{
		ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(1.000, Color3.fromRGB(15, 15, 15))
	}

	base["6"] = Instance.new("Frame", base["2"])
	base["6"]["BorderSizePixel"] = 0
	base["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	base["6"]["Size"] = UDim2.new(0, 344, 0, 32)
	base["6"]["Position"] = UDim2.new(0, 128, 0, 0)
	base["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	base["6"]["Name"] = "tabbutlist"
	base["6"]["BackgroundTransparency"] = 1

	base["7"] = Instance.new("UIListLayout", base["6"])
	base["7"]["Padding"] = UDim.new(0, 8)
	base["7"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
	base["7"]["SortOrder"] = Enum.SortOrder.LayoutOrder
	base["7"]["FillDirection"] = Enum.FillDirection.Horizontal

	base["8"] = Instance.new("Frame", base["2"])
	base["8"]["BorderSizePixel"] = 0
	base["8"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25)
	base["8"]["Size"] = UDim2.new(0, 480, 0, 256)
	base["8"]["Position"] = UDim2.new(0, 0, 0.1, 0)
	base["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	base["8"]["Name"] = "tabframelist"

	base["9"] = Instance.new("TextLabel", base["2"])
	base["9"]["BorderSizePixel"] = 0
	base["9"]["TextXAlignment"] = Enum.TextXAlignment.Left
	base["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	base["9"]["TextSize"] = 14
	base["9"]["FontFace"] = Font.new("rbxassetid://11702779409", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	base["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	base["9"]["BackgroundTransparency"] = 1
	base["9"]["Size"] = UDim2.new(0, 120, 0, 32)
	base["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	base["9"]["Text"] = config.username .. " - " .. config.placename .. " - " .. config.otherinfo
	base["9"]["AutomaticSize"] = Enum.AutomaticSize.X
	base["9"]["Name"] = "label"
	base["9"]["Position"] = UDim2.new(0, 8, 1, -32)

	base["a"] = Instance.new("UIGradient", base["9"])
	base["a"]["Rotation"] = 90
	base["a"]["Offset"] = Vector2.new(0, 0.25)
	base["a"]["Color"] = ColorSequence.new{
		ColorSequenceKeypoint.new(0.000, Color3.fromRGB(194, 164, 164)),
		ColorSequenceKeypoint.new(1.000, Color3.fromRGB(17, 15, 15))
	}
	--drag script
	do
		local gui = base["2"]
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
		UserInputService.InputChanged:Connect(function(input)
			if dragging then
				update(input)
			end
		end)
	end

	local activeTab = nil

	local function changeActiveTab(tabName)
		if activeTab then
			-- Деактивируем текущую активную вкладку
			activeTab.Button.TextColor3 = Color3.fromRGB(130, 110, 110)
			activeTab.Button.UIGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.000, Color3.fromRGB(48, 48, 48)),
				ColorSequenceKeypoint.new(1.000, Color3.fromRGB(31, 31, 31))
			}
			activeTab.Frame.Visible = false
		end

		-- Активируем новую вкладку
		local newTab = self.Shared[tabName]
		newTab.Button.TextColor3 = Color3.fromRGB(48, 48, 48)
		newTab.Button.UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.000, Color3.fromRGB(194, 164, 164)),
			ColorSequenceKeypoint.new(1.000, Color3.fromRGB(131, 111, 111))
		}
		newTab.Frame.Visible = true

		activeTab = newTab
	end

	-- Функция для создания секций
	function self:CreateSection(tabName, sectionName, side)
		local tab = self.Shared[tabName]
		if not tab then
			warn("Tab not found: " .. tabName)
			return
		end

		local sectionFrame = Instance.new("TextLabel")
		sectionFrame["BorderSizePixel"] = 0
		sectionFrame["TextXAlignment"] = Enum.TextXAlignment.Left
		sectionFrame["TextYAlignment"] = Enum.TextYAlignment.Top
		sectionFrame["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		sectionFrame["TextSize"] = 16
		sectionFrame["FontFace"] = Font.new("rbxassetid://12187607287", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
		sectionFrame["TextColor3"] = Color3.fromRGB(131, 111, 111)
		sectionFrame["BackgroundTransparency"] = 1
		sectionFrame["Size"] = UDim2.new(0, 200, 0, 24)
		sectionFrame["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		sectionFrame["Text"] = sectionName
		sectionFrame["AutomaticSize"] = Enum.AutomaticSize.Y
		sectionFrame["Name"] = sectionName
		sectionFrame["Position"] = UDim2.new(0.05357, 0, 0, 0)

		local sectionContainer = Instance.new("Frame", sectionFrame)
		sectionContainer["BorderSizePixel"] = 0
		sectionContainer["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		sectionContainer["AutomaticSize"] = Enum.AutomaticSize.Y
		sectionContainer["Size"] = UDim2.new(0, 200, 0, 0)
		sectionContainer["Position"] = UDim2.new(0, 0, 0, 20)
		sectionContainer["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		sectionContainer["Name"] = "elementlistframe"
		sectionContainer["BackgroundTransparency"] = 1

		local sectionContainerListLayout = Instance.new("UIListLayout", sectionContainer);
		sectionContainerListLayout["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		sectionContainerListLayout["SortOrder"] = Enum.SortOrder.LayoutOrder;


		-- Добавляем секцию в соответствующую сторону (левую или правую)
		if side == "Left" then
			sectionFrame.Parent = tab.Frame.Left
		elseif side == "Right" then
			sectionFrame.Parent = tab.Frame.Right
		else
			warn("Invalid side: " .. side)
			sectionFrame:Destroy()
			return
		end

		return sectionContainer
	end

	-- Функция для создания элементов
	function self:CreateElement(sectionContainer, sectionTable, element)
		if element.type == "toggle" then
			-- Создаем TextLabel для Toggle
			local toggleLabel = Instance.new("TextLabel", sectionContainer)
			toggleLabel["BorderSizePixel"] = 0
			toggleLabel["TextXAlignment"] = Enum.TextXAlignment.Left
			toggleLabel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			toggleLabel["TextSize"] = 14
			toggleLabel["FontFace"] = Font.new("rbxassetid://11702779409", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			toggleLabel["TextColor3"] = Color3.fromRGB(131, 131, 131)
			toggleLabel["BackgroundTransparency"] = 1
			toggleLabel["Size"] = UDim2.new(0, 184, 0, 24)
			toggleLabel["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			toggleLabel["Text"] = element.name or "Toggle"
			toggleLabel["Name"] = element.name .. "_Toggle"
		
			-- Создаем TextButton для Toggle
			local toggleButton = Instance.new("TextButton", toggleLabel)
			toggleButton["BorderSizePixel"] = 0
			toggleButton["AutoButtonColor"] = false
			toggleButton["TextSize"] = 14
			toggleButton["TextColor3"] = Color3.fromRGB(0, 0, 0)
			toggleButton["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			toggleButton["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			toggleButton["Size"] = UDim2.new(0, 16, 0, 16)
			toggleButton["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			toggleButton["Text"] = ""
			toggleButton["Position"] = UDim2.new(1, -24, 0.04167, 3)
		
			-- Добавляем UICorner для TextButton
			local buttonCorner = Instance.new("UICorner", toggleButton)
			buttonCorner["CornerRadius"] = UDim.new(0, 4)
		
			-- Добавляем UIStroke для TextButton
			local buttonStroke = Instance.new("UIStroke", toggleButton)
			buttonStroke["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			buttonStroke["Color"] = Color3.fromRGB(131, 111, 111)
		
			-- Добавляем UIGradient для TextButton
			local buttonGradient = Instance.new("UIGradient", toggleButton)
			buttonGradient["Rotation"] = 90
		
			-- Инициализируем состояние Toggle
			local toggleState = element.default or false
		
			-- Функция для обновления внешнего вида Toggle
			local function updateToggle()
				if toggleState then
					buttonGradient["Color"] = ColorSequence.new{
						ColorSequenceKeypoint.new(0.000, Color3.fromRGB(194, 164, 164)),
						ColorSequenceKeypoint.new(1.000, Color3.fromRGB(131, 111, 111))
					}
				else
					buttonGradient["Color"] = ColorSequence.new{
						ColorSequenceKeypoint.new(0.000, Color3.fromRGB(47, 47, 47)),
						ColorSequenceKeypoint.new(1.000, Color3.fromRGB(30, 30, 30))
					}
				end
			end
		
			-- Обновляем Toggle при инициализации
			updateToggle()
		
			-- Обработка нажатия на Toggle
			toggleButton.MouseButton1Click:Connect(function()
				toggleState = not toggleState
				updateToggle()
				if element.callback then
					element.callback(toggleState)
				end
			end)
		
			-- Создаем объект для управления Toggle
			local toggleObject = {
				SetValue = function(value)
					toggleState = value
					updateToggle()
					toggleObject.Value = toggleState -- Обновляем значение в объекте
				end,
				SetVisible = function(visible)
					toggleLabel.Visible = visible
				end,
				Value = toggleState -- Инициализируем значение
			}
		
			-- Добавляем объект в секцию
			sectionTable[element.name] = toggleObject
		elseif element.type == "slider" then
			-- Создаем Frame для Slider
			local sliderFrame = Instance.new("Frame", sectionContainer)
			sliderFrame["BorderSizePixel"] = 0
			sliderFrame["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			sliderFrame["Size"] = UDim2.new(0, 184, 0, 48)
			sliderFrame["Position"] = UDim2.new(0.04, 0, 0.71429, 0)
			sliderFrame["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			sliderFrame["Name"] = element.name .. "_Slider"
			sliderFrame["BackgroundTransparency"] = 1

			-- Создаем TextLabel для названия Slider
			local sliderLabel = Instance.new("TextLabel", sliderFrame)
			sliderLabel["BorderSizePixel"] = 0
			sliderLabel["TextXAlignment"] = Enum.TextXAlignment.Left
			sliderLabel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			sliderLabel["TextSize"] = 14
			sliderLabel["FontFace"] = Font.new("rbxassetid://11702779409", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			sliderLabel["TextColor3"] = Color3.fromRGB(131, 131, 131)
			sliderLabel["BackgroundTransparency"] = 1
			sliderLabel["Size"] = UDim2.new(0, 184, 0, 24)
			sliderLabel["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			sliderLabel["Text"] = element.name or "Slider"
			sliderLabel["Name"] = "Label"

			-- Создаем TextButton для заполнения Slider (теперь это родительский элемент)
			local sliderFill = Instance.new("TextButton", sliderFrame)
			sliderFill["BorderSizePixel"] = 0
			sliderFill["TextSize"] = 14
			sliderFill["TextColor3"] = Color3.fromRGB(0, 0, 0)
			sliderFill["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			sliderFill["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			sliderFill["Size"] = UDim2.new(1, -16, 0, 16)
			sliderFill["Position"] = UDim2.new(0, 8, 0.429, 5)
			sliderFill["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			sliderFill["Text"] = ""
			sliderFill["Name"] = "SliderFill"
			sliderFill["AutoButtonColor"] = false

			-- Добавляем UICorner для заполнения Slider
			local fillCorner = Instance.new("UICorner", sliderFill)
			fillCorner["CornerRadius"] = UDim.new(0, 3)

			-- Добавляем UIGradient для заполнения Slider
			local fillGradient = Instance.new("UIGradient", sliderFill)
			fillGradient["Rotation"] = 90
			fillGradient["Color"] = ColorSequence.new{
				ColorSequenceKeypoint.new(0.000, Color3.fromRGB(194, 164, 164)),
				ColorSequenceKeypoint.new(1.000, Color3.fromRGB(131, 111, 111))
			}

			-- Создаем Frame для фона Slider (теперь это дочерний элемент sliderFill)
			local sliderBackground = Instance.new("Frame", sliderFill)
			sliderBackground["BorderSizePixel"] = 0
			sliderBackground["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			sliderBackground["Size"] = UDim2.new(1, 0, 1, 0)
			sliderBackground["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			sliderBackground["Name"] = "SliderBackground"

			-- Добавляем UIGradient для фона Slider
			local backgroundGradient = Instance.new("UIGradient", sliderBackground)
			backgroundGradient["Rotation"] = 90
			backgroundGradient["Color"] = ColorSequence.new{
				ColorSequenceKeypoint.new(0.000, Color3.fromRGB(48, 48, 48)),
				ColorSequenceKeypoint.new(1.000, Color3.fromRGB(31, 31, 31))
			}

			-- Добавляем UIStroke для фона Slider
			--local backgroundStroke = Instance.new("UIStroke", sliderBackground)
			--backgroundStroke["Color"] = Color3.fromRGB(48, 48, 48)

			-- Добавляем UICorner для фона Slider
			--local backgroundCorner = Instance.new("UICorner", sliderBackground)
			--backgroundCorner["CornerRadius"] = UDim.new(0, 3)

			-- Создаем TextLabel для отображения значения Slider
			local sliderValueLabel = Instance.new("TextLabel", sliderFill)
			sliderValueLabel["BorderSizePixel"] = 0
			sliderValueLabel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			sliderValueLabel["TextSize"] = 14
			sliderValueLabel["FontFace"] = Font.new("rbxassetid://11702779409", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
			sliderValueLabel["TextColor3"] = Color3.fromRGB(86, 86, 86)
			sliderValueLabel["BackgroundTransparency"] = 1
			sliderValueLabel["Size"] = UDim2.new(1, 0, 1, 0)
			sliderValueLabel["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			sliderValueLabel["Text"] = tostring(element.default or 0)
			sliderValueLabel["Name"] = "SliderValue"

			-- Логика для Slider
			local isDragging = false
			local minValue = element.min or 0
			local maxValue = element.max or 100
			local currentValue = element.default or minValue
			local decimalPlaces = element.decimalPlaces or 0

			-- Функция для обновления значения Slider
			local function updateSlider(value)
				currentValue = math.clamp(value, minValue, maxValue)
				local percent = (currentValue - minValue) / (maxValue - minValue)
				sliderBackground.Size = UDim2.new(1 - percent, 0, 1, 0)
				sliderBackground.Position = UDim2.new(percent, 0, 0, 0)

				-- Форматируем значение с учетом количества знаков после запятой
				local formattedValue = string.format("%." .. decimalPlaces .. "f", currentValue)
				sliderValueLabel.Text = formattedValue

				if element.callback then
					element.callback(currentValue)
				end
			end

			-- Обработка начала перетаскивания
			sliderFill.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					isDragging = true
				end
			end)

			-- Обработка окончания перетаскивания
			sliderFill.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					isDragging = false
				end
			end)

			-- Обработка изменения позиции мыши
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					local mousePos = input.Position.X - sliderFill.AbsolutePosition.X
					local percent = math.clamp(mousePos / sliderFill.AbsoluteSize.X, 0, 1)
					local value = minValue + (maxValue - minValue) * percent
					updateSlider(value)
				end
			end)

			-- Инициализация Slider
			updateSlider(currentValue)
		end
		
	end

	for tabName, tabData in pairs(config.tree) do
		self.Shared[tabName] = {}

		local tabbut = Instance.new("TextButton", base["6"])
		tabbut["BorderSizePixel"] = 0
		tabbut["TextSize"] = 14
		tabbut["TextColor3"] = Color3.fromRGB(130, 110, 110)
		tabbut["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		tabbut["FontFace"] = Font.new("rbxassetid://11702779409", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
		tabbut["AutomaticSize"] = Enum.AutomaticSize.X
		tabbut["Size"] = UDim2.new(0, 34, 0, 18)
		tabbut["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		tabbut["Text"] = "  " .. tabName .. "  "
		tabbut["Position"] = UDim2.new(0.38685, 0, 0.21875, 0)
		tabbut["AutoButtonColor"] = false

		local buttcorner = Instance.new("UICorner", tabbut)
		buttcorner["CornerRadius"] = UDim.new(0, 4)

		local uigradient = Instance.new("UIGradient", tabbut)
		uigradient["Rotation"] = 90
		uigradient["Color"] = ColorSequence.new{
			ColorSequenceKeypoint.new(0.000, Color3.fromRGB(48, 48, 48)),
			ColorSequenceKeypoint.new(1.000, Color3.fromRGB(31, 31, 31))
		}

		local uistorke = Instance.new("UIStroke", tabbut)
		uistorke["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
		uistorke["Color"] = Color3.fromRGB(86, 86, 86)

		local tabframe = Instance.new("Frame", base["8"])
		tabframe["BorderSizePixel"] = 0
		tabframe["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		tabframe["Size"] = UDim2.new(0, 480, 0, 256)
		tabframe["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		tabframe["Name"] = tabName
		tabframe["BackgroundTransparency"] = 1

		local tableftside = Instance.new("ScrollingFrame", tabframe)
		tableftside["Active"] = true
		tableftside["ScrollingDirection"] = Enum.ScrollingDirection.Y
		tableftside["BorderSizePixel"] = 0
		tableftside["CanvasSize"] = UDim2.new(0, 0, 1, 0)
		tableftside["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		tableftside["Name"] = "Left"
		tableftside["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
		tableftside["Size"] = UDim2.new(0.5, 0, 1, 0)
		tableftside["ScrollBarImageColor3"] = Color3.fromRGB(48, 48, 48)
		tableftside["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		tableftside["ScrollBarThickness"] = 4
		tableftside["BackgroundTransparency"] = 1

		local leftuilistlayout = Instance.new("UIListLayout", tableftside)
		leftuilistlayout["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		leftuilistlayout["Padding"] = UDim.new(0, 4)
		leftuilistlayout["SortOrder"] = Enum.SortOrder.LayoutOrder

		local leftuipadding = Instance.new("UIPadding", tableftside)
		leftuipadding["PaddingTop"] = UDim.new(0, 8)
		leftuipadding["PaddingRight"] = UDim.new(0, 8)
		leftuipadding["PaddingLeft"] = UDim.new(0, 8)
		leftuipadding["PaddingBottom"] = UDim.new(0, 8)

		local tabrightside = Instance.new("ScrollingFrame", tabframe)
		tabrightside["Active"] = true
		tabrightside["ScrollingDirection"] = Enum.ScrollingDirection.Y
		tabrightside["BorderSizePixel"] = 0
		tabrightside["CanvasSize"] = UDim2.new(0, 0, 1, 0)
		tabrightside["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		tabrightside["Name"] = "Right"
		tabrightside["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
		tabrightside["Size"] = UDim2.new(0.5, 0, 1, 0)
		tabrightside["ScrollBarImageColor3"] = Color3.fromRGB(48, 48, 48)
		tabrightside["Position"] = UDim2.new(0.5, 0, 0, 0)
		tabrightside["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		tabrightside["ScrollBarThickness"] = 4
		tabrightside["BackgroundTransparency"] = 1

		local rightuilistlayout = Instance.new("UIListLayout", tabrightside)
		rightuilistlayout["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		rightuilistlayout["Padding"] = UDim.new(0, 4)
		rightuilistlayout["SortOrder"] = Enum.SortOrder.LayoutOrder

		local rightuipadding = Instance.new("UIPadding", tabrightside)
		rightuipadding["PaddingTop"] = UDim.new(0, 8)
		rightuipadding["PaddingRight"] = UDim.new(0, 8)
		rightuipadding["PaddingLeft"] = UDim.new(0, 8)
		rightuipadding["PaddingBottom"] = UDim.new(0, 8)

		self.Shared[tabName].Button = tabbut
		self.Shared[tabName].Frame = tabframe
		

		tabbut.MouseButton1Click:Connect(function()
			changeActiveTab(tabName)
		end)

		-- Создаем секции для вкладки
		for sectionName, sectionData in pairs(tabData) do
            local sectionContainer, sectionTable = self:CreateSection(tabName, sectionName, sectionData.side)
            if sectionData.elements then
                for _, element in ipairs(sectionData.elements) do
                    self:CreateElement(sectionContainer, sectionTable, element)
                end
            end
        end
	end

	-- Активируем первую вкладку по умолчанию
	local firstTabName = next(config.tree)
	if firstTabName then
		changeActiveTab(firstTabName)
	end

	return self
end

return uilib
