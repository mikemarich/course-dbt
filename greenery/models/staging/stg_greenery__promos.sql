{{ config(materialized='table') }}

with source as (

    select * from {{ source('src_greenery','promos') }}

),

renamed as (

    select
        -- ids
        promo_id,

        -- varchar
        status,

        --integer
        discount

    from source

)

select * from renamed