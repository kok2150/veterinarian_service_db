CREATE TABLE veterinarian (
    vet_id          VARCHAR2(10)    NOT NULL,
    branch_id       VARCHAR2(10)    NOT NULL,
    name            VARCHAR2(100)   NOT NULL,
    specialization  VARCHAR2(100)   NOT NULL,
    license_no      VARCHAR2(10)    NOT NULL,
    phone           VARCHAR2(20),
    email           VARCHAR2(100),
    status          VARCHAR2(20)    DEFAULT 'AVAILABLE' NOT NULL,--5
    CONSTRAINT pk_veterinarian PRIMARY KEY (vet_id),
    CONSTRAINT fk_veterinarian_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    CONSTRAINT chk_veterinarian_vet_id CHECK (REGEXP_LIKE(vet_id, '^VET[0-9]{6}$')),
    CONSTRAINT chk_veterinarian_branch_id CHECK (REGEXP_LIKE(branch_id, '^BRH[0-9]{6}$')),
    CONSTRAINT chk_veterinarian_name CHECK (REGEXP_LIKE(name, '^[A-Za-z .-]+$')),
    CONSTRAINT chk_veterinarian_specialization CHECK (REGEXP_LIKE(specialization, '^[A-Za-z .-]+$')),
    CONSTRAINT chk_veterinarian_license_no CHECK (REGEXP_LIKE(license_no, '^L[0-9]{1,8}$')),
    CONSTRAINT chk_veterinarian_phone CHECK (REGEXP_LIKE(phone, '^[0-9]{10,11}$')),
    CONSTRAINT chk_veterinarian_email CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9_%.+-]+@[A-Za-z0-9_.-]+\.[A-Za-z]{2,}$')),
    CONSTRAINT chk_veterinarian_status CHECK (UPPER(status) IN ('AVAILABLE', 'ON LEAVE', 'RESIGNED'))
);