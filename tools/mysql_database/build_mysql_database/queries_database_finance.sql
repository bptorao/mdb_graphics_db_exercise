
-- QUERY:

select distinct hq_location,
 country
from LAYOFF_DATA
order by 2


-- QUERY: 

select * from LAYOFF_DATA where country = 'Spain'


--  QUERY: 
with group_layoff as (
    
select 
    case  when number_laid_off is NULL
 then 0 else 1 end as nlayoff_case 
    ,ld.*
from LAYOFF_DATA ld

    )
    
    select 
      nlayoff_case
    , count(*)
    from group_layoff
    group by 1

-- QUERY

select   ld.* from LAYOFF_DATA ld
where upper(substring(company_name,1,1)) = 'A'

-- QUERY

select * 
from LAYOFF_DATA ld
INNER JOIN COUNTRY_CONTINENTS cc
ON ld.COUNTRY = cc.COUNTRY

-- 

SELECT * FROM `LAYOFF_DATA` WHERE 1
2269

-- ############## ############## ############## ##############
-- NODES
-- -------
-- QUERY: companies location

DROP VIEW v_nodes_locations;

CREATE VIEW v_nodes_locations AS
SELECT
      distinct hq_location
     , "LOCATION" as label
from LAYOFF_DATA      
WHERE number_laid_off is not null;

-- QUERY: companies location

DROP VIEW v_nodes_countries;

CREATE VIEW v_nodes_countries AS
SELECT
       country
     , "COUNTRY" as label
from COUNTRY_CONTINENTS;


-- QUERY: companies sector

DROP VIEW v_nodes_sectors;

CREATE VIEW v_nodes_sectors AS
SELECT
    distinct sector
    , "SECTOR" as label
from LAYOFF_DATA      
WHERE number_laid_off is not null;

-- QUERY: country continents

DROP VIEW v_nodes_continents;

CREATE VIEW v_nodes_continents AS
SELECT 
   distinct continent
  , "CONTINENT" as label
FROM COUNTRY_CONTINENTS;

-- QUERY: companies layoff

DROP VIEW v_nodes_layoff;

CREATE VIEW v_nodes_layoff AS
SELECT
       company_name
     , number_laid_off
     , date_of
     , PERCENTAGE_OF_COMPANY
     , stage
     , "COMPANY" as label
from LAYOFF_DATA      
WHERE number_laid_off is not null;

-- ############## ############## ############## ##############
-- RELATIONSHIPS
---------



-- QUERY: companies location

DROP VIEW v_rel_companies_countries;

CREATE VIEW v_rel_companies_countries AS
SELECT
       company_name as start_id
     , country as end_id
     , "HQ_COUNTRY" as label
from LAYOFF_DATA      
WHERE number_laid_off is not null;


-- QUERY: companies location

DROP VIEW v_rel_companies_locations;

CREATE VIEW v_rel_companies_locations AS
SELECT
        company_name as start_id
      ,  hq_location as end_id
      , "HQ_LOCATION" as rel_type
from LAYOFF_DATA      
WHERE number_laid_off is not null;

-- QUERY: companies sector

DROP VIEW v_rel_companies_sectors;

CREATE VIEW v_rel_companies_sectors AS
SELECT
      company_name as start_id
    , sector as end_id
    , "SECTOR" as rel_type
from LAYOFF_DATA      
WHERE number_laid_off is not null;

-- QUERY: country continents

DROP VIEW v_rel_country_continents;

CREATE VIEW v_rel_country_continents AS
SELECT 
    country as start_id
  , continent as end_id
  , "CONTINENT" as rel_type
FROM COUNTRY_CONTINENTS;



-- ############## ############## ############## ##############
------- ----------------- ----------

with layoff as (
select * 
from LAYOFF_DATA ld
INNER JOIN COUNTRY_CONTINENTS cc
ON ld.COUNTRY = cc.COUNTRY
WHERE ld.number_laid_off is not null

)

select 
from layoff

-- ############## ############## ############## ##############
------- ----------------- ----------
-- Countries que no tienen continenete asociado.
with countries as (
select distinct country from LAYOFF_DATA
where number_laid_off is not null
)

select co.country, cc.CONTINENT
from countries co
left join COUNTRY_CONTINENTS cc
on co.country = cc.COUNTRY 
where cc.CONTINENT is null