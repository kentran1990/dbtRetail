

select
    C_NAME,
    cast(C_ACCTBAL as number(15,5)) as C_ACCTBAL,
    C_ADDRESS,
    C_CUSTKEY,
    C_NATIONKEY,
    C_PHONE,
    C_MKTSEGMENT,
    UPDATED_DATETIME

from {{ source('pos', 'customer') }}


union all 

select 
    C_NAME,
    C_ACCTBAL,
    C_ADDRESS,
    C_CUSTKEY,
    C_NATIONKEY,
    C_PHONE,
    C_MKTSEGMENT,
    UPDATED_DATETIME

from {{ref('stg_customer_ephemeral')}}
 where C_NAME <> 'AAAA'

