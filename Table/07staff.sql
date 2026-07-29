create table staff(
    staff_id    VARCHAR2(10)    NOT NULL,
    branch_id   VARCHAR2(10)    NOT NULL,
    name        VARCHAR2(100)   NOT NULL,
    role        VARCHAR2(100)   NOT NULL,
    phone       VARCHAR2(20),
    email       VARCHAR2(100),
    status      VARCHAR2(20)    DEFAULT 'AVAILABLE' NOT NULL,
CONSTRAINT  pk_staff            PRIMARY KEY (staff_id),
CONSTRAINT  fk_staff            FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
CONSTRAINT  chk_staff_id        CHECK       (REGEXP_LIKE(staff_id,'^S[0-9]{1,8}$')),
CONSTRAINT  chk_staff_branch_id CHECK       (REGEXP_LIKE(branch_id,'^B[0-9]{1,8}$')),
CONSTRAINT  chk_staff_name      CHECK       (REGEXP_LIKE(name,'^[A-Za-z .-]+$')),
CONSTRAINT  chk_staff_role      CHECK       (REGEXP_LIKE(role,'^[A-Za-z .-]+$')),
CONSTRAINT  chk_staff_phone     CHECK       (REGEXP_LIKE(phone,'^[0-9]{10,11}$')),
CONSTRAINT  chk_staff_email     CHECK       (REGEXP_LIKE(email,'^[A-Za-z0-9_%.+-]+@[A-Za-z0-9_.-]+\.[A-Za-z]{2,}$')),
CONSTRAINT  chk_staff_status    CHECK       (UPPER(status) IN ('AVAILABLE', 'ON LEAVE', 'RESIGNED'))
)