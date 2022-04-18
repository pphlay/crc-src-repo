{{ config(materialized='table', cluster_by = "perceived_colour_value_id") }}

with source_data as (
    SELECT DISTINCT
        perceived_colour_value_id,
        perceived_colour_value_name
    FROM 
        dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data


