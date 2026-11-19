---- LESSON 3: MOVING DATA FROM SIS TO SNOWFLAKE ----

--1) CREATE PLACE TO STORE ORDER DATA FROM STREAMLIT
USE SYSADMIN;
CREATE TABLE smoothies.public.orders(
    ingredients VARCHAR (200)
);

--2) BUILD INSERT TATEMENT AND TEST

--copied statement from 
INSERT INTO smoothies.public.orders(ingredients) 
VALUES ('Apples Blueberries Cantaloupe Dragon Fruit ');

SELECT * FROM smoothies.public.orders;

--3) FIXING ISSUE WITH TESTING STREAMLIT APP RESULTING IN ADDING A NEW LING FOR EVERY INGREDIENT ADDED

-- truncate orders table

TRUNCATE TABLE smoothies.public.orders;

--test table after submit button added to app
SELECT * from smoothies.public.orders;

