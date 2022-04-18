{{ config(
    materialized='table', 
    partition_by={
        "field":"period_dt",
        "data_type": "date",
        "granularity": "day"
        }, cluster_by=["product_code","department_no"]) }}

with fact_sales as (
    select * from {{ ref('fact_sales_by_dbt') }}
)
select 
    period_dt,
    product_code,
    product_type_no,
    graphical_appearance_no,
    colour_group_code,
    perceived_colour_value_id,
    perceived_colour_master_id,
    department_no,
    index_code,
    index_group_no,
    section_no,
    garment_group_no,
    customer_id,
    sales_channel_id,

/*Denomalized Column For Account / Measures*/

    sum(sales_amt) as sales_amt,
    sum(sales_qty) as sales_qty,
    sum(sales_amt * 0.3) as cogs_amt,
    sum(sales_amt * 0.02) as kpi_1,
    sum(sales_amt * 0.03) as kpi_2,
    sum(sales_amt * 0.05) as kpi_3,
    sum(sales_amt) as ytd_sales_amt,
    sum(sales_qty) as ytd_sales_qty,
    sum(sales_amt * 0.3) as ytd_cogs_amt,
    sum(sales_amt * 0.02) as ytd_kpi_1,
    sum(sales_amt * 0.03) as ytd_kpi_2,
    sum(sales_amt * 0.05) as ytd_kpi_3
from
    fact_sales
group by 
    1,2,3,4,5,6,7,8,9,10,11,12,13,14
