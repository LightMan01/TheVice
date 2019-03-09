RegisterCommand("duty", function(args, string)
    local ped = GetPlayerPed(PlayerId())
    msg("^2^* Вы получили снаряжение офицера ^3полиции ^2.")
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    GiveWeaponToPed(ped, GetHashKey("WEAPON_NIGHTSTICK"), 50, false, false)
    GiveWeaponToPed(ped, GetHashKey("WEAPON_PUMPSHOTGUN"), 100, false, false)
    GiveWeaponToPed(ped, GetHashKey("WEAPON_COMBATPISTOL"), 100, false, false)
    GiveWeaponToPed(ped, GetHashKey("WEAPON_STUNGUN"), 1, false, false)
	GiveWeaponToPed(ped, GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
end, false)

function msg(text)
    TriggerEvent("chatMessage", "[DUTY]", {255, 4, 1}, text)
end
