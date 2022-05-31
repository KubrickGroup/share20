CREATE TABLE XXXXXX.cardjoin (
	 clientnum bigint NOT NULL,
	 customer_age int NULL,
	 card_category varchar (100) NULL,
	 trans_id INTEGER  NULL,
	 amount decimal (10, 2) NULL,
	 trans_date date NULL,
	 balance decimal (10, 2) NULL
);

CREATE TABLE XXXXXX.cardlatest (
	 clientnum bigint NOT NULL,
	 customer_age int NULL,
	 card_category varchar (100) NULL,
	 trans_id INTEGER NULL,
	 amount decimal (10, 2) NULL,
	 trans_date date NULL,
	 balance decimal (10, 2) NULL
);
