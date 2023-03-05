with
    vendaCab as (
        select   cast(salesorderID          as int)         as id_venda
                ,cast(OrderDate             as timestamp)   as dt_venda
                ,cast(DueDate               as timestamp)   as dt_limite_entrega
                ,cast(status                as string)      as status
                ,cast(CustomerID                as int)         as id_cliente                
                ,cast(CreditCardID          as int)         as id_cartao_credito
                ,cast(shiptoaddressid       as int)         as id_endereco
        from {{source('adventureworks','salesorderheader')}}
    ),
    
    VendaDetalhe as (
        select 
                cast(salesorderID               as int)         as id_venda
                ,cast(SalesOrderDetailID        as int)         as id_venda_detalhada
                ,cast(OrderQty                  as int)         as qt_vendida
                ,cast(ProductID                 as int)         as id_produto
                ,cast(SpecialOfferID            as int)         as id_desconto
                ,cast(UnitPrice                 as int)         as qt_preco_unitario
        from {{source('adventureworks','salesorderdetail')}}

    )
SELECT  distinct 
         a.id_venda
        ,a.dt_venda
        ,a.dt_limite_entrega
        ,a.status
        ,a.id_cartao_credito
        ,a.id_cliente
        ,a.id_endereco
        ,b.id_venda_detalhada
        ,b.qt_vendida
        ,b.id_produto
        ,b.id_desconto
        ,b.qt_preco_unitario
FROM vendaCab as a
inner join VendaDetalhe b         on b.id_venda = a.id_venda