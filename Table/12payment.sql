CREATE TABLE payment (
    payment_id      VARCHAR2(10)   NOT NULL,
    visit_id        VARCHAR2(10)   NOT NULL,
    amount          NUMBER(30,2)   NOT NULL,
    payment_method  VARCHAR2(20)   NOT NULL,
    payment_date    DATE           DEFAULT SYSDATE NOT NULL,
    status          VARCHAR2(20)   DEFAULT 'pending' NOT NULL,
    CONSTRAINT pk_payment PRIMARY KEY (payment_id),
    CONSTRAINT fk_visit_id FOREIGN KEY (visit_id) REFERENCES medical_visit(visit_id),
    CONSTRAINT chk_payment_id CHECK (REGEXP_LIKE(payment_id, '^PMT[0-9]{6}$')),
    CONSTRAINT chk_visit_id CHECK (REGEXP_LIKE(visit_id, '^VIS[0-9]{6}$')),
    CONSTRAINT chk_amount CHECK (amount > 0),
    CONSTRAINT chk_payment_method CHECK (payment_method IN ('Cash', 'Card', 'E-wallet', 'Insurance')),
    CONSTRAINT chk_status CHECK (status IN ('paid', 'pending', 'failed', 'refunded'))
);