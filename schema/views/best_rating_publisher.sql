USE jungle_library_db;

CREATE OR REPLACE VIEW BestRatingPublisher AS
SELECT P.Publisher_Name
FROM PUBLISHER AS P
JOIN BOOK AS B ON P.Publisher_ID = B.Publisher_ID
WHERE B.Book_ID IN
    (
        SELECT Book_ID
        FROM COMMENTS
        GROUP BY Book_ID 
        HAVING AVG(Rating) >= 4.0
    )
GROUP BY P.Publisher_Name
;