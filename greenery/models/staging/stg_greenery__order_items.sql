{{ config(materialized='table') }}

with source as (

    select * from {{ source('src_greenery','order_items') }}

),

renamed as (

    select
        -- ids
        order_id,
        product_id,

        --integer
        quantity

    from source

)

select * from renamed