with source_data as (
    select
        category_id
        , category_name
        , description as notes
    from {{source('northwind_data','categories')}}
)

select *
from source_data