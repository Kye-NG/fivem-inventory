CREATE DATABASE fivem;

CREATE TABLE fivem.items (
  item_id int NOT NULL AUTO_INCREMENT,
  display_name VARCHAR(100) NOT NULL DEFAULT 'Unknown',
  type int NOT NULL DEFAULT 1,
  image_url VARCHAR(100) NOT NULL DEFAULT 'unknown.png',
  PRIMARY KEY (item_id)
);

CREATE TABLE fivem.user_inventory (
  license VARCHAR(100),
  item_id int NOT NULL,
  quantity int NOT NULL DEFAULT 1,
  KEY item_id (item_id),
  CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES items (item_id)
);

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Cash', 1, 'cash.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Knuckledusters', 2, 'pistol.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Broken Bottle', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Cavalry Dagger', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Knife', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Machete', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Hatchet', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Hammer', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Crowbar', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Nightstick', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Golf Club', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Baseball Bat', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Stun Gun', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('SNS Pistol', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Vintage Pistol', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Combat Pistol', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Pistol', 2, 'pistol.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('AP Pistol', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Heavy Pistol', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Desert Eagle', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Marksman Pistol', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('MAC-10', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('SMG', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Assault SMG', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Combat PDW', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Machine Pistol', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Gusenberg Sweeper', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('MG', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Combat MG', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Musket', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Sawed Off Shotgun', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Pump Shotgun', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Bullpup Shotgun', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Heavy Shotgun', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Assault Shotgun', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Advanced Rifle', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Bullpup Rifle', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Assault Rifle', 2, 'unknown.png');

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Carbine Rifle', 2, 'unknown.png');


-- test item giving
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 1, 50);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 2, 1);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 3, 1);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 4, 1);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 5, 1);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 6, 1);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 7, 1);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 8, 1);
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 9, 1);