CREATE SCHEMA IF NOT EXISTS lakekeeper.bronze;
CREATE TABLE lakekeeper.bronze.raw_part AS SELECT * FROM tpch.sf1.part;
CREATE TABLE lakekeeper.bronze.raw_partsupp AS SELECT * FROM tpch.sf1.partsupp;
CREATE TABLE lakekeeper.bronze.raw_supplier AS SELECT * FROM tpch.sf1.supplier;
