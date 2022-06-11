with
    sum_quantity as (
        SELECT
            sum(quantity) as total
        FROM {{ ref ('fact_order_detail') }}
        where order_date
        between '1997-01-01' and '1997-01-31'
    )

select * from sum_quantity where total != 2401