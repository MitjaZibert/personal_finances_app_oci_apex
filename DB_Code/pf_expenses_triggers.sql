
-- AFTER UPDATE TRIGGER on pf_expenses

CREATE OR REPLACE TRIGGER trg_au_pf_expenses
    AFTER UPDATE ON pf_expenses
    FOR EACH ROW
BEGIN

    UPDATE pf_monthly_sum ms
    SET (expenses_all, expenses_open, expenses_paid) =
        (SELECT SUM(amount_all), SUM(amount_open), SUM(amount_paid)
        FROM pf_expenses e
        WHERE e.user_group_id = ms.user_group_id
        AND e.monthly_sum_id = ms.monthly_sum_id)
    WHERE ms.monthly_sum_id = :OLD.monthly_sum_id
    AND ms.user_group_id = :OLD.user_group_id;

    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            --RAISE_APPLICATION_ERROR(-20001, 'non-defined error');

END trg_au_pf_incomes;

    --============================================================================================
