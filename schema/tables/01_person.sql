USE jungle_library_db;

DROP TABLE IF EXISTS PERSON;

CREATE TABLE PERSON (
    Person_ID CHAR(4) PRIMARY KEY CHECK (Person_ID REGEXP '^P[0-9]{3}$'),
    Fname VARCHAR(50) NOT NULL,
    MName VARCHAR(50),
    LName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    Gender CHAR(1),
    DOB DATE
);