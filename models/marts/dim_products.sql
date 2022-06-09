with products as (
    select *
    from {{ref('stg_products')}}
)

    , categories as (
        select *
        from {{ref('stg_categories')}}
    )

    , transformed as (
        select row_number() over (order by product_id) as product_sk -- auto-incremental surrogate key
        , products.product_id
        , products.supplier_id
        , products.category_id
        , products.product_name		
        , products.qty_per_unit
        , products.unit_price
        , products.units_in_stock
        , products.units_on_order
        , products.reorder_level
        , products.is_discontinued
        , categories.category_name
        , categories.notes
        from products
        left join categories on products.category_id = categories.category_id
)

select *
from transformed