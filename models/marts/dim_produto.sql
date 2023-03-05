with
    produto as (
        select id_produto
               ,nome_produto
        from {{ref('stg_produto')}}

    ),
    oferta as (
        select   id_produto
                ,tipo_oferta
        from {{ref('stg_oferta')}}

    )
SELECT row_number() over(order by a.id_produto) as produto_sk
        ,a.id_produto
        ,a.nome_produto
        ,b.tipo_oferta
FROM produto a
left join oferta b on b.id_produto = a.id_produto