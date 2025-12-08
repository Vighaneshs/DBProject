USE jungle_library_db;

CREATE OR REPLACE VIEW BestRatingPublisher AS
SELECT 
    P.Publisher_Name,
    AVG(C.Rating) AS Avg_Rating
FROM PUBLISHER P
JOIN BOOK B
    ON P.Publisher_ID = B.Publisher_ID
JOIN COMMENTS C
    ON B.Book_ID = C.Book_ID
GROUP BY P.Publisher_Name
HAVING AVG(C.Rating) >= 4.0;