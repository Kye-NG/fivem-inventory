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

const mainInventories = {};

// Create the connection pool. The pool-specific settings are the defaults
const pool = mysql.createPool(config);

onNet('inv:getItems', () => {
  getItems(source);
});

// For testing, do not let the client give item.
onNet('inv:giveItem', (itemId, metadata) => {
  giveItem(source, itemId, metadata);
});

onNet('inv:clearInventory', () => {
  clearInventory(source);
});

function getItems(source) {
  const player = source;
  const license = GetPlayerIdentifier(player, 1);

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
    mainInventories[license] = results;

    emitNet('inv:updateItems', player, results);
  });
}

function giveItem(source, itemId, metadata) {
  const player = source;
  const license = GetPlayerIdentifier(player, 1);

  pool.execute(`
    INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata)
      VALUES (?, ?, 1, ?);
  `,
  [license, itemId, JSON.stringify({ ammunition: 100 })],
  (err, results, fields) => {
    getItems(player);
  });
}

function clearInventory(source) {
  const player = source;
  const license = GetPlayerIdentifier(player, 1);

  pool.execute(`
    DELETE FROM fivem.user_inventory
      WHERE license = ?
  `,
  [license],
  (err, results, fields) => {
    getItems(player);
  });
}

RegisterCommand('give', (source, args, raw) => {
  giveItem(source, parseInt(args[0]), {})
}, false);