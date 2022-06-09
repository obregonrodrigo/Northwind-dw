with customers as (
    select
        customer_sk
        , customer_id
    from {{ref('dim_customers')}}
)

, employees as (
    select
        employee_sk
        , employee_id
    from {{ref('dim_customers')}}
)

, products as (
    select
        product_sk
        , product_id
    from {{ref('dim_products')}}
)

, orders_with_sk as (
    select
        orders.order_id
        , employees.employee_sk as employee_fk
        , customers.customer_sk as customer_fk
        , orders.customer_id
        , orders.employee_id
        , orders.order_date
        , orders.required_date
        , orders.shipped_date
        , orders.ship_via
        , orders.freight
        , orders.ship_name
        , orders.ship_address
        , orders.ship_city
        , orders.ship_region
        , orders.ship_postal_code
        , orders.ship_country
    from {{ref('stg_orders')}} orders
    left join employees on orders.employee_id = employees.employee_id
    left join customers on orders.customer_id = customers.customer_id
)

, orders_detail_with_sk as (
    select
        order_details.order_id
        , products.product_sk as product_fk
        , order_details.discount
        , order_details.unit_price
        , order_details.quantity
    from {{ref('stg_order_details')}} order_details
    left join products on order_details.product_id = products.product_id
)

, final as (
    select
        order_details.order_id
        , orders.employee_fk
        , orders.customer_fk
        , order_details.product_fk
        , orders.order_date
        , orders.required_date
        , orders.shipped_date
        , orders.ship_via
        , orders.freight
        , orders.ship_name
        , orders.ship_address
        , orders.ship_city
        , orders.ship_region
        , orders.ship_postal_code
        , orders.ship_country
        , order_details.discount
        , order_details.unit_price
        , order_details.quantity
    from orders_with_sk as orders
    left join orders_detail_with_sk as order_details on orders.order_id = order_id
)

select *
from final