ESX                           = nil
Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)

local templePos = vec(492.28, -1039.66, 28.34)

RegisterNetEvent('xng:usedToss')
AddEventHandler('xng:usedToss', function(name)
	local ped = PlayerPedId()
    if #(GetEntityCoords(ped) - templePos) <= 2 then
		ESX.ShowNotification(wish_custom)
		Citizen.Wait(3000)

        TriggerEvent('esx:showNotification', doing_custom)
		xng_showAnim()	
		Citizen.Wait(5000)

        local rate = math.random(1,3)
		
        if rate == 1 then 
			Citizen.Wait(6500)
			PlaySound(-1, 'Menu_Accept', 'Phone_SoundSet_Default', 0, 0, 1)
			ESX.Scaleform.ShowFreemodeMessage(TossResult_nice, name..TossResult, 5)
			ESX.ShowNotification(TossResult_nice_mean)
            TriggerEvent('esx:showNotification', got_money)    
            TriggerServerEvent('xng:tossResult', 'money')
        elseif rate == 2 then 
			Citizen.Wait(6500)
			PlaySound(-1, 'Menu_Accept', 'Phone_SoundSet_Default', 0, 0, 1)
			ESX.Scaleform.ShowFreemodeMessage(TossResult_hmmm, name..TossResult, 5)
			ESX.ShowNotification(TossResult_hmmm_mean)   
        elseif rate == 3 then
			Citizen.Wait(6500)
			PlaySound(-1, 'Menu_Accept', 'Phone_SoundSet_Default', 0, 0, 1)
			ESX.Scaleform.ShowFreemodeMessage(TossResult_nah, name..TossResult, 5)
			ESX.ShowNotification(TossResult_nah_mean)
        end
    else
        TriggerEvent('esx:showNotification', wrong_place)    
    end   
end)

function xng_showAnim()
	loadAnimDict('amb@world_human_gardener_plant@male@idle_a')
	TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, false)
	--loadAnimDict('timetable@amanda@ig_4')--ig_4_idle
	--TaskStartScenarioInPlace(PlayerPedId(), 'ig_4_idle', 0, false)--timetable@amanda@ig_4
	Citizen.Wait(5000)
	ClearPedTasks(PlayerPedId())
end
  
  
function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end
