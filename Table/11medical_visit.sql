CREATE TABLE medical_visit (
    visit_id        VARCHAR2(10)   NOT NULL,
    appointment_id  VARCHAR2(10)   NOT NULL,
    visit_time      DATE           DEFAULT SYSDATE NOT NULL,
    diagnosis       VARCHAR2(100)  NOT NULL,
    weight          NUMBER(30,2)   NOT NULL,
    notes           VARCHAR2(500),
    CONSTRAINT pk_medical_visit PRIMARY KEY (visit_id),
    CONSTRAINT fk_appointment_id FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id),
    CONSTRAINT chk_visit_id CHECK (REGEXP_LIKE(visit_id, '^VIS[0-9]{6}$')),
    CONSTRAINT chk_appointment_id CHECK (REGEXP_LIKE(appointment_id, '^APT[0-9]{6}$')),
    CONSTRAINT chk_weight CHECK (weight > 0)
);