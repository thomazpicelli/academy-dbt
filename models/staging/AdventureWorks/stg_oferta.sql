with
    specialofferproduct as (
        select   cast(specialofferid          as int) as id_oferta
                ,cast(productid             as int)   as id_produto
        from {{source('adventureworks','specialofferproduct')}}
    ),
    
    specialoffer as (
        select 
                cast(specialofferid     as int)         as id_oferta
                ,cast(type              as string)         as tipo_oferta
        from {{source('adventureworks','specialoffer')}}

    )
SELECT  distinct 
         a.id_oferta
        ,a.id_produto
        ,b.tipo_oferta
FROM specialofferproduct as a
inner join specialoffer b         on b.id_oferta = a.id_oferta