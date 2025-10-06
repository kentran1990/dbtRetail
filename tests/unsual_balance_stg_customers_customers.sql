{{ config(
            severity = 'error'
            , error_if = '>150000'
            ) }}

select CustomerName,
    sum(CustomerAccountBalance) CustomerAccountBalance
from {{ref('customer')}}
group by 1
having sum(CustomerAccountBalance) > 1000
-- Just to test the indirect selection flag
union
select C_NAME,
    sum(C_ACCTBAL) CustomerAccountBalance
from {{ref('stg_customer')}}
group by 1
having sum(C_ACCTBAL) > 1000