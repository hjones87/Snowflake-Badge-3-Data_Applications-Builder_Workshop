---- LESSON 8: INTRO TO VARIABLES and VARIABLE-DRIVEN LOADING ----

--1) CREATE AND SET A LOCAL SQL VARIABLE

SET mystery_bag = 'This bag is empty';

SELECT $mystery_bag;

--2) create some more variables

SET var1 = 2;
SET var2 = 5;
SET var3 = 7;

SELECT $var1+$var2+$var3;


--3) CREATE A SIMPLE UESR DEFINED FUNCTION (UDF)

CREATE FUNCTION util_db.public.sum_mystery_bag_vars (
    var1 NUMBER,
    var2 NUMBER,
    var3 NUMBER
)
RETURNS NUMBER as 'select var1+var2+var3';

SELECT sum_mystery_bag_vars (12,36,204);

--3) COMBINE LOCAL VARIABLES AND FUNCTION CALLS

SET eeny = 4;
SET meeny = 67.2;
SET miney_mo = -39;

SELECT sum_mystery_bag_vars ($eeny, $meeny, $miney_mo);

--4) COMBINING UDFs WITH SNOWFLAKE FUNCTIONS 

--USING SYSTEM FUNCTIONS TO FIX VARIABLE VALUES

SET alternating_caps_phrase = 'wHy ArE yOu lIkE tHiS?';
SELECT initcap($alternating_caps_phrase);

--CHALLENGE: Write a UDF that neutralises alternating caps phrases

CREATE FUNCTION util_db.public.neutralize_whining (
    var1 TEXT(100)
)
RETURNS TEXT as 
$$
SELECT initcap(var1)
$$;

SELECT util_db.public.neutralize_whining ('wIlL tHiS wOrK?');


SHOW STREAMLITS;
