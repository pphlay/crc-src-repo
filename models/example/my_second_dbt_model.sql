
-- Use the `ref` function to select from other models

select *
from {{ ref('dim_channel') }}
where sales_channel_id = 1
