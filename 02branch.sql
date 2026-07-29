CREATE TABLE branch (
    branch_id     VARCHAR2(10)   NOT NULL,
    branch_name   VARCHAR2(100)  NOT NULL,
    address       VARCHAR2(100)  NOT NULL,
    city          VARCHAR2(100)  NOT NULL,
    postcode      VARCHAR2(10)   NOT NULL, 
    phone         VARCHAR2(20)   NOT NULL,
    CONSTRAINT pk_branch PRIMARY KEY (branch_id),
    CONSTRAINT chk_branch_branch_id CHECK (REGEXP_LIKE(branch_id, '^BRH[0-9]{6}$')),
    CONSTRAINT chk_branch_postcode CHECK (REGEXP_LIKE(postcode, '^[0-9]{5}$')),
    CONSTRAINT chk_branch_phone CHECK (REGEXP_LIKE(phone, '^[0-9]{10,11}$'))
);