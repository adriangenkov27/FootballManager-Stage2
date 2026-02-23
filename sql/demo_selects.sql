USE football_manager;

-- 1. Всички клубове
SELECT * FROM clubs;

-- 2. Играчите по клуб
SELECT p.first_name, p.last_name, c.name AS club
FROM players p
JOIN clubs c ON p.club_id = c.id;

-- 3. Всички мачове
SELECT * FROM matches;

-- 4. Всички голове
SELECT g.id, p.first_name, p.last_name, g.minute
FROM goals g
JOIN players p ON g.player_id = p.id;

-- 5. Всички картони
SELECT c.id, p.first_name, p.last_name, c.type, c.minute
FROM cards c
JOIN players p ON c.player_id = p.id;
