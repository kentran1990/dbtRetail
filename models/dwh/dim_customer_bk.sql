{{
    config(
        materialized='incremental',
        unique_key='CustomerKey',
        incremental_strategy="merge" ,
        merge_update_columns=['CustomerName','CustomerAddress']
        
    )
}}
-- 
-- incremental_strategy: merge is default, append, delete+insert, insert_overwrite,microbatch
select
    CustomerAccountBalance,
    CustomerAddress,
    CustomerKey,
    CustomerName,
    UPDATED_DATETIME

from {{ ref("customer")}}