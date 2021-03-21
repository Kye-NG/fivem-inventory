local menuOpen = false
local currentItems = {}

RegisterNetEvent('inv:getItems')
RegisterNetEvent('inv:updateItems')

AddEventHandler('playerSpawned', function()
  Citizen.CreateThread(function()

    -- Update user items when the player spawns.
    TriggerServerEvent('inv:getItems')

  end)
end)

AddEventHandler('inv:updateItems', function(items)
  currentItems = {}
  currentItems = items

  SendNUIMessage({
    type = 'updateItems',
    items = currentItems
  })
end)

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

      -- Disable the weapon wheel, stats, and saving
      BlockWeaponWheelThisFrame()
      HideHudComponentThisFrame(19)
      HideHudComponentThisFrame(20)
      HideHudComponentThisFrame(17)
      DisableControlAction(0, 37, true)

      if menuOpen then
        HideHudAndRadarThisFrame()

        HideHudComponentThisFrame( 1 ) -- Wanted Stars
        HideHudComponentThisFrame( 2 ) -- Weapon Icon
        HideHudComponentThisFrame( 3 ) -- Cash
        HideHudComponentThisFrame( 4 ) -- MP Cash
        HideHudComponentThisFrame( 6 ) -- Vehicle Name
        HideHudComponentThisFrame( 7 ) -- Area Name
        HideHudComponentThisFrame( 8 ) -- Vehicle Class      
        HideHudComponentThisFrame( 9 ) -- Street Name
        HideHudComponentThisFrame( 13 ) -- Cash Change
      end

      if IsDisabledControlJustReleased(0, 37) and IsInputDisabled(0) then
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
  TriggerEvent('chatMessage', '[inv]', { 29, 233, 182 }, text)
end