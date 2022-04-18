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
dim_color_group as (
    select * from {{ ref('dim_color_group') }} 
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
    last_day(t_dat) as period_dt,
    a.product_code
from
    dcsea-ac-hpegoog.hnm_dl.transactions a
    inner join dcsea-ac-hpegoog.hnm_dl.articles b on a.article_id = b.article_id
