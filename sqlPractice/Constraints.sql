---Constraints, from w3schools

/* Constraint Types:
NOT NULL
UNIQUE // column-wise unique
PRIMARY KEY // combines not-null and unique
FOREIGN KEY // Uniquely identifies record in another table
CHECK // Check all col values against a particular condition
DEFAULT // Sets a default value for col when none is specified
INDEX // Used to create and retrieve data from db quickly
*/

--- NOT NULL
CREATE TABLE Persons(
	ID int NOT NULL,
	LName varchar(255) NOT NULL,
	FNAME varchar(255) NOT NULL,
	Age int
);

--- UNIQUE
CREATE TABLE Persons(
	ID int NOT NULL,
	LName varchar(255) NOT NULL,
	FNAME varchar(255) NOT NULL,
	CONSTRAINT UC_Person UNIQUE (ID, LName)
);

--- CHECK
CREATE TABLE Persons (
	ID int NOT NULL,
	LName varchar(255) NOT NULL,
	FNAME varchar(255) NOT NULL,
	Age int,
	CHECK (Age >=18)
);

--- DEFAULT
CREATE TABLE Persons (
	ID int NOT NULL,
	City varchar(255) DEFUALT 'New York',
	OrderDate date DEFAULT GETDATE()
);

--- Dropping DEFAULT
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

--- INDEX
CREATE INDEX index_name
ON table_name (col1, col2, ...);

CREATE UNIQUE INDEX index_name
ON table_name (col1, col2, ...);


--- AUTO_INCREMENT
CREATE TABLE Persons (
	ID int NOT NULL AUTO_INCREMENT,
	City varchar(255) DEFUALT 'New York',
	OrderDate date DEFAULT GETDATE()
);

ALTER TABLE Persons AUTO_INCREMENT=100;

/* Now, we dont have to specify ID val when inserting*/