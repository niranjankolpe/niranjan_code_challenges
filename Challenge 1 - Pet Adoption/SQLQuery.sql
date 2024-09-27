-- Name: Niranjan Kolpe, Batch: C# batc-2
-- Coding Challenge - PetPals, The Pet Adoption Platform

-- Tasks:
--1. Provide a SQL script that initializes the database for the Pet Adoption Platform ”PetPals”.
IF (EXISTS (SELECT name FROM sys.databases WHERE name='PetPalsDB'))
BEGIN SELECT 'DATBASE WITH THIS NAME ALREADY EXISTS!' AS SystemMessage END
ELSE
BEGIN
CREATE DATABASE PetPalsDB;
SELECT 'DATABASE CREATED SUCCESSFULLY!' AS SystemMessage;
END

USE PetPalsDB;

--2. Create tables for pets, shelters, donations, adoption events, and participants.
-- Table: Pets
CREATE TABLE Pets (PetID INT PRIMARY KEY IDENTITY, Name VARCHAR(20) NOT NULL, Age INT,
				   Breed VARCHAR(20), Type VARCHAR(20), AvailableForAdoption BIT NOT NULL);
INSERT INTO Pets VALUES ('Rocky', 3, 'Bulldog',            'Dog',    1);
INSERT INTO Pets VALUES ('Lucy',  1, 'Holland Lop',        'Rabbit', 1);
INSERT INTO Pets VALUES ('Laila', 1, 'British Shorthair',  'Cat',    1);
INSERT INTO Pets VALUES ('Fuffy', 2, 'Lionhead Rabbit',    'Rabbit', 0);
INSERT INTO Pets VALUES ('Dasy',  2, 'Poodle',             'Dog',    1);
INSERT INTO Pets VALUES ('Lily',  4, 'Maine Coon',         'Cat',    0);
INSERT INTO Pets VALUES ('Bucky', 1, 'Rex Rabbit',         'Rabbit', 1);
INSERT INTO Pets VALUES ('Mylo',  2, 'Scottish Fold',      'Cat',    1);
INSERT INTO Pets VALUES ('Bruno', 5, 'Siberian Husky',     'Dog',    0);
INSERT INTO Pets VALUES ('Jilly', 3, 'American Fuzzy Lop', 'Rabbit', 0);
SELECT * FROM Pets;

-- Table: Shelters
CREATE TABLE Shelters (ShelterID INT PRIMARY KEY IDENTITY,  Name VARCHAR(20) NOT NULL, Location VARCHAR(20) NOT NULL);
INSERT INTO Shelters VALUES ('Delhi Pet Shelter',     'Delhi');
INSERT INTO Shelters VALUES ('Mumbai Pet Shelter',    'Mumbai');
INSERT INTO Shelters VALUES ('New York Pet Shelter',  'New York');
INSERT INTO Shelters VALUES ('Chennai Pet Shelter',   'Chennai');
INSERT INTO Shelters VALUES ('Pune Pet Shelter',      'Pune');
INSERT INTO Shelters VALUES ('Indore Pet Shelter',    'Indore');
INSERT INTO Shelters VALUES ('Berlin Pet Shelter',    'Berlin');
INSERT INTO Shelters VALUES ('London Pet Shelter',    'London');
INSERT INTO Shelters VALUES ('Paris Pet Shelter',     'Paris');
INSERT INTO Shelters VALUES ('Nagpur Pet Shelter',    'Nagpur');
SELECT * FROM Shelters;

-- Table: Donations
CREATE TABLE Donations (DonationID INT PRIMARY KEY IDENTITY, DonorName VARCHAR(20), DonationType VARCHAR(20) NOT NULL,
						DonationAmount DECIMAL NOT NULL DEFAULT 0, DonationItem VARCHAR(20), DonationDate DATETIME NOT NULL DEFAULT GETDATE());
INSERT INTO Donations VALUES ('Niranjan', 'Cash', 3000, NULL,          '2024-09-27 10:01:31.660');
INSERT INTO Donations VALUES ('Steve',    'Cash', 1000, NULL,          '2024-09-27 10:02:55.787');
INSERT INTO Donations VALUES ('Sam',      'Item', 0,    'Pet Clothes', '2024-09-27 10:04:12.563');
INSERT INTO Donations VALUES ('Tony',     'Item', 0,    'Medical Kit', '2024-09-27 10:04:46.937');
INSERT INTO Donations VALUES ('Peter',    'Cash', 5000, NULL,          '2024-09-27 10:05:36.070');
INSERT INTO Donations VALUES ('Scarlett', 'Item', 0,    'Clothes',     '2024-09-27 10:07:12.630');
INSERT INTO Donations VALUES ('Clint',    'Cash', 2000, NULL,          '2024-09-27 10:07:59.723');
INSERT INTO Donations VALUES ('Bruce',    'Cash', 5000, NULL,          '2024-09-27 10:08:47.850');
INSERT INTO Donations VALUES ('Tom',      'Item', 0,    'Clothes',     '2024-09-27 10:09:59.650');
INSERT INTO Donations VALUES ('Benedict', 'Cash', 9000, NULL,          '2024-09-27 10:10:42.430');
SELECT * FROM Donations;

-- Table: AdoptionEvents
CREATE TABLE AdoptionEvents (EventID INT PRIMARY KEY IDENTITY, EventName VARCHAR(30) NOT NULL,
							 EventDate DATETIME NOT NULL, Location VARCHAR(20) NOT NULL);
INSERT INTO AdoptionEvents VALUES ('Delhi Pet Adoption',     '2024-09-27 10:19:42.420', 'Delhi');
INSERT INTO AdoptionEvents VALUES ('Mumbai Pet Adoption',    '2024-09-27 10:20:03.010', 'Mumbai');
INSERT INTO AdoptionEvents VALUES ('New York Pet Adoption',  '2024-09-27 10:20:13.917', 'New York');
INSERT INTO AdoptionEvents VALUES ('Chennai Pet Adoption',   '2024-09-27 10:20:23.720', 'Chennai');
INSERT INTO AdoptionEvents VALUES ('Pune Pet Adoption',      '2024-09-27 10:20:37.910', 'Pune');
INSERT INTO AdoptionEvents VALUES ('Indore Pet Adoption',    '2024-09-27 10:20:54.027', 'Indore');
INSERT INTO AdoptionEvents VALUES ('Berlin Pet Adoption',    '2024-09-27 10:21:06.690', 'Berlin');
INSERT INTO AdoptionEvents VALUES ('London Pet Adoption',    '2024-09-27 10:21:17.510', 'London');
INSERT INTO AdoptionEvents VALUES ('Paris Pet Adoption',     '2024-09-27 10:21:27.300', 'Paris');
INSERT INTO AdoptionEvents VALUES ('Nagpur Pet Adoption',    '2024-09-27 10:21:38.090', 'Nagpur');
SELECT * FROM AdoptionEvents;

-- Table: Participants
CREATE TABLE Participants (ParticipantID INT PRIMARY KEY IDENTITY, ParticipantName VARCHAR(20) NOT NULL, 
						   ParticipantType VARCHAR(20) NOT NULL,
						   EventID INT FOREIGN KEY REFERENCES AdoptionEvents(EventID));
INSERT INTO Participants VALUES ('Niranjan',     'Shelter',  4);
INSERT INTO Participants VALUES ('Steve',    'Adopter',  6);
INSERT INTO Participants VALUES ('Sam',     'Shelter',  7);
INSERT INTO Participants VALUES ('Tony',     'Adopter',  9);
INSERT INTO Participants VALUES ('Peter',   'Shelter', 10);
INSERT INTO Participants VALUES ('Scarlett',  'Shelter',  1);
INSERT INTO Participants VALUES ('Benedict', 'Adopter',  2);
INSERT INTO Participants VALUES ('Niranjan',  'Adopter',  5);
INSERT INTO Participants VALUES ('Sam',     'Shelter',  1);
INSERT INTO Participants VALUES ('Bruce',  'Adopter',  7);
SELECT * FROM Participants;

--3. Define appropriate primary keys, foreign keys, and constraints.
-- Solution: Appropriate Primary Keys, Foreign Keys and Constraints have been assigned during Table creation for all tables.
-- Refer Task 2 Queries.

--4. Ensure the script handles potential errors, such as if the database or tables already exist.
-- Refer Task 1 Queries.


--5. Write an SQL query that retrieves a list of available pets (those marked as available for adoption)
--from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that
--the query filters out pets that are not available for adoption.
SELECT Name, Age, Breed, Type FROM Pets WHERE AvailableForAdoption=1;

--6. Write an SQL query that retrieves the names of participants (shelters and adopters) registered
--for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query
--joins the necessary tables to retrieve the participant names and types.
DECLARE @EventID INT = 1;
SELECT * FROM Participants INNER JOIN AdoptionEvents ON Participants.EventID=AdoptionEvents.EventID WHERE Participants.EventID=@EventID;

--7. Create a stored procedure in SQL that allows a shelter to update its information (name and location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information.
--Ensure that the procedure performs the update and handles potential errors, such as an invalid shelter ID.
CREATE PROCEDURE UpdateShelter
    @ShelterID INT,
    @NewName VARCHAR(150),
    @NewAddress VARCHAR(255) AS BEGIN
    BEGIN TRANSACTION;
    IF EXISTS (SELECT *
    FROM Shelters
    WHERE ShelterID = @ShelterID)
    BEGIN
        UPDATE Shelters
        SET Name = @NewName,
            Location = @NewAddress
        WHERE ShelterID = @ShelterID;
        COMMIT TRANSACTION;
        PRINT 'Shelter Updated!';
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Shelter ID is Invalid!';
    END
END
GO

EXEC UpdateShelter
 @ShelterID = 1, @NewName = 'Washington Pet',
  @NewAddress = 'Washington';
SELECT * FROM Shelters WHERE ShelterID=1;


--8. Write an SQL query that calculates and retrieves the total donation amount for each shelter (by
--shelter name) from the "Donations" table. The result should include the shelter name and the
--total donation amount. Ensure that the query handles cases where a shelter has received no
--donations.
ALTER TABLE Donations ADD ShelterID INT FOREIGN KEY REFERENCES Shelters(ShelterID);
SELECT * FROM Donations;
UPDATE Donations SET ShelterID=1;
SELECT SUM(DonationAmount) AS TotalDonation FROM Donations JOIN Shelters ON Donations.ShelterID=Shelters.ShelterID;

--9. Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an
--owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result
--set.
ALTER TABLE Pets ADD Owner_ID INT;
SELECT Name, Age, Breed,  Type FROM Pets WHERE Pets.Owner_ID IS NULL;
SELECT * FROM Pets;

--10. Write an SQL query that retrieves the total donation amount for each month and year (e.g.,
--January 2023) from the "Donations" table. The result should include the month-year and the
--corresponding total donation amount. Ensure that the query handles cases where no donations
--were made in a specific month-year.
SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear, ISNULL(SUM(DonationAmount), 0) AS TotalDonationAmount
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy');
GO

--11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older
--than 5 years.
SELECT Breed, Age FROM Pets WHERE (Age>1 AND Age<3) OR Age>5;

--12. Retrieve a list of pets and their respective shelters where the pets are currently available for
--adoption.
ALTER TABLE Pets ADD ShelterID INT FOREIGN KEY REFERENCES Shelters(ShelterID);
SELECT * FROM Pets;
UPDATE Pets SET ShelterID=1;
SELECT PetID, Name, ShelterID FROM Pets WHERE AvailableForAdoption=1;

--13. Find the total number of participants in events organized by shelters located in specific city.
--Example: City=Chennai
UPDATE AdoptionEvents SET Location='Chennai' WHERE EventID=9;
SELECT COUNT(*) AS Count FROM Participants JOIN AdoptionEvents ON Participants.EventID=AdoptionEvents.EventID WHERE Location='Chennai';

--14. Retrieve a list of unique breeds for pets with ages between 1 and 5 years.
SELECT DISTINCT Breed FROM Pets WHERE Age>1 AND Age<5;

--15. Find the pets that have not been adopted by selecting their information from the 'Pet' table.
SELECT * FROM Pets WHERE AvailableForAdoption=1 AND Owner_ID IS NULL;

--16. Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and
--'User' tables.
-- Adopter's table data unable:
SELECT * FROM Pets INNER JOIN Adopters ON Pets.PetID=Adopters.PetID;
SELECT * FROM Pets INNER JOIN Adopters ON Pets.PetID=Adopters.PetID;

--17. Retrieve a list of all shelters along with the count of pets currently available for adoption in each
--shelter.
SELECT ShelterID, COUNT(*) AS PetsAvailable FROM Pets WHERE AvailableForAdoption=1 GROUP BY ShelterID ORDER BY SHelterID;

--18. Find pairs of pets from the same shelter that have the same breed.
SELECT PetID, Breed FROM Pets WHERE ShelterID=1 GROUP BY PetID, Breed;

--19. List all possible combinations of shelters and adoption events.
ALTER TABLE AdoptionEvents ADD ShelterID INT FOREIGN KEY REFERENCES Shelters(ShelterID);
SELECT * FROM AdoptionEvents;
UPDATE AdoptionEvents SET ShelterID=4;
SELECT * FROM Shelters FULL OUTER JOIN AdoptionEvents ON Shelters.ShelterID=AdoptionEvents.ShelterID;

--20. Determine the shelter that has the highest number of adopted pets.
SELECT ShelterID, COUNT(*) AS NoOfAdoptedPets FROM Pets WHERE AvailableForAdoption=0 GROUP BY ShelterID;