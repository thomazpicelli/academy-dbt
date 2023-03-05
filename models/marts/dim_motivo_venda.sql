with
    motivo_venda as (
        select   id_venda
                ,id_motivo
                ,nome_motivo
                ,tipo_motivo
        from {{ref('stg_motivo_venda')}}

    )
SELECT row_number() over(order by a.id_motivo) as motivo_sk
        ,a.*
FROM motivo_venda a