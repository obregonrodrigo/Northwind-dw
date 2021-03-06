with source_data as (
    select
        customer_id
        , company_name
        , contact_name
        , contact_title
        , 'address' as street_address
        , city
        , region
        , postal_code
        , country
        , phone
        , fax
    from {{source('northwind_data','customers')}}
)

select *
from source_data