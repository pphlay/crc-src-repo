
-- Use the `ref` function to select from other models

select *
from {{ ref('dim_channel') }}
where id = 1
