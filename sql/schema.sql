CREATE DATABASE IF NOT EXISTS football_manager;
USE football_manager;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin','operator','viewer') NOT NULL
);

CREATE TABLE clubs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    city VARCHAR(100)
);

CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    position ENUM('GK','DF','MF','FW') NOT NULL,
    status ENUM('active','injured','suspended','free') DEFAULT 'active',
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(id)
);

CREATE TABLE transfers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    from_club_id INT,
    to_club_id INT,
    transfer_date DATE NOT NULL,
    type ENUM('permanent','loan') NOT NULL,
    FOREIGN KEY (player_id) REFERENCES players(id),
    FOREIGN KEY (from_club_id) REFERENCES clubs(id),
    FOREIGN KEY (to_club_id) REFERENCES clubs(id)
);

CREATE TABLE leagues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    season VARCHAR(20) NOT NULL,
    UNIQUE(name, season)
);

CREATE TABLE league_teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    league_id INT NOT NULL,
    club_id INT NOT NULL,
    UNIQUE(league_id, club_id),
    FOREIGN KEY (league_id) REFERENCES leagues(id),
    FOREIGN KEY (club_id) REFERENCES clubs(id)
);

CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    league_id INT NOT NULL,
    home_club_id INT NOT NULL,
    away_club_id INT NOT NULL,
    match_date DATE,
    round INT,
    home_goals INT DEFAULT 0,
    away_goals INT DEFAULT 0,
    status ENUM('scheduled','played') DEFAULT 'scheduled',
    FOREIGN KEY (league_id) REFERENCES leagues(id),
    FOREIGN KEY (home_club_id) REFERENCES clubs(id),
    FOREIGN KEY (away_club_id) REFERENCES clubs(id)
);

CREATE TABLE goals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    club_id INT NOT NULL,
    minute INT CHECK (minute BETWEEN 1 AND 120),
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (player_id) REFERENCES players(id),
    FOREIGN KEY (club_id) REFERENCES clubs(id)
);

CREATE TABLE cards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    type ENUM('yellow','red') NOT NULL,
    minute INT CHECK (minute BETWEEN 1 AND 120),
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (player_id) REFERENCES players(id)
);
