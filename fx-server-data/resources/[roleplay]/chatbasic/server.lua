--Private Messages
TriggerEvent('es:addCommand', 'pm', function(source, args, user)
if(GetPlayerName(tonumber(args[2])) or GetPlayerName(tonumber(args[3])))then
local player = tonumber(args[2])
table.remove(args, 2)
table.remove(args, 1)

TriggerEvent("es:getPlayerFromId", player, function(target)
TriggerClientEvent('chatMessage', player, "PM", {214, 214, 214}, "^2 From ^5"..GetPlayerName(source).. " [" .. source .. "]: ^7" ..table.concat(args, " "))
TriggerClientEvent('chatMessage', source, "PM", {214, 214, 214}, "^3 Sent to ^5"..GetPlayerName(player).. ": ^7" ..table.concat(args, " "))
end)
else
TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
end
end, function(source, args, user)
TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message,1,string.len("/"))=="/" then
		--ne doit rien se passer c'est une commande
	else
		TriggerClientEvent("sendProximityMessage", -1, source, name, message)
	end
	CancelEvent()
end)

-- ME COMMAND (/me [Message]) Outcomes: Name Message (All in purple)
TriggerEvent('es:addCommand', 'me', function(source, args, user)
    table.remove(args, 1)
    local pname = GetPlayerName(source)
    TriggerClientEvent("sendProximityMessageMe", -1, source, pname, table.concat(args, " "))
end, function(source, args, user)
    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- DO COMMAND (/do [Message]) Outcomes: Action: *Name Message
TriggerEvent('es:addCommand', 'do', function(source, args, user)
	table.remove(args, 1)
	local pname = GetPlayerName(source)
	TriggerClientEvent("sendProximityMessageDo", -1, source, pname, table.concat(args, " "))
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addCommand', 'b', function(source, args, user)
    table.remove(args, 1)
    local pname = GetPlayerName(source)
    TriggerClientEvent("sendProximityMessageB", -1, source, pname, table.concat(args, " "))
end, function(source, args, user)
    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

--end Eventhandlers

--functions
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
--end Functions