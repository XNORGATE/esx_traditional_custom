ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
local hasCustom = {}

ESX.RegisterUsableItem('taiwanToss', function(source)
	local name = GetPlayerName(source)
    TriggerClientEvent('xng:usedToss', source, name)
	local sid = GetPlayerIdentifier(source)
	local inTable = false

	for _, v in pairs(hasCustom) do
        if v == sid then return end
		inTable = true
    end

	if not inTable and math.random(1,10) > 9 then 
		table.insert(hasCustom, sid)
	end	

	if inTable then 
		TriggerClientEvent('esx:showNotification', wait)
	end	
end)

RegisterNetEvent('xng:tossResult')
AddEventHandler('xng:tossResult', function(result) 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and result == 'money' then
        xPlayer.addMoney(8888)
    end
end)

function clearCustom()
    hasCustom = {}
    SetTimeout(300 * 1000, clearCustom)
end
clearCustom()

