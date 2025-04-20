-- Row-level trigger to processes the pf_money_allocation BEFORE inserts
CREATE OR REPLACE TRIGGER trg_aiu_row_pf_money_allocation
    AFTER INSERT OR UPDATE ON pf_money_allocation
    --FOR EACH ROW
--DECLARE
  --  l_currency_rate NUMBER(10,2);
BEGIN
    -- SELECT currency_rate
    -- INTO l_currency_rate
    -- FROM pf_currencies
    -- WHERE currency_code = :NEW.currency_code;
    
    -- :NEW.allocation_value := :NEW.allocation_amount * l_currency_rate;
    
    UPDATE pf_money_allocation ma
    SET allocation_value = ma.allocation_amount * 
        (SELECT c.currency_rate
        FROM pf_currencies c
        WHERE c.currency_code = ma.currency_code);

    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_bi_row_pf_money_allocation');

END trg_aiu_row_pf_money_allocation;
/

-- Row-level trigger to processes the pf_money_allocation insert or update
CREATE OR REPLACE TRIGGER trg_biu_row_pf_money_allocations
    BEFORE INSERT OR UPDATE ON pf_money_allocation
    FOR EACH ROW
DECLARE
    l_currency_rate NUMBER;
BEGIN

    SELECT currency_rate
    INTO l_currency_rate
    FROM pf_currencies
    WHERE currency_code = :NEW.currency_code;

    :NEW.allocation_value := :NEW.allocation_amount * l_currency_rate;

    
END trg_biu_row_pf_money_allocation;
/

-- -- Row-level trigger to processes the pf_money_allocation AFTER inserts, updates, and deletes
-- CREATE OR REPLACE TRIGGER trg_aiud_row_pf_money_allocation
--     AFTER INSERT OR UPDATE OR DELETE ON pf_money_allocation
--     FOR EACH ROW

-- DECLARE
--     trigger_control BOOLEAN := TRUE;
-- BEGIN
--     CASE
--         -- On insert new pf_money_allocation record
--         WHEN INSERTING THEN
--            NULL;

--         -- On update pf_money_allocation record - actual updates will be processed in statement-level trigger trg_au_stmt_pf_money_allocation
--         WHEN UPDATING THEN
--             IF pkg_control.allow_trigger THEN
--                 pkg_control.allow_trigger := FALSE;
--                 INSERT INTO temp_pf_changes (allocation_id)
--                 VALUES (:OLD.allocation_id);

--                 pkg_control.allow_trigger := TRUE;
--             END IF;
            
--         -- On delete pf_money_allocation record          
--         WHEN DELETING THEN
--             NULL;

--     END CASE;

    
--     FOR rec IN (SELECT DISTINCT allocation_id FROM temp_pf_changes)
--     LOOP
--         dbms_output.put_line('ID: ' || rec.allocation_id);

--     END LOOP;


--     EXCEPTION
--         WHEN OTHERS THEN
--             -- Handle non-defined exceptions
--             dbms_output.put_line('An error occurred: ' || SQLERRM);
--             dbms_output.put_line('Error code: ' || SQLCODE);
--             RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_aiud_row_pf_money_allocation');

-- END trg_aiud_row_pf_money_allocation;
-- /


-- Statement-level trigger to processes the pf_money_allocation updates
-- CREATE OR REPLACE TRIGGER trg_au_stmt_pf_money_allocation
--     AFTER UPDATE ON pf_money_allocation 
-- BEGIN
--     FOR rec IN (SELECT DISTINCT allocation_id FROM temp_pf_changes)
--     LOOP
--         UPDATE pf_money_allocation ma
--             SET allocation_value = allocation_amount * 
--                 (SELECT c.currency_rate
--                 FROM pf_currencies c
--                 JOIN pf_money_allocation a 
--                 ON c.currency_code = a.currency_code
--                 WHERE a.allocation_id = ma.allocation_id)
--         WHERE ma.allocation_id = rec.allocation_id;
--     END LOOP;

--     EXCEPTION
--         WHEN OTHERS THEN
--             -- Handle non-defined exceptions
--             dbms_output.put_line('An error occurred: ' || SQLERRM);
--             dbms_output.put_line('Error code: ' || SQLCODE);
--             RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_au_stmt_pf_money_allocation');
            
--             RAISE_APPLICATION_ERROR(SQLERRM, 'An error occurred: ' || SQLCODE);


-- END trg_au_stmt_pf_money_allocation;