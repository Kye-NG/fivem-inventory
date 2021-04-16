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
  VALUES ('Knife', 2, 'knife.png', '{"hash": "WEAPON_KNIFE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Knuckledusters', 2, 'knuckle.png', '{"hash": "WEAPON_KNUCKLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Nightstick', 2, 'nightstick.png', '{"hash": "WEAPON_NIGHTSTICK"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Hammer', 2, 'hammer.png', '{"hash": "WEAPON_HAMMER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Baseball Bat', 2, 'bat.png', '{"hash": "WEAPON_BAT"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Golf Club', 2, 'golfclub.png', '{"hash": "WEAPON_GOLFCLUB"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Crowbar', 2, 'crowbar.png', '{"hash": "WEAPON_CROWBAR"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Broken Bottle', 2, 'bottle.png', '{"hash": "WEAPON_BOTTLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Cavalry Dagger', 2, 'dagger.png', '{"hash": "WEAPON_DAGGER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Hatchet', 2, 'hatchet.png', '{"hash": "WEAPON_HATCHET"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Machete', 2, 'machete.png', '{"hash": "WEAPON_MACHETE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Flashlight', 2, 'flashlight.png', '{"hash": "WEAPON_FLASHLIGHT"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Switchblade', 2, 'switchblade.png', '{"hash": "WEAPON_SWITCHBLADE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Proxmine', 2, 'proxmine.png', '{"hash": "WEAPON_PROXMINE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('BZGas', 2, 'bzgas.png', '{"hash": "WEAPON_BZGAS"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Smoke Grenade', 2, 'smokegrenade.png', '{"hash": "WEAPON_SMOKEGRENADE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Molotov', 2, 'molotov.png', '{"hash": "WEAPON_MOLOTOV"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Petrol Can', 2, 'petrolcan.png', '{"hash": "WEAPON_PETROLCAN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Flare', 2, 'flare.png', '{"hash": "WEAPON_FLARE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Baseball', 2, 'ball.png', '{"hash": "WEAPON_BALL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pool Cue', 2, 'poolcue.png', '{"hash": "WEAPON_POOLCUE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pipe Wrench', 2, 'wrench.png', '{"hash": "WEAPON_PIPEWRENCH"}');


-- Guns

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Revolver', 2, 'revolver.png', '{"hash": "WEAPON_REVOLVER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Revolver Mk2', 2, 'revolver_mk2.png', '{"hash": "WEAPON_REVOLVER_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pistol', 2, 'pistol.png', '{"hash": "WEAPON_PISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pistol Mk2', 2, 'pistol_mk2.png', '{"hash": "WEAPON_PISTOL_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Double Action', 2, 'doubleaction.png', '{"hash": "WEAPON_DOUBLEACTION"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Combat Pistol', 2, 'combatpistol.png', '{"hash": "WEAPON_COMBATPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('AP Pistol', 2, 'appistol.png', '{"hash": "WEAPON_APPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Desert Eagle', 2, 'pistol50.png', '{"hash": "WEAPON_PISTOL50"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('SNS Pistol', 2, 'snspistol.png', '{"hash": "WEAPON_SNSPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('SNS Pistol Mk2', 2, 'snspistol_mk2.png', '{"hash": "WEAPON_SNSPISTOL_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Pistol', 2, 'heavypistol.png', '{"hash": "WEAPON_HEAVYPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Vintage Pistol', 2, 'vintagepistol.png', '{"hash": "WEAPON_VINTAGEPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Stun Gun', 2, 'stungun.png', '{"hash": "WEAPON_STUNGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Flare Gun', 2, 'flaregun.png', '{"hash": "WEAPON_FLAREGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Marksman Pistol', 2, 'marksmanpistol.png', '{"hash": "WEAPON_MARKSMANPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('MAC-10', 2, 'microsmg.png', '{"hash": "WEAPON_MICROSMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Mini SMG', 2, 'minismg.png', '{"hash": "WEAPON_MINISMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('SMG', 2, 'smg.png', '{"hash": "WEAPON_SMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('SMG Mk2', 2, 'smg_mk2.png', '{"hash": "WEAPON_SMG_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Assault SMG', 2, 'assaultsmg.png', '{"hash": "WEAPON_ASSAULTSMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('MG', 2, 'mg.png', '{"hash": "WEAPON_MG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Combat MG', 2, 'combatmg.png', '{"hash": "WEAPON_COMBATMG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Combat MG Mk2', 2, 'combatmg_mk2.png', '{"hash": "WEAPON_COMBATMG_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Combat PDW', 2, 'combatpdw.png', '{"hash": "WEAPON_COMBATPDW"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Gusenberg Sweeper', 2, 'gusenberg.png', '{"hash": "WEAPON_GUSENBERG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Machine Pistol', 2, 'machinepistol.png', '{"hash": "WEAPON_MACHINEPISTOL"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Assault Rifle', 2, 'assaultrifle.png', '{"hash": "WEAPON_ASSAULTRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Assault Rifle Mk2', 2, 'assaultrifle_mk2.png', '{"hash": "WEAPON_ASSAULTRIFLE_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Carbine Rifle', 2, 'carbinerifle.png', '{"hash": "WEAPON_CARBINERIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Carbine Rifle Mk2', 2, 'carbinerifle_mk2.png', '{"hash": "WEAPON_CARBINERIFLE_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Advanced Rifle', 2, 'advancedrifle.png', '{"hash": "WEAPON_ADVANCEDRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Special Carbine', 2, 'specialcarbine.png', '{"hash": "WEAPON_SPECIALCARBINE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Special Carbine Mk2', 2, 'specialcarbine_mk2.png', '{"hash": "WEAPON_SPECIALCARBINE_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Bullpup Rifle', 2, 'bullpuprifle.png', '{"hash": "WEAPON_BULLPUPRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Bullpup Rifle Mk2', 2, 'bullpuprifle_mk2.png', '{"hash": "WEAPON_BULLPUPRIFLE_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Compact Rifle', 2, 'compactrifle.png', '{"hash": "WEAPON_COMPACTRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pump Shotgun', 2, 'pumpshotgun.png', '{"hash": "WEAPON_PUMPSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Pump Shotgun Mk2', 2, 'pumpshotgun_mk2.png', '{"hash": "WEAPON_PUMPSHOTGUN_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Sawed Off Shotgun', 2, 'sawnoffshotgun.png', '{"hash": "WEAPON_SAWNOFFSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Bullpup Shotgun', 2, 'bullpupshotgun.png', '{"hash": "WEAPON_BULLPUPSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Assault Shotgun', 2, 'assaultshotgun.png', '{"hash": "WEAPON_ASSAULTSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Musket', 2, 'musket.png', '{"hash": "WEAPON_MUSKET"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Shotgun', 2, 'heavyshotgun.png', '{"hash": "WEAPON_HEAVYSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('DB Shotgun', 2, 'dbshotgun.png', '{"hash": "WEAPON_DBSHOTGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Sniper Rifle', 2, 'sniperrifle.png', '{"hash": "WEAPON_SNIPERRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Sniper', 2, 'heavysniper.png', '{"hash": "WEAPON_HEAVYSNIPER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Heavy Sniper Mk2', 2, 'heavysniper_mk2.png', '{"hash": "WEAPON_HEAVYSNIPER_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Marksman Rifle', 2, 'marksmanrifle.png', '{"hash": "WEAPON_MARKSMANRIFLE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Marksman Rifle Mk2', 2, 'marksmanrifle_mk2.png', '{"hash": "WEAPON_MARKSMANRIFLE_MK2"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Grenade Launcher', 2, 'grenadelauncher.png', '{"hash": "WEAPON_GRENADELAUNCHER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('RPG', 2, 'rpg.png', '{"hash": "WEAPON_RPG"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Minigun', 2, 'minigun.png', '{"hash": "WEAPON_MINIGUN"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Firework Launcher', 2, 'firework.png', '{"hash": "WEAPON_FIREWORK"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Grenade', 2, 'grenade.png', '{"hash": "WEAPON_GRENADE"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Compact Launcher', 2, 'compactlauncher.png', '{"hash": "WEAPON_COMPACTLAUNCHER"}');

INSERT INTO fivem.items (display_name, type, image_url, metadata)
  VALUES ('Compact Launcher', 2, 'compactlauncher.png', '{"hash": "WEAPON_COMPACTLAUNCHER"}');

-- test item giving
INSERT INTO fivem.user_inventory(license, item_id, quantity) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 1, 50);
INSERT INTO fivem.user_inventory(license, item_id, quantity, item_metadata) VALUES ('license:8c60b253d34fd38cada69c4b1daf93debf01030a', 3, 1, '{"ammunition": "50"}');
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
