with
    produto as (
        select cast(ProductID        as int) as id_produto
                ,cast(name             as string) as nome_produto
        from {{source('adventureworks','product')}}

    )
SELECT *
FROM produto a