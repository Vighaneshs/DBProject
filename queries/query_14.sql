USE jungle_library_db;

SELECT 
    cm.Employee_ID,
    p.FName,
    p.LName
FROM CATALOGING_MANAGER cm
JOIN EMPLOYEE e 
    ON cm.Employee_ID = e.Employee_ID
JOIN PERSON p 
    ON e.Person_ID = p.Person_ID
WHERE NOT EXISTS (
    SELECT DISTINCT b.Category
    FROM BOOK b
    WHERE NOT EXISTS (
        SELECT 1
        FROM CATALOGING_LOG cl
        JOIN BOOK b2 
            ON cl.Book_ID = b2.Book_ID
        WHERE 
            cl.Manager_ID = cm.Employee_ID
            AND b2.Category = b.Category
            AND cl.Catalog_Date >= DATE_SUB(CURDATE(), INTERVAL 4 WEEK)
    )
);
