-- Creation script for the airport table. Replace XXXXXXs with a schema name

DROP TABLE IF EXISTS XXXXXX.airport;

CREATE TABLE XXXXXX.airport (
	ident varchar(10) NOT NULL PRIMARY KEY,
	continent char(2) NOT NULL,
	coordinates varchar(50) NOT NULL,
	elevation_ft int NULL,
	gps_code varchar(10) NULL,
	iata_code varchar(10) NULL,
	iso_country varchar(10) NOT NULL,
	iso_region varchar(10) NOT NULL,
	local_code varchar(10) NULL,
	municipality nvarchar(100) NULL,
	name nvarchar(100) NOT NULL,
	type varchar(50) NOT NULL,
	create_dt DATETIME NULL DEFAULT CURRENT_TIMESTAMP -- timestamp for each insert
);

INSERT INTO XXXXXX.airport ( ident, continent, coordinates, elevation_ft, gps_code, iata_code, iso_country, iso_region, local_code, municipality, name, type )
VALUES
 ('CYVR', 'NA', '-123.183998108, 49.193901062', 14, '', '', '', '', NULL, 'Vancouver', 'Vancouver International Airport', '')
,('EGPF', 'EU', '-4.43306, 55.871899', 26, '', '', '', '', NULL, 'Glasgow', 'Glasgow International Airport', '')
,('EPMO', 'EU', '20.6518, 52.451099', 341, '', '', '', '', NULL, 'Warsaw', 'Modlin Airport', '')
,('HKJK', 'AF', '36.9277992249, -1.31923997402', 5330, '', '', '', '', NULL, 'Nairobi', 'Jomo Kenyatta International Airport', '');

SELECT TOP 10 * FROM XXXXXX.airport ORDER BY create_dt, ident;
