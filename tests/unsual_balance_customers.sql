{{ config(
            severity = 'error'
            , error_if = '>150000'
            ) }}

select CustomerName,
    sum(CustomerAccountBalance) CustomerAccountBalance
from {{ref('customer')}}
group by 1
having sum(CustomerAccountBalance) > 1000 