----use CareElectShop

CREATE TABLE ItemCategoryMaster
(
ItemCategoryId int	PRIMARY KEY NONCLUSTERED IDENTITY(1,1),
ItemCategoryName varchar(50) UNIQUE,
ItemCategoryShortname varchar(10) UNIQUE,
Isactive CHAR(1) NOT NULL
)


INSERT INTO ItemCategoryMaster(ItemCategoryName,ItemCategoryShortname,Isactive) VALUES ('LAPTOP','LPT','Y')
INSERT INTO ItemCategoryMaster(ItemCategoryName,ItemCategoryShortname,Isactive) VALUES ('MOBILE PHONE','MOB','Y')
INSERT INTO ItemCategoryMaster(ItemCategoryName,ItemCategoryShortname,Isactive) VALUES ('TABLETS','TAB','Y')
INSERT INTO ItemCategoryMaster(ItemCategoryName,ItemCategoryShortname,Isactive) VALUES ('TELEVISION','TV','Y')
INSERT INTO ItemCategoryMaster(ItemCategoryName,ItemCategoryShortname,Isactive) VALUES ('ACCESSORIES','ACCR','Y')
INSERT INTO ItemCategoryMaster(ItemCategoryName,ItemCategoryShortname,Isactive) VALUES ('CAMERAS','CMR','Y')

SELECT * FROM ItemCategoryMaster




CREATE TABLE BrandMaster
(
BrandId	INT	PRIMARY KEY NONCLUSTERED IDENTITY(100,1),
BrandName VARCHAR(50) UNIQUE,
BrandShortName VARCHAR(10) UNIQUE,
Isactive CHAR(1) NOT NULL
)


INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('SAMSUNG','SMG','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('HEWLETT-PACKARD','HP','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('LENOVO','LNV','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('DELL','DELL','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('MICROSOFT','MS','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('APPLE','APP','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('LUCKY GOLDSTAR','LG','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('NIKON','NKN','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('CANON','CAN','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('TRANSCEND','TRN','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('SEAGATE','SGT','Y')
INSERT INTO BrandMaster(BrandName,BrandShortName,Isactive) VALUES ('SONY','SONY','Y')

select * from BrandMaster

CREATE TABLE ItemMaster
(
ItemId	INT	PRIMARY KEY  NONCLUSTERED IDENTITY(1000,1),
ItemName VARCHAR(50) UNIQUE,
ItemCategory INT FOREIGN KEY REFERENCES ItemCategoryMaster(ItemCategoryId),
ItemBrand INT FOREIGN KEY REFERENCES BrandMaster(BrandId),
ItemPrice DECIMAL(10,2) NOT NULL,
ImageSmallURL VARCHAR(500) NOT NULL,
ImageBigURL	VARCHAR(500) NOT NULL,
ItemDescription	VARCHAR(500) NOT NULL,
ItemColor VARCHAR(100) NOT NULL,
Isactive CHAR(1) NOT NULL
)

INSERT INTO ItemMaster VALUES ('Apple_Charger',5, 104,2000,'images\200_200\Apple_Charger','images\400_400\Apple_Charger','Universal Apple charger for all IPhones','White','Y') 
INSERT INTO ItemMaster VALUES ('Apple_I6',2, 104,60000,'images\200_200\Apple_I6','images\400_400\Apple_I6','Apple IPhone with 32GB internal memory','White','Y') 
INSERT INTO ItemMaster VALUES ('Apple_MacAir',2, 104,96900,'images\200_200\Apple_MacAir','images\400_400\Apple_MacAir','APPLE MACBOOK AIR 13-INCH CORE I5 1.6GHZ/4GB/256GB/INTEL HD 6000','White','Y') 
INSERT INTO ItemMaster VALUES ('Canon_dslr',6, 107,44330,'images\200_200\Canon_dslr','images\400_400\Canon_dslr','Canon EOS 750D 24.2MP Digital SLR Camera (Black) with Body only, Memory card, Camera Bag','Black','Y') 
INSERT INTO ItemMaster VALUES ('Dell_inspiron',1, 102,39300,'images\200_200\Dell_inspiron','images\400_400\Dell_inspiron','Dell Inspiron 3148 11.6-inch Laptop (Core i3/4GB/500GB HDD/Windows 8.1/Intel HD Graphics)','Red','Y') 
INSERT INTO ItemMaster VALUES ('Dell_Venue_8',3, 102,15200,'images\200_200\Dell_Venue_8','images\400_400\Dell_Venue_8','Dell Venue 8 Tablet (16GB, WiFi)','Black','Y') 
INSERT INTO ItemMaster VALUES ('HP_V3000',1, 111,15200,'images\200_200\Dell_Venue_8','images\400_400\Dell_Venue_8','Dell Venue 8 Tablet (16GB, WiFi)','Black','Y') 


select * from ItemMaster

CREATE TABLE UserRegistration
(
UserId	INT	PRIMARY KEY NONCLUSTERED IDENTITY(1000,1),
UserName VARCHAR(200) UNIQUE,
[Address] VARCHAR(1000)	NOT NULL,
AlternateNo	VARCHAR(10),	
EmailId	VARCHAR(50)	UNIQUE,
[Password]	VARCHAR(50)	NOT NULL,
MobileNo VARCHAR(10) UNIQUE,
Isactive CHAR(1) NOT NULL
)


INSERT INTO UserRegistration VALUES ('Animesh Jha', 'KR Puram', '8591822564','animeshjha3@gmail.com','Animesh@33','7508023182','Y')
INSERT INTO UserRegistration VALUES ('Asha Kumari', 'Marathahalli', '9611441523','ashasingh@gmail.com','Asha@123','9611441523','Y')
INSERT INTO UserRegistration VALUES ('Chintamani Pradhan', 'Sarjapura', '7847066797','chintamanipradhan06@gmail.com','chinthamani@123','7847066797','Y')
INSERT INTO UserRegistration VALUES ('Sony Rathnakar', 'Kundanahalli', '8105683049','sonykodkaniratnakar@gmail.com','sony@123','8105683049','Y')
INSERT INTO UserRegistration VALUES ('Ganesh N', 'Hebbal', '9845564427','ganeshsoftarch@gmail.com','ganesh@123','9845564427','Y')


select * from UserRegistration


CREATE TABLE OrderMaster 
(
OrderId BIGINT PRIMARY KEY IDENTITY (1,1),
UserId INT FOREIGN KEY REFERENCES UserRegistration(UserId),
TotalAmount DECIMAL (10,2) NOT NULL,
OrderStatus VARCHAR (20) check (OrderStatus in ('Processing','Processed','Failed')) NOT NULL,
OrderDate DATETIME NOT NULL
)


INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1001,500.00,'Processing','10/24/2015')
INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1003,450.00,'Processing','11/01/2015')
INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1001,600.00,'Processing','11/15/2015')
INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1003,700.00,'Processing','12/17/2015')
INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1001,1000.00,'Processing','01/03/2015')
INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1003,1200.00,'Processing','01/25/2016')
INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1001,1100.00,'Processing','02/05/2016')
INSERT INTO OrderMaster(UserId,TotalAmount,OrderStatus,OrderDate) VALUES (1003,1140.00,'Processing','03/24/2016')

select * from OrderMaster

CREATE TABLE OrderMasterDetails 
(
OrderMasterDetailsId INT PRIMARY KEY IDENTITY (1,1),
OrderId BIGINT FOREIGN KEY REFERENCES OrderMaster (OrderId),
ItemId INT FOREIGN KEY REFERENCES ItemMaster (ItemId),
Quantity INT NOT NULL,
SubTotal BIGINT NOT NULL
)


INSERT INTO OrderMasterDetails VALUES (2,1003,2,88600)
INSERT INTO OrderMasterDetails VALUES (4,1004,1,39300)
INSERT INTO OrderMasterDetails VALUES (8,1000,1,2000)

select * from OrderMasterDetails


CREATE TABLE CardMaster 
(
CardNumber	BIGINT	PRIMARY KEY,
Cvv INT NOT NULL,	
CardExpiryDate VARCHAR(7) NOT NULL,	
CardHolderName VARCHAR(100) NOT NULL,
CardHolderAddress VARCHAR(500) NOT NULL,
CardHolderContact VARCHAR(10) NOT NULL,
AccountBalance DECIMAL (8,2) NOT NULL
)


INSERT INTO CardMaster
(CardNumber,Cvv,CardExpiryDate,CardHolderName,CardHolderAddress,CardHolderContact,AccountBalance) 
VALUES 
(5103720004702104,480,'12/2020','Animesh Jha','West Bengal','8591822564',25000.00)

INSERT INTO CardMaster
(CardNumber,Cvv,CardExpiryDate,CardHolderName,CardHolderAddress,CardHolderContact,AccountBalance) 
VALUES 
(5103750004802110,500,'08/2021','Avinash Jha','Bangalore','7508023182',50000.00)


INSERT INTO CardMaster
(CardNumber,Cvv,CardExpiryDate,CardHolderName,CardHolderAddress,CardHolderContact,AccountBalance) 
VALUES 
(5120720006002200,625,'12/2025','Rohit Dhand', 'Canada','8591855642',100000.00)

select * from CardMaster



CREATE TABLE TransactionMaster
(
	TransactionId BIGINT PRIMARY KEY,
	OrderId BIGINT FOREIGN KEY REFERENCES OrderMaster (OrderId),
	UserId INT FOREIGN KEY REFERENCES UserRegistration(UserId),
	CardNumber	BIGINT	FOREIGN KEY REFERENCES CardMaster(CardNumber),
	TransactionDate	DATETIME NOT NULL,
	TransactionAmount DECIMAL(8,2) NOT NULL,
	--OTP	INT	NOT NULL,
	TransactionStatus VARCHAR(10) NOT NULL
	--TranasactionFailureMessage VARCHAR(30)	
)




CREATE PROCEDURE GetItemMasterDetails
AS
BEGIN
SELECT IM.[ItemId],IM.[ItemName],ICM.[ItemCategoryName], IM.[ItemPrice], IM.[ImageSmallURL],IM.[ItemDescription], 
BM.[BrandName]
FROM [ItemCategoryMaster] ICM 
INNER JOIN
[ItemMaster] IM ON ICM.[ItemCategoryId] = IM.[ItemCategory] 
INNER JOIN
[BrandMaster] BM ON BM.BrandId = IM.ItemBrand
WHERE IM.Isactive = 'Y'
END


CREATE PROCEDURE [sp_CreditCardMasterInfo]
 (
 @CardMaster BIGINT,
 @Cvv int
) AS
BEGIN 
SELECT * from CardMaster WHERE CardNumber=@CardMaster AND Cvv=@Cvv
END



Exec sp_CreditCardMasterInfo 5103720004702104,480


ALTER PROCEDURE AuthenticateCard
@CardNumber  BIGINT
AS
BEGIN
SELECT [CardNumber], [Cvv], [CardExpiryDate] from CardMaster where CardNumber = @CardNumber
END 


