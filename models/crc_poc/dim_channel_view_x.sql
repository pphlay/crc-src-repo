
-- Use the `ref` function to select from other models


{{ config(materialized='table', cluster_by="sales_channel_id") }}
select *
from {{ ref('dim_channel') }}
where sales_channel_id = 1
