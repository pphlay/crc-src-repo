

{{ config(materialized='table', cluster_by = "garment_group_no") }}

with source_data as (
    SELECT
        distinct
        garment_group_no,
        garment_group_name
    FROM 
        `dcsea-ac-hpegoog.hnm_dl.articles`
)

select *
from source_data
