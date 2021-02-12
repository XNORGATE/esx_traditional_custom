TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
local hasCustom = {}

ESX.RegisterUsableItem('taiwanToss', function(source)
    TriggerClientEvent('xng:usedToss', source)

	local sid = GetPlayerIdentifier(source)
	for _, v in pairs(hasCustom) do
        if v == sid then
			return TriggerClientEvent('esx:showNotification', wait)
		end
    end

	if math.random(1,10) > 9 then 
		table.insert(hasCustom, sid)
	end
end)

RegisterNetEvent('xng:tossedMoney')
AddEventHandler('xng:tossedMoney', function() 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addMoney(8888)
    end
end)

function clearCustom()
    hasCustom = {}
    SetTimeout(300 * 1000, clearCustom)
end
clearCustom()