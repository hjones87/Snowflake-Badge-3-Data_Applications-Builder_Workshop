---- LESSON 11: USING API DATA WITH VARIABLES ----

--1) UPDATING THE MULTI_SELECT PART 1

-- add search-on field to fruit-options table

ALTER TABLE smoothies.public.fruit_options
ADD COLUMN search_on VARCHAR (100);

--copy name to seed the columns - then can eidt the problem rows

UPDATE smoothies.public.fruit_options
SET search_on = fruit_name;

SELECT * from fruit_options;

UPDATE fruit_options
SET search_on = 'Yangmei (Waxberry)'
WHERE fruit_name = 'Ximenia';