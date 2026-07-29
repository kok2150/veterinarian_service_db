CREATE TABLE customer (
    customer_id   VARCHAR2(10)   NOT NULL,
    first_name    VARCHAR2(100)  NOT NULL,
    last_name     VARCHAR2(100)  NOT NULL,
    gender        VARCHAR2(1),
    ic_no         VARCHAR2(20)   NOT NULL,
    phone         VARCHAR2(20)   NOT NULL,
    email         VARCHAR2(100),
    address       VARCHAR2(200), 
    CONSTRAINT pk_customer PRIMARY KEY (customer_id),
    CONSTRAINT chk_customer_customer_id CHECK (REGEXP_LIKE(customer_id, '^CUST[0-9]{6}$')),
    CONSTRAINT chk_customer_gender CHECK (UPPER(gender) IN ('M', 'F')),
    CONSTRAINT chk_customer_ic_no CHECK (REGEXP_LIKE(ic_no, '^[0-9]{12}$')),
    CONSTRAINT chk_customer_phone CHECK (REGEXP_LIKE(phone, '^[0-9]{10,11}$')),
    CONSTRAINT chk_customer_email CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);