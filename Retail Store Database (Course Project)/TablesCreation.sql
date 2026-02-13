--Створення таблиці Магазини (Stores):
create table Stores (
StoreID int primary key,
StoreCity varchar(20),
StoreAddress varchar(40),
StoreName varchar(20));

--Створення таблиці Склади (Warehouses):
create table Warehouses (
WarehouseID int primary key,
WareCity varchar(20),
WareAddress varchar(40),
WareName varchar(20));

--Створення таблиці Товари (Goods):
create table Goods ( 
GoodID int primary key,
GoodBrand varchar(20),
GoodType varchar(40),
GoodColor varchar(20),
GoodMaterial varchar(20),
GoodSize varchar(20),
TotalAmount int,
WarehouseID int foreign key references Warehouses(WarehouseID) NOT NULL);

--Створення таблиці Запити (Requests):
create table Requests (
RequestID int primary key,
StoreID int foreign key references Stores(StoreID) NOT NULL,
GoodID int foreign key references Goods(GoodID) NOT NULL,
Quantity int NOT NULL);

--Створення таблиці Водії (Drivers):
create table Drivers (
DriverID int primary key,
DriverName varchar(20),
DriverSurname varchar(20),
DriverLicense varchar(10));

--Створення таблиці Автомобілі (Cars):
create table Cars ( 
CarID int primary key,
CarBrand varchar(20),
CarModel varchar(30),
CarType varchar(20),
CarNumber varchar(20),
DriverID int foreign key references Drivers(DriverID) NOT NULL);

--Створення таблиці Розклад (Schedule):
create table Schedule (
RouteID int primary key,
RequestID int foreign key references Requests(RequestID) NOT NULL,
CarID int foreign key references Cars(CarID) NOT NULL,
DeliveryDate date );
