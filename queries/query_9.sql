USE jungle_library_db;

SELECT P.Fname, P.MName, P.LName
FROM PERSON P
JOIN BORROWS B ON B.Member_ID = P.Person_ID
JOIN ENTRY E1 ON E1.Payment_ID = B.Payment_ID
WHERE E1.Book_ID IN (
    SELECT EE.Book_ID
    FROM ENTRY EE
    GROUP BY EE.Book_ID
    HAVING COUNT(EE.Payment_ID) =(
        SELECT COUNT(E.Payment_ID) as borrow_count
        FROM ENTRY E
        GROUP BY E.Book_ID
        ORDER BY borrow_count DESC
        LIMIT 1)
);