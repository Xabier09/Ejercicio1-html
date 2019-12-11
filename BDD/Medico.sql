create TABLE medico (
    cod_m       INT,
    nombre      VARCHAR(25) NOT NULL,
    apellido    VARCHAR(25) NOT NULL,
    fecha_nac   DATE NOT NULL,
    PRIMARY KEY (cod_m));

CREATE TABLE paciente (
    DNI         VARCHAR(9),
    nombre      VARCHAR(25) NOT NULL,
    apellido    VARCHAR(25) NOT NULL,
    cod_m       INT,
    PRIMARY KEY (DNI),
    FOREIGN KEY (cod_m) REFERENCES medico(cod_m));

CREATE TABLE consultas (
    DNI         VARCHAR(9),
    cod_m       INT,
    fecha_hora  DATE,
    PRIMARY KEY (DNI, cod_m, fecha_hora),
    FOREIGN KEY (cod_m) REFERENCES medico(cod_m),
    FOREIGN KEY (DNI) REFERENCES paciente(DNI));