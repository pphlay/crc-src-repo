
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
asfasfsafsafasf a safsaefsadfasdfsfdadASDAsdASDAsdasdqasd
    Try changing "table" to "view" below fffff abc abdccsdfsfsf
*/

{{ config(materialized='table', cluster_by = "sales_channel_id") }}

with source_data as (

    select distinct sales_channel_id , if(sales_channel_id=1,'Channel 1','Channel 2') as sales_channel_name from dcsea-ac-hpegoog.hnm_dl.transactions

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
