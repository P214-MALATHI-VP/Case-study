--CREATING DATABASE

CREATE DATABASE Crimedb;

use Crimedb;

--CREATING TABLES

-- 1. Victims Table

CREATE TABLE Victims (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- 2. Suspects Table

CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- 3. Incidents Table

CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(100),
    IncidentDate DATE,
    Location GEOGRAPHY, 
    Description TEXT,
    Status VARCHAR(50),
    VictimID INT, 
    SuspectID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID)
);

-- 4. Law Enforcement Agencies Table

CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY ,
    AgencyName VARCHAR(255),
    Jurisdiction VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- 5. Officers Table

CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BadgeNumber VARCHAR(50),
    Rank VARCHAR(50),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

-- 6. Evidence Table

CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY,
    Description TEXT,
    LocationFound VARCHAR(255),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);

-- 7. Reports Table

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    IncidentID INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status VARCHAR(50),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);

--INSERTING RECORDS 

--Insert into victims table

INSERT INTO Victims (VictimID, FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber)
VALUES 
(1, 'Arun', 'Kumar', '1990-05-10', 'Male', '12, Anna Nagar, Chennai', '9876543210'),
(2, 'Lakshmi', 'Subramani', '1985-03-22', 'Female', '45, Mylapore, Chennai', '8765432109'),
(3, 'Ravi', 'Shankar', '1978-11-13', 'Male', '34, Gandhipuram, Coimbatore', '7654321098'),
(4, 'Meena', 'Raghavan', '1992-09-07', 'Female', '56, Kamaraj Salai, Madurai', '6543210987'),
(5, 'Senthil', 'Murugan', '1980-12-15', 'Male', '78, Cross Road, Trichy', '6432109876'),
(6, 'Anitha', 'Rajendran', '1994-04-21', 'Female', '23, Alwarpet, Chennai', '7321098765'),
(7, 'Saravanan', 'Mani', '1982-06-18', 'Male', '91, Thillai Nagar, Trichy', '8210987654'),
(8, 'Kavitha', 'Muthu', '1996-07-14', 'Female', '100, Sivananda Colony, Coimbatore', '8109876543'),
(9, 'Prakash', 'Selvan', '1975-02-26', 'Male', '67, R.S. Puram, Coimbatore', '7098765432'),
(10, 'Divya', 'Balasubramanian', '1998-11-30', 'Female', '89, Ashok Nagar, Chennai', '6987654321');


--Insert into Suspects table

INSERT INTO Suspects (SuspectID, FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber)
VALUES 
(1, 'Karthik', 'Natarajan', '1984-07-15', 'Male', '23, T. Nagar, Chennai', '9123456789'),
(2, 'Siva', 'Ganesan', '1990-02-28', 'Male', '45, Sathyamangalam Road, Coimbatore', '9234567890'),
(3, 'Mohan', 'Venkatesh', '1982-10-12', 'Male', '67, Thillai Nagar, Trichy', '9345678901'),
(4, 'Priya', 'Ravi', '1989-05-05', 'Female', '12, Race Course Road, Madurai', '9456789012'),
(5, 'Vikram', 'Anandan', '1977-11-22', 'Male', '56, Peelamedu, Coimbatore', '9567890123'),
(6, 'Shanthi', 'Perumal', '1986-08-18', 'Female', '78, K.K. Nagar, Chennai', '9678901234'),
(7, 'Balaji', 'Pandian', '1993-01-10', 'Male', '90, Karur Bypass Road, Trichy', '9789012345'),
(8, 'Geetha', 'Saravanan', '1995-04-27', 'Female', '34, Alandur, Chennai', '9890123456'),
(9, 'Kumar', 'Velu', '1981-09-17', 'Male', '22, Kalavasal, Madurai', '9901234567'),
(10, 'Malar', 'Krishnan', '1997-12-01', 'Female', '101, Singanallur, Coimbatore', '9012345678');

--Inserting into Incidents table

INSERT INTO Incidents (IncidentID, IncidentType, IncidentDate, Location, Description, Status, VictimID, SuspectID)
VALUES 
(1, 'Robbery', '2023-01-01', geography::STPointFromText('POINT(80.278464 13.08784)', 4326), 'Armed robbery at a shop in Chennai.', 'Open', 1, 1),
(2, 'Homicide', '2023-02-15', geography::STPointFromText('POINT(78.118255 9.9252)', 4326), 'Homicide reported in Madurai.', 'Under Investigation', 2, 2),
(3, 'Theft', '2023-03-10', geography::STPointFromText('POINT(77.0307 11.0168)', 4326), 'Theft at a store in Coimbatore.', 'Closed', 3, 3),
(4, 'Robbery', '2023-04-25', geography::STPointFromText('POINT(78.6821 10.7905)', 4326), 'Bank robbery in Trichy.', 'Open', 4, 4),
(5, 'Assault', '2023-05-30', geography::STPointFromText('POINT(80.278464 13.067439)', 4326), 'Physical assault outside a bar in Chennai.', 'Under Investigation', 5, 5),
(6, 'Burglary', '2023-06-14', geography::STPointFromText('POINT(78.118255 9.9252)', 4326), 'Burglary at a home in Madurai.', 'Open', 6, 6),
(7, 'Fraud', '2023-07-19', geography::STPointFromText('POINT(77.0307 11.0168)', 4326), 'Credit card fraud in Coimbatore.', 'Closed', 7, 7),
(8, 'Theft', '2023-08-24', geography::STPointFromText('POINT(78.6821 10.7905)', 4326), 'Bike stolen from a park in Trichy.', 'Open', 8, 8),
(9, 'Vandalism', '2023-09-12', geography::STPointFromText('POINT(80.278464 13.067439)', 4326), 'Graffiti on a wall in Chennai.', 'Under Investigation', 9, 9),
(10, 'Homicide', '2023-10-05', geography::STPointFromText('POINT(78.118255 9.9252)', 4326), 'Homicide in a residential area in Madurai.', 'Closed', 10, 10);


-- Insert into LawEnforcementAgencies Table 

INSERT INTO LawEnforcementAgencies (AgencyID, AgencyName, Jurisdiction, Address, PhoneNumber)
VALUES 
(1, 'Chennai City Police', 'Chennai', 'Vepery, Chennai, Tamil Nadu', '044-23456789'),
(2, 'Coimbatore City Police', 'Coimbatore', 'Gopalapuram, Coimbatore, Tamil Nadu', '0422-3456789'),
(3, 'Madurai City Police', 'Madurai', 'Tallakulam, Madurai, Tamil Nadu', '0452-4567890'),
(4, 'Trichy City Police', 'Tiruchirappalli', 'Cantonment, Trichy, Tamil Nadu', '0431-5678901'),
(5, 'Tamil Nadu State Police', 'Statewide', 'Kamarajar Salai, Chennai, Tamil Nadu', '044-6789012'),
(6, 'Chennai Traffic Police', 'Chennai', 'Anna Salai, Chennai, Tamil Nadu', '044-7890123'),
(7, 'Coimbatore Rural Police', 'Coimbatore Rural', 'Sundarapuram, Coimbatore, Tamil Nadu', '0422-8901234'),
(8, 'Madurai Rural Police', 'Madurai Rural', 'Periyar, Madurai, Tamil Nadu', '0452-9012345'),
(9, 'Trichy Traffic Police', 'Trichy', 'Main Guard Gate, Trichy, Tamil Nadu', '0431-0123456'),
(10, 'Tamil Nadu Crime Branch', 'Statewide', 'Egmore, Chennai, Tamil Nadu', '044-1234567');


-- Insert into Officers Table 

INSERT INTO Officers (OfficerID, FirstName, LastName, BadgeNumber, Rank, Address, PhoneNumber, AgencyID)
VALUES 
(1, 'Karthik', 'Rajendran', 'TN12345', 'Inspector', '12, Thiruvanmiyur, Chennai', '9876501234', 1),
(2, 'Suresh', 'Venkatesan', 'TN23456', 'Sub-Inspector', '45, Periyar Nagar, Madurai', '8765430123', 2),
(3, 'Arul', 'Selvan', 'TN34567', 'Head Constable', '23, Gandhipuram, Coimbatore', '7654321012', 3),
(4, 'Muthu', 'Kumar', 'TN45678', 'Assistant Inspector', '67, Cross Road, Trichy', '6543210123', 4),
(5, 'Ramesh', 'Krishnan', 'TN56789', 'Constable', '89, Ashok Nagar, Chennai', '5432101234', 1),
(6, 'Bala', 'Murugan', 'TN67890', 'Constable', '34, Thillai Nagar, Trichy', '4321090123', 4),
(7, 'Vijay', 'Subramanian', 'TN78901', 'Inspector', '98, KK Nagar, Madurai', '3210989012', 7),
(8, 'Kumar', 'Swaminathan', 'TN89012', 'Sub-Inspector', '56, Anna Nagar, Coimbatore', '2109878901', 6),
(9, 'Mani', 'Sundaram', 'TN90123', 'Head Constable', '78, R.S. Puram, Coimbatore', '1098767890', 3),
(10, 'Aravind', 'Mohan', 'TN01234', 'Assistant Inspector', '12, Alwarpet, Chennai', '0987656789', 1);


-- Insert into Evidence Table 

INSERT INTO Evidence (EvidenceID, Description, LocationFound, IncidentID)
VALUES 
(1, 'Fingerprints', 'Mall counter', 1),
(2, 'Blood sample', 'Crime scene floor', 2),
(3, 'Security camera footage', 'Store entrance', 3),
(4, 'Getaway vehicle description', 'Bank parking lot', 4),
(5, 'Clothing fibers', 'Nightclub entrance', 5),
(6, 'Broken window glass', 'House backyard', 6),
(7, 'Credit card statement', 'Bank records', 7),
(8, 'Bike lock', 'Park fence', 8),
(9, 'Spray paint cans', 'Sidewalk', 9),
(10, 'Firearm', 'Apartment hallway', 10);


-- Insert into Reports Table

INSERT INTO Reports (ReportID, IncidentID, ReportingOfficer, ReportDate, ReportDetails, Status)
VALUES 
(1, 1, 1, '2023-01-02', 'Initial report for robbery at the mall.', 'Draft'),
(2, 2, 2, '2023-02-16', 'Crime scene investigation report for homicide.', 'Finalized'),
(3, 3, 3, '2023-03-11', 'Theft investigation completed. Closed.', 'Finalized'),
(4, 4, 4, '2023-04-26', 'Robbery at the bank with a vehicle involved. Still open.', 'Draft'),
(5, 5, 5, '2023-05-31', 'Physical assault investigation in progress.', 'Under Investigation'),
(6, 6, 6, '2023-06-15', 'Burglary case under review.', 'Open'),
(7, 7, 7, '2023-07-20', 'Fraud report finalized.', 'Finalized'),
(8, 8, 8, '2023-08-25', 'Stolen bike report filed.', 'Open'),
(9, 9, 9, '2023-09-13', 'Vandalism reported. Investigation ongoing.', 'Under Investigation'),
(10, 10, 10, '2023-10-06', 'Homicide report closed after investigation.', 'Finalized');

-- PRINTING ALL THE TABLES

select * from Victims;
select * from Suspects;
select * from Incidents;
select * from LawEnforcementAgencies;
select * from Officers;
select * from Evidence;
select * from Reports;

--SAMPLE QUERIES

--1. To count Incidents by Type

SELECT IncidentType, COUNT(*) AS TotalIncidents
FROM Incidents
GROUP BY IncidentType;

--2. Find count of Officers in Each Agency

SELECT a.AgencyName, COUNT(o.OfficerID) AS OfficerCount
FROM LawEnforcementAgencies a
LEFT JOIN Officers o ON a.AgencyID = o.AgencyID
GROUP BY a.AgencyName;

--3. Retrieve Reports for a Specific Incident

SELECT r.ReportID, r.ReportDate, r.ReportDetails
FROM Reports r
WHERE r.IncidentID = 1;

--4. Retrieve Incidents and Corresponding Reports

SELECT i.IncidentID, i.IncidentType, i.Description AS IncidentDescription, 
       r.ReportID, r.ReportDetails, r.Status AS ReportStatus
FROM Incidents i
LEFT JOIN Reports r ON i.IncidentID = r.IncidentID
ORDER BY i.IncidentID;

--5. To find total incidents

SELECT Count(IncidentType) as totalIncidents
FROM Incidents;

--6.To find the location of the incident

SELECT IncidentId, Location.STAsText() AS Location
FROM Incidents
WHERE IncidentID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);