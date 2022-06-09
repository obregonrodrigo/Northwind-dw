with source_data as (
    select
        supplier_id
        , company_name
        , contact_name
        , contact_title
        , address as street_address
        , city
        , region
        , postal_code
        , country
        , phone
        , fax
        , homepage
    from {{source('northwind_data','suppliers')}}
)

select *
from source_data