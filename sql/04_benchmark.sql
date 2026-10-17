SET SESSION lakekeeper.compression_codec = 'NONE';
CREATE TABLE lakekeeper.bench.partsupp_parquet_none AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SET SESSION lakekeeper.compression_codec = 'SNAPPY';
CREATE TABLE lakekeeper.bench.partsupp_parquet_snappy AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SET SESSION lakekeeper.compression_codec = 'GZIP';
CREATE TABLE lakekeeper.bench.partsupp_parquet_gzip AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SET SESSION lakekeeper.compression_codec = 'ZSTD';
CREATE TABLE lakekeeper.bench.partsupp_parquet_zstd AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SET SESSION lakekeeper.compression_codec = 'NONE';
CREATE TABLE lakekeeper.bench.partsupp_orc_none WITH (format = 'ORC') AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SET SESSION lakekeeper.compression_codec = 'SNAPPY';
CREATE TABLE lakekeeper.bench.partsupp_orc_snappy WITH (format = 'ORC') AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SET SESSION lakekeeper.compression_codec = 'GZIP';
CREATE TABLE lakekeeper.bench.partsupp_orc_gzip WITH (format = 'ORC') AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SET SESSION lakekeeper.compression_codec = 'ZSTD';
CREATE TABLE lakekeeper.bench.partsupp_orc_zstd WITH (format = 'ORC') AS SELECT * FROM lakekeeper.silver.partsupp_enriched;

SELECT 'parquet_none' AS variant, sum(file_size_in_bytes) AS bytes FROM lakekeeper.bench."partsupp_parquet_none$files"
UNION ALL SELECT 'parquet_snappy', sum(file_size_in_bytes) FROM lakekeeper.bench."partsupp_parquet_snappy$files"
UNION ALL SELECT 'parquet_gzip', sum(file_size_in_bytes) FROM lakekeeper.bench."partsupp_parquet_gzip$files"
UNION ALL SELECT 'parquet_zstd', sum(file_size_in_bytes) FROM lakekeeper.bench."partsupp_parquet_zstd$files"
UNION ALL SELECT 'orc_none', sum(file_size_in_bytes) FROM lakekeeper.bench."partsupp_orc_none$files"
UNION ALL SELECT 'orc_snappy', sum(file_size_in_bytes) FROM lakekeeper.bench."partsupp_orc_snappy$files"
UNION ALL SELECT 'orc_gzip', sum(file_size_in_bytes) FROM lakekeeper.bench."partsupp_orc_gzip$files"
UNION ALL SELECT 'orc_zstd', sum(file_size_in_bytes) FROM lakekeeper.bench."partsupp_orc_zstd$files";

SELECT brand, "type", size, count(DISTINCT suppkey) AS supplier_cnt 
FROM lakekeeper.bench.partsupp_parquet_none 
GROUP BY brand, "type", size;
