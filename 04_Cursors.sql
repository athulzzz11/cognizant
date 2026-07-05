BEGIN
    UPDATE employees SET salary = salary * 1.1 WHERE department_id = 10;
    DBMS_OUTPUT.PUT_LINE('Rows updated (implicit cursor): ' || SQL%ROWCOUNT);
END;
/

DECLARE
    CURSOR c_employees IS
        SELECT employee_id, first_name, salary
        FROM employees
        WHERE department_id = 10;

    v_emp_id     employees.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_salary     employees.salary%TYPE;
BEGIN
    OPEN c_employees;
    LOOP
        FETCH c_employees INTO v_emp_id, v_first_name, v_salary;
        EXIT WHEN c_employees%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_emp_id || ' - ' || v_first_name || ' - ' || v_salary);
    END LOOP;
    CLOSE c_employees;
END;
/

DECLARE
    CURSOR c_by_dept (p_dept_id NUMBER) IS
        SELECT employee_id, first_name
        FROM employees
        WHERE department_id = p_dept_id;
BEGIN
    FOR emp_rec IN c_by_dept(20) LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.employee_id || ' - ' || emp_rec.first_name);
    END LOOP;
END;
/
