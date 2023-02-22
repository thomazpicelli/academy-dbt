with
    endereco as (
        select   cast(addressID        as int) as id_endereco
                ,cast(city             as string) as nome_cidade
                ,cast(stateprovinceID  as int) as id_estado
        from {{source('adventureworks','address')}}

    )
SELECT *
FROM endereco a