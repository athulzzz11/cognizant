DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 0;
    v_result NUMBER;
    e_invalid_amount EXCEPTION;
    v_amount NUMBER := -500;
BEGIN
    BEGIN
        v_result := v_num1 / v_num2;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed');
    END;

    BEGIN
        IF v_amount < 0 THEN
            RAISE e_invalid_amount;
        END IF;
    EXCEPTION
        WHEN e_invalid_amount THEN
            DBMS_OUTPUT.PUT_LINE('Error: Amount cannot be negative');
    END;

    BEGIN
        SELECT salary INTO v_result FROM employees WHERE employee_id = 99999;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No employee found with that ID');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Error: Query returned multiple rows');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    END;
END;
/
