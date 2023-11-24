-- Creating the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS GDKI_police;
GRANT ALL PRIVILEGES ON GDKI_police.* TO 'police'@'%';
-- Using the newly created database
USE GDKI_police;

-- Creating the Citizen table
CREATE TABLE IF NOT EXISTS Citizen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nic VARCHAR(20) UNIQUE, 
    fullname VARCHAR(255),
    offenses BOOLEAN DEFAULT FALSE
);

-- Creating the Offense table
CREATE TABLE IF NOT EXISTS Offense (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT,
    offense VARCHAR(255),
    FOREIGN KEY (citizen_id) REFERENCES Citizen(id)
);

-- Creating the Police_Requests table
CREATE TABLE IF NOT EXISTS Police_Requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50),
    citizen_id INT,
    date DATE,
    notes TEXT,
    FOREIGN KEY (citizen_id) REFERENCES Citizen(id)
);

-- Inserting data into Citizen table
INSERT INTO Citizen (fullname, offenses) VALUES
    ('200040724825','John Doe', FALSE),
    ('200117491593','Alice Smith', TRUE),
    ('200239613714','Bob Johnson', FALSE);

-- Inserting data into Offense table
INSERT INTO Offense (citizen_id, offense) VALUES
    (1, 'Parking Violation'),
    (2, 'Shoplifting'),
    (2, 'Speeding');

-- Inserting data into Police_Requests table
INSERT INTO Police_Requests (status, citizen_id, date, notes) VALUES
    ('Pending', 1, '2023-11-01', 'Reported suspicious activity'),
    ('Resolved', 2, '2023-10-15', 'Caught stealing at a supermarket'),
    ('Pending', 3, '2023-11-20', 'Speeding on the highway');
