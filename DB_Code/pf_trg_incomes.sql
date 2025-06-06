
-- Row-level trigger to processes the pf_incomes inserts, updates, and deletes
CREATE OR REPLACE TRIGGER trg_aiud_row_pf_incomes
    AFTER INSERT OR UPDATE OR DELETE ON pf_incomes
    FOR EACH ROW
BEGIN
    CASE
        -- On insert new pf_incomes record
        WHEN INSERTING THEN
            UPDATE pf_monthly_sum
                SET incomes_all = incomes_all + :NEW.amount_all
            WHERE monthly_sum_id = :NEW.monthly_sum_id;

        -- On update pf_incomes record - actual updates will be processed in statement-level trigger trg_au_stmt_pf_incomes
        WHEN UPDATING THEN
            NULL;
        --     INSERT INTO temp_pf_changes (monthly_sum_id)
        --     VALUES (:OLD.monthly_sum_id);

        -- On delete pf_incomes record          
        WHEN DELETING THEN
            UPDATE pf_monthly_sum
                SET incomes_all = incomes_all - :OLD.amount_all,
                    incomes_received = incomes_received - :OLD.amount_received
            WHERE monthly_sum_id = :OLD.monthly_sum_id;

    END CASE;
    
    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_aiud_row_pf_incomes');

END trg_aiud_row_pf_incomes;
/

-- Statement-level trigger to processes the pf_incomes updates
CREATE OR REPLACE TRIGGER trg_au_stmt_pf_incomes 
    AFTER UPDATE ON pf_incomes 
BEGIN
    -- FOR rec IN (SELECT DISTINCT monthly_sum_id FROM temp_pf_changes)
    -- LOOP
    --     UPDATE pf_monthly_sum ms
    --         SET (incomes_all, incomes_received) =
    --             (SELECT SUM(amount_all), SUM(amount_received)
    --             FROM pf_incomes i
    --             WHERE i.monthly_sum_id = rec.monthly_sum_id)
    --     WHERE ms.monthly_sum_id = rec.monthly_sum_id;
    -- END LOOP;

    UPDATE pf_monthly_sum ms
    SET (incomes_all, incomes_received) =
        (SELECT SUM(amount_all), SUM(amount_received)
        FROM pf_incomes i
        WHERE ms.monthly_sum_id = i.monthly_sum_id)
    WHERE EXISTS (SELECT 1 
        FROM pf_incomes i 
        WHERE ms.monthly_sum_id = i.monthly_sum_id);

    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_au_stmt_pf_incomes');


END trg_au_stmt_pf_incomes;
/

-- Row-level trigger to processes the pf_incomes  updates
CREATE OR REPLACE TRIGGER trg_bu_row_pf_incomes
    BEFORE UPDATE ON pf_incomes
    FOR EACH ROW
BEGIN
    :NEW.amount_received := :OLD.amount_received + :NEW.amount_correction;
    :NEW.amount_correction := 0;

    
END trg_bu_row_pf_incomes;
/