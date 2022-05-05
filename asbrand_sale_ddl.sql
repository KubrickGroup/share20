CREATE TABLE XXXXX.sale
(
	transid int NOT NULL PRIMARY KEY,
	orderdatetime datetime2(0) NOT NULL,
	delivdate date NULL,
	sku int NOT NULL,
	customer_code varchar(10) NULL,
	qty int NOT NULL,
	value decimal(10, 2) NULL,
	color VARCHAR(50) NULL,
	brand_name nvarchar(50) NULL
);

