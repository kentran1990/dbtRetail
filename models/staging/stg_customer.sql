select
    C_NAME,
    C_ACCTBAL,
    C_ADDRESS,
    C_CUSTKEY,
    C_NATIONKEY,
    C_PHONE,
    C_MKTSEGMENT

from {{ source('pos','customer')}}
