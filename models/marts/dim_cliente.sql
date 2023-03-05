with
    cliente as (
        select id_cliente
               ,id_pessoa
        from {{ref('stg_cliente')}}

    ),
    pessoa as (
        select   id_pessoa
                ,nome
                ,sobrenome
        from {{ref('stg_pessoa')}}

    ),
    cartao_credito as (
        select   id_pessoa
                ,id_cartao_credito
                ,numero_cartao
                ,tipo_cartao_credito
        from {{ref('stg_cartao_credito')}}

    )
SELECT row_number() over(order by a.id_cliente) as cliente_sk
        ,a.id_cliente
        ,a.id_pessoa
        ,b.nome
        ,b.sobrenome
        ,c.id_cartao_credito
        ,c.numero_cartao
        ,c.tipo_cartao_credito
FROM cliente a
left join pessoa         b on b.id_pessoa = a.id_pessoa
left join cartao_credito c on c.id_pessoa = b.id_pessoa