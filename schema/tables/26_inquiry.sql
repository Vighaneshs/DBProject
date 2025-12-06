USE jungle_library_db;

DROP TABLE IF EXISTS INQUIRY;

CREATE TABLE INQUIRY (
    Inquiry_ID VARCHAR(10) PRIMARY KEY,
    Inquiry_Time DATETIME,
    Resolution_Status VARCHAR(30),

    Member_ID VARCHAR(10),
    Rating INT,

    Receptionist_ID VARCHAR(10),

    FOREIGN KEY (Member_ID) REFERENCES MEMBER(Member_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    FOREIGN KEY (Receptionist_ID) REFERENCES RECEPTIONIST(Employee_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
