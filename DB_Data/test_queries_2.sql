BEGIN
pf_app_pkg.set_app_language('SLOVENIAN');
END;
/


SELECT user_group_id,
        monthly_sum_id, 
        year, 
        month, 
        TO_CHAR(TO_DATE(month, 'MM'), 'Month', 'NLS_DATE_LANGUAGE = ' || SYS_CONTEXT('pf_app_context', 'app_language')) AS month_name, 
        incomes_all, 
        incomes_open, 
        incomes_received, 
        expenses_all, 
        expenses_open, 
        expenses_paid, 
        (incomes_all - expenses_all) AS monthly_balance,
        SUM(incomes_all - expenses_all) OVER (ORDER BY year, month) AS cumulative_balance,
        CASE month_closed_char
          WHEN TRUE THEN 'Y'
          ELSE 'N'
        END AS month_closed
FROM pf_monthly_sum
ORDER BY year, month;


select "YEAR","MONTH","INCOMES_ALL","INCOMES_OPEN","INCOMES_RECEIVED","EXPENSES_ALL",
"EXPENSES_OPEN","EXPENSES_PAID","MONTH_CLOSED_VCHAR","MONTH_NAME","MONTHLY_BALANCE","MONTH_CLOSED","CUMULATIVE_BALANCE" from
(select * from "PF_VIEW_MONTHLY_SUM"where(USER_GROUP_ID = :APP_USER_GROUP_ID))
where "USER_GROUP_ID"=:APEX$PK1 and"MONTHLY_SUM_ID"=:APEX$PK2
 for update nowait;