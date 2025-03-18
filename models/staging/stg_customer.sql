select
    C_ACCTBAL,
    C_ADDRESS,
    C_CUSTKEY

from {{ source('pos','customer')}}