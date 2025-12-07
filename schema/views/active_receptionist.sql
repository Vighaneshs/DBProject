USE jungle_library_db;

CREATE OR REPLACE VIEW ActiveReceptionist AS
SELECT 
    p.FName AS First_Name,
    p.LName AS Last_Name,
    COUNT(i.Inquiry_ID) AS resolved_count
FROM RECEPTIONIST r
JOIN EMPLOYEE e 
    ON r.Employee_ID = e.Employee_ID
JOIN PERSON p 
    ON e.Person_ID = p.Person_ID
JOIN INQUIRY i 
    ON r.Employee_ID = i.Receptionist_ID
WHERE 
    i.Resolution_Status = 'Resolved'
    AND i.Inquiry_Time >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY 
    r.Employee_ID, p.FName, p.LName
HAVING 
    COUNT(i.Inquiry_ID) > 5;
