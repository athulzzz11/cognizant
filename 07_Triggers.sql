CREATE OR REPLACE TRIGGER trg_before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF :NEW.hire_date IS NULL THEN
        :NEW.hire_date := SYSDATE;
    END IF;

    IF :NEW.salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
    END IF;
END;
/

CREATE TABLE employee_audit (
    audit_id     NUMBER GENERATED ALWAYS AS IDENTITY,
    employee_id  NUMBER,
    old_salary   NUMBER,
    new_salary   NUMBER,
    changed_on   DATE
);
/

CREATE OR REPLACE TRIGGER trg_after_update_salary
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, old_salary, new_salary, changed_on)
    VALUES (:OLD.employee_id, :OLD.salary, :NEW.salary, SYSDATE);
END;
/

CREATE OR REPLACE VIEW employee_view AS
SELECT employee_id, first_name, salary
FROM employees;
/

CREATE OR REPLACE TRIGGER trg_instead_of_employee_view
INSTEAD OF INSERT ON employee_view
FOR EACH ROW
BEGIN
    INSERT INTO employees (employee_id, first_name, salary, hire_date)
    VALUES (:NEW.employee_id, :NEW.first_name, :NEW.salary, SYSDATE);
END;
/
