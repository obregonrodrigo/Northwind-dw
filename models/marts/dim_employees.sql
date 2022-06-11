with staging as (
    select *
    from {{ref('stg_employees')}}
)
    , transformed as (
        select
            row_number() over (order by employee_id) as employee_sk -- auto-incremental surrogate key
            , employee_id
            , full_name
            , title
            -- , title_of_courtesy
            , birth_date
            , hire_date
            , street_address
            , city
            -- , region
            , postal_code
            , country
            , home_phone
            , notes
            , reports_to
        from staging
)

select *  from transformed