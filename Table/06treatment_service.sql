create table treatment_service(
    service_id      VARCHAR2(10)    NOT NULL,
    service_name    VARCHAR2(100)   NOT NULL,
    category_name   VARCHAR2(100)   NOT NULL,
    standard_price  NUMBER(30,2)    NOT NULL,
    description     VARCHAR2(500),
CONSTRAINT  pk_ts               PRIMARY KEY (service_id),
CONSTRAINT  chk_ts_service_id      CHECK       (REGEXP_LIKE(service_id,'^SE[0-9]{1,8}$')),
CONSTRAINT  chk_ts_service_name    CHECK       (REGEXP_LIKE(service_name,'^[A-Za-z0-9 ./#+-]$')),
CONSTRAINT  chk_ts_serv_category   CHECK       (UPPER(category_name) IN ('VACCINATION', 'CONSULTATION', 'SURGERY', 'DENTAL', 'GROOMING', 'DIAGNOSTIC', 'EMERGENCY', 'DEWORMING')),
CONSTRAINT  chk_ts_standard_price  CHECK       (standard_price > 0),
)