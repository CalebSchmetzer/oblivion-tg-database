# Oblivion Thieves Guild Ledger Database

## Project Documentation

**Disclaimer**: This is a fan-made project and is not affiliated with or endorsed by Bethesda Game Studios. It is intended solely for personal and non-commercial purposes. All rights to the original content belong to their respective owners.

### Purpose:
This project is a fictional ledger for the Thieves Guild faction from *The Elder Scrolls IV: Oblivion* that stores information about guild activities, members, and dynamics. Additionally, the database also contains more information such as the cities, businesses, and trade routes around the in-game world of Cyrodiil. The purpose is to get a hands-on understanding of database design and querying using MySQL.


### Database Schema:
The database is composed of nine tables, each representing either an aspect of the guild (e.g. members, enemies, etc.) or the surrounding world (e.g. cities).

#### Table Overview:

- **cities**: Stores key information about the major in-game cities, such as name and population.
- **guild_branches**: Stores information about the branches of the Thieves Guild. By default there is one branch per major city.
- **guild_members**: Contains information about all the guild members, such as name and rank.
- **guild_fences**: Identifies guild members who are fences and details additional information about them such as skill level. (These are the characters who act as guild merchants in-game).
- **guild_doyens**: Identifies guild members who are doyens and details additional information about them. (These are the characters who act as guild quest givers in-game).
- **guild_adversaries**: Tracks enemies of the guild and key details about them.
- **businesses**: Contains information about all of the major businesses throughout Cyrodiil, such as business name, merchandise, and income.
- **trade_routes**: Stores trade routes throughout the game world.
- **trade_route_cities**: Functions as a bridge table to keep track of which cities the trade routes pass through.

---

> **Note**: Much of the data used to populate the tables was acquired from [UESP](https://en.uesp.net/) and [Fandom](https://elderscrolls.fandom.com/).
#### Table Key
**■ = Primary Key**  
**● = Foreign Key**

## **cities Table**

| city_id ■ | city_name       | population | region          |
|-----------|-----------------|------------|-----------------|
| 1         | Imperial City   | 194        | Heartlands      |
| 2         | Anvil           | 68         | Gold Coast     |
| 3         | Bravil          | 55         | Nibenay Valley |
| 4         | Bruma           | 51         | Jerall Mountains|
| 5         | Cheydinhal      | 57         | Nibenay Basin  |
| ...       | ...             | ...        | ...             |

- **city_id**: Auto-incrementing primary key that acts as a unique identifier for the city.
- **city_name**: Unique string value holding the name of the city.
- **population**: The city's population, acquired by counting the number of NPCs in each city.
- **region**: The geographic region of the city.

---

## **guild_branches Table**

| guild_branch_id ■ | branch_name        | guild_branch_leader ● | guild_branch_earnings | city_id ● |
|-------------------|--------------------|-----------------------|-----------------------|-----------|
| IPC               | Imperial City Branch| 113                   | 76824                 | 1         |
| ANV               | Anvil Branch        | 100                   | 3915                  | 2         |
| BRV               | Bravil Branch       | 104                   | 6600                  | 3         |
| BMA               | Bruma Branch        | 106                   | 3060                  | 4         |
| CHY               | Cheydinhal Branch   | 108                   | 2700                  | 5         |
| ...               | ...                | ...                   | ...                   | ...       |

- **guild_branch_id**: Primary key consisting of three characters. Unique identifier for the branch.
- **guild_branch_name**: The name of the guild branch.
- **guild_branch_leader**: Foreign key which references the upcoming guild_members table, representing the leader of the branch via their guild member id.
- **guild_branch_earnings**: Estimation of the guild branch's earnings, calculated via the following formula: 
    - `# branch members * # of businesses inside branch's city * 6/5 (if branch contains an active fence) * 6/5 (if branch contains an active doyen) * 5/6 (if branch's city contains one or more adversaries) * 5 (for all branches except the one based in Imperial City)`
- **city_id**: Foreign key which references the cities table. The city which the branch is based in.

---

## **guild_members Table**

| guild_mbr_id ■ | guild_mbr_name | guild_rank    | guild_branch_id ● |
|----------------|----------------|---------------|-------------------|
| 100            | Corvus         | Gray Fox     | ANV               |
| 101            | Orrin          | Shadowfoot   | ANV               |
| 102            | Dro'shanji     | Prowler      | BRV               |
| 103            | Luciana        | Cat Burglar  | BRV               |
| 104            | S'Krivva       | Shadowfoot   | BRV               |
| ...            | ...            | ...           | ...               |

- **guild_mbr_id**: Primary key which serves as a unique identifier for every member of the guild. Auto-incremented starting at 100.
- **guild_mbr_name**: The name of the guild member.
- **guild_mbr_rank**: The rank of the guild member, acquired by checking the in-game rank of the character.
- **guild_branch_id**: Foreign key which references the guild_branch table. Identifies which branch the guild member works for.

---

## **guild_fences Table**

| guild_mbr_id ■● | guild_branch_id ■● | skill_level  | income |
|-----------------|--------------------|--------------|--------|
| 107             | BMA                | Journeyman   | 600    |
| 127             | LEY                | Journeyman   | 800    |
| 103             | BRV                | Expert       | 1000   |
| 101             | ANV                | Expert       | 1200   |
| 117             | IPC                | Master       | 1500   |

- **guild_mbr_id**: Foreign key which references the guild_members table to identify the guild member who is a fence. Part of the composite primary key for the table. (Note: Fences are defined as the in-game Thieves Guild merchants).
- **guild_branch_id**: Foreign key which references the guild_branches table to identify which branch the fence belongs to. Part of the composite primary key for the table.
- **skill_level**: The level of expertise the fence has. This was acquired from the in-game Mercantile skill of the fence.
- **income**: An estimation of the amount of money the fence earns. This was acquired from the in-game gold limit of the fence.

---

## **guild_doyens Table**

| guild_mbr_id ■● | guild_branch_id ■● | job_level |
|-----------------|--------------------|-----------|
| 113             | IPC                | Low       |
| 104             | BRV                | Medium    |
| 100             | ANV                | High      |

- **guild_mbr_id**: Foreign key which references the guild_members table to identify the guild member who is a doyen. Part of the composite primary key for the table. (Note: Doyens are defined as the in-game Thieves Guild quest givers).
- **guild_branch_id**: Foreign key which references the guild_branches table to identify which branch the doyen belongs to. Part of the composite primary key for the table.
- **job_level**: The importance level of the jobs the doyen gives. Based on the in-game rank cut-offs of the quest giver.
  - Low: Gives jobs to the ranks Pickpocket, Footpad, and Bandit.
  - Medium: Gives jobs to the ranks Prowler, Cat Burglar, and Shadowfoot.
  - High: Gives jobs to the rank Master Thief.

---

## **guild_adversaries Table**

| adversary_key ■ | adversary_name | threat_level | city_id ● | details     |
|-----------------|----------------|--------------|-----------|-------------|
| 300             | Hieronymus     | High         | 1         | Watch Captain|
| 301             | Myvryna        | Medium       | 1         | Traitor     |
| 302             | Jakben         | Low          | 1         | Vampire     |
| 303             | Aren           | Low          | 3         | Crazed Mage |
| 304             | Alessia        | High         | 7         | Countess    |
| ...             | ...            | ...          | ...       | ...         |

- **adversary_key**: Primary key which acts as a unique identifier for the guild enemy. Auto-incremented starting at 300. (Note: Adversaries were defined as characters who caused or attempted to cause active harm to the guild or its members during the in-game storyline).
- **adversary_name**: The name of the guild enemy.
- **threat_level**: How much of a threat the enemy represents. Acquired from in-game events and NPC behavior.
- **city_id**: Foreign key which references the cities table to identify which city the adversary is associated with.
- **details**: Additional details about the adversary's relationship to the guild, such as profession, faction, or special skills.

---

## **businesses Table**

| business_id ■ | business_name           | owner_name | merchandise      | income | city_id ● | guild_affiliated |
|----------------|-------------------------|------------|------------------|--------|-----------|------------------|
| 200            | A Fighting Chance       | Rohssan    | Blacksmith       | 1200   | 1         | FALSE            |
| 201            | Divine Elegance         | Palonirya  | Clothing         | 1200   | 1         | FALSE            |
| 202            | First Edition           | Phintias   | Books            | 1200   | 1         | FALSE            |
| 203            | Jensine's Good As New Merchandise | Jensine | General Goods    | 600    | 1         | FALSE            |
| 204            | Mystic Emporium         | Aurelinwae | Magical Supplies | 3000   | 1         | FALSE            |
| ...            | ...                     | ...        | ...              | ...    | ...       | ...              |

**Columns:**
- **business_id**: Primary key, unique identifier for each business.
- **business_name**: The name of the business.
- **owner_name**: The name of the owner of the business.
- **merchandise**: The type of goods or services the business sells.
- **income**: Estimated income of the business.
- **city_id**: Foreign key referencing the `cities` table to represent the city in which the business is located.
- **guild_affiliated**: Boolean value indicating whether the business is affiliated with any guild (TRUE or FALSE).

---

## **trade_routes Table**

| route_id ■ | route_name    | profitability |
|------------|---------------|---------------|
| 400        | Black Road    | High          |
| 401        | Blue Road     | Medium        |
| 402        | Gold Road     | High          |
| 403        | Green Road    | High          |
| 404        | Orange Road   | Low           |
| 405        | Silver Road   | Medium        |
| 406        | Yellow Road   | Medium        |

**Columns:**
- **route_id**: Primary key, auto-incremented starting at 400. Defines a trade route (a road connecting to one or more main cities or connecting two or more separate roads).
- **route_name**: The name of the trade route.
- **profitability**: Based on the following criteria:
  - Connected to Imperial City and two other cities = High
  - Connected to Imperial City and one other city = Medium
  - Connects two cities that aren’t Imperial City = Low

---

## **trade_route_cities Table**

| route_id ■● | city_id ■● |
|-------------|------------|
| 400         | 1          |
| 400         | 6          |
| 401         | 1          |
| 401         | 5          |
| 402         | 1          |
| ...         | ...        |

**Columns:**
- **route_id**: Foreign key referencing the `trade_routes` table, part of the composite primary key.
- **city_id**: Foreign key referencing the `cities` table, part of the composite primary key.

---

### Project Files:
- **tg_ledger_creation.sql**: Contains the full SQL code used to create the database.
- **tg_data_insertion.sql**: Contains the full SQL code used to populate the tables with data.
- **tg_useful_queries.sql**: Contains sample queries which I found either useful or interesting.

### Future Development:
There are many ideas that I have for expanding the database in the future, such as adding more guilds such as the Mages Guild or adding additional cities, NPCs, and guild branches from other games in the Elder Scrolls series, such as *The Elder Scrolls III: Morrowind* or *The Elder Scrolls V: Skyrim*.
