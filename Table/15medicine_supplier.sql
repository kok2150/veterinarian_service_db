CREATE TABLE medicine_supplier (
    medicine_id  VARCHAR2(10)   NOT NULL,
    supplier_id  VARCHAR2(10)   NOT NULL,
    unit_price   NUMBER(30,2)   NOT NULL,
    quantity     INT            NOT NULL,
    total        NUMBER(30,2)   NOT NULL,
    CONSTRAINT pk_medicine_supplier PRIMARY KEY (medicine_id, supplier_id),
    CONSTRAINT fk_medicine_id FOREIGN KEY (medicine_id) REFERENCES medicine(medicine_id),
    CONSTRAINT fk_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    CONSTRAINT chk_medicine_id CHECK (REGEXP_LIKE(medicine_id, '^MED[0-9]{6}$')),
    CONSTRAINT chk_supplier_id CHECK (REGEXP_LIKE(supplier_id, '^SUP[0-9]{6}$')),
    CONSTRAINT chk_unit_price CHECK (unit_price > 0),
    CONSTRAINT chk_quantity CHECK (quantity > 0),
    CONSTRAINT chk_total CHECK (total >= 0)
);