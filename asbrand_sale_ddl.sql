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
	brand_name nvarchar(50) NULL,
	login_name varchar(20) NOT NULL,
	full_name varchar(100) NOT NULL,
	city varchar(50) NOT NULL,
	postal_code varchar(10) NOT NULL,
	email nvarchar(255) NOT NULL,
	producturl VARCHAR(1000) NULL,
	productdescription VARCHAR(1000) NULL
);
