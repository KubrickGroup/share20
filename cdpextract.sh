psql --file=cdpextract.sql --no-align --tuples-only --host=kubrickgroupmi.ccwjw5h2ozjv.eu-west-2.rds.amazonaws.com --dbname=kubrickgroupmidb --username=cdpex --output=cdpextract.txt
mv cdpextract.txt /data/share/cdpextract.txt
