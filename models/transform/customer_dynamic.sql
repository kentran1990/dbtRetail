{{ config(
    materialized="dynamic_table",
    on_configuration_change="apply",
    target_lag="1 days",
    snowflake_warehouse="COMPUTE_WH",
    refresh_mode="AUTO",
    initialize="ON_CREATE" 

) }}
select
    C_ACCTBAL as CustomerAccountBalance,
    C_ADDRESS as CustomerAddress,
    C_CUSTKEY as CustomerKey,
    C_NAME    as CustomerName,
    UPDATED_DATETIME as UPDATED_DATETIME

from {{ ref("stg_customer")}}
--where DATE_TRUNC(DAY, UPDATED_DATETIME) in ({{ var('var_common_fromdate') | join(',') }})
where DATE_TRUNC(DAY, UPDATED_DATETIME) between {{ var('var_common_fromdate')}} and {{ var('var_common_todate')}}