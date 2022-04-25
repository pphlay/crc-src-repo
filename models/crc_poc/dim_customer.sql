{{ config(materialized='incremental', unique_key = 'customer_id', 
merge_update_columns = ['FN', 'active','club_member_status','club_member_status_hash','fashion_news_frequency','age','postal_code','postal_code_encrypted']
, cluster_by = "customer_id") }}

with source_data as (
    select 
        customer_id,
        FN,
        ifnull(active,0) as active,
        club_member_status
        /*Hashing Sample*/
        SHA256(club_member_status) as club_member_status_hash,
        fashion_news_frequency,
        age,
        --SHA256(postal_code) as postal_code
        postal_code as postal_code,
        KEYS.NEW_KEYSET('AEAD_AES_GCM_256') as encrypt_keyset
    from 
        dcsea-ac-hpegoog.hnm_dl.customers
)

select *, AEAD.ENCRYPT(encrypt_keyset, postal_code, customer_id) as postal_code_encrypted
from source_data

/*Decrypt Logic:   AEAD.DECRYPT_STRING(encrypt_keyset, postal_code_encrypted, customer_id)*/