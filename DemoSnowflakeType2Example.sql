/* Example type 2 load procedure - Inventory Dimension - Snowflake */
CREATE OR REPLACE PROCEDURE staging.InventoryType2Load ()
RETURNS INT
LANGUAGE SQL
AS
$$
    DECLARE dt TIMESTAMP;
    BEGIN
    dt := GETDATE();

    TRUNCATE TABLE staging.inventory;

    COPY INTO staging.inventory(assetcode, assetclass, countrycode)
    FROM (
        SELECT $1, $2, $3
        FROM @staging.mystage as p
    )
    PATTERN = 'inventory.txt'
    FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = '|' SKIP_HEADER = 1, FIELD_OPTIONALLY_ENCLOSED_BY = '"');

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
    THEN INSERT (DimInventoryId, assetcode, assetclass, countrycode
                , startdate, iscurrent)
         VALUES (DimInventoryId, assetcode, assetclass, countrycode
                , :dt, 'Y')
    WHEN MATCHED THEN UPDATE SET iscurrent = 'N', enddate = :dt;

    RETURN SQLROWCOUNT;
    END
$$;

/* Call the proceedure */
CALL staging.InventoryType2Load ();