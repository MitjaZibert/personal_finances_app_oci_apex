
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
            WHERE user_group_id = :NEW.user_group_id
            AND monthly_sum_id = :NEW.monthly_sum_id;

        -- On update pf_incomes record - actual updates will be rocessed in statement-level trigger trg_au_stmt_pf_incomes
        WHEN UPDATING THEN
            INSERT INTO temp_pf_changes (user_group_id, monthly_sum_id)
            VALUES (:OLD.user_group_id, :OLD.monthly_sum_id);

        -- On delete pf_incomes record          
        WHEN DELETING THEN
            UPDATE pf_monthly_sum
                SET incomes_all = incomes_all - :OLD.amount_all,
                    incomes_received = incomes_received - :OLD.amount_received
            WHERE user_group_id = :OLD.user_group_id
            AND monthly_sum_id = :OLD.monthly_sum_id;

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
    FOR rec IN (SELECT user_group_id, monthly_sum_id FROM temp_pf_changes)
    LOOP
        UPDATE pf_monthly_sum ms
            SET (incomes_all, incomes_received) =
                (SELECT SUM(amount_all), SUM(amount_received)
                FROM pf_incomes i
                WHERE i.user_group_id = rec.user_group_id
                AND i.monthly_sum_id = rec.monthly_sum_id)
        WHERE ms.monthly_sum_id = rec.monthly_sum_id
        AND ms.user_group_id = rec.user_group_id;
    END LOOP;

    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_au_stmt_pf_incomes');


END trg_au_stmt_pf_incomes;