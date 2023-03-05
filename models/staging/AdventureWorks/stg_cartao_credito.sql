with
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
SELECT  a.id_pessoa
        ,a.id_cartao_credito
        ,b.numero_cartao
        ,b.tipo_cartao_credito
FROM pessoa_cartao a
inner join cartao b on b.id_cartao_credito = a.id_cartao_credito
