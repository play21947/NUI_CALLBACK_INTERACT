local display = false

RegisterCommand('clearweapon', function()
    RemoveAllPedWeapons(PlayerPedId(), true)
end)

RegisterCommand('nui', function()
    SetDisplay(not display)
end)

RegisterNUICallback("main", function(data)
    local weapon = data.text
    give_something(weapon)
    SetDisplay(false)
end)

RegisterNUICallback('exit', function(data)
    SetDisplay(false)
end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- block Look left and right
        DisableControlAction(0, 2, display) -- Block Look upper and down
        DisableControlAction(0, 142, display) -- Melee Attack
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VihicleControl
    end
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

function give_something(hash)
    GiveWeaponToPed(PlayerPedId(), hash, 999, false, false)
end