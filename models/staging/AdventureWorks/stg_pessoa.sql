with
    pessoa as (
        select cast(businessentityID        as int) as id_pessoa
                ,cast(firstname             as string) as Nome
                ,cast(lastname              as string) as Sobrenome
        from {{source('adventureworks','person')}}

    )
SELECT *
FROM pessoa a