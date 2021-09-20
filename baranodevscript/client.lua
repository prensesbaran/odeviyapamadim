local a = 0
local b = 0
local sonuc = 0
--Made by Prenses Baran

-- pedin üzerinde yazıları çıkmasu içunnn
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

-- ha burası döngünün başlaması için
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,-1230.44, -1226.54, 6.91, 14.42,false)
    local sleepThread = 500
    if distance <= 5.0 then
        sleepThread = 5
        if distance <= 1.2 then
            DrawText3D(-1230.44, -1226.54, 6.91, "[E] - Dahi Çocuk")
            if IsControlJustReleased(0, 86) then
                Citizen.Wait(1)
                TriggerEvent("baran:odevyap")
            end
        end
    end
    if distance >= 7.0 then
      Citizen.Wait(5000)
    else 
      Citizen.Wait(5)
    end
  end
end)
local firstspawn = false


-- pedi spawnlamak için gerekli kodlar
Citizen.CreateThread(function()
    local hash = GetHashKey("ig_jimmydisanto")

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Citizen.Wait(100)
    end

    while not HasModelLoaded(hash) do
        Citizen.Wait(0)
    end

    if firstspawn == false then
        local bmnpc1 = CreatePed(6, hash, -1230.44, -1226.54, 6.91, 14.42, 150.0, false, false)
        SetEntityInvincible(bmnpc1, true)
        FreezeEntityPosition(bmnpc1, true)
        SetBlockingOfNonTemporaryEvents(bmnpc1, true)
        SetPedDiesWhenInjured(bmnpc1, false)
        SetPedCanRagdollFromPlayerImpact(bmnpc1, false)
        SetPedCanRagdoll(bmnpc1, false)
        SetEntityAsMissionEntity(bmnpc1, true, true)
        SetEntityDynamic(bmnpc1, true)
    end
    firstspawn = true
end)

RegisterNetEvent("baran:odevyap")
AddEventHandler("baran:odevyap", function()
    print("Hoşgeldin ben matematik dehasıyım sana yardımcı olabilirim!")
    print("Düşünüyor...")
    Citizen.Wait(3000)
    print("4 işlem için /topla /çıkar /bol /çarp komutlarını konsola yazabilirsin!")
    print("Üs almak için /üsal Yüzde almak için /yuzdeal komutlarını konsola yazabilirsin")
    Citizen.Wait(1000)
end)

RegisterCommand("çıkar",function(args)
    if args[1] == nil then
        print("argümantlar boş olmamalı en az 2 tane argümant gir mesela /çıkar 10 1")
    else
        if args[2] == nil then
            print("argümantlar boş olmamalı en az 2 tane argümant gir mesela /çıkar 10 1")
        else
            args[1] = a
            args[2] = b
            sonuc = a - b
            print("çıkarma işlemine hoşgeldin...")
            print("Düşünüyor...")
            Citizen.Wait(3000)
            print("Çıkar işleminin sonucu: ",sonuc)
        end
    end

end)