CREATE DATABASE mdisubd_db

CREATE TABLE PersonalData
(
	PersonalDataID smallserial PRIMARY KEY,
	PersonName varchar(30) NOT NULL,
	PersonSurname varchar(30) NOT NULL,
	PersonPatronimyc varchar(30) NOT NULL,
	PersonPhone numeric UNIQUE
);

CREATE TABLE UserLog
(
	LogID smallserial PRIMARY KEY,
	LogType varchar(60) NOT NULL,
	LogMsg varchar(60) NOT NULL,
	PersonalDataID smallserial NOT NULL,
	FOREIGN KEY (PersonalDataID) REFERENCES PersonalData(PersonalDataID)
);

CREATE TABLE Provider
(
	ProviderID smallserial PRIMARY KEY,
	ProviderName varchar(60) 
	ProviderEmail varchar(50) NOT NULL UNIQUE,
	FOREIGN KEY (PersonalDataID) REFERENCES PersonalData(PersonalDataID)
);

CREATE TABLE Branch
(
	BranchID smallserial PRIMARY KEY,
	BranchAdress varchar(100) NOT NULL UNIQUE,
	BranchName varchar(30) NOT NULL
);

CREATE TABLE Customer
(  
	CustomerID smallserial PRIMARY KEY,
	PassportNumber numeric NOT NULL UNIQUE,
	PersonalDataID smallserial NOT NULL,
	BranchID smallserial NOT NULL,
	FOREIGN KEY (PersonalDataID) REFERENCES PersonalData(PersonalDataID),
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Employee
(  
	EmployeeID smallserial PRIMARY KEY,
	DateOfBirth date NOT NULL,
	WorkExperience smallint NOT NULL,
	WorkPosition varchar(50) NOT NULL,
	PersonalDataID smallserial NOT NULL,
	BranchID smallserial NOT NULL,
	FOREIGN KEY (PersonalDataID) REFERENCES PersonalData(PersonalDataID),
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Cart
(
	CartID smallint PRIMARY KEY,
	CustomerID smallint NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Car
(
	CarID smallserial PRIMARY KEY,
	Brand varchar(50) NOT NULL,
	ReleaseYear smallint NOT NULL,
	Color varchar(30) NOT NULL,
	CarPrice money NOT NULL,
	BodyType varchar(30) NOT NULL,
	CountryOfAssembly varchar(30) NOT NULL,
	IsBought boolean ,
	BranchID smallserial NOT NULL,
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE CartProduct
(
	CartProductID smallserial PRIMARY KEY,
	TotalPrice int CONSTRAINT cartproduct_totalprice_check  CHECK(TotalPrice >0 ),
	CarID smallserial NOT NULL,
	CartID smallserial NOT NULL,
	FOREIGN KEY (CarID) REFERENCES Car(CarID),
	FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);
CREATE TABLE Delivery 
(
	DeliveryID smallserial PRIMARY KEY,
	DeliveryDate date NOT NULL,
	DeliveryMethod varchar(60) NOT NULL,
	DeliveryPrice int CONSTRAINT deliveryprice_check CHECK(DeliveryPrice>0),
	BranchID smallserial NOT NULL,
	CarID smallserial NOT NULL,
	ProviderID smallserial NOT NULL,
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
	FOREIGN KEY (CarID) REFERENCES Car(CarID),
	FOREIGN KEY (ProviderID) REFERENCES Provider(ProviderID)
);

CREATE TABLE Sale
(
	SaleID smallserial PRIMARY KEY,
	SalePrice int CONSTRAINT saleprice_check CHECK(SalePrice>0),
	CarID smallserial NOT NULL,
	CustomerID smallserial NOT NULL,
	BranchID smallserial NOT NULL,
	EmployeeID smallserial NOT NULL,
	FOREIGN KEY (CarID) REFERENCES Car(CarID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE PurchaseOrder
(
	PurchaseOrderID	smallserial PRIMARY KEY,
	PlacementDate	date NOT NULL,
	CompletionDate	date ,
	EmployeeID	smallserial NOT NULL,
	BranchID	smallserial NOT NULL,
	CustomerID	smallserial	 NOT NULL,
	CarID	smallserial NOT NULL,
	ProviderID	smallserial	NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (CarID) REFERENCES Car(CarID),
	FOREIGN KEY (ProviderID) REFERENCES Provider(ProviderID)
);
