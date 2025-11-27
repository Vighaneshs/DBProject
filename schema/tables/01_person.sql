USE jungle_library_db;

CREATE TABLE PERSON (
    Person_ID CHAR(4) PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    MName VARCHAR(50),
    LName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    Gender CHAR(1),
    DOB DATE
);