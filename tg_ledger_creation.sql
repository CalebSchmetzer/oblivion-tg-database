CREATE DATABASE thieves_guild_ledger; 


USE thieves_guild_ledger; 


CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(40) UNIQUE,
    population INT, 
    region VARCHAR(40)
); 


CREATE TABLE guild_branches (
    guild_branch_id CHAR(3) PRIMARY KEY,
    guild_branch_name VARCHAR(40) UNIQUE,
    guild_branch_leader INT, 
    guild_branch_earnings INT, 
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);


CREATE TABLE guild_members (
    guild_mbr_id INT AUTO_INCREMENT PRIMARY KEY,
    guild_mbr_name VARCHAR(40),
    guild_rank VARCHAR(40),
    guild_branch_id CHAR(3),
    FOREIGN KEY (guild_branch_id) REFERENCES guild_branches(guild_branch_id),
    UNIQUE (guild_mbr_name, guild_branch_id)
) AUTO_INCREMENT = 100;

ALTER TABLE guild_branches 
ADD CONSTRAINT fk_guild_branch_leader 
FOREIGN KEY (guild_branch_leader) REFERENCES guild_members(guild_mbr_id);


CREATE TABLE guild_fences (
    guild_mbr_id INT,
    guild_branch_id CHAR(3),
    skill_level VARCHAR(40), 
    income INT, 
    PRIMARY KEY (guild_mbr_id, guild_branch_id),
    FOREIGN KEY (guild_mbr_id) REFERENCES guild_members(guild_mbr_id),
    FOREIGN KEY (guild_branch_id) REFERENCES guild_branches(guild_branch_id)
);


CREATE TABLE guild_doyens (
    guild_mbr_id INT,
    guild_branch_id CHAR(3),
    job_level VARCHAR(10),
    PRIMARY KEY (guild_mbr_id, guild_branch_id),
    FOREIGN KEY (guild_mbr_id) REFERENCES guild_members(guild_mbr_id),
    FOREIGN KEY (guild_branch_id) REFERENCES guild_branches(guild_branch_id)
);


CREATE TABLE guild_adversaries (
    adversary_id INT AUTO_INCREMENT PRIMARY KEY,
    adversary_name VARCHAR(40),
    threat_level VARCHAR(10),
    city_id INT,
    details VARCHAR(60), 
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
) AUTO_INCREMENT = 300;


CREATE TABLE businesses (
    business_id INT AUTO_INCREMENT PRIMARY KEY, 
    business_name VARCHAR(40),
    owner_name VARCHAR(40),
    merchandise VARCHAR(40),
    income INT, 
    city_id INT, 
    guild_affiliated BOOL DEFAULT FALSE,
    FOREIGN KEY (city_id) REFERENCES cities(city_id),
    UNIQUE (business_name, city_id)
) AUTO_INCREMENT = 200; 


CREATE TABLE trade_routes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    route_name VARCHAR(255) NOT NULL UNIQUE,
    profitability VARCHAR(10)
) AUTO_INCREMENT = 400;


CREATE TABLE trade_route_cities (
    route_id INT,
    city_id INT,
    PRIMARY KEY (route_id, city_id),
    FOREIGN KEY (route_id) REFERENCES trade_routes(route_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);


CREATE INDEX idx_cities_name ON cities(city_name);
CREATE INDEX idx_guild_branch_id ON guild_members(guild_branch_id);
CREATE INDEX idx_guild_branches_city_id ON guild_branches(city_id);
CREATE INDEX idx_guild_fences_mbr_id ON guild_fences(guild_mbr_id);
CREATE INDEX idx_guild_doyens_mbr_id ON guild_doyens(guild_mbr_id);
CREATE INDEX idx_guild_adversaries_city_id ON guild_adversaries(city_id);
CREATE INDEX idx_businesses_city_id ON businesses(city_id);
CREATE INDEX idx_trade_route_id ON trade_route_cities(route_id);
CREATE INDEX idx_trade_city_id ON trade_route_cities(city_id);
