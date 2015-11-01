local widget = require("widget")

local startingLife = 20
local p1Life = startingLife
local p2Life = startingLife

local gradient = function (color1, color2)
	return {
		type = "gradient",
		color1 = color1,
		color2 = color2,
		direction = "down"
	}
end

local color = function (life)
	local halfLife = startingLife / 2
	if life > (startingLife * 2) then
		return gradient(
			{1, 1, 1},
			{1, 1, 1})
	elseif life > (startingLife + halfLife) then
		return gradient(
			{(life - startingLife - halfLife) / halfLife, 1, 1},
			{1, 1, 1})
	elseif life > startingLife then
		return gradient(
			{0, 1, (life - startingLife) / halfLife},
			{1, 1, 1})
	elseif life > halfLife then
		return gradient(
			{1 - ((life - halfLife) / halfLife), 1, 0},
			{life / startingLife, life / startingLife, life / startingLife})
	else
		return gradient(
			{1, 1 - ((halfLife - life) / halfLife), 0},
			{life / startingLife, life / startingLife, life / startingLife})
	end
end

local p1LifeLabel = display.newText(
	p1Life,
	display.contentCenterX - 160,
	display.contentWidth / 4 + 32,
	native.systemFont,
	64)
p1LifeLabel:setFillColor(color(p1Life))
local p2LifeLabel = display.newText(
	p2Life,
	display.contentCenterX + 160,
	display.contentWidth / 4 + 32,
	native.systemFont,
	64)
p2LifeLabel:setFillColor(color(p2Life))

local p1LifeDown = function (event)
	if p1Life == 0 then
		return
	end
	p1Life = p1Life - 1
	p1LifeLabel.text = p1Life
	p1LifeLabel:setFillColor(color(p1Life))
end
local p1LifeUp = function (event)
	p1Life = p1Life + 1
	p1LifeLabel.text = p1Life
	p1LifeLabel:setFillColor(color(p1Life))
end
local p2LifeDown = function (event)
	if p2Life == 0 then
		return
	end
	p2Life = p2Life - 1
	p2LifeLabel.text = p2Life
	p2LifeLabel:setFillColor(color(p2Life))
end
local p2LifeUp = function (event)
	p2Life = p2Life + 1
	p2LifeLabel.text = p2Life
	p2LifeLabel:setFillColor(color(p2Life))
end

local reset = function (event)
	p1Life = startingLife
	p2Life = startingLife
	p1LifeLabel.text = p1Life
	p2LifeLabel.text = p2Life
	p1LifeLabel:setFillColor(color(p1Life))
	p2LifeLabel:setFillColor(color(p2Life))
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

lifeButton("button1Up",   "+1",    p1LifeUp,   display.contentCenterX - 160, display.contentCenterY - 96)
lifeButton("button1Down", "-1",    p1LifeDown, display.contentCenterX - 160, display.contentWidth / 4 + 128)
lifeButton("button2Up",   "+1",    p2LifeUp,   display.contentCenterX + 160, display.contentCenterY - 96)
lifeButton("button2Down", "-1",    p2LifeDown, display.contentCenterX + 160, display.contentWidth / 4 + 128)
lifeButton("reset",       "Reset", reset,      display.contentCenterX,       display.contentCenterY)
