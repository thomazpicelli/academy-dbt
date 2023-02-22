with
    regiao_pais as (
        select   cast(countryregioncode       as string) as id_regiao_pais
                ,cast(name                  as string) as nome_regiao
        from {{source('adventureworks','countryregion')}}

    )
SELECT *
FROM regiao_pais a