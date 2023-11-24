-- Inserting data into Citizen table
INSERT INTO Citizen (id,nic,fullname, isCriminal) VALUES
    (UUID(),'200040724825','John Doe', FALSE),
	(UUID(),'200319274625', 'Emily Johnson', TRUE),
    (UUID(),'200512349871', 'Michael Brown', FALSE),
    (UUID(),'200625489732', 'Sophia Wilson', TRUE),
    (UUID(),'200117491593','Alice Smith', TRUE),
    (UUID(),'200239613714','Bob Johnson', FALSE),
	(UUID(),'200712349871', 'William Miller', FALSE);

-- Inserting data into Offense table
INSERT INTO Offense (id,offense, citizenId)
VALUES
    (UUID(),'Fraud', (SELECT id FROM Citizen WHERE fullname = 'John Doe')),
    (UUID(),'Drug Possession', (SELECT id FROM Citizen WHERE fullname = 'Sophia Wilson')),
    (UUID(),'Burglary', (SELECT id FROM Citizen WHERE fullname = 'Alice Smith')),
    (UUID(),'DUI', (SELECT id FROM Citizen WHERE fullname = 'Bob Johnson')),
    (UUID(),'Forgery', (SELECT id FROM Citizen WHERE fullname = 'Bob Johnson')),
    (UUID(),'Theft', (SELECT id FROM Citizen WHERE fullname = 'Emily Johnson')),
    (UUID(),'Assault', (SELECT id FROM Citizen WHERE fullname = 'Emily Johnson')),
    (UUID(),'Speeding', (SELECT id FROM Citizen WHERE fullname = 'Michael Brown')),
    (UUID(),'Vandalism', (SELECT id FROM Citizen WHERE fullname = 'Michael Brown'));


-- Inserting data into PoliceRequest table
INSERT INTO PoliceRequest (id,status, appliedTime, citizenId)
VALUES
    (UUID(),'Pending', '2023-11-01', (SELECT id FROM Citizen WHERE fullname = 'John Doe')),
    (UUID(),'Rejected', '2023-10-15', (SELECT id FROM Citizen WHERE fullname = 'Emily Johnson')),
    (UUID(),'Pending', '2023-11-20', (SELECT id FROM Citizen WHERE fullname = 'Michael Brown')),
    (UUID(),'Rejected', '2023-12-05', (SELECT id FROM Citizen WHERE fullname = 'Sophia Wilson')),
    (UUID(),'Rejected', '2023-11-20', (SELECT id FROM Citizen WHERE fullname = 'Alice Smith')),
    (UUID(),'Cleared', '2023-10-10', (SELECT id FROM Citizen WHERE fullname = 'Bob Johnson')),
    (UUID(),'Pending', '2023-09-15', (SELECT id FROM Citizen WHERE fullname = 'Sophia Wilson')),
    (UUID(),'Cleared', '2023-08-28', (SELECT id FROM Citizen WHERE fullname = 'William Miller')),
    (UUID(),'Rejected', '2023-09-28', (SELECT id FROM Citizen WHERE fullname = 'John Doe'));
