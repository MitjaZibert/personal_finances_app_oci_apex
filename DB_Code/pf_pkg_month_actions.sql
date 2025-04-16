CREATE OR REPLACE PACKAGE pf_month_actions_pkg 
AS
    PROCEDURE check_and_add_new_months;
    PROCEDURE update_future_months;
    FUNCTION get_next_month (p_monthly_sum_id in NUMBER) RETURN NUMBER;
    PROCEDURE transfer_income (p_income_id IN NUMBER);
    PROCEDURE transfer_expense (p_expense_id IN NUMBER);
END pf_month_actions_pkg;
/

CREATE OR REPLACE PACKAGE BODY pf_month_actions_pkg AS

    --============================================================================================
    PROCEDURE check_and_add_new_months 
    IS
        l_all_months_added BOOLEAN := FALSE;
        l_max_new_month DATE;
        l_next_new_month DATE;
        l_year NUMBER;
        l_month NUMBER;
    BEGIN

        SELECT ADD_MONTHS(TO_DATE(pf_year||pf_month, 'YYYYMM'), 12)
        INTO l_max_new_month
        FROM pf_monthly_sum
        WHERE TO_DATE(pf_year||pf_month, 'YYYYMM') = TRUNC(TO_DATE(SYSDATE), 'MM');

        WHILE NOT l_all_months_added LOOP
            SELECT ADD_MONTHS(MAX(TO_DATE(pf_year||pf_month, 'YYYYMM')), 1)
            INTO l_next_new_month
            FROM pf_monthly_sum;
        
            IF l_next_new_month <= l_max_new_month THEN
                l_year := TO_CHAR(l_next_new_month, 'YYYY');
                l_month := TO_CHAR(l_next_new_month, 'MM');

                INSERT INTO pf_monthly_sum (pf_year, pf_month)
                VALUES (l_year, l_month);
                
            ELSE
                l_all_months_added := TRUE;
            END IF;

        END LOOP;

        -- Do update for all future months (add or update regular incomes and expenses)
        pf_month_actions_pkg.update_future_months;


    END check_and_add_new_months;

    --============================================================================================
    PROCEDURE update_future_months 
    IS
    BEGIN

        FOR future_months IN (SELECT monthly_sum_id, pf_month
                            FROM pf_monthly_sum
                            WHERE TO_DATE(pf_year||pf_month, 'YYYYMM') > TRUNC(TO_DATE(SYSDATE), 'MM')
                            ORDER BY pf_year, pf_month)
        LOOP
            -- ++++++++++++++++++++++++++++++++++
            -- INCOMES
            -- ++++++++++++++++++++++++++++++++++
            
            -- Delete all inactive regular incomes
            DELETE FROM pf_incomes
                WHERE monthly_sum_id = future_months.monthly_sum_id
                AND regular_income_id not IN (SELECT regular_income_id 
                                                FROM pf_regular_incomes
                                                WHERE is_active = 'Y'
                                                AND (months is null or REGEXP_LIKE(months, '(^|,[ ]*)'||future_months.pf_month||'(,|$)')));


            -- Update or insert all active regular incomes (only equal to months = null OR months IN future_months.pf_month)
            MERGE INTO pf_incomes t
            USING (SELECT regular_income_id, income_category_id, regular_income_name, amount, regular_income_notes
                    FROM PF_REGULAR_INCOMES
                    WHERE is_active = 'Y'
                    AND (months is null OR REGEXP_LIKE(months, '(^|,[ ]*)'||future_months.pf_month||'(,|$)'))) s
            ON (t.regular_income_id = s.regular_income_id
                and t.monthly_sum_id = future_months.monthly_sum_id)
            WHEN MATCHED THEN
            UPDATE SET t.income_category_id = s.income_category_id, 
                        t.income = s.regular_income_name,
                        t.amount_all = s.amount, 
                        t.incomes_notes = s.regular_income_notes
            WHEN NOT MATCHED THEN
            INSERT (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, incomes_notes)
            VALUES (future_months.monthly_sum_id, s.income_category_id, s.regular_income_name, s.amount, 0, s.regular_income_id, s.regular_income_notes);


            -- ++++++++++++++++++++++++++++++++++
            -- EXPENSES
            -- ++++++++++++++++++++++++++++++++++
            
            -- Delete all inactive regular expenses
            DELETE FROM pf_expenses
                WHERE monthly_sum_id = future_months.monthly_sum_id
                AND regular_expense_id not IN (SELECT regular_expense_id 
                                                FROM pf_regular_expenses
                                                WHERE is_active = 'Y'
                                                AND (months is null or REGEXP_LIKE(months, '(^|,[ ]*)'||future_months.pf_month||'(,|$)')));

            

            -- Update or insert all active regular expenses (only equal to months = null OR months IN future_months.pf_month)
            MERGE INTO pf_expenses t
            USING (SELECT regular_expense_id, expense_category_id, regular_expense_name, amount, regular_expense_notes
                    FROM PF_REGULAR_EXPENSES
                    WHERE is_active = 'Y'
                    AND (months is null OR REGEXP_LIKE(months, '(^|,[ ]*)'||future_months.pf_month||'(,|$)'))) s
            ON (t.regular_expense_id = s.regular_expense_id
                and t.monthly_sum_id = future_months.monthly_sum_id)
            WHEN MATCHED THEN
            UPDATE SET t.expense_category_id = s.expense_category_id, 
                        t.expense = s.regular_expense_name,
                        t.amount_all = s.amount, 
                        t.expenses_notes = s.regular_expense_notes
            WHEN NOT MATCHED THEN
            INSERT (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, expenses_notes)
            VALUES (future_months.monthly_sum_id, s.expense_category_id, s.regular_expense_name, s.amount, 0, s.regular_expense_id, s.regular_expense_notes);



        END LOOP;


    END update_future_months;

    --============================================================================================
    FUNCTION get_next_month (p_monthly_sum_id in NUMBER)
    RETURN NUMBER
    IS
        l_next_month_id NUMBER;
    BEGIN
        SELECT monthly_sum_id 
        INTO l_next_month_id
            FROM pf_monthly_sum 
            WHERE (pf_year, pf_month) IN 
                (SELECT TO_CHAR(next_month, 'YYYY'), TO_CHAR(next_month, 'MM') 
                FROM (
                    SELECT ADD_MONTHS(TO_DATE( pf_year||pf_month, 'YYYYMM'), 1) AS next_month
                    FROM PF_MONTHLY_SUM
                    WHERE monthly_sum_id = p_monthly_sum_id)
            );

        RETURN l_next_month_id;

    END get_next_month;


    --============================================================================================
    PROCEDURE transfer_income (p_income_id IN NUMBER) 
    IS
        l_current_month_id NUMBER;
        l_next_month_id NUMBER;
    BEGIN
        SELECT monthly_sum_id
        INTO l_current_month_id
        FROM pf_incomes
        WHERE income_id = p_income_id;

        l_next_month_id := get_next_month (l_current_month_id);
         
        UPDATE pf_incomes 
        SET monthly_sum_id = l_next_month_id
        WHERE income_id = p_income_id;

    END transfer_income;

    --============================================================================================
    
    PROCEDURE transfer_expense (p_expense_id IN NUMBER) 
    IS
        l_current_month_id NUMBER;
        l_next_month_id NUMBER;
    BEGIN
        SELECT monthly_sum_id
        INTO l_current_month_id
        FROM pf_expenses
        WHERE expense_id = p_expense_id;

        l_next_month_id := get_next_month (l_current_month_id);
         
        UPDATE pf_expenses
        SET monthly_sum_id = l_next_month_id
        WHERE expense_id = p_expense_id;

    END transfer_expense;
    --============================================================================================
    
END pf_month_actions_pkg;