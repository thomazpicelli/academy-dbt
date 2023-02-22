with
    cliente as (
        select   cast(customerid    as int) as id_cliente
                ,cast(personid      as int) as id_pessoa
        from {{source('adventureworks','customer')}}
    )
SELECT  *
FROM cliente as a