{{ config(materialized='table', cluster_by = "section_no") }}

with source_data as (
    SELECT DISTINCT
        section_no,
        section_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data

