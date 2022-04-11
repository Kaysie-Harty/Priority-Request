--------------------------------- Config ----------------------------------


webhookUrl = 'WEBHOOKURLHERE'
callBlips = false -- Ignore This!
disableCallsInChat = true -- If you change this to "false", it will turn off chat alerts!



-- Do not change anything unless you know what your doing! -- 

RegisterServerEvent('priorequest')
AddEventHandler('priorequest', function(location, msg, x, y, z, name, p)
	
	local pName = GetPlayerName(source)
	local p = GetPlayerPed(source)

		if disableCallsInChat == false then
				TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
				TriggerClientEvent('chatMessage', -1, '^*^5Prio Request:', {0, 255, 238})
				TriggerClientEvent('chatMessage', -1, '   ^*^5[UserName]^r^7', {0, 255, 238}, pName .. " (" .. source .. ")")
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Location]^r^7', {0, 255, 238}, location)
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Priority]^r^7', {0, 255, 238}, msg)
				TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
			end
			sendDiscord('Prio Request \n', '**Username: **' .. pName .. ' (' .. source .. ') \n**  Location: **' .. location .. '\n**  Priority: **' .. msg)
		
		if callBlips == true then
				TriggerClientEvent('setBlip', -1, name, x, y, z)
		end
end)

--------------------- Functions -----------------------


function sendDiscord(name, message)
	local content = {
        {
        	["color"] =  "5263615",
            ["title"] = "**Prio Request**",
            ["description"] = message,
        }
    }
  	PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end


--------------------------------------------------------

	
