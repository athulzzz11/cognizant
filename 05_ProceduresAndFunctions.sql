CREATE OR REPLACE PROCEDURE give_raise (
    p_emp_id  IN employees.employee_id%TYPE,
    p_percent IN NUMBER
) IS
BEGIN
    UPDATE employees
    SET salary = salary + (salary * p_percent / 100)
    WHERE employee_id = p_emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || p_emp_id);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Salary updated for employee: ' || p_emp_id);
    END IF;
END give_raise;
/

CREATE OR REPLACE PROCEDURE get_employee_details (
    p_emp_id     IN  employees.employee_id%TYPE,
    p_name       OUT employees.first_name%TYPE,
    p_salary     OUT employees.salary%TYPE
) IS
BEGIN
    SELECT first_name, salary
    INTO p_name, p_salary
    FROM employees
    WHERE employee_id = p_emp_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_name := NULL;
        p_salary := NULL;
END get_employee_details;
/

CREATE OR REPLACE PROCEDURE double_value (
    p_value IN OUT NUMBER
) IS
BEGIN
    p_value := p_value * 2;
END double_value;
/

CREATE OR REPLACE FUNCTION calculate_annual_salary (
    p_monthly_salary IN NUMBER
) RETURN NUMBER IS
    v_annual_salary NUMBER;
BEGIN
    v_annual_salary := p_monthly_salary * 12;
    RETURN v_annual_salary;
END calculate_annual_salary;
/

DECLARE
    v_name   employees.first_name%TYPE;
    v_salary employees.salary%TYPE;
    v_num    NUMBER := 10;
    v_annual NUMBER;
BEGIN
    give_raise(101, 5);

    get_employee_details(101, v_name, v_salary);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Salary: ' || v_salary);

    double_value(v_num);
    DBMS_OUTPUT.PUT_LINE('Doubled value: ' || v_num);

    v_annual := calculate_annual_salary(5000);
    DBMS_OUTPUT.PUT_LINE('Annual salary: ' || v_annual);
END;
/
