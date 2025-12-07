DROP TRIGGER IF EXISTS Check_Employee_Age_Insert;

CREATE TRIGGER Check_Employee_Age_Insert
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    DECLARE v_dob DATE;

    SELECT DOB INTO v_dob 
    FROM PERSON 
    WHERE Person_ID = NEW.Person_ID;

    IF v_dob IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Person ID not found or DOB is missing.';
    END IF;

    IF TIMESTAMPDIFF(YEAR, v_dob, CURDATE()) < 18 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Employee must be at least 18 years old.';
    END IF;
END;