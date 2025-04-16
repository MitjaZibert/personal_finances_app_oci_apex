BEGIN
  pf_month_actions_pkg.check_and_add_new_months;
  --pf_month_actions_pkg.update_future_months;
  --ROLLBACK;
    
END;
/
ROLLBACK;

select * from PF_MONTHLY_SUM where MONTHLY_SUM_ID > 16;

  select * from pf_expenses
   where MONTHLY_SUM_ID > 16
   order by MONTHLY_SUM_ID, expense_id;


  select * from pf_incomes
   where MONTHLY_SUM_ID > 16
   order by MONTHLY_SUM_ID, income_id;

SELECT NVL(TO_CHAR(SUM(amount_all), 'S999G999G999G999G990D00'), 0), 
            NVL(TO_CHAR(SUM(amount_open), 'S999G999G999G999G990D00'), 0), 
            NVL(TO_CHAR(SUM(amount_received), 'S999G999G999G999G990D00'), 0)
    FROM pf_incomes
    WHERE monthly_sum_id = 16;