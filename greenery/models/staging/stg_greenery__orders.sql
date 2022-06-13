{{ config(materialized='table') }}

with source as (

    select * from {{ source('src_greenery','orders') }}

),

renamed as (

    select
        -- ids
        order_id,
        tracking_id,
        address_id,
        promo_id,
        user_id,

        -- varchars
        shipping_service,
        status,

        --reals
        order_cost,
        shipping_cost,
        order_total,

        --timestamps
        created_at,
        estimated_delivery_at,
        delivered_at

    from source

)

select * from renamed