CREATE TABLE medical_visit_treatment (
    visit_id      VARCHAR2(10)   NOT NULL,
    service_id    VARCHAR2(10)   NOT NULL,
    price         NUMBER(30,2)   NOT NULL,
    quantity      INT            DEFAULT 1 NOT NULL,
    subtotal      NUMBER(30,2)   NOT NULL,
    CONSTRAINT pk_medical_visit_treatment PRIMARY KEY (visit_id, service_id),
    CONSTRAINT fk_visit_id FOREIGN KEY (visit_id) REFERENCES medical_visit(visit_id),
    CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES treatment_service(service_id),
    CONSTRAINT chk_visit_id CHECK (REGEXP_LIKE(visit_id, '^VIS[0-9]{6}$')),
    CONSTRAINT chk_service_id CHECK (REGEXP_LIKE(service_id, '^SRV[0-9]{6}$')),
    CONSTRAINT chk_price CHECK (price > 0),
    CONSTRAINT chk_quantity CHECK (quantity > 0),
    CONSTRAINT chk_subtotal CHECK (subtotal >= 0)
);