{{ config(materialized='table', cluster_by="sales_channel_id") }}
select A.*,B.*
from {{ ref('dim_channel') }} A
inner join  {{ ref('dim_garment_group') }} B on 1=1
inner join  {{ ref('dim_channel_view_x') }} C on 1=1
where A.sales_channel_id = 1