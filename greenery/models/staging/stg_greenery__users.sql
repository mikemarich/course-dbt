{{ config(materialized='table') }}

with source as (

    select * from {{ source('src_greenery','users') }}

),

renamed as (

    select
        -- ids
        user_id,
        address_id,

        -- varchars
        first_name,
        last_name,
        email,
        phone_number,

        --timestamp
        created_at,
        updated_at

    from source

)

select * from renamed