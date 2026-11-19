---- LESSON 6: PENDING ORDERS APP IMPROVEMENTS ----

CREATE SEQUENCE orders_seq
    START = 1
    INCREMENT = 2
    COMMENT = 'Provide a unique id for each smoothie order';
--1) ENSURE UNIQUENESS - CREATE SEQUENCE TO USE AS A ROW ID

-- truncate table first as column iwth unique id cannot be added if table has rows already in it
TRUNCATE TABLE smoothies.public.orders;

--add column for unique id
ALTER TABLE smoothies.public.orders
ADD COLUMN order_uid INTEGER --adds the column
    DEFAULT smoothies.public.orders_seq.nextval  --sets the value of the column to sequence
    CONSTRAINT order_uid UNIQUE ENFORCED; --makes sure there is always a unique value in the column


--2) PERFECTING ORDERS TABLE DEFINITION

-- drop and recreate orders table
DROP TABLE smoothies.public.orders;

CREATE OR REPLACE TABLE smoothies.public.orders (
    order_uid INTEGER DEFAULT smoothies.public.orders_seq.nextval,
    order_filled BOOLEAN DEFAULT FALSE,
    name_on_order VARCHAR(100),
    ingredients VARCHAR (200),
    CONSTRAINT order_uid unique (order_uid),
    order_ts timestamp_ltz DEFAULT current_timestamp()
);