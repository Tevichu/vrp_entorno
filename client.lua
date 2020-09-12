RegisterCommand('entorno', function(source, args)
    local ped = GetPlayerPed(PlayerId())
    local plyPos = GetEntityCoords(GetPlayerPed(-1))
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^5Entorno', {255,255,255}, ' ^7Por favor, escribe lo sucedido detalladamente.')
    else
        TriggerServerEvent('entorno:sendentorno', plyPos.x, plyPos.y, plyPos.z, msg)
        TriggerEvent('chatMessage', '(OOC)', {128, 128, 128}, '^7 Has enviado una llamada de rol de entorno a la policía')
    end
end)


RegisterCommand("forzar", function(source, args, rawCommand)
	local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
		if (vehicle ~= nil and vehicle ~= 0) then
			local modelo = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            modelo = GetLabelText(modelo)
			local puertas1 = GetNumberOfVehicleDoors(vehicle)
			local puertas = puertas1-2

			local plyPos = GetEntityCoords(GetPlayerPed(-1))
			local location = GetStreetNameFromHashKey(street)
			local msg = 'Una persona acaba de robarme mi '.. modelo.. ' de '.. puertas ..' puertas'
			
			TriggerServerEvent('entorno:sendentorno', plyPos.x, plyPos.y, plyPos.z, msg)
			TriggerEvent('chatMessage', '(OOC)', {128, 128, 128}, '^7 Has enviado una llamada de rol de entorno a la policía')
        end
    end
end, false)

