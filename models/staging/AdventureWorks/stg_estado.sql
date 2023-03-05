with
    estado as (
        select   cast(stateprovinceID       as int)    as id_estado
                ,cast(name                  as string) as nome_estado
                ,cast(StateProvinceCode     as string) as codigo_estado
                ,cast(countryregioncode     as string) as id_regiao_pais
        from {{source('adventureworks','stateprovince')}}

    )
SELECT *
FROM estado a