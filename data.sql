-- Inserting data into Citizen table
INSERT INTO Citizen (nic,fullname, isCriminal) VALUES
    ('200040724825','John Doe', FALSE),
	('200319274625', 'Emily Johnson', TRUE),
    ('200512349871', 'Michael Brown', FALSE),
    ('200625489732', 'Sophia Wilson', TRUE),
    ('200117491593','Alice Smith', TRUE),
    ('200239613714','Bob Johnson', FALSE),
	('200712349871', 'William Miller', FALSE);

-- Inserting data into Offense table
INSERT INTO Offense (offense, citizenId) VALUES
    ('Fraud', 1),
    ('Drug Possession', 4),
    ('Burglary', 5),
    ('DUI', 6),
    ('Forgery', 6),
    ('Theft', 2),
    ('Assault', 2),
    ('Speeding', 3),
    ('Vandalism', 3);

-- Inserting data into PoliceRequest table
INSERT INTO PoliceRequest (status, appliedTime, citizenId) VALUES
    ('Pending', '2023-11-01', 1),
    ('Resolved', '2023-10-15', 2),
    ('Pending', '2023-11-20', 3),
	('Pending', '2023-12-05', 4),
    ('Resolved', '2023-11-20', 5),
    ('Closed', '2023-10-10', 6),
    ('Pending', '2023-09-15', 4),
    ('Resolved', '2023-08-28', 7),
    ('Closed', '2023-09-28', 1);