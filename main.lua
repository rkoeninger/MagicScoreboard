local widget = require("widget")

local startingLife = 20
local p1Life = startingLife
local p2Life = startingLife

local p1LifeLabel = display.newText(
	p1Life,
	display.contentCenterX - 160,
	display.contentWidth / 4 + 32,
	native.systemFont,
	64)
p1LifeLabel:setFillColor(0, 1, 0)
local p2LifeLabel = display.newText(
	p2Life,
	display.contentCenterX + 160,
	display.contentWidth / 4 + 32,
	native.systemFont,
	64)
p2LifeLabel:setFillColor(0, 1, 0)

local p1LifeDown = function (event)
	if p1Life == 0 then
		return
	end
	p1Life = p1Life - 1
	p1LifeLabel.text = p1Life
	if p1Life < (startingLife / 2) then
		p1LifeLabel:setFillColor(1, 0, 0)
	end
end
local p1LifeUp = function (event)
	p1Life = p1Life + 1
	p1LifeLabel.text = p1Life
	if p1Life >= (startingLife / 2) then
		p1LifeLabel:setFillColor(0, 1, 0)
	end
end
local p2LifeDown = function (event)
	if p2Life == 0 then
		return
	end
	p2Life = p2Life - 1
	p2LifeLabel.text = p2Life
	if p2Life < (startingLife / 2) then
		p2LifeLabel:setFillColor(1, 0, 0)
	end
end
local p2LifeUp = function (event)
	p2Life = p2Life + 1
	p2LifeLabel.text = p2Life
	if p2Life >= (startingLife / 2) then
		p2LifeLabel:setFillColor(0, 1, 0)
	end
end

local reset = function (event)
	p1Life = startingLife
	p2Life = startingLife
	p1LifeLabel.text = p1Life
	p2LifeLabel.text = p2Life
	p1LifeLabel:setFillColor(0, 1, 0)
	p2LifeLabel:setFillColor(0, 1, 0)
end

local lifeButton = function (id, label, onRelease, x, y)
	local button = widget.newButton
	{
		id = id,
		label = label,
		fontSize = 22,
		font = native.systemFontBold,
		defaultFile = "images/buttonBlue_100.png",
		overFile = "images/buttonBlueOver_100.png",
		onRelease = onRelease
	}
	button.x = x
	button.y = y
end

lifeButton("button1Down", "Down",  p1LifeDown, display.contentCenterX - 160, display.contentWidth / 4 + 128)
lifeButton("button1Up",   "Up",    p1LifeUp,   display.contentCenterX - 160, display.contentCenterY - 96)
lifeButton("button2Down", "Down",  p2LifeDown, display.contentCenterX + 160, display.contentWidth / 4 + 128)
lifeButton("button2Up",   "Up",    p2LifeUp,   display.contentCenterX + 160, display.contentCenterY - 96)
lifeButton("reset",       "Reset", reset,      display.contentCenterX,       display.contentCenterY)
