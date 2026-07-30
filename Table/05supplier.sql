CREATE TABLE supplier (
    supplier_id     VARCHAR2(10)   NOT NULL,
    company_name    VARCHAR2(100)  NOT NULL,
    contact_person  VARCHAR2(100)  NOT NULL,
    phone           VARCHAR2(20)   NOT NULL,
    email           VARCHAR2(100),
    address         VARCHAR2(100),
    CONSTRAINT pk_supplier PRIMARY KEY (supplier_id),
    CONSTRAINT chk_supplier_id CHECK (REGEXP_LIKE(supplier_id, '^SUP[0-9]{6}$')),
    CONSTRAINT chk_company_name CHECK (REGEXP_LIKE(company_name, '^[A-Za-z0-9_%.+ -]+$')),
    CONSTRAINT chk_contact_person CHECK (REGEXP_LIKE(contact_person, '^[A-Za-z .-]+$')),
    CONSTRAINT chk_phone CHECK (REGEXP_LIKE(phone, '^[0-9]{10,11}$')),
    CONSTRAINT chk_email CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9_%.+-]+@[A-Za-z0-9_.-]+\.[A-Za-z]{2,}$')),
    CONSTRAINT chk_address CHECK (REGEXP_LIKE(address, '^[A-Za-z0-9/#,. -]+$'))
);