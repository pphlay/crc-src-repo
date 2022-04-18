{{ config(materialized='table', cluster_by = "graphical_appearance_no") }}

with source_data as (
    SELECT DISTINCT
        graphical_appearance_no,
        graphical_appearance_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data