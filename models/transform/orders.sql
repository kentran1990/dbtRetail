{{ config(
    materialized = "incremental",
    unique_key= "OrderKey",
    incremental_strategy= "merge"  
    
)
}}
select
    o_orderkey as OrderKey
    ,o_custkey as CustomerKey
    ,o_orderstatus as OrderStatus
    ,o_totalprice as TotalPrice
    ,o_orderdate as OrderDate
    ,UPDATED_DATETIME as UPDATED_DATETIME

from {{ ref("stg_orders")}} 
{% if is_incremental() %}
        where DATE_TRUNC(DAY, UPDATED_DATETIME) >= dateadd(day, -7, current_date)
        --where DATE_TRUNC(DAY, UPDATED_DATETIME) between {{ var('var_common_fromdate')}} and {{ var('var_common_todate')}}
{% endif %}
