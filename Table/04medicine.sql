create table medicine(
    medicine_id     VARCHAR2(10)                NOT NULL,
    medicine_name   VARCHAR2(100)               NOT NULL,
    unit            VARCHAR2(10)                NOT NULL,
    unit_price      NUMBER(20,2)                NOT NULL,
    stock_qty       INT             DEFAULT 0   NOT NULL,
CONSTRAINT  pk_medicine             PRIMARY KEY     (medicine_id),
CONSTRAINT chk_medicine_id_format   CHECK           (REGEXP_LIKE(medicine_id, '^M[0-9]{1,9}$')),
CONSTRAINT  chk_medicine_name       CHECK           (REGEXP_LIKE(medicine_name,'^[A-Za-z0-9().-+ ]+$')),
CONSTRAINT  chk_unit                CHECK           (UPPER(unit) IN ('TABLET','ML','BOTTLE','CAPSULE','VIAL','SACHET','TUBE')),
CONSTRAINT  chk_unit_price          CHECK           (unit_price > 0),
CONSTRAINT  chk_stock_qty           CHECK           (stock_qty >= 0)
)