---450.0 6016.2 31.72
ketchup = false
dish = "Banana"
quantity = 1
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Выдача оружия", " ")
_menuPool:Add(mainMenu)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end



function AddMenuAnotherMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Another Menu")
    for i = 1, 20, 1 do
        submenu:AddItem(NativeUI.CreateItem("PageFiller", "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"))
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