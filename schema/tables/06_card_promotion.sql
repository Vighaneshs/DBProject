USE jungle_library_db;

CREATE TABLE CARD_PROMOTION (
    Card_ID VARCHAR(20),
    Promotion_Code VARCHAR(20),
    PRIMARY KEY (Card_ID, Promotion_Code),
    FOREIGN KEY (Card_ID) REFERENCES CARD_DETAIL(Card_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Promotion_Code) REFERENCES PROMOTION(Promotion_Code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
