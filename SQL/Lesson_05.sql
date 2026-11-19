---- LESSON 5: PROTOPTYPING REVIEWS AND SPRINT PLANNING

--4) ADD COLUMN FOR NAME_ON_ORDER

ALTER TABLE smoothies.public.orders 
ADD COLUMN name_on_order VARCHAR (200);

--5) TEST SQL STATEMENT FROM APP
INSERT INTO smoothies.public.orders(ingredients, name_on_order) 
VALUES ('Honeydew Mango Papaya Strawberries ','Holly');

SELECT * from smoothies.public.orders;

--6) CREATE SiS APP FOR THE KITCHEN

--ADD ORDER FILLED COLUMN
ALTER TABLE smoothies.public.orders
ADD COLUMN order_filled BOOLEAN DEFAULT FALSE;

SELECT * FROM smoothies.public.orders;

UPDATE smoothies.public.orders
SET order_filled = true
WHERE name_on_order is null;

