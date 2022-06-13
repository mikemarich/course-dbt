{{ config(materialized='table') }}

with source as (

    select * from {{ source('src_greenery','events') }}

),

renamed as (

    select
        -- ids
        event_id,
        session_id,
        order_id,
        product_id,
        user_id,

        -- varchars
        page_url,
        event_type,

        --timestamp
        created_at

    from source

)

select * from renamed