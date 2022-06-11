with
    count_customers as (
        SELECT
            count(customer_id) as total
        FROM {{ ref ('dim_customers') }}
        WHERE company_name = 'Alfreds Futterkiste' AND customer_id = 'ALFKI'
    )

select * from count_customers where total != 1