USE ROLE SYSADMIN;

--CREATE FRUIT_OPTIONS TABLE

CREATE TABLE smoothies.public.fruit_options(
    fruit_id NUMBER,
    fruit_name VARCHAR(25)
);

--CREATE FILE FORMAT FOR TABLE

create file format smoothies.public.two_headerrow_pct_delim
  type = CSV,
  skip_header = 2,
  field_delimiter = '%',
  trim_space = TRUE;

--QUERY UNLOADED DATA

SELECT $1, $2
FROM @smoothies.public.my_uploaded_files/fruits_available_for_smoothies.txt
(FILE_FORMAT => smoothies.public.two_headerrow_pct_delim);

--COPY INTO TO LOAD TABLE

COPY INTO smoothies.public.fruit_options
FROM (
    SELECT $2 AS fruit_id, $1 AS fruit_name
    FROM @smoothies.public.my_uploaded_files/fruits_available_for_smoothies.txt
    )
FILE_FORMAT = (FORMAT_NAME = smoothies.public.two_headerrow_pct_delim)
ON_ERROR = ABORT_STATEMENT
PURGE = TRUE; 

SELECT * FROM smoothies.public.fruit_options;

