-- CODE --

RegisterNetEvent( 'openTrunk' )
AddEventHandler( 'openTrunk', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0 then
            SetVehicleDoorShut(veh, 5, false)
        else
            SetVehicleDoorOpen(veh, 5, false, false)
        end
    end
end, false)

RegisterNetEvent( 'openHood' )
AddEventHandler( 'openHood', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0 then
            SetVehicleDoorShut(veh, 4, false)
        else
            SetVehicleDoorOpen(veh, 4, false, false)
        end
    end
end, false)

-- Notifications
RegisterNetEvent( 'trunkMessage' )
AddEventHandler( 'trunkMessage', function()
    drawNotification("~g~You opened your trunk.")
end)

RegisterNetEvent( 'hoodMessage' )
AddEventHandler( 'hoodMessage', function()
    drawNotification("~g~You opened your hood.")
end)

-- Notification Function
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

-- Designed by Lucifer, please don't edit.