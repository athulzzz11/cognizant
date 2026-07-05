CREATE OR REPLACE PACKAGE employee_pkg AS
    PROCEDURE hire_employee (
        p_name   IN VARCHAR2,
        p_salary IN NUMBER
    );

    FUNCTION get_total_employees RETURN NUMBER;

    PROCEDURE update_salary (
        p_emp_id IN NUMBER,
        p_amount IN NUMBER
    );
END employee_pkg;
/

CREATE OR REPLACE PACKAGE BODY employee_pkg AS

    PROCEDURE hire_employee (
        p_name   IN VARCHAR2,
        p_salary IN NUMBER
    ) IS
    BEGIN
        INSERT INTO employees (employee_id, first_name, salary, hire_date)
        VALUES (employees_seq.NEXTVAL, p_name, p_salary, SYSDATE);
        COMMIT;
    END hire_employee;

    FUNCTION get_total_employees RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM employees;
        RETURN v_count;
    END get_total_employees;

    PROCEDURE update_salary (
        p_emp_id IN NUMBER,
        p_amount IN NUMBER
    ) IS
    BEGIN
        UPDATE employees
        SET salary = salary + p_amount
        WHERE employee_id = p_emp_id;
        COMMIT;
    END update_salary;

END employee_pkg;
/

BEGIN
    employee_pkg.hire_employee('Alice Smith', 60000);
    DBMS_OUTPUT.PUT_LINE('Total employees: ' || employee_pkg.get_total_employees);
    employee_pkg.update_salary(101, 1000);
END;
/
