USE football_manager;

INSERT INTO clubs (name, city) VALUES
('Levski', 'Sofia'),
('CSKA', 'Sofia'),
('Ludogorets', 'Razgrad'),
('Botev', 'Plovdiv');

INSERT INTO players (first_name, last_name, birth_date, position, club_id) VALUES
('Ivan', 'Petrov', '2000-05-10', 'GK', 1),
('Georgi', 'Ivanov', '1999-03-15', 'DF', 1),
('Petar', 'Dimitrov', '2001-07-20', 'FW', 1),
('Martin', 'Kolev', '1998-02-11', 'MF', 2),
('Nikolay', 'Stoyanov', '2002-09-09', 'FW', 2),
('Dimitar', 'Georgiev', '1997-01-01', 'DF', 3),
('Stefan', 'Angelov', '2003-12-12', 'MF', 3),
('Borislav', 'Todorov', '2000-06-06', 'FW', 4);

INSERT INTO leagues (name, season) VALUES
('Bulgarian League', '2025/2026');

INSERT INTO league_teams (league_id, club_id) VALUES
(1,1),(1,2),(1,3),(1,4);

INSERT INTO matches (league_id, home_club_id, away_club_id, match_date, round, home_goals, away_goals, status) VALUES
(1,1,2,'2025-09-01',1,2,1,'played'),
(1,3,4,'2025-09-02',1,0,0,'scheduled');

INSERT INTO goals (match_id, player_id, club_id, minute) VALUES
(1,3,1,15),
(1,3,1,60),
(1,5,2,75);

INSERT INTO cards (match_id, player_id, type, minute) VALUES
(1,2,'yellow',30);
