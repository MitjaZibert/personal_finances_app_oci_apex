
TRUNCATE TABLE pf_app_variables;
TRUNCATE TABLE pf_user_groups;
TRUNCATE TABLE pf_users;

INSERT INTO pf_user_groups (user_group_id, user_group_name) VALUES (1, 'Development Group');
INSERT INTO pf_user_groups (user_group_id, user_group_name) VALUES (2, 'MZ-Iva Group');
INSERT INTO pf_user_groups (user_group_id, user_group_name) VALUES (3, 'Demo Group');


INSERT INTO pf_app_variables (user_group_id, currency_check_sum, pre_app_money_sum) VALUES (1, 0, 0);
INSERT INTO pf_app_variables (user_group_id, currency_check_sum, pre_app_money_sum) VALUES (2, 0, 0);
INSERT INTO pf_app_variables (user_group_id, currency_check_sum, pre_app_money_sum) VALUES (3, 0, 0);


INSERT INTO pf_users (user_group_id, user_name) VALUES (1, 'MZ');
INSERT INTO pf_users (user_group_id, user_name) VALUES (2, 'MZ');
INSERT INTO pf_users (user_group_id, user_name) VALUES (3, 'MZ');
INSERT INTO pf_users (user_group_id, user_name) VALUES (2, 'Ivana');
INSERT INTO pf_users (user_group_id, user_name) VALUES (3, 'PF_Demo');



TRUNCATE TABLE pf_incomes;
TRUNCATE TABLE pf_expenses;
TRUNCATE TABLE pf_monthly_sum;
TRUNCATE TABLE pf_regular_incomes;
TRUNCATE TABLE pf_regular_expenses;
TRUNCATE TABLE pf_income_categories;
TRUNCATE TABLE pf_expense_categories;
TRUNCATE TABLE pf_money_allocation;
TRUNCATE TABLE pf_currencies;
TRUNCATE TABLE pf_money_correction;

ALTER TABLE pf_income_categories MODIFY income_category_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_expense_categories MODIFY expense_category_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_regular_incomes MODIFY regular_income_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_regular_expenses MODIFY regular_expense_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_monthly_sum MODIFY monthly_sum_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_incomes MODIFY income_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_expenses MODIFY expense_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_money_allocation MODIFY allocation_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);
ALTER TABLE pf_money_correction MODIFY money_correction_id GENERATED ALWAYS AS IDENTITY (START WITH LIMIT VALUE);

-- pf_currencies
INSERT INTO pf_currencies (user_group_id, currency_code, currency_name, currency_rate, rate_date) VALUES (1, 'EUR', 'Euro', 1, SYSDATE);
INSERT INTO pf_currencies (user_group_id, currency_code, currency_name, currency_rate, rate_date) VALUES (1, 'USD', 'US Dollar', 1, SYSDATE);

-- pf_money_allocation
INSERT INTO pf_money_allocation (user_group_id, allocation, allocation_amount, currency_code, allocation_value, is_available, allocation_notes) VALUES (1, 'Wallet cash', 0, 'EUR', 0, TRUE, 'Money (cash) on hand');
INSERT INTO pf_money_allocation (user_group_id, allocation, allocation_amount, currency_code, allocation_value, is_available, allocation_notes) VALUES (1, 'Bank account', 0, 'EUR', 0, TRUE, 'Money readily availabe from bank account');

-- pf_expense_categories
INSERT INTO pf_expense_categories (user_group_id, expense_category_name, expense_category_notes) VALUES (1, 'Groceries', 'Home food, drinks, ...');
INSERT INTO pf_expense_categories (user_group_id, expense_category_name, expense_category_notes) VALUES (1, 'Household Bills', 'Tax, electricity, water, heating, waste, internet, TV, ...');
INSERT INTO pf_expense_categories (user_group_id, expense_category_name, expense_category_notes) VALUES (1, 'Insurance', 'Home, health, travel, car...');
INSERT INTO pf_expense_categories (user_group_id, expense_category_name, expense_category_notes) VALUES (1, 'Transportation', 'Car gas, public transport tickets, car maintenance, ...');
INSERT INTO pf_expense_categories (user_group_id, expense_category_name, expense_category_notes) VALUES (1, 'Entertnainmnet', 'Restaurants, pubs, museums, ...');
INSERT INTO pf_expense_categories (user_group_id, expense_category_name, expense_category_notes) VALUES (1, 'Travel', 'Tickets, bookings, food, souvenirs, ...');
INSERT INTO pf_expense_categories (user_group_id, expense_category_name, expense_category_notes) VALUES (1, 'Business', 'Business related expenses incl. tax');


-- pf_income_categories
INSERT INTO pf_income_categories (user_group_id, income_category_name, income_category_notes) VALUES (1, 'Regular job', 'Regular monthly income from job or own business');
INSERT INTO pf_income_categories (user_group_id, income_category_name, income_category_notes) VALUES (1, 'Freelance work', 'Occasional project work');
INSERT INTO pf_income_categories (user_group_id, income_category_name, income_category_notes) VALUES (1, 'Dividends', 'Investment dividends');


-- pf_regular_expenses
INSERT INTO pf_regular_expenses (user_group_id, expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 1, 'Groceries', 350, NULL, 'Regular expenses for groceries');
INSERT INTO pf_regular_expenses (user_group_id, expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 2, 'Home utlities', 120, NULL, 'Monthly home utilities');
INSERT INTO pf_regular_expenses (user_group_id, expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 3, 'Home insurance', 200, '10, 11, 12', 'Home insurance');
INSERT INTO pf_regular_expenses (user_group_id, expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 7, 'Government payments', 58, NULL, 'Monthly business expenses for government');
INSERT INTO pf_regular_expenses (user_group_id, expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 4, 'Car fuel', 65, NULL, 'Monthly car fuel expense');
INSERT INTO pf_regular_expenses (user_group_id, expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 4, 'Car insurance', 365, 8, 'Yearly car insurance');
INSERT INTO pf_regular_expenses (user_group_id, expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 5, 'Restaurants', 50, NULL, 'Monthly eating in restaurants');


-- pf_regular_incomes
INSERT INTO pf_regular_incomes (user_group_id, income_category_id, regular_income_name, amount, months, regular_income_notes) VALUES (1, 1, 'Job salary', 2350, NULL, 'Monthly salary');

-- pf_monthly_sum

INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 1, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 2, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 3, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 4, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 5, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 6, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 7, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 8, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 9, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 10, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 11, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, 12, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 1, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 2, TRUE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 3, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 4, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 5, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 6, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 7, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 8, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 9, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 10, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 11, FALSE);
INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, 12, FALSE);


-- pf_incomes

INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 1, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 2, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 3, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, 3, 2, 'PL/SQL script', 240, 0, 240, 'Freelance client 1');
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 4, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 5, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 6, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 7, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, 7, 2, 'PL/SQL script', 240, 0, 240, 'Freelance client 1');
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 8, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, 8, 2, 'SQL optimization', 140, 0, 140, 'Freelance client 2');
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 9, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 10, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 11, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 12, 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, 12, 2, 'APEX custom module', 1025, 0, 1025, 'Freelance client 1');
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 13, 1, 'Monthly salary', 2350, 0, 2350, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 14, 1, 'Monthly salary', 2350, 0, 2350, 1, FALSE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, 14, 2, 'Consulting', 320, 0, 320, 'Freelance client 3');
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 15, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 16, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 17, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 18, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 19, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 20, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 21, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 22, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 23, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);
INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, 24, 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);


-- pf_expenses

INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 1, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 1, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 1, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 1, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 1, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 2, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 2, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 2, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 2, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 2, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 3, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 3, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 3, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 3, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 3, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, 3, 7, 'Business tax', 60, 0, 60);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 4, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 4, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 4, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 4, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 4, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 5, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 5, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 5, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 5, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 5, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 6, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 6, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 6, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 6, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 6, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 7, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 7, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 7, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 7, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 7, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, 7, 7, 'Business tax', 60, 0, 60);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 8, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 8, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 8, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 8, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 8, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, 8, 7, 'Business tax', 35, 0, 35);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 8, 4, 'Car insurance', 344.25, 0, 344.25, 6, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 8, 4, 'Car maintenance', 95.55, 0, 95.55, 6, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 9, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 9, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 9, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 9, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 9, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, 9, 6, 'Vacation', 1250, 0, 1250);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 10, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 10, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 10, 3, 'Business tax', 195.55, 0, 195.55, 3, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 10, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 10, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 10, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 11, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 11, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 11, 3, 'Business tax', 195.55, 0, 195.55, 3, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 11, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 11, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 11, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 12, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 12, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 12, 3, 'Business tax', 195.55, 0, 195.55, 3, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 12, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 12, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 12, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, 12, 7, 'Business tax', 256.25, 0, 256.25);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 13, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 13, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 13, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 13, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 13, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, 13, 7, 'Business tax', 35, 0, 35);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 14, 1, 'Food and stuff', 350, 0, 350, 1, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 14, 2, 'House expenses', 120, 0, 120, 2, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 14, 7, 'Business payments', 58, 0, 58, 4, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 14, 4, 'Car fuel', 65, 0, 65, 5, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 14, 5, 'Restaurants', 45, 0, 45, 7, FALSE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, 14, 7, 'Business tax', 80, 0, 80);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 15, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 15, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 15, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 15, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 15, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 16, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 16, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 16, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 16, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 16, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 17, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 17, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 17, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 17, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 17, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 18, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 18, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 18, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 18, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 18, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 19, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 19, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 19, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 19, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 19, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 20, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 20, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 20, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 20, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 20, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 21, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 21, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 21, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 21, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 21, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 22, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 22, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 22, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 22, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 22, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 23, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 23, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 23, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 23, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 23, 5, 'Restaurants', 50, 0, 50, 7, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 24, 1, 'Food and stuff', 350, 0, 350, 1, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 24, 2, 'House expenses', 120, 0, 120, 2, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 24, 7, 'Business payments', 58, 0, 58, 4, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 24, 4, 'Car fuel', 65, 0, 65, 5, TRUE);
INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 24, 5, 'Restaurants', 50, 0, 50, 7, TRUE);

COMMIT;