CREATE DATABASE fivem;

CREATE TABLE items (
  item_id int NOT NULL AUTO_INCREMENT,
  display_name VARCHAR(100) NOT NULL DEFAULT 'Unknown',
  type int NOT NULL DEFAULT 1,
  PRIMARY KEY (item_id)
);

CREATE TABLE user_inventory (
  license VARCHAR(100),
  item_id int NOT NULL,
  quantity int NOT NULL DEFAULT 1,
  KEY item_id (item_id),
  CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES items (item_id)
);

INSERT INTO items (display_name, type)
  VALUES ('Cash', 1);

INSERT INTO items (display_name, type)
  VALUES ('AK-47', 2);

INSERT INTO items (display_name, type)
  VALUES ('Carbine', 2);

INSERT INTO items (display_name, type)
  VALUES ('Machete', 2);

INSERT INTO items (display_name, type)
  VALUES ('Test item 1', 2);

INSERT INTO items (display_name, type)
  VALUES ('Test item 2', 2);

INSERT INTO items (display_name, type)
  VALUES ('Test item 3', 2);

INSERT INTO items (display_name, type)
  VALUES ('Test item 4', 2);

INSERT INTO items (display_name, type)
  VALUES ('Test item 5', 2);

-- test item giving
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 1, 50);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 2, 1);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 3, 1);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 4, 1);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 5, 1);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 6, 1);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 7, 1);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 8, 1);
INSERT INTO user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 9, 1);