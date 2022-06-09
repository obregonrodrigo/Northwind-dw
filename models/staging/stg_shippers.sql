with source_data as (
    select
        shipper_id
        , company_name
        , phone
    from {{source('northwind_data','shippers')}}
)

select *
from source_data