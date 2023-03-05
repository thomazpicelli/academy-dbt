with
    endereco as (
        select   id_endereco
                ,nome_cidade
                ,id_estado
        from {{ref('stg_endereco')}}

    ),
    estado as (
        select   id_estado
                ,nome_estado
                ,codigo_estado
                ,id_regiao_pais
        from {{ref('stg_estado')}}

    ),
    regiao_pais as (
        select   id_regiao_pais
                 ,nome_regiao
        from {{ref('stg_regiao_pais')}}

    )
SELECT row_number() over(order by a.id_endereco) as endereco_sk
        ,a.id_endereco
        ,a.nome_cidade
        ,b.nome_estado
        ,b.codigo_estado
        ,c.nome_regiao
FROM endereco a
left join estado         b on b.id_estado = a.id_estado
left join regiao_pais    c on c.id_regiao_pais = b.id_regiao_pais