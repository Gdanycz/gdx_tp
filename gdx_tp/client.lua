ESX = nil
local PlayerData    = {}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.GetSharedObject, function(obj)
            ESX = obj
            PlayerData = ESX.GetPlayerData()
        end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
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
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            for i,location in ipairs(Config.Positions) do
                if location[3] == "everyone" then
                    local distancea = GetDistanceBetweenCoords(coords, location[1][1], location[1][2], location[1][3], true)
                    local distanceb = GetDistanceBetweenCoords(coords, location[2][1], location[2][2], location[2][3], true)
                    if distancea < 20.0 then
                        DrawMarker(27, location[1][1], location[1][2], (location[1][3] - 0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 255, 20, false, false, 2, true, false, false, false)
                        if distancea < 1.6 then
                            DrawGenericTextThisFrame()
                            SetTextEntry("STRING")
                            if Config.UseCustomFont then
                                AddTextComponentString("<font face='"..Config.FontName.."'>".._U('enter_text').."</font>")
                            else
                                AddTextComponentString(_U('enter_text'))
                            end
                            DrawText(0.5, 0.8)
                            if IsControlJustReleased(0, Config.TeleportKey) then
                                if IsPedInAnyVehicle(playerPed, true) then
                                    SetEntityCoords(GetVehiclePedIsUsing(playerPed), location[2][1], location[2][2], location[2][3])
                                    SetEntityHeading(GetVehiclePedIsUsing(playerPed), location[2][4])
                                else
                                    SetEntityCoords(playerPed, location[2][1], location[2][2], location[2][3])
                                    SetEntityHeading(playerPed, location[2][4])
                                end
                            end
                        end
                    end
                    if distanceb < 20.0 then
                        DrawMarker(27, location[2][1], location[2][2], (location[2][3] - 0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 255, 20, false, false, 2, true, false, false, false)
                        if distanceb < 1.6 then
                            DrawGenericTextThisFrame()
                            SetTextEntry("STRING")
                            if Config.UseCustomFont then
                                AddTextComponentString("<font face='"..Config.FontName.."'>".._U('enter_text').."</font>")
                            else
                                AddTextComponentString(_U('enter_text'))
                            end
                            DrawText(0.5, 0.8)
                            if IsControlJustReleased(0, Config.TeleportKey) then
                                if IsPedInAnyVehicle(playerPed, true) then
                                    SetEntityCoords(GetVehiclePedIsUsing(playerPed), location[1][1], location[1][2], location[1][3])
                                    SetEntityHeading(GetVehiclePedIsUsing(playerPed), location[1][4])
                                else
                                    SetEntityCoords(playerPed, location[1][1], location[1][2], location[1][3])
                                    SetEntityHeading(playerPed, location[1][4])
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
                                if Config.UseCustomFont then
                                    AddTextComponentString("<font face='"..Config.FontName.."'>".._U('enter_text').."</font>")
                                else
                                    AddTextComponentString(_U('enter_text'))
                                end
                                DrawText(0.5, 0.8)
                                if IsControlJustReleased(0, Config.TeleportKey) then
                                    if IsPedInAnyVehicle(playerPed, true) then
                                        SetEntityCoords(GetVehiclePedIsUsing(playerPed), location[2][1], location[2][2], location[2][3])
                                        SetEntityHeading(GetVehiclePedIsUsing(playerPed), location[2][4])
                                    else
                                        SetEntityCoords(playerPed, location[2][1], location[2][2], location[2][3])
                                        SetEntityHeading(playerPed, location[2][4])
                                    end
                                end
                            end
                        end
                        if distanceb < 20.0 then
                            DrawMarker(27, location[2][1], location[2][2], (location[2][3] - 0.5), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 120, 255, 20, false, false, 2, true, false, false, false)
                            if distanceb < 1.6 then
                                DrawGenericTextThisFrame()
                                SetTextEntry("STRING")
                                if Config.UseCustomFont then
                                    AddTextComponentString("<font face='"..Config.FontName.."'>".._U('enter_text').."</font>")
                                else
                                    AddTextComponentString(_U('enter_text'))
                                end
                                DrawText(0.5, 0.8)
                                if IsControlJustReleased(0, Config.TeleportKey) then
                                    if IsPedInAnyVehicle(playerPed, true) then
                                        SetEntityCoords(GetVehiclePedIsUsing(playerPed), location[1][1], location[1][2], location[1][3])
                                        SetEntityHeading(GetVehiclePedIsUsing(playerPed), location[1][4])
                                    else
                                        SetEntityCoords(playerPed, location[1][1], location[1][2], location[1][3])
                                        SetEntityHeading(playerPed, location[1][4])
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
    SetTextFont(Config.FontId or 4)
    SetTextProportional(0)
    SetTextScale(0.0, 0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
end