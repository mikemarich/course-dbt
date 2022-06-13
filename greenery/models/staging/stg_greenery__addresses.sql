{{ config(materialized='table') }}

with source as (

    select * from {{ source('src_greenery','addresses') }}

),

renamed as (

    select
        -- ids
        address_id,

        -- varchars
        address,
        state,
        country,

        --integer
        zipcode

    from source

)

select * from renamed