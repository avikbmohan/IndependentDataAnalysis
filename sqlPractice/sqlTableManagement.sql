--- These examples are taken from both SQLZoo and w3schools.com ---

---1. Create a new table

CREATE TABLE t_test(
	a INTEGER PRIMARY KEY,
	b VARCHAR(10)
)

---2. Drop a table

DROP TABLE t_test

---3. Composite Primary Key

CREATE TABLE track(
	album CHAR(10) NOT NULL,
	dsk INTEGER NOT NULL,
	posn INTEGER NOT NULL,
	song VARCHAR(255),
	PRIMARY KEY (album, dsk, posn)
);

---4. Create a Foreign Key // Foreign Keys make sure to prevent destructive actions and also prevent invalid data from being inserted into the foreign key column
---MySQL
CREATE TABLE Orders(
	OrderID INT NOT NULL,
	OrderNum INT NOT NULL
	PersonID INT,
	PRIMARY KEY (OrderID),
	FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

---SQL Server / Oracle / MS Access:
CREATE TABLE Orders(
	OrderID INT NOT NULL PRIMARY KEY,
	OrderNum INT NOT NULL,
	PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

---5. Create FK constraint referencing persons on already created orders
--- All Platforms
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

---5.5 To allow naming of a fk constraint, and to define on multiple columns
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREING KEY (PersonI

---7. Drop FK constraint
---MySQL:
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

---SQL Server / Oracle / MS Access
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

---8. Alter Table - add column
ALTER TABLE table_name
ADD column_name datatype;

---9. Alter Table - drop column
ALTER TABLE table_name
DROP COLUMN column_name;

---10. Alter Table - alter column
---SQL Server / MS Access
ALTER TABLE table_name
ALTER COLUMN column_name datatype;

---My SQL / Oracle
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

---Oracle 10G and later:
ALTER TABLE table_name
MODIFY column_name datatype;