SELECT 
	LaptopName, 
	Price
	,RANK() OVER(ORDER BY Price) AS RowRank
	,8 AS TotalRecords
	,RANK() OVER(ORDER BY Price)/8.0000 AS PriceDistribution_Manual
	,CUME_DIST() OVER(ORDER BY Price) AS PriceDistribution_ByCumeDist
FROM [dbo].[Laptops] 
SELECT 
	LaptopName, 
	LaptopBrand, 
	ReleasedYear, 
	DeviceType, 
	Price,
	CUME_DIST() OVER(PARTITION BY DeviceType ORDER BY Price) AS PriceDistribution
FROM [dbo].[Laptops]
SELECT LaptopName, LaptopBrand, ReleasedYear, DeviceType, Price,
LAST_VALUE(LaptopName) OVER(ORDER BY Price
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastValue
FROM [dbo].[Laptops]
CREATE DATABASE Showroom

Use Showroom
CREATE TABLE Car
(
CarId int identity(1,1) primary key,
Name varchar(100),
Make varchar(100),
Model int ,
Price int ,
Type varchar(20)
)

insert into Car( Name, Make, Model , Price, Type)
VALUES ('Corrolla','Toyota',2015, 20000,'Sedan'),
('Civic','Honda',2018, 25000,'Sedan'),
('Passo','Toyota',2012, 18000,'Hatchback'),
('Land Cruiser','Toyota',2017, 40000,'SUV'),
('Corrolla','Toyota',2011, 17000,'Sedan'),
('Vitz','Toyota',2014, 15000,'Hatchback'),
('Accord','Honda',2018, 28000,'Sedan'),
('7500','BMW',2015, 50000,'Sedan'),
('Parado','Toyota',2011, 25000,'SUV'),
('C200','Mercedez',2010, 26000,'Sedan'),
('Corrolla','Toyota',2014, 19000,'Sedan'),
('Civic','Honda',2015, 20000,'Sedan')