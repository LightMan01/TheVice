--[[------------------------------------------------------------------------

	Radar/ALPR 
	Created by Brock =]
	Edited by Chip W. Gaming and Terbium
	Edits allowing to switch between mph/kph by JebstaLP

	Uses Y to turn on
    Uses E to freeze
	
	To change either key, edit lines 47 and 63
    --https://docs.fivem.net/game-references/controls/

------------------------------------------------------------------------]]--

local radar =
{
	shown = false,
	freeze = false,
	info = "~y~Калибровка значений, подождите...~n~~w~Радар готов.",
	info2 = "~y~Калибровка значений, подождите...~n~~w~Радар готов.",
	minSpeed = 5.0,
	maxSpeed = 75.0,
	metric	= true, --set to false for imperal (mph) Edited by JebstaLP
    radargun = "WEAPON_MUSKET"
}

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

Citizen.CreateThread( function()
while true do
	Wait(0)

	if IsControlJustPressed(1, 246) then --246 = Y
	
     if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(radar.radargun) then

			if radar.shown then 
				radar.shown = false 
				radar.info = string.format("~y~Калибровка значений, подождите...~n~~w~Радар готов.")
				radar.info2 = string.format("~y~Калибровка значений, подождите...~n~~w~Радар готов.")
			else 
				radar.shown = true 	
     end
   end
  Wait(75)
			
  end

		if IsControlJustPressed(1, 38) then --38 = E
		
			if radar.freeze then radar.freeze = false else radar.freeze = true end
	
		end
		if radar.shown  then
			if radar.freeze == false then
					local player = GetPlayerPed(-1)
					local coordA = GetOffsetFromEntityInWorldCoords(player, 0.0, 1.0, 1.0)
					local coordB = GetOffsetFromEntityInWorldCoords(player, 0.0, 105.0, 0.0)
					local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, player, 7)
					local a, b, c, d, e = GetShapeTestResult(frontcar)
					local playerId = PlayerId()
					
					if IsEntityAVehicle(e) then

					 if IsPlayerFreeAiming(playerId) then
						
						local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
						
						if radar.metric == true then
							local fvspeed = GetEntitySpeed(e)*3.6  -- m/s to kmh
							local fplate = GetVehicleNumberPlateText(e)
							radar.info = string.format("~y~Номер: ~w~%s  ~y~Модель: ~w~%s ~n~ ~y~Скорость: ~w~%s км/ч", fplate, fmodel, math.ceil(fvspeed))
						else 
							local fvspeed = GetEntitySpeed(e)*2.23694 -- m/s to mph
							local fplate = GetVehicleNumberPlateText(e)
							radar.info = string.format("~y~Номер: ~w~%s  ~y~Модель: ~w~%s ~n~ ~y~Скорость: ~w~%s mph", fplate, fmodel, math.ceil(fvspeed))
						end
					end
				end	
			end
			
			DrawRect(0.508, 0.94, 0.196, 0.116, 0, 0, 0, 150)
			DrawAdvancedText(0.600, 0.903, 0.005, 0.0028, 0.4, "Полицейский радар", 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.6, 0.928, 0.005, 0.0028, 0.4, radar.info, 255, 255, 255, 255, 6, 0)

		end
					
	end
	
	
end)




Citizen.CreateThread( function()
    while true do
        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(radar.radargun) then
            local ped = GetPlayerPed( -1 )  

            DisableControlAction( 0, 24, true ) -- Attack
            DisablePlayerFiring( ped, true ) -- Disable weapon firing
            DisableControlAction( 0, 142, true ) -- MeleeAttackAlternate
            DisableControlAction( 0, 106, true ) -- VehicleMouseControlOverride

            SetPauseMenuActive( false )
        end 

        Citizen.Wait( 0 )
    end 
end )