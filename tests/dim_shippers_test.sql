with
    check_shippers as (
        SELECT
            count(shipper_id) as total
        FROM {{ ref ('dim_shippers') }}
        WHERE shipper_id = 6 and company_name = 'DHL'
    )

select * from check_shippers where total != 1