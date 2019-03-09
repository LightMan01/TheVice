ketchup = false
dish = "Banana"
quantity = 1
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Оружейная", " ")
_menuPool:Add(mainMenu)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function AddMenuKetchup(menu)
    local newitem = NativeUI.CreateCheckboxItem("Add ketchup?", ketchup, "Do you wish to add ketchup?")
    menu:AddItem(newitem)
    menu.OnCheckboxChange = function(sender, item, checked_)
        if item == newitem then
            ketchup = checked_
            ShowNotification("~r~Ketchup status: ~b~"..tostring(ketchup))
        end
    end
end

function AddMenuFoods(menu)
    local foods = {
        "Banana",
        "Apple",
        "Pizza",
        "Quartilicious",
        "Steak",
        0xF00D,
    }
    local newitem = NativeUI.CreateListItem("Food", foods, 1)
    menu:AddItem(newitem)
    menu.OnListChange = function(sender, item, index)
        if item == newitem then
            dish = item:IndexToItem(index)
            ShowNotification("Preparing ~b~" .. dish .. "~w~...")
        end
    end
end

function AddMenuFoodCount(menu)
    local amount = {}
    for i = 1, 100 do amount[i] = i end
    local newitem = NativeUI.CreateSliderItem("Quantity", amount, 1, false)
    menu:AddItem(newitem)
    menu.OnSliderChange = function(sender, item, index)
        if item == newitem then
            quantity = item:IndexToItem(index)
            ShowNotification("Preparing ~r~" .. quantity .. " ~b~" .. dish .. "(s)~w~...")
        end
    end
end

function AddMenuCook(menu)
    local newitem = NativeUI.CreateItem("Cook!", "Cook the dish with the appropriate ingredients and ketchup.")
    newitem:SetLeftBadge(BadgeStyle.Star)
    newitem:SetRightBadge(BadgeStyle.Tick)
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, index)
        if item == newitem then
            local string = "You have ordered ~r~" .. quantity .. " ~b~"..dish.."(s)~w~ ~r~with~w~ ketchup."
            if not ketchup then
                string = "You have ordered ~r~" .. quantity .. " ~b~"..dish.."(s)~w~ ~r~without~w~ ketchup."
            end
            ShowNotification(string)
        end
    end
    menu.OnIndexChange = function(sender, index)
        if sender.Items[index] == newitem then
            newitem:SetLeftBadge(BadgeStyle.None)
        end
    end
end

function AddMenuAnotherMenu(menu)
	local guns = {"Glock 17", "Винтовка М4", "Помповый дробовик", "Снайперская винтовка", "Полицейская дубинка", "Тазер", "Сигнальный пистолет","Флаер", "Фонарик"}
	local desc = {"Боевой пистолет офицера. Доступен всем.", "Для использоватя тактическими группами.", "Для использоватя тактическими группами.", "Доступен всем.", "Доступен всем.", "Доступен всем.", "Доступен всем.", "Доступен всем." , "Доступен всем."}
    local gun = {"WEAPON_COMBATPISTOL", "WEAPON_CARBINERIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_NIGHTSTICK", "WEAPON_STUNGUN","WEAPON_FLAREGUN","WEAPON_FLARE","WEAPON_FLASHLIGHT"}
	local arm = {}
	local var
	for i = 1, #guns do
		arm[i] = NativeUI.CreateItem(guns[i], desc[i])
        menu:AddItem(arm[i])
    end
	arm[10] = menu:AddItem(NativeUI.CreateItem("Очистить все оружие", " "))
	menu.OnItemSelect = function(sender, item, index)
		for i = 1, #arm do
			if arm[1] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
				GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(gun[i]), 0x359B7AAE)
				SetPedWeaponTintIndex(PlayerPedId(), GetHashKey(gun[i]), 3)
			end
			else if arm[2] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[3] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[4] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[5] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[6] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[7] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[8] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[9] == item then 
				GiveWeaponToPed(PlayerPedId(), GetHashKey(gun[i]), 300, false, true)
			end
			else if arm[10] == item then 
				RemoveAllPedWeapons(sender, false)
				ShowNotification("da")
			end
		end
		
    end
end

AddMenuAnotherMenu(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 51) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)