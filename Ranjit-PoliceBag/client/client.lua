local QBCore = exports['qb-core']:GetCoreObject()
local policebag1 = nil
local function droppolicebag()
    DetachEntity(policebag1)
    PlaceObjectOnGroundProperly(policebag1)
end
local function spawnpolicebag()
    local hasBag = true
    CreateThread(function()
        while hasBag do
            Wait(0)
            if IsControlJustReleased(0, 38) then -- If E is pressed it drop the  bag
                hasBag = false
                droppolicebag()
                Wait(1000)
            end
        end
    end)
end
local ObjectList = {}

RegisterNetEvent('Ranjit-policeBag:Client:SpawnpoliceBag', function()
    local hash = GetHashKey('prop_cs_heist_bag_01')
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -0.7)) -- Adjusted offset
    QBCore.Functions.LoadModel(hash)
    policebag1 = CreateObjectNoOffset(hash, x, y, z, true, false)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(policebag1, ped, GetPedBoneIndex(ped, 57005), 0.1, 0.12, -0.08, -90.0, 0.0, 90.0, true, true, false, true, 1, true) -- Adjusted position parameters
    spawnpolicebag()
    TriggerServerEvent("Ranjit-policeBag:Server:RemoveItem","policebag",1)
end)


RegisterNetEvent('Ranjit-policeBag:Client:spawnLight', function()

    TriggerServerEvent("Ranjit-policeBag:Server:SpawnpoliceBag", "policebag")
end)

RegisterNetEvent('Ranjit-policeBag:Client:GuardarpoliceBag')
AddEventHandler("Ranjit-policeBag:Client:GuardarpoliceBag", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local playerPedPos = GetEntityCoords(PlayerPedId(), true)
    local policeBag = GetClosestObjectOfType(playerPedPos, 10.0, GetHashKey("prop_cs_heist_bag_01"), false, false, false)
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD")
    progressBar("Taking Back the Police Bag...")
    Wait(2500)
    Notify("Police Bag Taken Back with success.")
    SetEntityAsMissionEntity(policeBag, 1, 1)
    DeleteObject(policeBag)
    TriggerServerEvent("Ranjit-policeBag:Server:AddItem","policebag",1)
end)

local citizenid = nil
AddEventHandler("Ranjit-policeBag:Client:StoragepoliceBag", function()
    local charinfo = QBCore.Functions.GetPlayerData().charinfo
    citizenid = QBCore.Functions.GetPlayerData().citizenid
    TriggerEvent("inventory:client:SetCurrentStash", "police Bag",citizenid)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "police Bag",citizenid, {
        maxweight = Config.Stash.MaxWeighStash,
        slots = Config.Stash.MaxSlotsStash,
    })
end)

local policeBags = {
    'prop_cs_heist_bag_01',
}

exports['qb-target']:AddTargetModel(policeBags, {
    options = {{event   = "Ranjit-policeBag:Client:MenupoliceBag",icon    = "fa-solid fa-building-shield",label   = "Police Bag" , job = Config.Bag.Job },
    {event   = "Ranjit-policeBag:Client:GuardarpoliceBag",icon    = "fa-solid fa-building-shield",label   = "Take Back Police Bag" , job = Config.Bag.Job },},distance = 2.0 })

exports['qb-target']:AddTargetModel(policeBags, {
    options = {{event   = "Ranjit-policeBag:Client:MenupoliceBag",icon    = "fa-solid fa-building-shield",label   = "Police Bag" , job = Config.Bag.Job1 },
    {event   = "Ranjit-policeBag:Client:GuardarpoliceBag",icon    = "fa-solid fa-building-shield",label   = "Take Back Police Bag" , job = Config.Bag.Job1 },},distance = 2.0 })
    