key_to_teleport = 38

positions = {
	--{{x, y, z, h}, {x, y, z, h}, "job_name"}, pro povelení všem hráčům použijte: everyone
    {{141.24, -735.36, 262.85, 158.9}, {131.08, -762.28, 242.15, 160.23}, "fbi"},
}

ESX              = nil
local PlayerData                = {}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
            PlayerData = ESX.GetPlayerData()
        end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


Citizen.CreateThread(function ()
    Citizen.Wait(5000)

    while true do
        if PlayerData.job == nil then
            PlayerData.job = ESX.GetPlayerData().job
        else
            Citizen.Wait(0)
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
            for i,location in ipairs(positions) do
                if location[3] == "everyone" then
                    local distancea = GetDistanceBetweenCoords(coords, location[1][1], location[1][2], location[1][3], true)
                    local distanceb = GetDistanceBetweenCoords(coords, location[2][1], location[2][2], location[2][3], true)
                    if distancea < 20.0 then
                        DrawMarker(27, location[1][1], location[1][2], (location[1][3] - 0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 255, 20, false, false, 2, true, false, false, false)
                        if distancea < 1.6 then
                            DrawGenericTextThisFrame()
                            SetTextEntry("STRING")
                            AddTextComponentString("Vstoupit [~g~E~w~]")
                            DrawText(0.5, 0.8)
                            if IsControlJustReleased(0, key_to_teleport) then
                                if IsPedInAnyVehicle(player, true) then
                                    SetEntityCoords(GetVehiclePedIsUsing(player), location[2][1], location[2][2], location[2][3])
                                    SetEntityHeading(GetVehiclePedIsUsing(player), location[2][4])
                                else
                                    SetEntityCoords(player, location[2][1], location[2][2], location[2][3])
                                    SetEntityHeading(player, location[2][4])
                                end
                            end
                        end
                    end
                    if distanceb < 20.0 then
                        DrawMarker(27, location[2][1], location[2][2], (location[2][3] - 0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 255, 20, false, false, 2, true, false, false, false)
                        if distanceb < 1.6 then
                            DrawGenericTextThisFrame()
                            SetTextEntry("STRING")
                            AddTextComponentString("Vstoupit [~g~E~w~]")
                            DrawText(0.5, 0.8)
                            if IsControlJustReleased(0, key_to_teleport) then
                                if IsPedInAnyVehicle(player, true) then
                                    SetEntityCoords(GetVehiclePedIsUsing(player), location[1][1], location[1][2], location[1][3])
                                    SetEntityHeading(GetVehiclePedIsUsing(player), location[1][4])
                                else
                                    SetEntityCoords(player, location[1][1], location[1][2], location[1][3])
                                    SetEntityHeading(player, location[1][4])
                                end
                            end
                        end
                    end
                else
                    if PlayerData.job.name == location[3] then
                        local distancea = GetDistanceBetweenCoords(coords, location[1][1], location[1][2], location[1][3], true)
                        local distanceb = GetDistanceBetweenCoords(coords, location[2][1], location[2][2], location[2][3], true)
                        if distancea < 20.0 then
                            DrawMarker(27, location[1][1], location[1][2], (location[1][3] - 0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 255, 20, false, false, 2, true, false, false, false)
                            if distancea < 1.6 then
                                DrawGenericTextThisFrame()
                                SetTextEntry("STRING")
                                AddTextComponentString("Vstoupit [~g~E~w~]")
                                DrawText(0.5, 0.8)
                                if IsControlJustReleased(0, key_to_teleport) then
                                    if IsPedInAnyVehicle(player, true) then
                                        SetEntityCoords(GetVehiclePedIsUsing(player), location[2][1], location[2][2], location[2][3])
                                        SetEntityHeading(GetVehiclePedIsUsing(player), location[2][4])
                                    else
                                        SetEntityCoords(player, location[2][1], location[2][2], location[2][3])
                                        SetEntityHeading(player, location[2][4])
                                    end
                                end
                            end
                        end
                        if distanceb < 20.0 then
                            DrawMarker(27, location[2][1], location[2][2], (location[2][3] - 0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 255, 20, false, false, 2, true, false, false, false)
                            if distanceb < 1.6 then
                                DrawGenericTextThisFrame()
                                SetTextEntry("STRING")
                                AddTextComponentString("Vstoupit [~g~E~w~]")
                                DrawText(0.5, 0.8)
                                if IsControlJustReleased(0, key_to_teleport) then
                                    if IsPedInAnyVehicle(player, true) then
                                        SetEntityCoords(GetVehiclePedIsUsing(player), location[1][1], location[1][2], location[1][3])
                                        SetEntityHeading(GetVehiclePedIsUsing(player), location[1][4])
                                    else
                                        SetEntityCoords(player, location[1][1], location[1][2], location[1][3])
                                        SetEntityHeading(player, location[1][4])
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2
    local t2 = y-cy
    local t21 = t2^2
    local t3 = z - cz
    local t31 = t3^2
    return (t12 + t21 + t31) <= radius^2
end

DrawGenericTextThisFrame = function()
    SetTextFont(13)
    SetTextProportional(0)
    SetTextScale(0.0, 0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
end