with
    produto as (
        select produto_sk
                ,id_produto
                ,nome_produto
                ,tipo_oferta
        from {{ref('dim_produto')}}

    ),
    cliente as (
        select   cliente_sk
                ,id_cliente
                ,id_pessoa
                ,nome
                ,sobrenome
                ,id_cartao_credito
                ,numero_cartao
                ,tipo_cartao_credito
        from {{ref('dim_cliente')}}

    ),
    motivo_venda as (
        select   motivo_sk
                ,id_venda
                ,id_motivo
                ,nome_motivo
                ,tipo_motivo
        from {{ref('dim_motivo_venda')}}

    ),
    endereco as (
        select   endereco_sk
                ,id_endereco
                ,nome_cidade
                ,nome_estado
                ,codigo_estado
                ,nome_regiao
        from {{ref('dim_endereco')}}

    ),
    vendas as (
        select   id_venda
                ,dt_venda
                ,dt_limite_entrega
                ,status
                ,id_cliente
                ,id_cartao_credito
                ,id_endereco
                ,id_venda_detalhada
                ,qt_vendida
                ,id_produto
                ,id_desconto
                ,qt_preco_unitario
        from {{ref('stg_vendas')}}

    )
SELECT --row_number() over(order by a.id_produto) as produto_sk
        a.id_venda
        ,b.cliente_sk  as cliente_fk
        ,c.produto_sk  as produto_fk
        ,d.endereco_sk as endereco_fk
        ,e.motivo_sk   as motivo_fk
        ,a.dt_venda
        ,a.dt_limite_entrega
        ,a.status
        ,a.qt_vendida
        ,a.qt_preco_unitario
FROM vendas a
left join cliente       b on b.id_cliente = a.id_cliente and b.id_cartao_credito = a.id_cartao_credito
left join produto       c on c.id_produto  = a.id_produto
left join endereco      d on d.id_endereco = a.id_endereco
left join motivo_venda  e on e.id_venda = a.id_venda
