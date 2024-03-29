local QBCore = exports['qb-core']:GetCoreObject()


-- Simple Event's , you can create yours and put on qb-menu :)

RegisterNetEvent('Ranjit-policeBag:Client:GiveRadio')
AddEventHandler("Ranjit-policeBag:Client:GiveRadio", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Out ...")
    TriggerServerEvent("Ranjit-policeBag:Server:AddItem", "radio", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["radio"], "add", 1)
end)

RegisterNetEvent('Ranjit-policeBag:Client:Givebandage')
AddEventHandler("Ranjit-policeBag:Client:Givebandage", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Out ...")

    TriggerServerEvent("Ranjit-policeBag:Server:AddItem", "bandage", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bandage"], "add", 1)
end)
RegisterNetEvent('Ranjit-policeBag:Client:Givepainkillers')
AddEventHandler("Ranjit-policeBag:Client:Givepainkillers", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Out ...")

    TriggerServerEvent("Ranjit-policeBag:Server:AddItem", "painkillers", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["painkillers"], "add", 1)
end)
RegisterNetEvent('Ranjit-policeBag:Client:Givearmor')
AddEventHandler("Ranjit-policeBag:Client:Givearmor", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Out ...")

    TriggerServerEvent("Ranjit-policeBag:Server:AddItem", "armor", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["armor"], "add", 1)
end)
RegisterNetEvent('Ranjit-policeBag:Client:Giveweapon_flashlight')
AddEventHandler("Ranjit-policeBag:Client:Giveweapon_flashlight", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Out ...")

    TriggerServerEvent("Ranjit-policeBag:Server:AddItem", "weapon_flashlight", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weapon_flashlight"], "add", 1)
end)


RegisterNetEvent('Ranjit-policeBag:Client:MenupoliceBag', function()
    local playerPed = PlayerPedId()
    if IsEntityDead(playerPed) then return Notify("You cannot Open Bag while dead", "error") end
    if IsPedSwimming(playerPed) then return Notify("You cannot Open Bag in the water.", "error") end
    if IsPedSittingInAnyVehicle(playerPed) then return Notify("You cannot Open Bag inside a vehicle", "error") end
    exports['qb-menu']:openMenu({
        { header = "[👮] Police Box", txt = "", isMenuHeader = true },
        { header = "[👜] Open Police Bag",  params = { event = "Ranjit-policeBag:Client:StoragepoliceBag" } },
        { header = "[🩹]Take Bandage ",  params = { event = "Ranjit-policeBag:Client:Givebandage" } },
        { header = "[💊] Take Painkillers ",  params = { event = "Ranjit-policeBag:Client:Givepainkillers" } },
        { header = "[🛡️] Take armor ",  params = { event = "Ranjit-policeBag:Client:Givearmor" } },
        { header = "[🔦] Take FlashLight ",  params = { event = "Ranjit-policeBag:Client:Giveweapon_flashlight" } },
        { header = "[📻] Take Radio",  params = { event = "Ranjit-policeBag:Client:GiveRadio" } },
        -- You can add more menus with your's personal events...
        { header = "", txt = "❌ Close", params = { event = "qb-menu:closeMenu" } },
    })
end)

