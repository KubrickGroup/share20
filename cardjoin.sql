CREATE TABLE XXXXXX.cardjoin (
	 clientnum bigint NOT NULL,
	 customer_age int NULL,
	 card_category varchar (100) NULL,
	 trans_id INTEGER NOT NULL,
	 amount decimal (10, 2) NOT NULL,
	 trans_date date NOT NULL,
	 balance decimal (10, 2) NOT NULL,
	 CONSTRAINT pk_cardjoin PRIMARY KEY (clientnum,trans_id)
);

CREATE TABLE XXXXXX.cardlatest (
	 clientnum bigint NOT NULL,
	 customer_age int NULL,
	 card_category varchar (100) NULL,
	 trans_id INTEGER NOT NULL,
	 amount decimal (10, 2) NOT NULL,
	 trans_date date NOT NULL,
	 balance decimal (10, 2) NOT NULL,
	 CONSTRAINT pk_cardlatest PRIMARY KEY (clientnum)
);
