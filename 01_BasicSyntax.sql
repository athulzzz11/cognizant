DECLARE
    v_name       VARCHAR2(50);
    v_age        NUMBER := 25;
    v_salary     NUMBER(10,2) DEFAULT 50000.00;
    v_hire_date  DATE := SYSDATE;
    v_is_active  BOOLEAN := TRUE;
BEGIN
    v_name := 'John Doe';

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(v_hire_date, 'DD-MON-YYYY'));

    IF v_is_active THEN
        DBMS_OUTPUT.PUT_LINE('Status: Active');
    END IF;
END;
/
