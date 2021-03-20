CREATE TABLE items (
  item_id int NOT NULL AUTO_INCREMENT,
  display_name VARCHAR(100) NOT NULL DEFAULT 'Unknown',
  type int NOT NULL DEFAULT 1,
  PRIMARY KEY (item_id)
);

CREATE TABLE inventories (
  id int NOT NULL AUTO_INCREMENT,
  license VARCHAR(100),
  items VARCHAR(1000),
  PRIMARY KEY (id)
);

INSERT INTO items (display_name, type)
  VALUES ('Cash', 1);

INSERT INTO items (display_name, type)
  VALUES ('AK-47', 2);

INSERT INTO items (display_name, type)
  VALUES ('Carbine', 2);

INSERT INTO items (display_name, type)
  VALUES ('Machete', 2);