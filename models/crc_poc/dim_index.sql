{{ config(materialized='table', cluster_by = "index_code") }}

with source_data as (
    SELECT DISTINCT
        index_code,
        index_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data