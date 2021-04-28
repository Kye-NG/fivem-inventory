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

// Create the connection pool. The pool-specific settings are the defaults
const pool = mysql.createPool(config);

onNet('inv:getItems', () => {
  const player = source;
  const license = GetPlayerIdentifier(player, 1);

  pool.execute(`
    SELECT 
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
    emitNet('inv:updateItems', player, results);
  });
});


