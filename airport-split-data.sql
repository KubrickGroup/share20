-- Airport conditional split tables. Replace XXXXXXs with a schema name!

CREATE TABLE XXXXXX.closedairport (
	ident varchar(10) NOT NULL PRIMARY KEY,
	iso_country char(2) NOT NULL,
	name nvarchar(100) NOT NULL,
	type varchar(50) NOT NULL
)

CREATE TABLE XXXXXX.activeairport (
	ident varchar(10) NOT NULL PRIMARY KEY,
	iso_country char(2) NOT NULL,
	name nvarchar(100) NOT NULL,
	type varchar(50) NOT NULL
)

CREATE TABLE XXXXXX.iataairport (
	ident varchar(10) NOT NULL PRIMARY KEY,
	iso_country char(2) NOT NULL,
	name nvarchar(100) NOT NULL,
	type varchar(50) NOT NULL,
	iata_code varchar(10) NOT NULL
);

