-- Databricks notebook source
DROP TABLE IF EXISTS bronze.tb_user_details;
CREATE TABLE IF NOT EXISTS bronze.tb_user_details;
COPY INTO bronze.tb_user_details
FROM '/mnt/dlake/landing-zone/sql-dvacademy/projeto-um'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header' = 'true', 'mergeSchema' = 'true')
COPY_OPTIONS ('mergeSchema' = 'true');

-- COMMAND ----------

SELECT * FROM bronze.tb_user_details

-- COMMAND ----------

CREATE TABLE silver.tb_user_details
USING DELTA
LOCATION '/mnt/dlake/silver/sql-dvacademy/projeto-um'
AS
SELECT  
        to_date(dob_date) as dob_date_tratada,
        year(dob_date) as ano_nascimento,
        concat(first,' ',last) as nome_completo,
        cast(dob_age as int) as idade_tratada,
        country
    FROM bronze.tb_user_details

-- COMMAND ----------

SELECT * FROM silver.tb_user_details

-- COMMAND ----------

DROP TABLE silver.tb_user_details

-- COMMAND ----------

SELECT * FROM silver.tb_user_details


-- COMMAND ----------

CREATE TABLE silver.tb_user_details
USING DELTA
LOCATION '/mnt/dlake/silver/sql-dvacademy/projeto-um'

-- COMMAND ----------

CREATE TABLE silver.tb_user_details_hericlis
USING DELTA
LOCATION '/mnt/dlake/silver/sql-dvacademy/projeto-um'

-- COMMAND ----------

CREATE TABLE silver.tb_user_details_lucas
USING DELTA
LOCATION '/mnt/dlake/silver/sql-dvacademy/projeto-um'

-- COMMAND ----------

CREATE TABLE silver.tb_user_details_juliana
USING DELTA
LOCATION '/mnt/dlake/silver/sql-dvacademy/projeto-um'

-- COMMAND ----------

SELECT * FROM DELTA.`/mnt/dlake/silver/sql-dvacademy/projeto-um`
SELECT * FROM silver.tb_user_details

-- COMMAND ----------

SELECT * FROM silver.tb_user_details_hericlis

-- COMMAND ----------

DELETE FROM silver.tb_user_details_lucas
WHERE ano_nascimento < 1990
