{{ config(
    materialized='table', 
    partition_by={
        "field":"t_dat",
        "data_type": "date",
        "granularity": "day"
        }, cluster_by=["period_dt","product_code","department_no"]) }}

with dim_channel as (
    select * from {{ ref('dim_channel') }}
),
dim_garment_group as (
    select * from  {{ ref('dim_garment_group') }}
),
dim_colour_group as (
    select * from {{ ref('dim_colour_group') }} 
),
dim_customer as (
    select * from {{ ref('dim_customer') }} 
),
dim_department as (
    select * from {{ ref('dim_department') }} 
),
dim_graphical_appearance as (
    select * from {{ ref('dim_graphical_appearance') }} 
)
select 
    a.article_id,
    a.t_dat,
    last_day(a.t_dat) as period_dt,
    b.product_code,
    b.product_type_no,
    b.graphical_appearance_no,
    b.colour_group_code,
    b.perceived_colour_value_id,
    b.perceived_colour_master_id,
    b.department_no,
    b.index_code,
    b.index_group_no,
    b.section_no,
    b.garment_group_no,
    a.customer_id,
    a.sales_channel_id,
    a.price as sales_amt,
    1 as sales_qty
from
    dcsea-ac-hpegoog.hnm_dl.transactions a
    inner join dcsea-ac-hpegoog.hnm_dl.articles b on a.article_id = b.article_id
--group by 
--    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
