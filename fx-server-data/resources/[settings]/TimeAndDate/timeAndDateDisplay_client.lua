local displayTime = true
local useMilitaryTime = false
local displayDayOfWeek = true
local displayDate = true

local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

-- Display Time and Date at top right of screen -- format: | 12:13 | Wednesday | January 17, 2017 |
Citizen.CreateThread(function()
	while true do
		Wait(1)
		timeAndDateString = "|"
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. " " .. hour .. ":" .. minute .. " |"
		end
		if displayDayOfWeek == true then
			CalculateDayOfWeekToDisplay()
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
		end
		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.30, 0.30)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextRightJustify(true)
		SetTextWrap(0,0.95)
		SetTextEntry("STRING")
		
		AddTextComponentString(timeAndDateString)
		DrawText(100, 0.03);
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end

function CalculateDayOfWeekToDisplay()
	dayOfWeek = GetClockDayOfWeek()
	
	if dayOfWeek == 0 then
		dayOfWeek = "Воскресенье"
	elseif dayOfWeek == 1 then
		dayOfWeek = "Понедельник"
	elseif dayOfWeek == 2 then
		dayOfWeek = "Вторник"
	elseif dayOfWeek == 3 then
		dayOfWeek = "Среда"
	elseif dayOfWeek == 4 then
		dayOfWeek = "Четверг"
	elseif dayOfWeek == 5 then
		dayOfWeek = "Пятница"
	elseif dayOfWeek == 6 then
		dayOfWeek = "Суббота"
	end
end

function CalculateDateToDisplay()
	month = GetClockMonth()
	dayOfMonth = GetClockDayOfMonth()
	year = GetClockYear()
	
	if month == 0 then
		month = "Январь"
	elseif month == 1 then
		month = "Февраль"
	elseif month == 2 then
		month = "Март"
	elseif month == 3 then
		month = "Апрель"
	elseif month == 4 then
		month = "Май"
	elseif month == 5 then
		month = "Июнь"
	elseif month == 6 then
		month = "Июль"
	elseif month == 7 then
		month = "Август"
	elseif month == 8 then
		month = "Сентябрь"
	elseif month == 9 then
		month = "Октябрь"
	elseif month == 10 then
		month = "Ноябрь"
	elseif month == 11 then
		month = "Декабрь"
	end
end
