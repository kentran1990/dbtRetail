select
    C_NAME,
    C_ACCTBAL,
    C_ADDRESS,
    C_CUSTKEY,
    C_NATIONKEY,
    C_PHONE

from {{ source('pos','customer')}}
