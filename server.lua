RegisterServerEvent('inv:getItems')

local function isempty(s)
  return s == nil or s == ''
end

local items = {}

AddEventHandler('inv:getItems', function(eventParam1, eventParam2)
  items = {}

  local player = source
  local identifiers = GetPlayerIdentifiers(player)
  local license

  for _, v in pairs(identifiers) do
    if string.find(v, 'license') then
      license = v
      break
    end
  end

  MySQL.ready(function ()
    MySQL.Async.fetchAll(
      'SELECT * FROM user_inventory JOIN items ON user_inventory.item_id = items.item_id WHERE license = @license',
      { ['@license'] = license },
      function(resultItems)
        for _, item in ipairs(resultItems) do
          t = { ['name'] = item.display_name, ['quantity'] = item.quantity, ['type'] = item.type }

          table.insert(items, tonumber(item.item_id), t)
        end

        TriggerClientEvent('inv:updateItems', player, items)
      end
    )
  end)
end)







-- -- Join server inventory license check
-- AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
--   deferrals.defer()

--   local player = source
--   local identifiers = GetPlayerIdentifiers(player)
--   local license

--   for _, v in pairs(identifiers) do
--     if string.find(v, 'license') then
--       license = v
--       break
--     end
--   end

--   deferrals.update('Searching for inventory in db')

--   if isempty(license) then
--     setKickReason('Issue with license, contact and admin')
--     CancelEvent()
--   else
--     MySQL.ready(function ()
--       MySQL.Async.fetchAll('SELECT license FROM inventories WHERE license = @license', { ['@license'] = license },
--         function(licenseResult)
--           if not licenseResult[1] then -- Has no license in inventory list
--             MySQL.Async.insert('INSERT INTO inventories (license, items) VALUES (@license, @items)',
--             { ['@license'] = license, ['@items'] = '' },
--             function(insertIdResult)
--               print('Inserted ' .. license .. ' into database')
--               deferrals.done()
--             end)
--           else -- Already has license in inventory list
--             print('already has license in db: ' .. licenseResult[1].license)
--             deferrals.done()
--           end
--         end
--       )
--     end)
--   end

-- end)
