/* replace XXXXXXXX with your schema name */
CREATE TABLE XXXXXXXX.car
(
	idnum int NOT NULL PRIMARY KEY,
	car varchar(50) NOT NULL,
	mpg decimal(10, 2) NOT NULL,
	cylinders tinyint NOT NULL,
	displacement decimal(10, 2) NOT NULL,
	horsepower decimal(10, 2) NOT NULL,
	weight decimal(10, 2) NOT NULL,
	acceleration decimal(10, 2) NOT NULL,
	origin varchar(50) NOT NULL,
	dt date NOT NULL
);

