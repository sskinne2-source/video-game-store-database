/*
** Authors: Gregory Rant, Sean Skinner
** Group Number: 69
** Course: IFT530
** SQL Server Version: Microsoft SQL Server 2012 (SP1) 
** History
** Date Created    Comments
** 11/19/2024	   Final IFT 530 Project, creating a game store's database
*/

USE master
GO

IF DB_ID('GameStoreDatabase') IS NOT NULL
	DROP DATABASE GameStoreDatabase;

CREATE DATABASE GameStoreDatabase;

USE GameStoreDatabaseSample;
GO

--- Create Tables ---
CREATE TABLE Users (
UserID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR(15) NOT NULL,
LastName VARCHAR(15) NOT NULL,
Email VARCHAR(20) UNIQUE NOT NULL,
Password VARCHAR(64) NOT NULL,
BirthDate DATE NOT NULL,
Username VARCHAR(10) UNIQUE NOT NULL
);
GO

CREATE TABLE Publisher (
PublisherID INT NOT NULL PRIMARY KEY,
Name VARCHAR(20) NOT NULL UNIQUE,
Address VARCHAR(25) NOT NULL,
State VARCHAR(15) NOT NULL,
ZipCode VARCHAR(5) NOT NULL,
Email VARCHAR(25) NOT NULL
);
GO

CREATE TABLE Games (
GameID INT NOT NULL PRIMARY KEY,
Title VARCHAR(40) NOT NULL,
Description VARCHAR(250) NOT NULL,
MaturityRating VARCHAR(4) NOT NULL,
ReleaseDate DATE NOT NULL,
Price MONEY NOT NULL,
PublisherID INT NOT NULL
FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID)
);
GO

CREATE TABLE Orders (
OrderID INT NOT NULL PRIMARY KEY,
UserID INT NOT NULL,
GameID INT NOT NULL,
Total MONEY NOT NULL,
OrderDate DATE NOT NULL
FOREIGN KEY(UserID) REFERENCES Users(UserID),
FOREIGN KEY(GameID) REFERENCES Games(GameID)
);
GO

CREATE TABLE Reviews (
ReviewID INT NOT NULL PRIMARY KEY,
GameID INT NOT NULL,
UserID INT NOT NULL,
ReviewStars INT NOT NULL,
ReviewDesc VARCHAR(200) NULL
FOREIGN KEY(GameID) REFERENCES Games(GameID),
FOREIGN KEY(UserID) REFERENCES Users(UserID)
);
GO

CREATE TABLE Discount (
DiscountID INT NOT NULL PRIMARY KEY,
DiscountExpiration DATE NOT NULL,
UserID INT NOT NULL
FOREIGN KEY(UserID) REFERENCES Users(UserID)
);
GO


--- Insert Statements ---

-- Insert into Users
INSERT INTO Users VALUES (7701, 'Emily', 'Carter', 'ECarter@gmail.com', 'my$ecureP4ssW0RD', '1992-03-15', 'ECarter');
INSERT INTO Users VALUES (7702, 'Michael', 'Johnson', 'MJohnson@gmail.com', 'my$ecureP4ssW0RD', '1987-07-22', 'MJohnson');
INSERT INTO Users VALUES (7703, 'Will', 'Smith', 'WSmith@asu.edu', 'Pa$$word!!', '2000-11-09', 'WSmith');
INSERT INTO Users VALUES (7704, 'Olivia', 'Davis', 'ODavis@asu.edu', 'Pa$$word!!', '1995-06-03', 'ODavis');
INSERT INTO Users VALUES (7705, 'Ethan', 'Martinez', 'EMartinez@asu.edu', 'Pa$$word!!', '1983-12-18', 'EMartinez');
INSERT INTO Users VALUES (7706, 'Alexander', 'Perez', 'APerez@gmail.com', 'my$ecureP4ssW0RD', '1998-04-27', 'APerez');
INSERT INTO Users VALUES (7707, 'Lily', 'Harris', 'LHarris@gmail.com', 'my$ecureP4ssW0RD', '1990-08-14', 'LHarris');
INSERT INTO Users VALUES (7708, 'Lily', 'Johnson', 'LJohnson@gmail.com', 'my$ecureP4ssW0RD', '2001-02-05', 'LJohnson');
INSERT INTO Users VALUES (7709, 'Daniel', 'Miller', 'DMiller@asu.edu', 'Pa$$word!!', '1985-10-30', 'DMiller');
INSERT INTO Users VALUES (7710, 'Dave', 'McDonald', 'DMcDonald@asu.edu', 'Pa$$word!!', '2004-09-12', 'DMcDonald');

-- Insert into Publisher
INSERT INTO Publisher VALUES (1101, 'Activision', '123 Maple Street', 'Arizona', '85224', 'info@Activision.com');
INSERT INTO Publisher VALUES (1102, 'Nintendo', '456 Oak Avenue', 'Florida', '30301', 'info@Nintendo.com');
INSERT INTO Publisher VALUES (1103, 'Rockstar Games', '789 Pine Road', 'Nevada', '10001', 'info@Rockstar Games.com');
INSERT INTO Publisher VALUES (1104, 'Electronic Arts Inc.', '321 Birch Lane', 'Maine', '60614', 'info@ea.com');
INSERT INTO Publisher VALUES (1105, 'Ubisoft', '654 Cedar Boulevard', 'Texas', '75201', 'info@Ubisoft.com');
INSERT INTO Publisher VALUES (1106, 'Bohemia Interactive', '987 Walnut Drive', 'Montana', '94105', 'info@Bohemia.com');
INSERT INTO Publisher VALUES (1107, 'Capcom', '246 Elm Street', 'Alabama', '85001', 'info@Capcom.com');
INSERT INTO Publisher VALUES (1108, 'Blizzard', '135 Spruce Court', 'Ohio', '02108', 'info@Blizzard.com');
INSERT INTO Publisher VALUES (1109, 'Bandai Namco', '864 Aspen Circle', 'Oregon', '48201', 'info@Bandai Namco.com');
INSERT INTO Publisher VALUES (1110, 'Sony Interactive', '579 Willow Avenue', 'Georgia', '73101', 'info@Sony Interactive.com');

-- Insert into Games
INSERT INTO Games VALUES (6601, 'Call of Duty: Black Ops 6', 'Call of Duty: Black Ops 6 very descriptive description, Call of Duty: Black Ops 6 is a M rated game!', 'M', '2024-10-25', 69.99, 1101);
INSERT INTO Games VALUES (6602, 'Call of Duty: Modern Warfare 2', 'Call of Duty: Modern Warfare 2 very descriptive description, Call of Duty: Modern Warfare 2 is a M rated game!', 'M', '2009-11-10', 19.99, 1101);
INSERT INTO Games VALUES (6603, 'Animal Crossing: New Horizons', 'Animal Crossing: New Horizons very descriptive description, Animal Crossing: New Horizons is a E rated game!', 'E', '2020-03-20', 59.99, 1102);
INSERT INTO Games VALUES (6604, 'Mario Kart 8 Deluxe', 'Mario Kart 8 Deluxe very descriptive description, Mario Kart 8 Deluxe is a E rated game!', 'E', '2017-04-28', 59.99, 1102);
INSERT INTO Games VALUES (6605, 'Grand Theft Auto V', 'Grand Theft Auto V very descriptive description, Grand Theft Auto V is a M rated game!', 'M', '2013-09-17', 29.99, 1103);
INSERT INTO Games VALUES (6606, 'Red Dead Redemption 2', 'Red Dead Redemption 2 very descriptive description, Red Dead Redemption 2 is a M rated game!', 'M', '2018-10-26', 59.99, 1103);
INSERT INTO Games VALUES (6607, 'FIFA 2024', 'FIFA 2024 very descriptive description, FIFA 2024 is a E rated game!', 'E', '2023-09-29', 69.99, 1104);
INSERT INTO Games VALUES (6608, 'The Sims 4', 'The Sims 4 very descriptive description, The Sims 4 is a T rated game!', 'T', '2014-09-02', 39.99, 1104);
INSERT INTO Games VALUES (6609, 'Tom Clancy''s Rainbow Six Siege', 'Tom Clancy''s Rainbow Six Siege very descriptive description, Tom Clancy''s Rainbow Six Siege is a T rated game!', 'T', '2015-12-01', 19.99, 1105);
INSERT INTO Games VALUES (6610, 'Assassin''s Creed Shadows', 'Assassin''s Creed Shadows very descriptive description, Assassin''s Creed Shadows is a T rated game!', 'T', '2025-02-14', 69.99, 1105);
INSERT INTO Games VALUES (6611, 'Arma III', 'Arma III very descriptive description, Arma III is a M rated game!', 'M', '2013-09-12', 39.99, 1106);
INSERT INTO Games VALUES (6612, 'DayZ', 'DayZ very descriptive description, DayZ is a M rated game!', 'M', '2018-12-13', 49.99, 1106);
INSERT INTO Games VALUES (6613, 'Resident Evil 4 / Remake', 'Resident Evil 4 / Remake very descriptive description, Resident Evil 4 / Remake is a M rated game!', 'M', '2023-03-24', 59.99, 1107);
INSERT INTO Games VALUES (6614, 'Street Fighter', 'Street Fighter very descriptive description, Street Fighter is a T rated game!', 'T', '2023-06-02', 59.99, 1107);
INSERT INTO Games VALUES (6615, 'Overwatch 2', 'Overwatch 2 very descriptive description, Overwatch 2 is a E rated game!', 'E', '2022-10-04', 39.99, 1108);
INSERT INTO Games VALUES (6616, 'Starcraft II', 'Starcraft II very descriptive description, Starcraft II is a T rated game!', 'T', '2010-07-27', 39.99, 1108);
INSERT INTO Games VALUES (6617, 'Elden Ring', 'Elden Ring very descriptive description, Elden Ring is a T rated game!', 'T', '2022-02-25', 59.99, 1109);
INSERT INTO Games VALUES (6618, 'Dark Souls III', 'Dark Souls III very descriptive description, Dark Souls III is a T rated game!', 'T', '2016-04-12', 59.99, 1109);
INSERT INTO Games VALUES (6619, 'The Last Of Us', 'The Last Of Us very descriptive description, The Last Of Us is a M rated game!', 'M', '2013-06-14', 59.99, 1110);
INSERT INTO Games VALUES (6620, 'Marvel''s Spider-Man', 'Marvel''s Spider-Man very descriptive description, Marvel''s Spider-Man is a T rated game!', 'T', '2018-09-07', 59.99, 1110);


-- Insert into Orders (Transactional)
INSERT INTO Orders VALUES (8801, 7703, 6613, 59.99, '2024-06-28');
INSERT INTO Orders VALUES (8802, 7704, 6615, 39.99, '2024-06-05');
INSERT INTO Orders VALUES (8803, 7706, 6609, 19.99, '2024-10-13');
INSERT INTO Orders VALUES (8804, 7705, 6605, 29.99, '2024-11-08');
INSERT INTO Orders VALUES (8805, 7708, 6606, 59.99, '2024-05-21');
INSERT INTO Orders VALUES (8806, 7710, 6613, 59.99, '2024-08-24');
INSERT INTO Orders VALUES (8807, 7709, 6616, 39.99, '2024-10-24');
INSERT INTO Orders VALUES (8808, 7710, 6611, 39.99, '2024-02-22');
INSERT INTO Orders VALUES (8809, 7708, 6604, 59.99, '2024-07-25');
INSERT INTO Orders VALUES (8810, 7705, 6602, 19.99, '2024-09-27');
INSERT INTO Orders VALUES (8811, 7706, 6602, 19.99, '2024-03-20');
INSERT INTO Orders VALUES (8812, 7703, 6608, 39.99, '2024-01-26');
INSERT INTO Orders VALUES (8813, 7701, 6609, 19.99, '2024-05-09');
INSERT INTO Orders VALUES (8814, 7709, 6602, 19.99, '2024-02-13');
INSERT INTO Orders VALUES (8815, 7706, 6604, 59.99, '2024-03-15');
INSERT INTO Orders VALUES (8816, 7705, 6617, 59.99, '2024-01-28');
INSERT INTO Orders VALUES (8817, 7703, 6616, 39.99, '2024-07-16');
INSERT INTO Orders VALUES (8818, 7702, 6611, 39.99, '2024-12-23');
INSERT INTO Orders VALUES (8819, 7706, 6601, 69.99, '2024-11-14');
INSERT INTO Orders VALUES (8820, 7705, 6608, 39.99, '2024-07-26');
INSERT INTO Orders VALUES (8821, 7704, 6606, 59.99, '2024-03-08');
INSERT INTO Orders VALUES (8822, 7710, 6601, 69.99, '2024-04-09');
INSERT INTO Orders VALUES (8823, 7704, 6618, 59.99, '2024-09-20');
INSERT INTO Orders VALUES (8824, 7703, 6611, 39.99, '2024-08-24');
INSERT INTO Orders VALUES (8825, 7701, 6605, 29.99, '2024-07-29');
INSERT INTO Orders VALUES (8826, 7704, 6603, 59.99, '2024-07-25');
INSERT INTO Orders VALUES (8827, 7705, 6617, 59.99, '2024-03-11');
INSERT INTO Orders VALUES (8828, 7701, 6610, 69.99, '2024-04-23');
INSERT INTO Orders VALUES (8829, 7703, 6607, 69.99, '2024-02-11');
INSERT INTO Orders VALUES (8830, 7707, 6614, 59.99, '2024-06-04');

-- Insert Into Reviews (Transactional)
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2201, 7704, 6603, 4, 'Good Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2202, 7703, 6608, 1, 'Awful Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2203, 7705, 6608, 5, 'Great Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2204, 7704, 6618, 5, 'Great Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2205, 7705, 6617, 5, 'Great Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2206, 7704, 6615, 3, 'Fine Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2207, 7708, 6604, 3, 'Fine Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2208, 7710, 6611, 2, 'Bad Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2209, 7702, 6611, 4, 'Good Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars, ReviewDesc) VALUES (2210, 7710, 6602, 2, 'Bad Review');
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2211, 7703, 6611, 3);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2212, 7706, 6601, 4);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2213, 7706, 6602, 4);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2214, 7701, 6605, 3);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2215, 7703, 6607, 2);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2216, 7704, 6606, 4);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2217, 7709, 6616, 3);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2218, 7707, 6614, 4);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2219, 7703, 6613, 5);
INSERT INTO Reviews (ReviewID, UserID, GameID, ReviewStars) VALUES (2220, 7706, 6604, 3);

-- Insert Into Discount
INSERT INTO Discount VALUES (5501, '2025-12-31', 7701);
INSERT INTO Discount VALUES (5502, '2025-12-31', 7702);
INSERT INTO Discount VALUES (5503, '2025-12-31', 7703);
INSERT INTO Discount VALUES (5504, '2025-12-31', 7704);
INSERT INTO Discount VALUES (5505, '2025-12-31', 7705);
INSERT INTO Discount VALUES (5506, '2025-12-31', 7706);
INSERT INTO Discount VALUES (5507, '2025-12-31', 7707);
INSERT INTO Discount VALUES (5508, '2025-12-31', 7708);
INSERT INTO Discount VALUES (5509, '2025-12-31', 7709);
INSERT INTO Discount VALUES (5510, '2025-12-31', 7710);


--- Views ---
/* The following view will show all orders of a particular game; in this case, Call of Duty: Modern Warfare 2.
** This is useful for accessing how many sales a particular game has had. */

IF OBJECT_ID('CODMW2Orders', 'v') IS NOT NULL
	DROP VIEW CODMW2Orders;
GO
CREATE VIEW CODMW2Orders AS
	SELECT Title, OrderID, UserID
		FROM Games g JOIN Orders o ON g.GameID = o.GameID
		WHERE g.GameID = 6602;
GO
SELECT * FROM CODMW2Orders;
GO

/* The following view will show all reviews by a specific user; in this case Olivia Davis.
** This is helpful to see how a particular user feels about games, potentially to recommend games they might like. */

IF OBJECT_ID('ODReviews', 'v') IS NOT NULL
	DROP VIEW ODReviews;
GO
CREATE VIEW ODReviews AS
	SELECT LastName, FirstName, Title, ReviewStars, ReviewDesc
		FROM Users u JOIN Reviews r ON u.UserID = r.UserID
			JOIN Games g ON r.GameID = g.GameID
		WHERE u.UserID = 7704;
GO
SELECT * FROM ODReviews;
GO

/* The following view will show the number of purchases per publisher, it is useful because it can show which publisher is the most popular and can be	
** used by the publisher to see how much their games are selling on our website. It can also be used by us to determine if we want to keep selling
** games by this publisher.
*/


IF OBJECT_ID('TopPublisher', 'v') IS NOT NULL
	DROP VIEW TopPublisher;
GO
CREATE VIEW TopPublisher AS
	SELECT Publisher.Name, Games.PublisherID, COUNT(Orders.OrderID) AS Num_Of_Purchases
		FROM Games
		INNER JOIN Orders ON Games.GameID = Orders.GameID	
		INNER JOIN Publisher ON Games.PublisherID = Publisher.PublisherID
		WHERE Games.PublisherID = 1101
		GROUP BY Publisher.Name, Games.PublisherID;
GO
Select * FROM TopPublisher;
GO

--- Audit Table ---
-- Create Audit Table
CREATE TABLE AuditTable (
	AuditID INT IDENTITY(1, 1) PRIMARY KEY,
	TableName VARCHAR(25) NOT NULL,
	ChangeDate DATETIME,
	Operation VARCHAR(25) NOT NULL
);
GO

-- Creating a trigger to log UPDATE actions
CREATE TRIGGER Audit_Update
ON Orders
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
	INSERT INTO AuditTable (TableName, ChangeDate, Operation)
	SELECT 'Orders', GETDATE(), 'UPDATE'
	FROM deleted
	INNER JOIN inserted ON deleted.OrderID = inserted.OrderID;
END;
GO

-- Creating a trigger to log INSERT actions
CREATE TRIGGER Audit_Insert
ON Orders
AFTER INSERT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted)
	INSERT INTO AuditTable (TableName, ChangeDate, Operation)
	SELECT 'Orders', GETDATE(), 'INSERT'
	FROM inserted
END;
GO

-- Creating a trigger to log DELETE actions
CREATE TRIGGER Audit_Delete
ON Orders
AFTER DELETE
AS
BEGIN
	IF EXISTS (SELECT 1 FROM deleted)
	INSERT INTO AuditTable (TableName, ChangeDate, Operation)
	SELECT 'Orders', GETDATE(), 'DELETE'
	FROM deleted
END;
GO

-- Test the Audit Table
INSERT INTO Orders VALUES (8834, 7705, 6602, 19.99, '2024-09-27');
GO
UPDATE Orders SET Total = 29.99 WHERE OrderID = 8834;
GO
DELETE FROM Orders WHERE OrderID = 8834;
GO

-- View Audit Table
Select * FROM AuditTable;
GO

--- Stored Procedure ---
-- Creating a stored procedure to find the total dollar amount of games sales across a certain date range
CREATE PROCEDURE GamePurchaseRange
@DateMin varchar(10) = NULL, 
@DateMax varchar(10) = NULL
AS
DECLARE @ConvertedDateMin date
DECLARE @ConvertedDateMax date
SET @ConvertedDateMin = convert(date, @DateMin, 126)
SET @ConvertedDateMax = convert(date, @DateMax, 126)

IF(@DateMin IS NULL OR @DateMin = '')
BEGIN
	RAISERROR('Please enter a minimum and maximum date', 18, 0)
	RETURN
END

IF(@DateMax IS NULL OR @DateMax = '')
BEGIN
	RAISERROR('Please enter a minimum and maximum date', 18, 0)
	RETURN
END

IF(ISDATE(@DateMin) != 1 AND ISDATE(@DateMax) != 1)
BEGIN
	RAISERROR('Invalid Date Parameter', 18, 0)
	RETURN
END

IF(@DateMin >= @DateMax)
BEGIN
	RAISERROR('The minimum date is greater than the maximum', 18, 0)
	RETURN
END
ELSE
BEGIN
	SELECT OrderID, UserID, GameID, Total, OrderDate FROM Orders
	WHERE OrderDate BETWEEN @DateMin AND @DateMax

	Select SUM(Total) as TotalSalesAmount FROM Orders
	WHERE OrderDate BETWEEN @DateMin AND @DateMax
END;
GO

-- Show all games within Q1 range.
EXEC GamePurchaseRange @DateMin = '2024-01-01', @DateMax = '2024-03-01';
GO

-- Drop Procedure
DROP PROCEDURE GamePurchaseRange;
GO

--- Cursor ---
-- The following cursor will be used to print relevant information about all the games in the game store's database.
DECLARE @TitleVar VARCHAR(40), @DescVar VARCHAR(250), @MatVar VARCHAR(4), @PriceVar MONEY;

IF CURSOR_STATUS('global', 'InfoCursor') >= -1
	BEGIN DEALLOCATE InfoCursor END

DECLARE InfoCursor CURSOR FOR
	SELECT Title, Description, MaturityRating, Price FROM Games ORDER BY Title;

OPEN InfoCursor;
FETCH NEXT FROM InfoCursor INTO @TitleVar, @DescVar, @MatVar, @PriceVar;
WHILE @@FETCH_STATUS <> -1
BEGIN
	PRINT @TitleVar + CHAR(9) + @DescVar + CHAR(9) + @MatVar + CHAR(9) + '$' + CONVERT(VARCHAR(10),@PriceVar)
	FETCH NEXT FROM InfoCursor INTO @TitleVar, @DescVar, @MatVar, @PriceVar;
END
CLOSE InfoCursor;
DEALLOCATE InfoCursor;
GO
