const axios = require('axios');
const mysql = require('mysql2');
const config = {
  "host": "localhost",
  "user": "fivem_admin",
  "database": "fivem",
  "waitForConnections": true,
  "connectionLimit": 10,
  "queueLimit": 0,
  "password": "fivem_admin_password_123"
};

// Test webhook url.
const webhookUrl = 'https://discord.com/api/webhooks/840201448830271528/UafoU43hSjpKJ3onVVTfvUkcilyPMu8OzCN5qrJhAroCbkkCyy4blsV2ncriN1-ZZf9C';

// Create the connection pool.
const pool = mysql.createPool(config);

const inventoryMaster = {};

/*
 * To:Do
 * - Add inventory locations to metadata.
 * - Add destroying of items.
 * - Add trading for items (to be used in crafting etc.)
 * - Add exports for has_item, has_items, trade_items, give item, etc.
 * - Add a way to keep users inven in memory until save, then remove, when they leave.
 * - Sync all players if script is restarted. Instead of on join.
 */

// Server events.
on('playerDropped', playerLeft);
on('playerJoining', playerJoined);

// Client events.
onNet('inv:getItems', getItems);
// For testing, do not let the client give item. also fix the arrow function uglyness.
onNet('inv:giveItem', (itemId, metadata) => {giveItem(source, itemId, metadata)});
onNet('inv:clearInventory', () => {clearInventory(source)});



// ----- Functions --------------------------------------------------------------------

async function playerJoined() {
  const player = source;
  const license = getLicense(player);
  const time = Date.now();

  // Set their inventory to memory;
  inventoryMaster[license] = await intialiseItems(license).catch(e => {
    sendWH(`Error with initialising items.\n\n${e}`);
  });

  // Joined server notification webhook.
  sendWH(`Player ${GetPlayerName(player)} joined! Inv Sync took \`${Date.now() - time}\`ms`);
}

function playerLeft(reason) {
  const player = source;
  const license = getLicense(player);

  // Needs to be updated so if they leave before update they dont lose their progress.
  delete inventoryMaster[license];

  sendWH(`Player ${GetPlayerName(player)} left\n\n**Reason**: ${reason}`);
}

// Grab their inventory.
function intialiseItems(license) {
  return new Promise((resolve, reject) => {
    pool.execute(`
      SELECT
        a.item_id AS item_id,
        a.quantity AS quantity,
        a.item_metadata AS item_metadata,
        b.type AS type,
        b.display_name AS display_name,
        b.image_url AS image_url,
        b.metadata AS metadata
      FROM user_inventory AS a
        JOIN items AS b ON a.item_id = b.item_id
      WHERE license = ?
    `,
    [license],
    (err, results, fields) => {
      if (err) {
        reject(err);
      } else {
        resolve(results);
      }
    });
  });
}

// Send the items to the client from memory.
function getItems() {
  const player = source;
  const license = getLicense(player);

  emitNet('inv:updateItems', player, inventoryMaster[license]);
}

function giveItem(source, itemId) {
  const player = source;
  const license = getLicense(player);
  const time = Date.now();

  // Setup dummy item.
  const item = {
    item_id: itemId,
    quantity: 1,
    item_metadata: {}
  }

  // Get the item definition from the db.
  pool.execute(`
    SELECT
      type,
      display_name,
      image_url,
      metadata
    FROM fivem.items
      WHERE item_id = ?
  `, [itemId], (err, res) => {
    if (err) {
      sendWH(`Item Definition Error: ${err}`);
    } else {
      // Setup the item :|

      item.type = res[0].type;
      item.display_name = res[0].display_name;
      item.image_url = res[0].image_url;
      item.metadata = res[0].metadata;

      if (item.type === 2) {
        item.item_metadata.ammunition = 250;
      }

      // Stringify itself to match how the db stores it.
      item.item_metadata = JSON.stringify(item.item_metadata);

      // Add item to the in memory inventory store.
      inventoryMaster[license].push(item);

      // Update the items.
      getItems(player);

      sendWH(`Item definition request took \`${Date.now() - time}\`ms`);
    }
  });
}

function clearInventory(source) {
  const player = source;
  const license = getLicense(player);

  // Needs to be updated so if they leave before update they dont lose their progress.
  inventoryMaster[license] = [];
}

// For testing.
function sendWH(content) {
  if (webhookUrl) {
    axios.post(webhookUrl, { content }).catch(e => {
      console.log(e);
    });
  }
}

function getLicense(player) {
  let foundLicense = false;
  let counter = 0;

  while (!foundLicense) {

    const ident = GetPlayerIdentifier(player, counter);

    if (ident.startsWith('license:')) {
      foundLicense = true;

      return ident;
    }

    counter++;
  }
}


// ----- Interval Save --------------------------------------------------------------------

// Timed updates.
setInterval(() => {
  const time = Date.now();

  const allLicenses = Object.keys(inventoryMaster).map(e => {
    return `\"${e}\"`
  });

  if (allLicenses.length) {
    const deleteSQL = `
      DELETE FROM fivem.user_inventory
        WHERE license = ${allLicenses.join(' OR license = ')};
    `;

    pool.execute(deleteSQL, (err) => {
      if (err) {
        sendWH(`Error deleting invs in update: ${err}`)
      } else {
        const insertSQL = `
          INSERT INTO fivem.user_inventory (license, item_id, quantity, item_metadata)
            VALUES ?
        `;

        const invArray = [];

        for (const [license, value] of Object.entries(inventoryMaster)) {
          if (!value.length) { continue; }

          let tempArray = [];

          for (let i = 0; i < value.length; i++) {
            tempArray.push(license);
            tempArray.push(value[i].item_id);
            tempArray.push(value[i].quantity);
            tempArray.push(value[i].item_metadata);

            invArray.push(tempArray);

            tempArray = [];
          }
        }

        // If theres nothing in inventories, dont bother.
        if (!invArray.length) { return; }

        pool.query(insertSQL, [invArray], (err) => {
          if (err) {
            sendWH(`Err inserting DB:\n\n ${err}`)
          } else {
            sendWH(`Successfully updated inventory in \`${Date.now() - time}\`ms`);
          }
        });
      }
    });
  }
}, 1000 * 60 * 5); // 5 minutes



// ----- Commands --------------------------------------------------------------------

// To be removed and made into an export.
RegisterCommand('give', (source, args, raw) => {
  giveItem(source, parseInt(args[0]))
}, false);