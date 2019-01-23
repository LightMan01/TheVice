function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local zones = { ['AIRP'] = "Аэропорт Лос-Сантос", ['ALAMO'] = "Озеро Аламо", ['ALTA'] = "Альта", ['ARMYB'] = "Форт Занкудо", ['BANHAMC'] = "Багама Каньйон Драйв", ['BANNING'] = "Беннинг", ['BEACH'] = "Пляж Веспуччи", ['BHAMCA'] = "Каньйон Бенхам", ['BRADP'] = "Проезд Бреддок", ['BRADT'] = "Тоннель Бреддок", ['BURTON'] = "Бартон", ['CALAFB'] = "Мост Калафия", ['CANNY'] = "Каньйон Рейтон", ['CCREAK'] = "Кессиди Крик", ['CHAMH'] = "Чемберлейн-Хиллс", ['CHIL'] = "Вайнвуд-Хиллс", ['CHU'] = "Чумаш", ['CMSW'] = "Горный заповедник Чиллиад", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Дэвис", ['DELBE'] = "Пляж Дель-Перро", ['DELPE'] = "Дель Перро", ['DELSOL'] = "Ла Пуерта", ['DESRT'] = "Пустыня Гранд Сенора", ['DOWNT'] = "Даунтаун", ['DTVINE'] = "Даунтаун Вайнвуд", ['EAST_V'] = "Восточный Вайнвуд", ['EBURO'] = "Холмы Эль Бурро", ['ELGORL'] = "Маяк Эль Гордо", ['ELYSIAN'] = "Остров Элисиан", ['GALFISH'] = "Галилее", ['GOLF'] = "GWC Гольф-клуб", ['GRAPES'] = "Грейпсид", ['GREATC'] = "Великий Чараррал", ['HARMO'] = "Хармони", ['HAWICK'] = "Хоуик", ['HORS'] = "Гоночный трек Вайнвуд", ['HUMLAB'] = "HLR", ['JAIL'] = "Тюрьма Болингбрук", ['KOREAT'] = "Литл-Сеул", ['LACT'] = "Водохранилище Ленд Арт", ['LAGO'] = "Озеро Занкудо", ['LDAM'] = "Дамба Ленд Арт", ['LEGSQU'] = "Площадь Легион", ['LMESA'] = "Ла Меса", ['LOSPUER'] = "Ла Пуерта", ['MIRR'] = "Миррор Парк", ['MORN'] = "Морнингвуд", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Гора Чиллиад", ['MTGORDO'] = "Гора Гордо", ['MTJOSE'] = "Гора Джосей", ['MURRI'] = "Холмы Муриетта", ['NCHU'] = "Северный Чумаш", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Тихий Океан", ['PALCOV'] = "Залив Палето", ['PALETO'] = "Палето-Бей", ['PALFOR'] = "Лес Палето", ['PALHIGH'] = "Возвышенность Паломино", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Холм Пиллбокс", ['PROCOB'] = "Пляж Прокопио", ['RANCHO'] = "Ранчо", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Ричман", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "Сан Андреас", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Сэнди-Шорс", ['SKID'] = "Мишн-Роу", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Строуберри", ['TATAMO'] = "Горы Татавиам", ['TERMINA'] = "Терминал", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Река Занкудо", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

local directions = { [0] = 'С', [45] = 'С-З', [90] = 'З', [135] = 'Ю-З', [180] = 'Ю', [225] = 'Ю-В', [270] = 'В', [315] = 'С-В', [360] = 'С', } 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())

		for k,v in pairs(directions)do
			direction = GetEntityHeading(GetPlayerPed())
			if(math.abs(direction - k) < 22.5)then
				direction = v
				break;
			end
		end

		if(var2 ~= 0)then
			drawTxt(0.515, 1.22, 1.0,1.0,0.4, "~w~[~y~" .. tostring(GetStreetNameFromHashKey(var2)) .. "~w~]", 255, 255, 255, 255)
		end

		if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z))then
			if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
				drawTxt(0.515, 1.25, 1.0,1.0,0.4, direction .. "~b~ | ~y~" .. tostring(GetStreetNameFromHashKey(var1)) .. " ~w~/ ~y~" .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], 255, 255, 255, 255)
			end
		end

	local t = 0
		for i = 0,32 do
			if(GetPlayerName(i))then
				if(NetworkIsPlayerTalking(i))then
					t = t + 1

					if(t == 1)then
							drawTxt(0.515, 0.95, 1.0,1.0,0.4, "~y~Говорит:", 255, 255, 255, 255)
					end

					drawTxt(0.520, 0.95 + (t * 0.023), 1.0,1.0,0.4, "" .. GetPlayerName(i), 255, 255, 255, 255)
				end
			end
		end
	end
end)