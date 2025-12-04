USE jungle_library_db;

DROP TABLE IF EXISTS PAYMENT;

CREATE TABLE PAYMENT (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Payment_Method VARCHAR(30),
    Payment_Date DATE,
    Amount_Paid DECIMAL(10,2)
);
