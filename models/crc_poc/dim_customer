{{ config(materialized='table', cluster_by = "customer_id") }}

with source_data as (
    select 
        customer_id,
        FN,
        ifnull(active,0) as active,
        club_member_status,
        fashion_news_frequency,
        age,
        postal_code
    from 
        dcsea-ac-hpegoog.hnm_dl.customers
)

select *
from source_data