
-- Row-level trigger to processes the pf_expenses inserts, updates, and deletes
CREATE OR REPLACE TRIGGER trg_aiud_row_pf_expenses
    AFTER INSERT OR UPDATE OR DELETE ON pf_expenses
    FOR EACH ROW
BEGIN
    CASE 
        -- On insert new pf_expenses record
        WHEN INSERTING THEN
            UPDATE pf_monthly_sum
                SET expenses_all = expenses_all + :NEW.amount_all
            WHERE monthly_sum_id = :NEW.monthly_sum_id;

        -- On update pf_expenses record - actual updates will be processed in statement-level trigger trg_au_stmt_pf_expenses
        WHEN UPDATING THEN
            NULL;
        --    INSERT INTO temp_pf_changes (monthly_sum_id)
        --    VALUES (:OLD.monthly_sum_id);
   

        -- On delete pf_expenses record          
        WHEN DELETING THEN
            UPDATE pf_monthly_sum
                SET expenses_all = expenses_all - :OLD.amount_all,
                    expenses_paid = expenses_paid - :OLD.amount_paid
            WHERE monthly_sum_id = :OLD.monthly_sum_id;

    END CASE;
    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_aiud_row_pf_expenses');

END trg_aiud_row_pf_expenses;


/

-- Statement-level trigger to processes the pf_expenses updates
CREATE OR REPLACE TRIGGER trg_au_stmt_pf_expenses 
    AFTER UPDATE ON pf_expenses
BEGIN
    
    UPDATE pf_monthly_sum ms
    SET (expenses_all, expenses_paid) =
        (SELECT SUM(amount_all), SUM(amount_paid)
        FROM pf_expenses e
        WHERE ms.monthly_sum_id = e.monthly_sum_id)
    WHERE EXISTS (SELECT 1 
        FROM pf_expenses e 
        WHERE ms.monthly_sum_id = e.monthly_sum_id);

    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_au_stmt_pf_expenses');

END trg_au_stmt_pf_expenses;
/

-- Row-level trigger to processes the pf_expenses  updates
CREATE OR REPLACE TRIGGER trg_bu_row_pf_expenses
    BEFORE UPDATE ON pf_expenses
    FOR EACH ROW
BEGIN
    :NEW.amount_paid := :OLD.amount_paid + :NEW.amount_correction;
    :NEW.amount_correction := 0;

    
END trg_bu_row_pf_expenses;
/

