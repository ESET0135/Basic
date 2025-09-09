create database smart_meter;

use smart_meter;

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Region VARCHAR(50)
);

--customer Data addition
select * from Customers;
insert into customers (CustomerId,Name,Address,Region) values (1,'A','add1','North')
insert into customers (CustomerId,Name,Address,Region) values (2,'B','add2','South')
insert into customers (CustomerId,Name,Address,Region) values (3,'C','add3','East')
insert into customers (CustomerId,Name,Address,Region) values (4,'D','add4','West')
insert into customers (CustomerId,Name,Address,Region) values (5,'E','add5','North')

--table creation
CREATE TABLE SmartMeterReadings (
    MeterId INT,
    CustomerId INT,
    Location VARCHAR(30),
    InstalledDate DATE,
    ReadingDateTime DATETIME,
    EnergyConsumed float,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);
drop table SmartMeterReadings;
select * from SmartMeterReadings;

--Data addition
insert into SmartMeterReadings (MeterId,CustomerId,Location,InstalledDate,
ReadingDateTime,EnergyConsumed) values (100,1,'add1','2020-01-01','2020-02-02',111.11) 
insert into SmartMeterReadings (MeterId,CustomerId,Location,InstalledDate,
ReadingDateTime,EnergyConsumed) values (200,2,'add2','2021-01-01','2021-02-02',222.22)
insert into SmartMeterReadings (MeterId,CustomerId,Location,InstalledDate,
ReadingDateTime,EnergyConsumed) values (300,3,'add3','2022-01-01','2022-02-02',333.33)
insert into SmartMeterReadings (MeterId,CustomerId,Location,InstalledDate,
ReadingDateTime,EnergyConsumed) values (400,4,'add4','2023-01-01','2023-02-02',444.4)
insert into SmartMeterReadings (MeterId,CustomerId,Location,InstalledDate,
ReadingDateTime,EnergyConsumed) values (500,5,'add5','2024-01-01','2024-02-02',555.55)

insert into SmartMeterReadings (MeterId,CustomerId,Location,InstalledDate,
ReadingDateTime,EnergyConsumed) values (100,1,'add1','2020-01-02','2020-02-02',150.55) 

select * from SmartMeterReadings;
select * from customers;

-- TASK 1 (Energy Consumed between 200 to 400)
select * from SmartMeterReadings where EnergyConsumed between 200 AND 400
AND ReadingDateTime between '2022-01-01' AND '2024-01-01'
AND InstalledDate <= '2023-06-30';

-- TASK 2 (AVG and max energy Consumed)
select c.CustomerId,avg(s.EnergyConsumed) as AvgEnergy,max(s.EnergyConsumed) as MaxEnergy from 
Customers c inner join SmartMeterReadings s on c.CustomerId=s.CustomerId group by c.CustomerId;