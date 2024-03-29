-- SCRIPT DATABASE FINANCE

-- database finance_db

USE finance_db;

CREATE TABLE INDEXES_DATA (
    ID INT NOT NULL AUTO_INCREMENT,
    INDEX_NAME varchar(50),
    COMPANY_NAME varchar(100),
    TICKER varchar(20),
    SECTOR varchar(100),
    SUB_INDUSTRY varchar(100),
    HQ_LOCATION varchar(100),
    HQ_COUNTRY varchar(100),
    FOUNDED  varchar(100),
    START_DATE date,
    END_DATE date,
    ISIN varchar(100),
    CIK varchar(100),
    WEIGHTING varchar(100),
    MAIN_LISTING varchar(100),
    CORPORATE_FORM varchar(100),
    ONBOARDING_DATE date,
    PRIMARY KEY(ID)
    );
   
CREATE TABLE LAYOFF_DATA(
    ID INT NOT NULL AUTO_INCREMENT,
    COMPANY_NAME varchar(100),
    HQ_LOCATION varchar(100),
    SECTOR varchar(100),
    NUMBER_LAID_OFF integer,
    DATE_OF timestamp,
    DATA_SOURCE varchar(1024),
    RAISED_MM FLOAT,
    STAGE varchar(100),
    DATE_ADDED timestamp,
    COUNTRY varchar(100),
    PERCENTAGE_OF_COMPANY float,
    LIST_OF_EMPLOYEES_LAID_OFF VARCHAR(1024),
    ONBOARDING_DATE date,
    PRIMARY KEY(ID)
    );

CREATE TABLE COUNTRY_CONTINENTS(
    ID INT NOT NULL AUTO_INCREMENT,
    COUNTRY varchar(100),
    CONTINENT varchar(100),
    PRIMARY KEY (ID, COUNTRY)
);

CREATE VIEW V_FINANCE_LAYOFFS AS 
    SELECT LD.*
     	, ID.ID INDEX_ID
        , ID.INDEX_NAME
        , ID.TICKER
        , ID.SECTOR AS SECTOR_INDEX
        , ID.SUB_INDUSTRY
        , ID.HQ_LOCATION AS HQ_LOCATION_INDEX
        , ID.HQ_COUNTRY AS HQ_COUNTRY_INDEX
        , ID.HQ_COUNTRY
        , ID.FOUNDED
        , ID.START_DATE
        , ID.END_DATE
        , ID.ISIN
        , ID.CIK
        , ID.WEIGHTING
        , ID.MAIN_LISTING
        , ID.CORPORATE_FORM
        , ID.ONBOARDING_DATE ONBOARDING_DATE_INDEX
    FROM LAYOFF_DATA LD
    INNER JOIN INDEXES_DATA ID
    ON LD.COMPANY_NAME = ID.COMPANY_NAME;
