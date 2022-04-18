{{ config(materialized='table', cluster_by = "product_type_no") }}

with source_data as (
    SELECT DISTINCT
        product_type_no,
        product_type_name,
        product_group_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data

