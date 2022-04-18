{{ config(materialized='table', cluster_by = "index_group_no") }}

with source_data as (
    SELECT DISTINCT
        index_group_no,
        index_group_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data