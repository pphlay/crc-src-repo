{{ config(materialized='table', cluster_by = "department_no") }}

with source_data as (
    SELECT DISTINCT
        department_no,
        department_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data