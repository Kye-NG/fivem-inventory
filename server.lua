local function isempty(s)
  return s == nil or s == ''
end

function Split(s, delimiter)
  result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
      table.insert(result, match);
  end
  return result;
end

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
  deferrals.defer()

  local player = source
  local identifiers = GetPlayerIdentifiers(player)
  local license

  for _, v in pairs(identifiers) do
    if string.find(v, "license") then
      license = v
      break
    end
  end

  deferrals.update('Searching for inventory in db')

  if isempty(license) then
    setKickReason('Issue with license, contact and admin')
    CancelEvent()
  else
    MySQL.ready(function ()
      MySQL.Async.fetchAll('SELECT license FROM inventories WHERE license = @license', { ['@license'] = license },
        function(licenseResult)
          if not licenseResult[1] then -- Has no license in inventory list
            MySQL.Async.insert('INSERT INTO inventories (license, items) VALUES (@license, @items)',
            { ['@license'] = license, ['@items'] = '' },
            function(insertIdResult)
              print('Inserted ' .. license .. ' into database')
              deferrals.done()
            end)
          else -- Already has license in inventory list
            print('already has license in db: ' .. licenseResult[1].license)
            deferrals.done()
          end
        end
      )
    end)
  end

end)
