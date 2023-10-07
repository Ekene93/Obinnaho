create database GratiasStore;
use GratiasStore;
create table Customer (
CustomerID INTEGER PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
Email VARCHAR(255),
PhoneNumber VARCHAR(15),
Address TEXT
);

create table Inventory (
ProductID INTEGER PRIMARY KEY,
ProductName VARCHAR(255),
Description TEXT,
Price DECIMAL(10, 2),
OpeningBalance INT,
QuantityRecieved INT,
QuantitySold INT,
ClosingBalance INT 
);

INSERT INTO Customer(CustomerID,FirstNmae, LastName, Email, PhoneNumber, Address)
VALUES ('001','JENNY', 'OKARO', 'jennyO@gmail.com', '07061877206', '12 diamond estate sagamu');
DESC customer;

INSERT INTO Inventory ( ProductID,ProductName,Description,Price,OpeningBalance,QuantityRecieved,QuantitySold,ClosingBalance)
VALUES ('0001','FAN','BG001',5000,25,0,10,15);

UPDATE Inventory
SET ClosingBalance = OpeningBalance + QuantityRecieved - QuantitySold;

INSERT INTO Customer (CustomerID, FirstNmae, LastName, Email, PhoneNumber, Address)
VALUES
    ('002','Alice', 'Johnson', 'alice@example.com', '555-123-4567', '456 Elm St'),
    ('003','Bob', 'Smith', 'bob@example.com', '555-987-6543', '789 Oak Ave'),
    ('004','Emily', 'Davis', 'emily@example.com', '555-555-5555', '123 Maple Rd'),
    ('005','Michael', 'Brown', 'michael@example.com', '555-111-2222', '789 Cherry Ln'),
    ('006','Sophia', 'Williams', 'sophia@example.com', '555-888-9999', '234 Birch Rd'),
    ('007','William', 'Jones', 'william@example.com', '555-444-7777', '567 Pine St'),
    ('008','Olivia', 'Martinez', 'olivia@example.com', '555-333-6666', '890 Cedar Ave'),
    ('009','James', 'Garcia', 'james@example.com', '555-666-3333', '901 Oak St'),
    ('010','Emma', 'Miller', 'emma@example.com', '555-222-8888', '345 Elm Ave'),
    ('011','Liam', 'Lopez', 'liam@example.com', '555-777-4444', '678 Maple Rd'),
    ('012','Ava', 'Rodriguez', 'ava@example.com', '555-555-5555', '789 Pine Ln'),
    ('013','Noah', 'Lee', 'noah@example.com', '555-222-1111', '234 Oak Rd'),
    ('014','Isabella', 'Hall', 'isabella@example.com', '555-999-6666', '567 Birch St'),
    ('015','Ethan', 'Turner', 'ethan@example.com', '555-666-5555', '890 Cedar Ave'),
    ('016','Mia', 'White', 'mia@example.com', '555-333-4444', '901 Elm St'),
    ('017','Oliver', 'Jackson', 'oliver@example.com', '555-888-3333', '345 Maple Ave'),
    ('018','Ava', 'Harris', 'ava@example.com', '555-444-7777', '678 Pine Rd'),
    ('019','Liam', 'Martin', 'liam@example.com', '555-777-9999', '789 Oak Ave'),
    ('020','Emma', 'Thompson', 'emma@example.com', '555-555-2222', '234 Cedar St'),
    ('021','Olivia', 'Gonzalez', 'olivia@example.com', '555-222-3333', '567 Birch Ave');
    
    INSERT INTO Inventory (ProductID,ProductName, Description, Price, OpeningBalance, QuantityRecieved, QuantitySold)
VALUES
    ('0002','Widget', 'A widget description', 9.99, 100, 50, 25),
    ('0003','Gadget', 'A gadget description', 19.99, 150, 75, 50),
    ('0004','Doodad', 'A doodad description', 7.99, 80, 40, 20),
    ('0005','Thingamajig', 'A thingamajig description', 14.99, 200, 100, 60),
    ('0006','Whatchamacallit', 'A whatchamacallit description', 12.99, 120, 60, 40),
    ('0007','Widget2', 'Another widget description', 11.99, 90, 45, 30),
    ('0008','Gadget2', 'Another gadget description', 24.99, 180, 90, 70),
    ('0009','Doodad2', 'Another doodad description', 8.99, 100, 50, 30),
    ('0010','Thingamajig2', 'Another thingamajig description', 17.99, 220, 110, 80),
    ('0011','Whatchamacallit2', 'Another whatchamacallit description', 15.99, 150, 75, 50);

select ProductName, ClosingBalance
from Inventory;

UPDATE Inventory
SET ClosingBalance = OpeningBalance + QuantityRecieved - QuantitySold;

select ProductName, ClosingBalance
from Inventory;
-- products that are currently in stock
select ProductName from inventory 
where ClosingBalance > 0;

use GratiasStore;

select ProductName from Inventory where ClosingBalance < 10;
-- total revenue generated from sales
select sum(price * QuantitySold) AS TotalRevenue FROM Inventory; 

-- top customers by total amount spent

select
c.CustomerID, c.FirstNmae, c.LastName,
sum(i.price * i.QuantitySold) AS TotalAmountSpent
from Customer c
join Inventory i ON c.CustomerID = c.CustomerID
GROUP BY
c.CustomerID, c.FirstNmae, c.LastName
ORDER BY 
TotalAmountSpent DESC;

-- average price of all products in stock

select AVG(price) AS AveragePrice from Inventory 
where ClosingBalance > 0;

-- total inventory values for all products available
select sum(price * ClosingBalance) AS TotalValue
from Inventory; 

-- which products where sold to emily

select ProductName from Inventory
where ProductID IN 
(select ProductID FROM Customer where CustomerID = '004');






