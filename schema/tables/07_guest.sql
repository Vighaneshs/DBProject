USE jungle_library_db;

DROP TABLE IF EXISTS GUEST;

CREATE TABLE GUEST (
    Gold_Member_ID CHAR(4),
    Guest_ID VARCHAR(4),
    Guest_Name VARCHAR(50) NOT NULL,
    Guest_Address VARCHAR(100),
    Guest_Contact_Info VARCHAR(50),
    PRIMARY KEY (Gold_Member_ID, Guest_ID),
    FOREIGN KEY (Gold_Member_ID) REFERENCES MEMBER(Member_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);