with source_data as (
    select
        employee_id
        , last_name
        , first_name
        , concat(first_name, ' ',last_name) as full_name
        , title
        , title_of_courtesy
        , birth_date
        , hire_date
        , 'address' as street_address
        , city
        , region
        , postal_code
        , country
        , home_phone
        , extension
        , notes
        , reports_to
    from {{ source('northwind_data', 'employees')}}
)

select *
from source_data