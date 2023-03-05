with
    salesorderheadersalesreason as (
        select   cast(SalesReasonID          as int)    as id_motivo
                ,cast(SalesOrderID           as int)    as id_venda
        from {{source('adventureworks','salesorderheadersalesreason')}}
    ),
    salesreason as (
        select 
                cast(SalesReasonID              as int)         as id_motivo
                ,cast(Name                      as string)      as nome_motivo
                ,cast(ReasonType                as string)      as tipo_motivo
        from {{source('adventureworks','salesreason')}}

    )
SELECT  distinct 
         a.id_venda
        ,a.id_motivo
        ,b.nome_motivo
        ,b.tipo_motivo
FROM salesorderheadersalesreason as a
inner join salesreason b         on b.id_motivo = a.id_motivo