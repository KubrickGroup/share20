-- mailco contact table
-- REPLACE XXXXXXXXXXs WITH A VALID SCHEMA NAME

CREATE TABLE XXXXXXXXXX.contact
(
	contactid int NOT NULL PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	company_name varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	county varchar(50) NOT NULL,
	state varchar(50) NOT NULL,
	zip int NOT NULL,
	phone1 varchar(50) NOT NULL,
	phone2 varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	web varchar(50) NOT NULL,
	modifydate date NOT NULL
);

BULK INSERT XXXXXXXXXX.contact  FROM '/data/share/mailcolatest.txt' WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n');
