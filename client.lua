local menuOpen = false

Citizen.CreateThread(function()
  while menuOpen do
    Citizen.Wait(0)

    DisableControlAction(0, 1, menuOpen) -- LookLeftRight
    DisableControlAction(0, 2, menuOpen) -- LookUpDown
    DisableControlAction(0, 142, menuOpen) -- MeleeAttackAlternate
    DisableControlAction(0, 18, menuOpen) -- Enter
    DisableControlAction(0, 322, menuOpen) -- ESC
    DisableControlAction(0, 106, menuOpen) -- VehicleMouseControlOverride
  end
end)

Citizen.CreateThread(
  function()
    while true do
      Citizen.Wait(0)

      HideHudComponentThisFrame(19)

      if IsControlJustReleased(0, 37) and IsInputDisabled(0) then
        toggleInventory()
      end
    end
  end
)

RegisterNUICallback('main', function(data, cb)
  chat(data.text)

  cb(data.text)
end)


RegisterNUICallback('exit', function(data, cb)
  chat('Closing')
  chat(data)
  toggleInventory()
  cb('ok')
end)

function toggleInventory() 
  menuOpen = not menuOpen

  -- Set focus to on or off
  SetNuiFocus(menuOpen, menuOpen)

  SendNUIMessage({
    type = 'ui',
    status = menuOpen
  })
end

function chat(text)
  TriggerEvent('chatMessage', '[inv]', { 255, 0, 0 }, 'Status ' .. tostring(menuOpen))
  TriggerEvent('chatMessage', '[inv]', { 0, 255, 0 }, text)
end