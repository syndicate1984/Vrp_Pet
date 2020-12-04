vRPpeturiC = {}
Tunnel.bindInterface("vrp_peturimancatiaspulata",vRPpeturiC)
Proxy.addInterface("vrp_peturimancatiaspulata",vRPpeturiC)
vRP = Proxy.getInterface("vRP")
vRPSpeturi = Tunnel.getInterface("vrp_peturimancatiaspulata","vrp_peturimancatiaspulata")

function vRPpeturiC.papagalnegru()
    RequestModel( GetHashKey( "a_c_crow" ) )
        while ( not HasModelLoaded( GetHashKey( "a_c_crow" ) ) ) do
            Citizen.Wait( 1 )
        end
    local pos = GetEntityCoords(GetPlayerPed(-1))
    ped = CreatePed(29, 0x18012A9F, pos.x+9, pos.y+5, pos.z+15, 90.0, true, false)
    AttachEntityToEntity(ped, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 24818), 0.15, 0.0005, 0.20, 10.0, 70.0, 10.0, true, true, false, true, 1, true)
    AttachEntityToEntity(ped, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  40269), 0.0, 'a_c_crow', -0.1, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
--   Wait(5000)
--   DeleteEntity(ped)
end

function vRPpeturiC.deleteEveryPet()
    DeleteEntity(ped)
    DeleteEntity(ped)
    DeleteEntity(ped)
    DeleteEntity(ped)
end

