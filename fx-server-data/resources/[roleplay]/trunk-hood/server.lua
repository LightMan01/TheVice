-- Hood Command

AddEventHandler( 'chatMessage', function(source, n, message)
    if (message == "/hood" ) then
        TriggerClientEvent('hoodMessage', source)	
        TriggerClientEvent('openHood', source)
    end 
end)

-- Trunk Command

AddEventHandler( 'chatMessage', function(source, n, message)
    if (message == "/trunk" ) then
        TriggerClientEvent('trunkMessage', source)	
        TriggerClientEvent('openTrunk', source)
    end 
end)

-- Designed by Lucifer, please don't edit.