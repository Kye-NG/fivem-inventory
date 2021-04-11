CREATE DATABASE fivem;

CREATE TABLE fivem.items (
  item_id int NOT NULL AUTO_INCREMENT,
  display_name VARCHAR(100) NOT NULL DEFAULT 'Unknown',
  type int NOT NULL DEFAULT 1,
  metadata json DEFAULT NULL,
  image_url VARCHAR(100) NOT NULL DEFAULT 'unknown.png',
  PRIMARY KEY (item_id)
);

CREATE TABLE fivem.user_inventory (
  license VARCHAR(100),
  item_id int NOT NULL,
  quantity int NOT NULL DEFAULT 1,
  item_metadata json DEFAULT NULL,
  KEY item_id (item_id),
  CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES items (item_id)
);

INSERT INTO fivem.items (display_name, type, image_url)
  VALUES ('Cash', 1, 'cash.png');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Knuckledusters', 2, 'unknown.png', '{"hash": "WEAPON_KNUCKLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Broken Bottle', 2, 'WEAPON_BOTTLE.png', '{"hash": "WEAPON_BOTTLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Cavalry Dagger', 2, 'WEAPON_DAGGER.png', '{"hash": "WEAPON_DAGGER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Knife', 2, 'WEAPON_KNIFE.png', '{"hash": "WEAPON_KNIFE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Machete', 2, 'WEAPON_MACHETE.png', '{"hash": "WEAPON_MACHETE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Hatchet', 2, 'unknown.png', '{"hash": "WEAPON_HATCHET"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Hammer', 2, 'WEAPON_HAMMER.png', '{"hash": "WEAPON_HAMMER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Crowbar', 2, 'crowbar.png', '{"hash": "WEAPON_CROWBAR"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Nightstick', 2, 'WEAPON_NIGHTSTICK.png', '{"hash": "WEAPON_NIGHTSTICK"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Golf Club', 2, 'WEAPON_GOLFCLUB.png', '{"hash": "WEAPON_GOLFCLUB"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Baseball Bat', 2, 'WEAPON_BAT.png', '{"hash": "WEAPON_BAT"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Stun Gun', 2, 'WEAPON_STUNGUN.png', '{"hash": "WEAPON_STUNGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('SNS Pistol', 2, 'WEAPON_SNSPISTOL.png', '{"hash": "WEAPON_SNSPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Vintage Pistol', 2, 'unknown.png', '{"hash": "WEAPON_VINTAGEPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Combat Pistol', 2, 'WEAPON_PISTOL.png', '{"hash": "WEAPON_COMBATPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pistol', 2, 'WEAPON_PISTOL.png', '{"hash": "WEAPON_PISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('AP Pistol', 2, 'WEAPON_APPISTOL.png', '{"hash": "WEAPON_APPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Pistol', 2, 'unknown.png', '{"hash": "WEAPON_HEAVYPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Desert Eagle', 2, 'unknown.png', '{"hash": "WEAPON_PISTOL50"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Marksman Pistol', 2, 'unknown.png', '{"hash": "WEAPON_MARKSMANPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('MAC-10', 2, 'WEAPON_MICROSMG.png', '{"hash": "WEAPON_MICROSMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('SMG', 2, 'WEAPON_SMG.png', '{"hash": "WEAPON_SMG "}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Assault SMG', 2, 'WEAPON_ASSAULTSMG.png', '{"hash": "WEAPON_ASSAULTSMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Combat PDW', 2, 'WEAPON_SMG.png', '{"hash": "WEAPON_COMBATPDW"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Machine Pistol', 2, 'WEAPON_MACHINEPISTOL.png', '{"hash": "WEAPON_MACHINEPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Gusenberg Sweeper', 2, 'unknown.png', '{"hash": "WEAPON_COMBATMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('MG', 2, 'unknown.png', '{"hash": "WEAPON_MG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Combat MG', 2, 'WEAPON_COMBATMG.png', '{"hash": "WEAPON_COMBATMG_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Musket', 2, 'unknown.png', '{"hash": "WEAPON_MUSKET"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Sawed Off Shotgun', 2, 'WEAPON_DBSHOTGUN.png', '{"hash": "WEAPON_SAWNOFFSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pump Shotgun', 2, 'WEAPON_PUMPSHOTGUN.png', '{"hash": "WEAPON_PUMPSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Bullpup Shotgun', 2, 'WEAPON_BULLPUPRIFLE.png', '{"hash": "WEAPON_BULLPUPSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Shotgun', 2, 'unknown.png', '{"hash": "WEAPON_HEAVYSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Assault Shotgun', 2, 'WEAPON_ASSAULTSHOTGUN.png', '{"hash": "WEAPON_ASSAULTSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Advanced Rifle', 2, 'unknown.png', '{"hash": "WEAPON_ADVANCEDRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Bullpup Rifle', 2, 'unknown.png', '{"hash": "WEAPON_BULLPUPRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Assault Rifle', 2, 'WEAPON_ASSAULTRIFLE.png', '{"hash": "WEAPON_ASSAULTRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Carbine Rifle', 2, 'WEAPON_CARBINERIFLE.png', '{"hash": "WEAPON_CARBINERIFLE"}');


-- test item giving
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 1, 50);
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 39, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 38, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 37, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 36, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 35, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 34, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 33, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 32, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 31, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 30, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 29, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 28, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 27, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 26, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 25, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 24, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 23, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 22, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 21, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 20, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 19, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 18, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 17, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 16, 1, '{"ammunition": "50"}');
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 15, 1, '{"ammunition": "50"}');
