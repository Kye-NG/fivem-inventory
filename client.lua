local function isempty(s)
  return s == nil or s == ''
end

local menuOpen = false
local itemLayout = {}

RegisterNetEvent('inv:getItems')
RegisterNetEvent('inv:updateItems')

AddEventHandler('playerSpawned', function()
  Citizen.CreateThread(function()

    -- Update user items when the player spawns.
    TriggerServerEvent('inv:getItems')

  end)
end)

AddEventHandler('inv:updateItems', function(items)
  itemLayout = {}
  itemLayout = items

  SendNUIMessage({
    type = 'updateItems',
    items = itemLayout
  })
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

      DisableControlAction(0, 157, true)
      DisableControlAction(0, 158, true)
      DisableControlAction(0, 160, true)
      DisableControlAction(0, 164, true)
      DisableControlAction(0, 165, true)
      DisableControlAction(0, 159, true)
      DisableControlAction(0, 161, true)

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

        DisableControlAction(0, 1, menuOpen) -- LookLeftRight
        DisableControlAction(0, 2, menuOpen) -- LookUpDown
        DisableControlAction(0, 142, menuOpen) -- MeleeAttackAlternate
        DisableControlAction(0, 18, menuOpen) -- Enter
        DisableControlAction(0, 322, menuOpen) -- ESC
        DisableControlAction(0, 106, menuOpen) -- VehicleMouseControlOverride
      end

      if IsDisabledControlJustReleased(0, 37) and IsInputDisabled(0) then
        toggleInventory()
      end

      if IsDisabledControlJustReleased(0, 157) and not menuOpen then
        UseItem(1)
      elseif IsDisabledControlJustReleased(0, 158) and not menuOpen then
        UseItem(2)
      elseif IsDisabledControlJustReleased(0, 160) and not menuOpen then
        UseItem(3)
      elseif IsDisabledControlJustReleased(0, 164) and not menuOpen then
        UseItem(4)
      elseif IsDisabledControlJustReleased(0, 165) and not menuOpen then
        UseItem(5)
      elseif IsDisabledControlJustReleased(0, 159) and not menuOpen then
        UseItem(6)
      elseif IsDisabledControlJustReleased(0, 161) and not menuOpen then
        UseItem(7)
      end
    end
  end
)

function UseItem(number)
  local itemSelected = itemLayout[28 + number]

  if not isempty(itemSelected) then
    print(json.encode(itemSelected))

    if itemSelected.type == 1 then
      print('Useless type 1 item')
    elseif itemSelected.type == 2 then
      local pedId = PlayerPedId()
      local metadata = json.decode(itemSelected.metadata)

      if HasPedGotWeapon(pedId, metadata.weapon_hash) then
        RemoveWeaponFromPed(pedId, metadata.weapon_hash, false)

        SetPedAmmo(pedId, weaponHash, 0)
      else
        local weaponHash = GetHashKey(metadata.weapon_hash)
  
        GiveWeaponToPed(pedId, weaponHash, 10, false, true)
      end
    end

  end
end

RegisterNUICallback('exit', function(data, cb)
  toggleInventory()

  cb('ok')
end)

RegisterNUICallback('move_item', function(data, cb)
  local fromIndex = (data.from[2] + 1) + (data.from[1] * 7)
  local toIndex = (data.to[2] + 1) + (data.to[1] * 7)

  local tempItem = itemLayout[fromIndex]
  itemLayout[fromIndex] = itemLayout[toIndex]
  itemLayout[toIndex] = tempItem

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

