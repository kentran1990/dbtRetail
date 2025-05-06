select
    C_ACCTBAL as CustomerAccountBalance,
    C_ADDRESS as CustomerAddress,
    C_CUSTKEY as CustomerKey,
    C_NAME    as CustomerName,
    UPDATED_DATETIME as UPDATED_DATETIME

from {{ ref("stg_customer")}}
--where DATE_TRUNC(DAY, UPDATED_DATETIME) in ({{ var('var_common_fromdate') | join(',') }})
where DATE_TRUNC(DAY, UPDATED_DATETIME) between {{ var('var_common_fromdate')}} and {{ var('var_common_todate')}}

union all 

select
    C_ACCTBAL as CustomerAccountBalance,
    C_ADDRESS as CustomerAddress,
    C_CUSTKEY as CustomerKey,
    C_NAME    as CustomerName,
    UPDATED_DATETIME as UPDATED_DATETIME

from {{ ref("stg_customer_2")}}