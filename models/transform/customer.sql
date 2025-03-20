select
    C_ACCTBAL as CustomerAccountBalance,
    C_ADDRESS as CustomerAddress,
    C_CUSTKEY as CustomerKey

from {{ ref("stg_customer")}}