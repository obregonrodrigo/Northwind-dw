with source_data as (
    select
        order_id  
        , product_id
        , unit_price
        , quantity
        , discount
        , (quantity * unit_price) as total_order
    from {{source('northwind_data','order_details')}}
)

select *
from source_data