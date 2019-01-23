local RadarEnabled = true; local CurrentVehicle = nil; local RadarOffset = 5.0; local TargetOffset = 75.0; local RadarText = 'No target'; local VehiclePlates = nil

RegisterNetEvent('RecieveAPIVehicles')
AddEventHandler('RecieveAPIVehicles', function(Information)
    VehiclePlates = Information
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		CurrentVehicle = GetVehiclePedIsIn(GetPlayerPed(PlayerId()), false)
		if RadarEnabled and DoesEntityExist(CurrentVehicle) and GetVehicleClass(CurrentVehicle) == 18 then
			local RadarPosition = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsIn(GetPlayerPed(PlayerId()), false), 0.0, radarOffset, 0.0)
			local TargetPosition = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, TargetOffset, 0.0)

			local RayHandle = StartShapeTestCapsule(RadarPosition["x"], RadarPosition["y"], RadarPosition["z"], TargetPosition["x"], TargetPosition["y"], TargetPosition["z"], 1.0, 10, CurrentVehicle, 7)
			local RaycastResult, RaycastHitSuccessful, RaycastTargetCoords, RaycastSurfaceNormal, RaycastEntityHit, RacastEntity2Hit = GetShapeTestResult(RayHandle)

			if RaycastHitSuccessful and DoesEntityExist(RaycastEntityHit) and GetEntityType(RaycastEntityHit) == 2 then
				local TargetVehicle = RaycastEntityHit
				local TargetVehicleInfo = { Name = GetDisplayNameFromVehicleModel(GetEntityModel(TargetVehicle)), Plate = GetVehicleNumberPlateText(TargetVehicle), Speed = RoundNumber(GetEntitySpeed(TargetVehicle), 0), Insurance = GetVehicleInsurance(GetVehicleNumberPlateText(TargetVehicle)), Registration = GetVehicleRegistration(GetVehicleNumberPlateText(TargetVehicle)) }
				if not OverSpeedLimit then
					RadarText = '~w~Vehicle: ~p~' .. TargetVehicleInfo.Name .. '~w~ Plate: ~b~' .. TargetVehicleInfo.Plate .. '~w~ Speed: ~g~' .. TargetVehicleInfo.Speed .. '~w~' .. Config['RadarUnit']
					RadarText2 = '~w~ \nInsurance: ~g~' .. TargetVehicleInfo.Insurance .. '~w~ Registration: ~g~' .. TargetVehicleInfo.Registration
				else
					RadarText = '~w~Vehicle: ~p~' .. TargetVehicleInfo.Name .. '~w~ Plate: ~b~' .. TargetVehicleInfo.Plate .. '~w~ Speed: ~r~' .. TargetVehicleInfo.Speed .. '~w~' .. Config['RadarUnit']
					RadarText2 = '~w~ \nInsurance: ~g~' .. TargetVehicleInfo.Insurance .. '~w~ Registration: ~g~' .. TargetVehicleInfo.Registration
				end
			else
				RadarText = 'No vehicle'
				RadarText2 = ''
			end
			DrawText2D1(0.25, 1.073, 0.5, 0.57, 0.25, RadarText, 255, 255, 255)
			DrawText2D2(0.25, 1.073, 0.5, 0.57, 0.25, RadarText2, 255, 255, 255)
		end
	end
end)

function GetVehicleInsurance(plate)
    for i in pairs(VehiclePlates) do
        if VehiclePlates[i].vehicle_plate == plate then
            if VehiclePlates[i].vehicle_is == 'Expired' or 'Invalid' or 'Fake' then return '~r~' .. VehiclePlates[i].vehicle_is end
            return VehiclePlates[i].vehicle_is
        end
    end
    return 'Valid'
end

function GetVehicleRegistration(plate)
    for i in pairs(VehiclePlates) do
        if VehiclePlates[i].vehicle_plate == plate then
            if VehiclePlates[i].vehicle_rs == 'Expired' or 'Invalid' or 'Fake' then return '~r~' .. VehiclePlates[i].vehicle_rs end
            return VehiclePlates[i].vehicle_rs
        end
    end
    return 'Valid'
end

function RoundNumber(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function DrawText2D1(x, y, width, height, scale, text, r, g, b)
    SetTextFont(0) -- Fonts: 0=Chalet London; 1=HouseScript; 2=Monospace; 3=ChaletComprimeCologne; 4=Pricedown
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end

function DrawText2D2(x, y, width, height, scale, text, r, g, b)
    SetTextFont(0) -- Fonts: 0=Chalet London; 1=HouseScript; 2=Monospace; 3=ChaletComprimeCologne; 4=Pricedown
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end
