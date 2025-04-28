{{
    config(
        materialized='incremental',
        unique_key='CustomerKey',
        incremental_strategy="merge" 
    )
}}
-- incremental_strategy: merge is default, append, delete+insert, insert_overwrite,microbatch
select
    CustomerAccountBalance,
    CustomerAddress,
    CustomerKey,
    CustomerName,
    UPDATED_DATETIME

from {{ ref("customer")}}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later on the same day as the last run of this model)
  where UPDATED_DATETIME >= (select coalesce(max(UPDATED_DATETIME), '1900-01-01') from {{ this }})

{% endif %}