USE jungle_library_db;

SELECT 
    t.Trainer_ID,
    COUNT(r.Employee_ID) AS Total_Trained
FROM TRAINER t
JOIN RECEPTIONIST r 
    ON t.Trainer_ID = r.Trainer_ID
GROUP BY 
    t.Trainer_ID
ORDER BY 
    Total_Trained DESC
LIMIT 1;
