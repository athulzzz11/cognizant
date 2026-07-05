DECLARE
    v_marks NUMBER := 75;
    v_grade VARCHAR2(2);
    v_day   NUMBER := 3;
    v_day_name VARCHAR2(20);
    v_counter NUMBER := 1;
BEGIN
    IF v_marks >= 90 THEN
        v_grade := 'A';
    ELSIF v_marks >= 75 THEN
        v_grade := 'B';
    ELSIF v_marks >= 50 THEN
        v_grade := 'C';
    ELSE
        v_grade := 'F';
    END IF;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);

    CASE v_day
        WHEN 1 THEN v_day_name := 'Monday';
        WHEN 2 THEN v_day_name := 'Tuesday';
        WHEN 3 THEN v_day_name := 'Wednesday';
        WHEN 4 THEN v_day_name := 'Thursday';
        WHEN 5 THEN v_day_name := 'Friday';
        ELSE v_day_name := 'Weekend';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Day: ' || v_day_name);

    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('FOR loop iteration: ' || i);
    END LOOP;

    WHILE v_counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('WHILE loop iteration: ' || v_counter);
        v_counter := v_counter + 1;
    END LOOP;

    v_counter := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE('Basic LOOP iteration: ' || v_counter);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 5;
    END LOOP;
END;
/
