CREATE TABLE lakekeeper.gold.q16_parts_supplier AS SELECT brand, "type", size, count(DISTINCT suppkey) AS supplier_cnt FROM lakekeeper.silver.partsupp_enriched GROUP BY brand, "type", size;
