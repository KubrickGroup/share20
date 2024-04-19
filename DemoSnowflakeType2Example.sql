USE test1;

CREATE OR REPLACE SCHEMA staging;
CREATE OR REPLACE SCHEMA dw;

CREATE OR REPLACE TABLE staging.inventory (DimInventoryId INT NULL, assetcode VARCHAR(10) NULL, assetclass VARCHAR(100) NULL, countrycode VARCHAR(3) NULL);

CREATE OR REPLACE TABLE dw.DimInventory (DimInventoryId INT NOT NULL IDENTITY PRIMARY KEY, assetcode VARCHAR(10) NOT NULL, assetclass VARCHAR(100) NOT NULL, countrycode VARCHAR(3) NOT NULL, startdate TIMESTAMP NOT NULL, enddate TIMESTAMP NOT NULL DEFAULT '9999-12-31T23:59:59.999'::timestamp, iscurrent CHAR(1) NOT NULL);


/* Example type 2 load procedure - Inventory Dimension - Snowflake */
CREATE OR REPLACE PROCEDURE staging.InventoryType2Load ()
RETURNS INT
LANGUAGE SQL
AS
$$
    DECLARE dt TIMESTAMP;
    BEGIN
    dt := GETDATE();

    MERGE INTO staging.inventory AS c
    USING (SELECT * FROM dw.DimInventory WHERE iscurrent = 'Y') AS d
    ON c.assetcode = d.assetcode -- business key
        AND c.assetclass = d.assetclass
        AND c.countrycode = d.countrycode
    WHEN MATCHED THEN DELETE  -- no change, so delete the row from staging
    WHEN NOT MATCHED
    THEN INSERT (DimInventoryId) -- nullable column in the staging table
         VALUES (DimInventoryId); -- surrogate IDENTITY key in the DW table

    MERGE INTO dw.DimInventory AS d
    USING staging.inventory AS c
    ON c.DimInventoryId = d.DimInventoryId -- surrogate key
    WHEN NOT MATCHED
    THEN INSERT (assetcode, assetclass, countrycode
                , startdate, iscurrent)
         VALUES (assetcode, assetclass, countrycode
                , :dt, 'Y')
    WHEN MATCHED THEN UPDATE SET iscurrent = 'N', enddate = :dt;

    RETURN SQLROWCOUNT;
    END
$$;

/* Generate some randomized data */
TRUNCATE TABLE staging.inventory;
INSERT INTO staging.inventory (assetcode, assetclass, countrycode)
    SELECT 'ABC',RANDSTR(5,RANDOM()),'USA'
    UNION ALL
    SELECT 'DEF',RANDSTR(5,RANDOM()),'USA';

/* Type 2 load */
CALL staging.InventoryType2Load ();

SELECT *
FROM dw.diminventory
ORDER BY assetcode, startdate, enddate, DimInventoryId;


