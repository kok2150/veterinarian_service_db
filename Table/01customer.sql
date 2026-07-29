create table customer (
    customer_id varchar2(10)    not null,
    first_name  varchar2(100)   not null,
    last_name   varchar2(100)   not null,
    gender      varchar2(1),
    ic_no       varchar2(20)    not null,
    phone       varchar2(20)    not null,
    email       varchar2(100),
    address     varchar2(200),
CONSTRAINT pk_customer          PRIMARY KEY (customer_id),
CONSTRAINT chk_cust_id_format   CHECK       (REGEXP_LIKE(customer_id, '^C[0-9]{1,9}$')),
CONSTRAINT chk_cust_gender      CHECK       (UPPER(gender) IN ('M','F')),
CONSTRAINT chk_cust_ic_no       CHECK       (REGEXP_LIKE(ic_no,'^[0-9]{12}$')),
CONSTRAINT chk_cust_phone       CHECK       (REGEXP_LIKE(phone,'^[0-9]{10,11}$')),
CONSTRAINT chk_cust_email       CHECK       (REGEXP_LIKE(email,'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);