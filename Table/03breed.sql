CREATE TABLE breed (
    breed_id           VARCHAR2(10)   NOT NULL,
    breed_name         VARCHAR2(50)   NOT NULL,
    species_name       VARCHAR2(50)   NOT NULL,
    size_category      VARCHAR2(10)   NOT NULL,
    average_life_span  NUMBER(5,2)    NOT NULL,
    CONSTRAINT pk_breed PRIMARY KEY (breed_id),
    CONSTRAINT chk_breed_breed_id CHECK (REGEXP_LIKE(breed_id, '^BRD[0-9]{6}$')),
    CONSTRAINT chk_breed_breed_name CHECK (REGEXP_LIKE(breed_name, '^[A-Za-z0-9 ]+$')),
    CONSTRAINT chk_breed_species_name CHECK (REGEXP_LIKE(species_name, '^[A-Za-z0-9]+$')),
    CONSTRAINT chk_breed_size_category CHECK (UPPER(size_category) IN ('SMALL', 'MEDIUM', 'LARGE', 'GIANT')),
    CONSTRAINT chk_breed_average_life_span CHECK (average_life_span > 0)
);