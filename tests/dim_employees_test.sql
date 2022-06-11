with
    check_hire_date as (
        SELECT
            count(employee_id) as total
        FROM {{ ref ('dim_employees') }}
        WHERE hire_date = '1992-05-01'
    )

select * from check_hire_date where total != 1