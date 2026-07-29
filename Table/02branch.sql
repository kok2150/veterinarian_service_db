create table branch(
    branch_id   varchar2(10)    not null,
    branch_name varchar2(100)   not null,
    address     varchar2(100)   not null,
    city        varchar2(100)   not null,
    postcode    varchar2(10)    not null, 
    phone       varchar2(20)    not null,
CONSTRAINT pk_branch            PRIMARY KEY (branch_id),
CONSTRAINT chk_bran_id_format   CHECK       (REGEXP_LIKE(branch_id, '^B[0-9]{1,9}$')),
CONSTRAINT chk_postcode         CHECK       (REGEXP_LIKE(postcode,'^[0-9]{5}$')),
CONSTRAINT chk_phone            CHECK       (REGEXP_LIKE(phone,'^[0-9]{10,11}$'))
); 