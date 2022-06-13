{{ config(materialized='table') }}

with source as (

    select * from {{ source('src_greenery','products') }}

),

renamed as (

    select
        -- ids
        product_id,

        -- varchar
        name,

        -- real
        price,

        --integer
        inventory

    from source

)

select * from renamed