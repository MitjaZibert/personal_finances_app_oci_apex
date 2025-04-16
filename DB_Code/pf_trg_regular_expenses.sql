
-- Statement-level trigger to update pf_expenses AFTER change on pf_regular_expenses
CREATE OR REPLACE TRIGGER trg_aiud_stmt_pf_regular_expenses
    AFTER INSERT OR UPDATE OR DELETE ON pf_regular_expenses
BEGIN
    pf_month_actions_pkg.check_and_add_new_months;

    EXCEPTION
        WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
            RAISE_APPLICATION_ERROR(-20001, 'Error point: trg_au_stmt_pf_money_allocation');
            
            RAISE_APPLICATION_ERROR(SQLERRM, 'An error occurred: ' || SQLCODE);


END trg_aiud_stmt_pf_regular_expenses;