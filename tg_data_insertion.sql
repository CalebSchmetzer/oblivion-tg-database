USE thieves_guild_ledger;

INSERT INTO cities (city_name, population, region)
VALUES ('Imperial City', 194, 'Heartlands'),
       ('Anvil', 68, 'Gold Coast'),
       ('Bravil', 55, 'Nibenay Valley'),
       ('Bruma', 55, 'Jerall Mountains'),
       ('Cheydinhal', 55, 'Nibenay Basin'),
       ('Chorrol', 55, 'Great Forest'),
       ('Leyawiin', 72, 'Blackwood'),
       ('Skingrad', 65, 'West Weald');


INSERT INTO guild_branches (guild_branch_id, guild_branch_name, guild_branch_earnings, city_id)
VALUES ('IPC', 'Imperial City Branch', 76824, 1),
       ('ANV', 'Anvil Branch', 3915, 2),
       ('BRV', 'Bravil Branch', 6600, 3),
       ('BMA', 'Bruma Branch', 3060, 4),
       ('CHY', 'Cheydinhal Branch', 2700, 5),
       ('CHO', 'Chorrol Branch', 3240, 6),
       ('LEY', 'Leyawiin Branch', 3600, 7),
       ('SKG', 'Skingrad Branch', 1355, 8);
       
       
INSERT INTO guild_members (guild_mbr_name, guild_rank, guild_branch_id)
VALUES ('Corvus', 'Gray Fox', 'ANV'),
       ('Orrin', 'Shadowfoot', 'ANV'),
       ('Dro''shanji', 'Prowler', 'BRV'),
       ('Luciana', 'Cat Burglar', 'BRV'),
       ('S''Krivva', 'Shadowfoot', 'BRV'),
       ('Varon', 'Pickpocket', 'BRV'),
       ('Helvius', 'Bandit', 'BMA'),
       ('Ongar', 'Bandit', 'BMA'),
       ('Ra''qanar', 'Bandit', 'CHY'),
       ('Glistel', 'Prowler', 'CHO'),
       ('Malintus', 'Cat Burglar', 'CHO'),
       ('Ancus', 'Prowler', 'IPC'),
       ('Amusei', 'Pickpocket', 'IPC'),
       ('Armand', 'Cat Burglar', 'IPC'),
       ('Carwen', 'Footpad', 'IPC'),
       ('Dynari', 'Prowler', 'IPC'),
       ('Dovyn', 'Cat Burglar', 'IPC'),
       ('Fathis', 'Master Thief', 'IPC'),
       ('Hillod', 'Pickpocket', 'IPC'),
       ('Isleif', 'Footpad', 'IPC'),
       ('Jair', 'Footpad', 'IPC'),
       ('J''baana', 'Master Thief', 'IPC'),
       ('Mandil', 'Bandit', 'IPC'),
       ('Methredhel', 'Pickpocket', 'IPC'),
       ('Myvryna', 'Bandit', 'IPC'),
       ('Othrelos', 'Shadowfoot', 'IPC'),
       ('Ahdarji', 'Pickpocket', 'LEY'),
       ('Dar', 'Prowler', 'LEY'),
       ('Reman', 'Bandit', 'SKG');	
       
       
UPDATE guild_branches
SET guild_branch_leader = 113  
WHERE guild_branch_id = 'IPC';

UPDATE guild_branches
SET guild_branch_leader = 100  
WHERE guild_branch_id = 'ANV';

UPDATE guild_branches
SET guild_branch_leader = 104 
WHERE guild_branch_id = 'BRV';

UPDATE guild_branches
SET guild_branch_leader = 106  
WHERE guild_branch_id = 'BMA';

UPDATE guild_branches
SET guild_branch_leader = 108  
WHERE guild_branch_id = 'CHY';

UPDATE guild_branches
SET guild_branch_leader = 110 
WHERE guild_branch_id = 'CHO';

UPDATE guild_branches
SET guild_branch_leader = 127  
WHERE guild_branch_id = 'LEY';

UPDATE guild_branches
SET guild_branch_leader = 128  
WHERE guild_branch_id = 'SKG';


INSERT INTO guild_fences (guild_mbr_id, guild_branch_id, skill_level, income)
VALUES (107, 'BMA', 'Journeyman', 600),
       (127, 'LEY', 'Journeyman', 800),
       (103, 'BRV', 'Expert', 1000),
       (101, 'ANV', 'Expert', 1200),
       (117, 'IPC', 'Master', 1500);


INSERT INTO guild_doyens (guild_mbr_id, guild_branch_id, job_level)
VALUES (113, 'IPC', 'Low'),
       (104, 'BRV', 'Medium'),
       (100, 'ANV', 'High');
       

INSERT INTO guild_adversaries (adversary_name, threat_level, city_id, details)
VALUES ('Hieronymus', 'High', 1, 'Watch Captain'),
       ('Myvryna', 'Medium', 1, 'Traitor'),
       ('Jakben', 'Low', 1, 'Vampire'),
       ('Aren', 'Low', 3, 'Crazed Mage'),
       ('Alessia', 'High', 7, 'Countess'),
       ('Marius', 'Medium', 7, 'Count'),
       ('Pale Lady', 'Medium', 8, 'Vampire');
       
       
INSERT INTO businesses (business_name, owner_name, merchandise, income, city_id, guild_affiliated)
VALUES ('A Fighting Chance', 'Rohssan', 'Blacksmith', 1200, 1, FALSE),
       ('Divine Elegance', 'Palonirya', 'Clothing', 1200, 1, FALSE),
       ('First Edition', 'Phintias', 'Books', 1200, 1, FALSE),
       ('Jensine''s Good As New Merchandise', 'Jensine', 'General Goods', 600, 1, FALSE),
       ('Mystic Emporium', 'Aurelinwae', 'Magical Supplies', 3000, 1, FALSE),
       ('Red Diamond Jewelry', 'Hamlof', 'Jewelry', 800, 1, FALSE),
       ('Rindir''s Staffs', 'Rindir', 'Magical Supplies', 600, 1, FALSE),
       ('Stonewall Shields', 'Viator', 'Blacksmith', 1000, 1, FALSE),
       ('The Best Defense', 'Varnado', 'Blacksmith', 1800, 1, FALSE),
       ('The Copius Coinpurse', 'Thoronir', 'General Goods', 800, 1, FALSE),
       ('The Feed Bag', 'Delos', 'Food', 500, 1, FALSE),
       ('The Gilded Carafe', 'Claudette', 'Alchemy', 1200, 1, FALSE),
       ('The Main Ingredient', 'Ogier', 'Alchemy', 800, 1, FALSE),
       ('The Merchants Inn', 'Velus', 'Inn Services', 700, 1, FALSE),
       ('Slash ''N Smash', 'Urbul', 'Blacksmith', 800, 1, FALSE),
       ('Three Brothers Trade Goods', 'Tertullian', 'General Goods', 2000, 1, FALSE),
       ('Tiber Septim Hotel', 'Augusta', 'Inn Services', 900, 1, FALSE),
       ('The Foaming Flask', 'Ernest', 'Food', 500, 1, FALSE),
       ('The King and Queen Tavern', 'Ley', 'Inn Services', 600, 1, FALSE),
       ('Luther Broad''s Boarding House', 'Luther', 'Inn Services', 600, 1, FALSE),
       ('The Bloated Float', 'Ormil', 'Inn Services', 600, 1, FALSE),
       ('The All-Saints Inn', 'Willet', 'Inn Services', 650, 1, FALSE),
       ('Lelles'' Quality Merchandise', 'Norbert', 'General Goods', 800, 2, FALSE),
       ('Morvayn''s Peacemakers', 'Varel', 'Blacksmith', 1200, 2, FALSE),
       ('The Count''s Arms', 'Wilbur', 'Inn Services', 750, 2, FALSE),
       ('The Flowing Bowl', 'Maenlorn', 'Inn Services', 600, 2, FALSE),
       ('A Warlock''s Luck', 'Ungarion', 'Magical Supplies', 800, 3, FALSE),
       ('The Archer''s Paradox', 'Daenlin', 'Blacksmith', 1000, 3, FALSE),
       ('The Fair Deal', 'Nilawen', 'General Goods', 800, 3, FALSE),
       ('The Lonely Suitor Lodge', 'Bogrum', 'Inn Services', 600, 3, TRUE),
       ('Silverhome on the Water', 'Gilgondorin', 'Inn Services', 700, 3, FALSE),
       ('Hammer and Axe', 'Fjotreid', 'Blacksmith', 800, 4, FALSE),
       ('Jerall View Inn', 'Hafid', 'Inn Services', 750, 4, FALSE),
       ('Novaroma', 'Karinnarre', 'General Goods', 1600, 4, FALSE),
       ('Nord Winds', 'Olfand', 'Blacksmith', 2000, 4, FALSE),
       ('Olav''s Tap and Tack', 'Olav', 'Inn Services', 600, 4, TRUE),
       ('Borba''s Goods and Stores', 'Borba', 'General Goods', 1000, 5, FALSE),
       ('Cheydinal Bridge Inn', 'Mariana', 'Inn Services', 900, 5, FALSE),
       ('Mach-Na''s Books', 'Mach-Na', 'Books', 1200, 5, FALSE),
       ('Newlands Lodge', 'Dervera', 'Inn Services', 600, 5, FALSE),
       ('The March Rider', 'Tertia', 'Blacksmith', 1000, 5, FALSE),
       ('Fire and Steel', 'Rasheda', 'Blacksmith', 1200, 6, FALSE),
       ('Northern Goods and Trade', 'Seed-Neeus', 'General Goods', 800, 6, FALSE),
       ('Renoit''s Books', 'Estelle', 'Books', 600, 6, FALSE),
       ('The Grey Mare', 'Emfrid', 'Inn Services', 600, 6, FALSE),
       ('The Oak and Crosier', 'Talasma', 'Inn Services', 600, 6, TRUE),
       ('Southern Books', 'Bugak', 'Books', 1000, 7, FALSE),
       ('Five Claws Lodge', 'Witseidutsei', 'Inn Services', 600, 7, TRUE),
       ('Best Goods and Guarantees', 'Gundalas', 'General Goods', 2000, 7, FALSE),
       ('Three Sisters'' Inn', 'Shuravi', 'Inn Services', 900, 7, FALSE),
       ('The Dividing Line', 'Tun-Zeeus', 'Blacksmith', 800, 7, FALSE),
       ('Hammer and Tongs', 'Agnete', 'Blacksmith', 1200, 8, FALSE),
       ('West Weald Inn', 'Erina', 'Inn Services', 700, 8, FALSE),
       ('All Things Alchemical', 'Falanu', 'Alchemy', 800, 8, FALSE),
       ('Colovian Traders', 'Gunder', 'General Goods', 800, 8, FALSE),
       ('Two Sisters Lodge', 'Mog', 'Inn Services', 600, 8, FALSE);


INSERT INTO trade_routes (route_name, profitability)
VALUES ('Black Road', 'High'),
       ('Blue Road', 'Medium'),
       ('Gold Road', 'High'),
       ('Green Road', 'High'),
       ('Orange Road', 'Low'),
       ('Silver Road', 'Medium'),
       ('Yellow Road', 'Medium');
       
       
INSERT INTO trade_route_cities (route_id, city_id)
VALUES (400, 1),
       (400, 6),
       (401, 1),
       (401, 5),
       (402, 1),
       (402, 2),
       (402, 8),
       (403, 1),
       (403, 3),
       (403, 7),
       (404, 6),
       (404, 4),
       (405, 1),
       (405, 4),
       (406, 1),
       (406, 7);
