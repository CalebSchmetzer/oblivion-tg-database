USE thieves_guild_ledger;

-- Total Earnings For Each Guild Branch With Leader -- 
SELECT gb.guild_branch_name, gm.guild_mbr_name AS leader_name, gb.guild_branch_earnings
FROM guild_branches gb
JOIN guild_members gm ON gb.guild_branch_leader = gm.guild_mbr_id
ORDER BY gb.guild_branch_earnings DESC;

-- Guild Branches Sorted By Number Of Members -- 
SELECT gb.guild_branch_name, COUNT(gm.guild_mbr_id) AS number_of_members
FROM guild_branches gb
JOIN guild_members gm ON gb.guild_branch_id = gm.guild_branch_id
GROUP BY gb.guild_branch_name
ORDER BY number_of_members DESC;

-- All Trade Routes That Are Connected To A Particular City -- 
SELECT tr.route_name
FROM trade_routes tr
JOIN trade_route_cities trc ON tr.route_id = trc.route_id
JOIN cities c ON trc.city_id = c.city_id
WHERE c.city_name = 'Imperial City'  
ORDER BY tr.route_name;

-- All Trade Routes That Run Through A Particular Region -- 
SELECT tr.route_name
FROM trade_routes tr
JOIN trade_route_cities trc ON tr.route_id = trc.route_id
JOIN cities c ON trc.city_id = c.city_id
WHERE c.region = 'Blackwood' 
ORDER BY tr.route_name;

-- Cities Sorted By Number Of Trade Routes Connected To It -- 
SELECT c.city_name, COUNT(trc.route_id) AS num_routes
FROM cities c
JOIN trade_route_cities trc ON c.city_id = trc.city_id
GROUP BY c.city_name
ORDER BY num_routes DESC;


-- All Guild Branches Which Have Higher Than Average Earnings -- 
SELECT gb.guild_branch_name, gb.guild_branch_earnings
FROM cities c
JOIN guild_branches gb ON c.city_id = gb.city_id
WHERE gb.guild_branch_earnings > (
    SELECT AVG(gb2.guild_branch_earnings)
    FROM guild_branches gb2
    WHERE gb2.city_id != 1 -- Imperial City is excluded from average because its earnings are much higher than the other cities
);

-- All Guild Affiliated Businesses And The Associated Branch -- 
SELECT b.business_name, b.owner_name, gb.guild_branch_name
FROM businesses b
JOIN guild_branches gb ON b.city_id = gb.city_id
WHERE b.guild_affiliated = TRUE;

-- Businesses Ordered By Income -- 
SELECT b.business_name, b.income
FROM businesses b
ORDER BY income DESC
LIMIT 0,100;

-- All Branch Leaders Who Are Also Doyens -- 
SELECT gb.guild_branch_name, gm.guild_mbr_name
FROM guild_branches gb
JOIN guild_doyens gd ON gb.guild_branch_leader = gd.guild_mbr_id
JOIN guild_members gm ON gb.guild_branch_leader = gm.guild_mbr_id;


-- All Branch Leaders Who Are Also Fences -- 
SELECT gb.guild_branch_name, gm.guild_mbr_name
FROM guild_branches gb
JOIN guild_fences f ON gb.guild_branch_leader = f.guild_mbr_id
JOIN guild_members gm ON gb.guild_branch_leader = gm.guild_mbr_id;
