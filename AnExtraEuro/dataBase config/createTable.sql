DROP DATABASE IF EXISTS AnExtraEuro;
CREATE DATABASE AnExtraEuro;

DROP TABLE IF EXISTS ACCOUNT;
DROP TABLE IF EXISTS CATEGORIA;
DROP TABLE IF EXISTS PROGETTO;
DROP TABLE IF EXISTS DONARE;

CREATE TABLE ACCOUNT(
    NICKNAME CHAR(20) NOT NULL,
    EMAIL CHAR(20) NOT NULL,
    PASSWORD CHAR(50) NOT NULL,
    CONSTRAINT pk_NICKNAME PRIMARY KEY (NICKNAME)
);

CREATE TABLE CATEGORIA(
    NOMINATIVO CHAR(20) NOT NULL,
    DESCRIZIONE CHAR(50) NOT NULL,
    CONSTRAINT pk_NOMINATIVO PRIMARY KEY (NOMINATIVO)
);

CREATE TABLE PROGETTO(
    ID INT NOT NULL AUTO_INCREMENT,
    NOME CHAR(20) NOT NULL,
    DESCRIZIONE CHAR(50) NOT NULL,
    ACCOUNT_NICKNAME CHAR(20) NOT NULL,
    CATEGORIA_NOMINATIVO CHAR(20) NOT NULL,
    OBBIETTIVO INT NOT NULL,
    CONSTRAINT pk_ID PRIMARY KEY (ID),
    FOREIGN KEY (ACCOUNT_NICKNAME) REFERENCES ACCOUNT(NICKNAME),
    FOREIGN KEY (CATEGORIA_NOMINATIVO) REFERENCES CATEGORIA(NOMINATIVO)
);


CREATE TABLE DONARE(
    ACCOUNT_NICKNAME CHAR(20) NOT NULL,
    PROGETTO_ID INT NOT NULL,
    VALORE_DONAZIONE DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ACCOUNT_NICKNAME) REFERENCES ACCOUNT(NICKNAME),
    FOREIGN KEY (PROGETTO_ID) REFERENCES PROGETTO(ID)
);