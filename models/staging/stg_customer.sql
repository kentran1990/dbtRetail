select
    C_NAME,
    C_ACCTBAL,
    C_ADDRESS,
    C_CUSTKEY

from {{ source('pos','customer')}}