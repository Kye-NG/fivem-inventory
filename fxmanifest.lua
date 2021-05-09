-- Manifest data
fx_version 'cerulean'
games {'gta5'}

-- Resource stuff
name 'fivem-inventory'
description 'Adds an inventory to your server'
version 'v0.0.1'
author 'Kye Norman-Gill'

-- Leave this set to '0' to prevent compatibility issues 
-- and to keep the save files your users.
-- experimental_features_enabled '0'

ui_page 'html/index.html'

client_scripts {
  -- 'client.lua',
  'client/client.js'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/server.js'
}

files {
  'html/index.html',
  'html/css/style.css',
  'html/js/index.js',
  'html/images/*'
}