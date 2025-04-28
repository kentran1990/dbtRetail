select
    C_ACCTBAL as CustomerAccountBalance,
    C_ADDRESS as CustomerAddress,
    C_CUSTKEY as CustomerKey,
    C_NAME    as CustomerName,
    UPDATED_DATETIME as UPDATED_DATETIME

from {{ ref("stg_customer")}}