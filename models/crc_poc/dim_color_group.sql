{{ config(materialized='table', cluster_by = "colour_group_code") }}

with source_data as (
    select distinct colour_group_code , colour_group_name from dcsea-ac-hpegoog.hnm_dl.articles
)

select *
from source_data