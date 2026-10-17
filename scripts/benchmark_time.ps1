Write-Host "Замер Parquet (None)..."
Measure-Command { 
    docker exec trino trino --execute 'SELECT brand, "type", size, count(DISTINCT suppkey) AS supplier_cnt FROM lakekeeper.bench.partsupp_parquet_none GROUP BY brand, "type", size' 
} | Select-Object -ExpandProperty TotalSeconds

Write-Host "Замер ORC (Snappy)..."
Measure-Command { 
    docker exec trino trino --execute 'SELECT brand, "type", size, count(DISTINCT suppkey) AS supplier_cnt FROM lakekeeper.bench.partsupp_orc_snappy GROUP BY brand, "type", size' 
} | Select-Object -ExpandProperty TotalSeconds

Write-Host "Замер Bronze GZIP (SELECT count(*))..."
Measure-Command { 
    docker exec trino trino --execute 'SELECT count(*) FROM lakekeeper.bronze.raw_part_gzip' 
} | Select-Object -ExpandProperty TotalSeconds

Write-Host "Замер Bronze ZSTD (SELECT count(*))..."
Measure-Command { 
    docker exec trino trino --execute 'SELECT count(*) FROM lakekeeper.bronze.raw_part_zstd' 
} | Select-Object -ExpandProperty TotalSeconds
