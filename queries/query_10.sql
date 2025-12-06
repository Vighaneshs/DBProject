USE jungle_library_db;

SELECT 
    e.Employee_ID,
    p.FName,
    p.LName
FROM EMPLOYEE e
JOIN MEMBER m 
    ON e.Member_ID = m.Member_ID
JOIN CARD_DETAIL cd
    ON m.Card_ID = cd.Card_ID
JOIN PERSON p 
    ON e.Person_ID = p.Person_ID
WHERE 
    m.Member_Type = 'gold'
    AND cd.Card_Issue_Date <= DATE_ADD(e.Start_Date, INTERVAL 1 MONTH);
