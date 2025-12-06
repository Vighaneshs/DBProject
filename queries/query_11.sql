USE jungle_library_db;

SELECT 
    r.Employee_ID,
    p.FName,
    p.LName,
    AVG(i.Rating) AS Avg_Rating
FROM RECEPTIONIST r
JOIN EMPLOYEE e ON r.Employee_ID = e.Employee_ID
JOIN PERSON p ON e.Person_ID = p.Person_ID
JOIN INQUIRY i ON r.Employee_ID = i.Receptionist_ID
WHERE 
    i.Resolution_Status = 'Resolved'
    AND i.Rating IS NOT NULL
GROUP BY 
    r.Employee_ID, p.FName, p.LName
HAVING 
    AVG(i.Rating) >= 4.0;
