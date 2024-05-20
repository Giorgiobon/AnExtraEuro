DROP DATABASE IF EXISTS AnExtraEuro;
CREATE DATABASE AnExtraEuro;
USE AnExtraEuro;

DROP TABLE IF EXISTS DONARE;
DROP TABLE IF EXISTS PROGETTO;
DROP TABLE IF EXISTS ACCOUNT;
DROP TABLE IF EXISTS CATEGORIA;

CREATE TABLE ACCOUNT (
    ID INT NOT NULL AUTO_INCREMENT,
    NICKNAME VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    ABILITATO BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_ID PRIMARY KEY (ID)
);

CREATE TABLE CATEGORIA (
    NOMINATIVO VARCHAR(20) NOT NULL,
    DESCRIZIONE VARCHAR(200) NOT NULL,
    CONSTRAINT pk_NOMINATIVO PRIMARY KEY (NOMINATIVO)
);

CREATE TABLE PROGETTO (
    ID INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    DESCRIZIONE VARCHAR(255) NOT NULL,
    ACCOUNT_ID INT NOT NULL,
    CATEGORIA_NOMINATIVO VARCHAR(20) NOT NULL,
    OBBIETTIVO INT NOT NULL,
    CONCLUSO BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_ID PRIMARY KEY (ID),
    FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNT(ID),
    FOREIGN KEY (CATEGORIA_NOMINATIVO) REFERENCES CATEGORIA(NOMINATIVO)
);

CREATE TABLE DONARE (
    ACCOUNT_ID INT NOT NULL,
    PROGETTO_ID INT NOT NULL,
    VALORE_DONAZIONE DECIMAL(10, 2) NOT NULL,
    DATA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNT(ID),
    FOREIGN KEY (PROGETTO_ID) REFERENCES PROGETTO(ID)
);