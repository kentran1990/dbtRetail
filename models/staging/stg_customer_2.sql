

select
    'ZZZ' as C_NAME,
    100 as C_ACCTBAL,
    'ABC' as C_ADDRESS,
    200002 as C_CUSTKEY,
    NULL as C_NATIONKEY,
    NULL as C_PHONE,
    NULL as C_MKTSEGMENT,
    --current_timestamp() as UPDATED_DATETIME
    to_timestamp('2025-09-05 15:31:00') as UPDATED_DATETIME
