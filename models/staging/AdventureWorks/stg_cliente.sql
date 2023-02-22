with
    cliente as (
        select   cast(customerid    as int) as id_cliente
                ,cast(personid      as int) as id_pessoa
        from {{source('adventureworks','customer')}}
    ),
    
    pessoa as (
        select cast(businessentityID        as int) as id_pessoa
                ,cast(firstname             as string) as Nome
                ,cast(lastname              as string) as Sobrenome
        from {{source('adventureworks','person')}}

    ),
    pessoa_cartao as (
        select cast(businessentityID        as int) as id_pessoa
                ,cast(creditcardid          as int) as id_cartao_credito
        from {{source('adventureworks','personcreditcard')}}
    ),
    cartao as (
        select  cast(creditcardid           as int) as id_cartao_credito
                ,cast(Cardtype              as string) as tipo_cartao_credito
                ,cast(CardNumber            as string) as numero_cartao
        from {{source('adventureworks','creditcard')}}
    )
SELECT   a.id_cliente
        ,a.id_pessoa
        ,b.nome
        ,b.sobrenome
        ,d.numero_cartao
        ,d.tipo_cartao_credito
FROM cliente as a
inner join pessoa b         on b.id_pessoa = a.id_pessoa
inner join pessoa_cartao c  on c.id_pessoa = b.id_pessoa
inner join cartao d         on d.id_cartao_credito = c.id_cartao_credito
