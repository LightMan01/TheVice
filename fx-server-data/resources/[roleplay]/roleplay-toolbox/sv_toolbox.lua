--[[
SERVER EVENTS FOR CIV ADVERTS
]]--	
RegisterServerEvent("syncad1")
AddEventHandler('syncad1', function(inputText)
TriggerClientEvent('displayad1', -1, inputText)
end)

RegisterServerEvent("syncad2")
AddEventHandler('syncad2', function(inputText)
TriggerClientEvent('displayad2', -1, inputText)
end)

RegisterServerEvent("syncad3")
AddEventHandler('syncad3', function(inputText)
TriggerClientEvent('displayad3', -1, inputText)
end)

RegisterServerEvent("syncad4")
AddEventHandler('syncad4', function(inputText)
TriggerClientEvent('displayad4', -1, inputText)
end)

RegisterServerEvent("syncad5")
AddEventHandler('syncad5', function(inputText)
TriggerClientEvent('displayad5', -1, inputText)
end)

RegisterServerEvent("syncad6")
AddEventHandler('syncad6', function(inputText)
TriggerClientEvent('displayad6', -1, inputText)
end)

RegisterServerEvent("syncad7")
AddEventHandler('syncad7', function(inputText)
TriggerClientEvent('displayad7', -1, inputText)
end)

RegisterServerEvent("syncad8")
AddEventHandler('syncad8', function(inputText)
TriggerClientEvent('displayad8', -1, inputText)
end)

RegisterServerEvent("syncad9")
AddEventHandler('syncad9', function(inputText)
TriggerClientEvent('displayad9', -1, inputText)
end)

RegisterServerEvent("syncad10")
AddEventHandler('syncad10', function(inputText)
TriggerClientEvent('displayad10', -1, inputText)
end)

RegisterServerEvent("syncad11")
AddEventHandler('syncad11', function(inputText)
TriggerClientEvent('displayad11', -1, inputText)
end)

RegisterServerEvent("syncad12")
AddEventHandler('syncad12', function(inputText)
TriggerClientEvent('displayad12', -1, inputText)
end)

RegisterServerEvent("syncad13")
AddEventHandler('syncad13', function(inputText)
TriggerClientEvent('displayad13', -1, inputText)
end)

RegisterServerEvent("syncad14")
AddEventHandler('syncad14', function(inputText)
TriggerClientEvent('displayad14', -1, inputText)
end)

RegisterServerEvent("syncad15")
AddEventHandler('syncad15', function(inputText)
TriggerClientEvent('displayad15', -1, inputText)
end)

RegisterServerEvent("syncad16")
AddEventHandler('syncad16', function(inputText)
TriggerClientEvent('displayad16', -1, inputText)
end)

RegisterServerEvent("syncad17")
AddEventHandler('syncad17', function(inputText)
TriggerClientEvent('displayad17', -1, inputText)
end)

RegisterServerEvent("syncad18")
AddEventHandler('syncad18', function(inputText)
TriggerClientEvent('displayad18', -1, inputText)
end)

RegisterServerEvent("syncad19")
AddEventHandler('syncad19', function(inputText)
TriggerClientEvent('displayad19', -1, inputText)
end)

RegisterServerEvent("syncad20")
AddEventHandler('syncad20', function(inputText)
TriggerClientEvent('displayad20', -1, inputText)
end)

RegisterServerEvent("syncad21")
AddEventHandler('syncad21', function(inputText)
TriggerClientEvent('displayad21', -1, inputText)
end)


RegisterServerEvent('wk_actionmenu:cuffGranted')
AddEventHandler('wk_actionmenu:cuffGranted', function(t)
	TriggerClientEvent('wk_actionmenu:getArrested', t)
end)

RegisterServerEvent('wk_actionmenu:dragRequest')
AddEventHandler('wk_actionmenu:dragRequest', function(t)
	TriggerClientEvent('wk_actionmenu:toggleDrag', t, source)
end)



RegisterServerEvent('wk_actionmenu:forceEnterAsk')
AddEventHandler('wk_actionmenu:forceEnterAsk', function(t, v)
	TriggerClientEvent('wk_actionmenu:forcedEnteringVeh', t, v)
end)

RegisterServerEvent('wk_actionmenu:confirmUnseat')
AddEventHandler('wk_actionmenu:confirmUnseat', function(t)
	TriggerClientEvent('wk_actionmenu:unseatme', t)
end)

	-- Registers functions for chat message --
RegisterServerEvent("chatMessage")
RegisterServerEvent("returnData")

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- DO NOT REMOVE --

local CurrentVersion = '1.4'
local GithubResourceName = 'roleplay-toolbox'

PerformHttpRequest('https://raw.githubusercontent.com/aka-lucifer/roleplay-toolbox-resources/master/VERSION', function(Error, NewestVersion, Header)
	PerformHttpRequest('' .. GithubResourceName .. '/CHANGES', function(Error, Changes, Header)
		print('\n')
		print('--------------------------------------------------------------------')
		print('')
		print('Roleplay Toolbox')
		print('')
		print('Current Version: ' .. CurrentVersion)
		print('Newest Version: ' .. NewestVersion)
		print('')
		if CurrentVersion ~= NewestVersion then
			print('--------------------------------------------------------------------')
		else
			print('-- Up to date!')
			print('--------------')
		end
		print('\n')
	end)
end)
