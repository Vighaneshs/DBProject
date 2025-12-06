USE jungle_library_db;

SELECT 
    r.Employee_ID AS Receptionist_ID,
    p.FName AS Receptionist_FName,
    p.LName AS Receptionist_LName,
    t.Trainer_ID
FROM RECEPTIONIST r
JOIN TRAINER t 
    ON r.Trainer_ID = t.Trainer_ID
JOIN EMPLOYEE er ON r.Employee_ID = er.Employee_ID
JOIN PERSON p ON er.Person_ID = p.Person_ID
JOIN INQUIRY i 
    ON r.Employee_ID = i.Receptionist_ID
WHERE 
    i.Resolution_Status = 'Resolved'
    AND i.Inquiry_Time >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY 
    r.Employee_ID,
    p.FName,
    p.LName,
    t.Trainer_ID,
    YEAR(i.Inquiry_Time),
    MONTH(i.Inquiry_Time)
HAVING 
    COUNT(i.Inquiry_ID) >= 2;
