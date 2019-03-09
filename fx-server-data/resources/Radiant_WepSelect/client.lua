

local regularNotify			= false
--  ^^^^^ If you want non-3d text then set regularNotify to true ^^^^^
local setWeapon 		 	= ""
local weaponCount			= 0
local disablePedWeaponDraw 	= false  --- Set this to true and non-police players will be set to unarmed when exiting a vehicle. If you use a custom unholstering animation enable this to prevent players bypassing it.
local drawText 				= false


--- Add new ped models here
local pedModels = {
	"s_m_y_cop_01",
	"s_f_y_cop_01",
	"s_m_y_hwaycop_01",
	"s_m_y_sheriff_01",
	"s_f_y_sheriff_01",
	"s_m_y_ranger_01",
	"s_f_y_ranger_01",
	"s_m_m_snowcop_01",
	--"insert model here",
}


-- Checks to see if they are in a vehicle and are the proper model
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		for i = 0, #pedModels do
			if IsPedModel(PlayerPedId(), GetHashKey(pedModels[i])) then
				if IsPedInAnyVehicle(ped, false) or IsPedInAnyVehicle(ped, false) == 0 then
					DisableControlAction(0,157,true) -- disable '1' Key
					if IsDisabledControlJustReleased(0, 157) then
						TriggerEvent('weaponCounter')
						Citizen.Wait(1000)
					end

				end
			end
		end
	end
	
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		if IsControlJustReleased(0, 75) then -- Is 'F' Pressed
			SetCurrentPedWeapon(ped, setWeapon, true)
			ClearPedSecondaryTask()
			Citizen.Wait(1000)
		end
	end
	
end)

-- This is the counter for 3dText to disable dont touchie if you dont knowie
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if drawText then
			Wait(800)
			drawText = false
		end
	end
end)

-- This triggers the actual weapon change
-- If you edit the weapon loadout, you need to edit the name of the variable as well.

RegisterNetEvent('weaponCounter')
AddEventHandler('weaponCounter', function()
	weaponCount = weaponCount + 1
	drawText = true
	if weaponCount == 1 then
		setWeapon = GetHashKey("WEAPON_STUNGUN")
		if regularNotify then
			Notification("~g~ Taser ~s~")  -- Edit this for non-3dtext
		else
			weapon = 'Stungun'  -- Edit this for 3d text
			TriggerEvent('drawText', weapon)
		end

	elseif weaponCount == 2 then 
		setWeapon = GetHashKey("WEAPON_COMBATPISTOL")
		if regularNotify then
			Notification("~g~ Pistol ~s~")
		else
			weapon = 'Pistol'
			TriggerEvent('drawText', weapon)			
		end
	elseif weaponCount == 3 then
		setWeapon = GetHashKey("WEAPON_PUMPSHOTGUN_MK2")
		if regularNotify then
			Notification("~g~ Shotgun ~s~")
		else
			weapon = 'Shotgun'
			TriggerEvent('drawText', weapon)
		end
	elseif weaponCount == 4 then
		setWeapon = GetHashKey("WEAPON_CARBINERIFLE_MK2")
		if regularNotify then
			Notification("~g~ Carbine Rifle~s~")
		else
			weapon = 'Carbine Rifle'
			TriggerEvent('drawText', weapon)
		end
	elseif weaponCount == 5 then
		setWeapon = GetHashKey("WEAPON_UNARMED")
		if regularNotify then
			Notification("~g~ You are Unarmed~s~")
		else
			weapon = 'Unarmed'
			TriggerEvent('drawText', weapon)
		end
	elseif weaponCount <= 6 then
		weaponCount = 0
	end
end)

RegisterNetEvent('drawText')
AddEventHandler('drawText', function(weapon)
	local playerCoords = GetEntityCoords( PlayerPedId() )
	while drawText do
		Wait(5)
		DrawText3d(playerCoords.x, playerCoords.y, playerCoords.z, tostring(weapon))
	end
end)


------------------------------------------------------------------------------------------ ALERT FUNCTION -----------------------------------------------------------------------------------------
function Notification( text )
	SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
	DrawNotification( false, false )
end

function DrawText3d(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = 0.9
   
    if onScreen then
        SetTextScale(0.0*scale, 0.25*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 150)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    	local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0125, 0.013+ factor, 0.03, 41, 11, 41, 68)
		-- Disable this ^^^ if you dont want to draw a rectangle around the 3d text
    end
end