CREATE TABLE pet (
    pet_id        VARCHAR2(10)   NOT NULL,
    customer_id   VARCHAR2(10)   NOT NULL,
    breed_id      VARCHAR2(10)   NOT NULL,
    pet_name      VARCHAR2(100)  NOT NULL,
    gender        VARCHAR2(1),
    birth_date    DATE,
    temperament   VARCHAR2(20),
    CONSTRAINT pk_pet PRIMARY KEY (pet_id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_breed_id FOREIGN KEY (breed_id) REFERENCES breed(breed_id),
    CONSTRAINT chk_pet_id CHECK (REGEXP_LIKE(pet_id, '^PET[0-9]{6}$')),
    CONSTRAINT chk_customer_id CHECK (REGEXP_LIKE(customer_id, '^CUST[0-9]{6}$')),
    CONSTRAINT chk_breed_id CHECK (REGEXP_LIKE(breed_id, '^BRD[0-9]{6}$')),
    CONSTRAINT chk_gender CHECK (UPPER(gender) IN ('M', 'F')),
    CONSTRAINT chk_temperament CHECK (LOWER(temperament) IN ('fearful', 'aggressive', 'calm', 'anxious'))
);