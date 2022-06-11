with
    check_products as (
        SELECT
            count(product_id) as total
        FROM {{ ref ('dim_products') }}
        WHERE product_id = 2 and product_name = 'Chang'
    )

select * from check_products where total != 1