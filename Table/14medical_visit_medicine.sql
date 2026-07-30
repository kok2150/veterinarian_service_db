CREATE TABLE medical_visit_medicine (
    visit_id      VARCHAR2(10)   NOT NULL,
    medicine_id   VARCHAR2(10)   NOT NULL,
    price         NUMBER(30,2)   NOT NULL,
    dosage_qty    INT            DEFAULT 1 NOT NULL,
    subtotal      NUMBER(30,2)   NOT NULL,
    CONSTRAINT pk_medical_visit_medicine PRIMARY KEY (visit_id, medicine_id),
    CONSTRAINT fk_visit_id FOREIGN KEY (visit_id) REFERENCES medical_visit(visit_id),
    CONSTRAINT fk_medicine_id FOREIGN KEY (medicine_id) REFERENCES medicine(medicine_id),
    CONSTRAINT chk_visit_id CHECK (REGEXP_LIKE(visit_id, '^VIS[0-9]{6}$')),
    CONSTRAINT chk_medicine_id CHECK (REGEXP_LIKE(medicine_id, '^MED[0-9]{6}$')),
    CONSTRAINT chk_price CHECK (price > 0),
    CONSTRAINT chk_dosage_qty CHECK (dosage_qty > 0),
    CONSTRAINT chk_subtotal CHECK (subtotal >= 0)
);