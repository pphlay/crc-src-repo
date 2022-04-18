{{ config(materialized='table', cluster_by = "product_code") }}

with source_data as (
    SELECT DISTINCT
        product_code,
        prod_name as product_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data

