local widget = require("widget")

local p1Life = 20
local p2Life = 20

local p1LifeLabel = display.newText(
	p1Life,
	display.contentCenterX - 128,
	display.contentWidth / 4 + 32,
	native.systemFont,
	40)
p1LifeLabel:setFillColor(0, 1, 0)
local p2LifeLabel = display.newText(
	p2Life,
	display.contentCenterX + 128,
	display.contentWidth / 4 + 32,
	native.systemFont,
	40)
p2LifeLabel:setFillColor(0, 1, 0)

local p1LifeDown = function (event)
	if p1Life == 0 then
		return
	end
	p1Life = p1Life - 1
	p1LifeLabel.text = p1Life
	if p1Life < 10 then
		p1LifeLabel:setFillColor(1, 0, 0)
	end
end
local p1LifeUp = function (event)
	p1Life = p1Life + 1
	p1LifeLabel.text = p1Life
	if p1Life >= 10 then
		p1LifeLabel:setFillColor(0, 1, 0)
	end
end
local p2LifeDown = function (event)
	if p2Life == 0 then
		return
	end
	p2Life = p2Life - 1
	p2LifeLabel.text = p2Life
	if p2Life < 10 then
		p2LifeLabel:setFillColor(1, 0, 0)
	end
end
local p2LifeUp = function (event)
	p2Life = p2Life + 1
	p2LifeLabel.text = p2Life
	if p2Life >= 10 then
		p2LifeLabel:setFillColor(0, 1, 0)
	end
end

local p1LifeDownButton = widget.newButton
{
	id = "button1Down",
	label = "Down",
	fontSize = 22,
	font = native.systemFontBold,
	defaultFile = "images/buttonBlue_100.png",
	overFile = "images/buttonBlueOver_100.png",
	onRelease = p1LifeDown
}
p1LifeDownButton.x = display.contentCenterX - 128
p1LifeDownButton.y = display.contentWidth / 4 + 100
local p1LifeUpButton = widget.newButton
{
	id = "button1Up",
	label = "Up",
	fontSize = 22,
	font = native.systemFontBold,
	defaultFile = "images/buttonBlue_100.png",
	overFile = "images/buttonBlueOver_100.png",
	onRelease = p1LifeUp
}
p1LifeUpButton.x = display.contentCenterX - 128
p1LifeUpButton.y = display.contentCenterY - 64

local p2LifeDownButton = widget.newButton
{
	id = "button2Down",
	label = "Down",
	fontSize = 22,
	font = native.systemFontBold,
	defaultFile = "images/buttonBlue_100.png",
	overFile = "images/buttonBlueOver_100.png",
	onRelease = p2LifeDown
}
p2LifeDownButton.x = display.contentCenterX + 128
p2LifeDownButton.y = display.contentWidth / 4 + 100
local p2LifeUpButton = widget.newButton
{
	id = "button2Up",
	label = "Up",
	fontSize = 22,
	font = native.systemFontBold,
	defaultFile = "images/buttonBlue_100.png",
	overFile = "images/buttonBlueOver_100.png",
	onRelease = p2LifeUp
}
p2LifeUpButton.x = display.contentCenterX + 128
p2LifeUpButton.y = display.contentCenterY - 64
