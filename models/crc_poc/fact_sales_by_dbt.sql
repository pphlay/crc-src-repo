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
),
dim_index as (
    select * from {{ ref('dim_index') }} 
),
dim_index_group as (
    select * from {{ ref('dim_index_group') }} 
),
dim_perceived_colour as (
    select * from {{ ref('dim_perceived_colour') }} 
),
dim_perceived_colour_master as (
    select * from {{ ref('dim_perceived_colour_master') }} 
),
dim_product as (
    select * from {{ ref('dim_product') }} 
),
dim_product_type as (
    select * from {{ ref('dim_product_type') }} 
),
dim_section as (
    select * from {{ ref('dim_section') }} 
)
select 
    a.article_id,
    a.t_dat,
    last_day(a.t_dat) as period_dt,
    b.product_code,
    b.department_no

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
    sum(a.price) as sales_amt,
    sum(1) as sales_qty
from
    dcsea-ac-hpegoog.hnm_dl.transactions a
    inner join dcsea-ac-hpegoog.hnm_dl.articles b on a.article_id = b.article_id
    left join dim_colour_group c on c.colour_group_code = b.colour_group_code
