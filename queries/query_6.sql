USE jungle_library_db;

SELECT DISTINCT B.Member_ID
FROM BORROWS AS B
JOIN ENTRY AS E ON E.Payment_ID = B.Payment_ID
WHERE NOT EXISTS (
    SELECT DISTINCT WW.Book_ID 
    FROM WRITES AS WW 
    WHERE WW.Author_ID = (
        SELECT WR.Author_ID
        FROM ENTRY AS EN
        JOIN WRITES AS WR ON WR.Book_ID = EN.Book_ID
        GROUP BY WR.Author_ID, WR.Book_ID
        ORDER BY COUNT(DISTINCT WR.Author_ID, EN.Payment_ID) DESC
        LIMIT 1
    )
    AND NOT EXISTS (
        SELECT 1
        FROM BORROWS AS B2
        JOIN ENTRY AS E2 ON E2.Payment_ID = B2.Payment_ID
        WHERE B2.Member_ID = B.Member_ID
        AND E2.Book_ID = WW.Book_ID
    )
);