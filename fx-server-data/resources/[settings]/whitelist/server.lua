

local WhiteList = {}

 local notwhitelisted = "Вас нет в вайтлисте."
 local steamiderr = "Ошибка: Мы не можем найти Ваш SteamID в базе разрешенных."
 local trouve = false 


 AddEventHandler("playerConnecting", function(playerName, setKickReason)

    local steamID = GetPlayerIdentifiers(source)[1] or false
     print("Whitelist: "..playerName.."["..steamID.."] try to connect")


       if not steamID then

        setKickReason(steamiderr)
        CancelEvent()

        print("Whitelist: "..playerName.." kicked, SteamID not found")
	--TriggerEvent('DiscordBot:ToDiscord', 'kill', 'WSRP Log | WTLST', ''..playerName..' kicked, SteamID not found', 'https://forum.fivem.net/uploads/default/original/2X/9/9993abe828e5f7d9d92b22a224472b040eb419a2.png', true)


       end


       local result = MySQL.Sync.fetchAll('SELECT * FROM whitelist')

        for i=1, #result, 1 do
            local id   = result[i].identifier
        
            table.insert(WhiteList, tostring(id))
        end

      for i=1, #WhiteList, 1 do

          if(tostring(WhiteList[i]) == tostring(steamID))then
              trouve = true


         end



      end


      if(trouve)then 
           print("Whitelist: "..playerName.."["..steamID.."]  joined, in whitelsit.")
	   --TriggerEvent('DiscordBot:ToDiscord', 'kill', 'WSRP Log | WTLST', ''..playerName..' joined, in whitelsit.', 'https://forum.fivem.net/uploads/default/original/2X/9/9993abe828e5f7d9d92b22a224472b040eb419a2.png', true)
           trouve = false
           WhiteList = {}

                   
      else
                 setKickReason(notwhitelisted)
                    CancelEvent()

                    print("Whitelist: "..playerName.."["..steamID.."] kicked, not found in whitelist. ")
		   -- TriggerEvent('DiscordBot:ToDiscord', 'log', '..playerName..', 'kicked, not found in whitelist.', 'IMAGE_URL', true)
                    trouve = false
                    WhiteList = {}
                    return


                 

      end


end)