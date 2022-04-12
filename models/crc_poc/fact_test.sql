{{ config(materialized='table', cluster_by="sales_channel_id") }}

with dim_channel as (
    select * from {{ ref('dim_channel') }}
),
dim_garment_group as (
    select * from  {{ ref('dim_garment_group') }}
),
dim_channel_view_x as (
    select * from {{ ref('dim_channel_view_x') }} 
)
select A.*
from
    dim_channel A
    left join dim_garment_group B ON 1=1