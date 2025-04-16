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


TRUNCATE TABLE pf_app_variables;


-- pf_app_variables
INSERT INTO pf_app_variables (currency_check_sum, pre_app_money_sum) VALUES (0, 0);



-- =================================================================================================
-- =================================================================================================

-- pf_currencies
INSERT INTO pf_currencies (currency_code, currency_name, currency_rate, rate_date) VALUES ('EUR', 'Euro', 1, SYSDATE);
INSERT INTO pf_currencies (currency_code, currency_name, currency_rate, rate_date) VALUES ('USD', 'US Dollar', 1, SYSDATE);

-- pf_money_allocation
INSERT INTO pf_money_allocation (allocation, allocation_amount, currency_code, allocation_value, is_available, allocation_notes) VALUES ('Wallet cash', 0, 'EUR', 0, 'Y', 'Money (cash) on hand');
INSERT INTO pf_money_allocation (allocation, allocation_amount, currency_code, allocation_value, is_available, allocation_notes) VALUES ('Bank account', 0, 'EUR', 0, 'Y', 'Money readily availabe from bank account');

-- pf_expense_categories
INSERT INTO pf_expense_categories (expense_category_name, expense_category_notes) VALUES ('Groceries', 'Home food, drinks, ...');
INSERT INTO pf_expense_categories (expense_category_name, expense_category_notes) VALUES ('Household Bills', 'Tax, electricity, water, heating, waste, internet, TV, ...');
INSERT INTO pf_expense_categories (expense_category_name, expense_category_notes) VALUES ('Insurance', 'Home, health, travel, car...');
INSERT INTO pf_expense_categories (expense_category_name, expense_category_notes) VALUES ('Transportation', 'Car gas, public transport tickets, car maintenance, ...');
INSERT INTO pf_expense_categories (expense_category_name, expense_category_notes) VALUES ('Entertnainmnet', 'Restaurants, pubs, museums, ...');
INSERT INTO pf_expense_categories (expense_category_name, expense_category_notes) VALUES ('Travel', 'Tickets, bookings, food, souvenirs, ...');
INSERT INTO pf_expense_categories (expense_category_name, expense_category_notes) VALUES ('Business', 'Business related expenses incl. tax');


-- pf_income_categories
INSERT INTO pf_income_categories (income_category_name, income_category_notes) VALUES ('Regular job', 'Regular monthly income from job or own business');
INSERT INTO pf_income_categories (income_category_name, income_category_notes) VALUES ('Freelance work', 'Occasional project work');
INSERT INTO pf_income_categories (income_category_name, income_category_notes) VALUES ('Dividends', 'Investment dividends');


-- pf_regular_expenses
INSERT INTO pf_regular_expenses (expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (1, 'Groceries', 350, NULL, 'Regular expenses for groceries');
INSERT INTO pf_regular_expenses (expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (2, 'Home utlities', 120, NULL, 'Monthly home utilities');
INSERT INTO pf_regular_expenses (expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (3, 'Home insurance', 200, '10, 11, 12', 'Home insurance');
INSERT INTO pf_regular_expenses (expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (7, 'Government payments', 58, NULL, 'Monthly business expenses for government');
INSERT INTO pf_regular_expenses (expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (4, 'Car fuel', 65, NULL, 'Monthly car fuel expense');
INSERT INTO pf_regular_expenses (expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (4, 'Car insurance', 365, 8, 'pf_yearly car insurance');
INSERT INTO pf_regular_expenses (expense_category_id, regular_expense_name, amount, months, regular_expense_notes) VALUES (5, 'Restaurants', 50, NULL, 'Monthly eating in restaurants');


-- pf_regular_incomes
INSERT INTO pf_regular_incomes (income_category_id, regular_income_name, amount, months, regular_income_notes) VALUES (1, 'Job salary', 2350, NULL, 'Monthly salary');


-- =================================================================================================
-- =================================================================================================

-- pf_monthly_sum

INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 1, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 2, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 3, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 4, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 5, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 6, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 7, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 8, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 9, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 10, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 11, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2024, 12, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 1, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 2, 'Y');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 3, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 4, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 5, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 6, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 7, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 8, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 9, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 10, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 11, 'N');
INSERT INTO pf_monthly_sum (pf_year, pf_month, month_closed) VALUES (2025, 12, 'N');


-- pf_incomes

INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (1, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (2, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (3, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, incomes_notes) VALUES (3, 2, 'PL/SQL script', 240, 240, 'Freelance client 1');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (4, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (5, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (6, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (7, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, incomes_notes) VALUES (7, 2, 'PL/SQL script', 240, 240, 'Freelance client 1');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (8, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, incomes_notes) VALUES (8, 2, 'SQL optimization', 140, 140, 'Freelance client 2');      
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (9, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (10, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (11, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (12, 1, 'Monthly salary', 2050, 2050, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, incomes_notes) VALUES (12, 2, 'APEX custom module', 1025, 1025, 'Freelance client 1'); 
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (13, 1, 'Monthly salary', 2350, 2350, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (14, 1, 'Monthly salary', 2350, 2350, 1, 'N');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, incomes_notes) VALUES (14, 2, 'Consulting', 320, 320, 'Freelance client 3');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (15, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (16, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (17, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (18, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (19, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (20, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (21, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (22, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (23, 1, 'Monthly salary', 2350, 0, 1, 'Y');
INSERT INTO pf_incomes (monthly_sum_id, income_category_id, income, amount_all, amount_received, regular_income_id, update_regular_income) VALUES (24, 1, 'Monthly salary', 2350, 0, 1, 'Y');


-- pf_expenses

INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (2, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (2, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (2, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (2, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (2, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (3, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (3, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (3, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (3, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (3, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid) VALUES (3, 7, 'Business tax', 60, 60);
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (4, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (4, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (4, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (4, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (4, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (5, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (5, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (5, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (5, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (5, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (6, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (6, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (6, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (6, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (6, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (7, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (7, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (7, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (7, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (7, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid) VALUES (7, 7, 'Business tax', 60, 60);
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (8, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (8, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (8, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (8, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (8, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid) VALUES (8, 7, 'Business tax', 35, 35);
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (8, 4, 'Car insurance', 344.25, 344.25, 6, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (8, 4, 'Car maintenance', 95.55, 95.55, 6, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (9, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (9, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (9, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (9, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (9, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid) VALUES (9, 6, 'Vacation', 1250, 1250);
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (10, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (10, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (10, 3, 'Business tax', 195.55, 195.55, 3, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (10, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (10, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (10, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (11, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (11, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (11, 3, 'Business tax', 195.55, 195.55, 3, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (11, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (11, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (11, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (12, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (12, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (12, 3, 'Business tax', 195.55, 195.55, 3, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (12, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (12, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (12, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid) VALUES (12, 7, 'Business tax', 256.25, 256.25);
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (13, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (13, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (13, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (13, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (13, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid) VALUES (13, 7, 'Business tax', 35, 35);
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (14, 1, 'Food and stuff', 350, 350, 1, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (14, 2, 'House expenses', 120, 120, 2, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (14, 7, 'Business payments', 58, 58, 4, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (14, 4, 'Car fuel', 65, 65, 5, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid, regular_expense_id, update_regular_expense) VALUES (14, 5, 'Restaurants', 45, 45, 7, 'N');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, amount_paid) VALUES (14, 7, 'Business tax', 80, 80);
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (15, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (15, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (15, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (15, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (15, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (16, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (16, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (16, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (16, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (16, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (17, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (17, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (17, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (17, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (17, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (18, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (18, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (18, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (18, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (18, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (19, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (19, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (19, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (19, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (19, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (20, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (20, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (20, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (20, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (20, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (21, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (21, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (21, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (21, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (21, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (22, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (22, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (22, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (22, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (22, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (23, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (23, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (23, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (23, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (23, 5, 'Restaurants', 50, 7, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (24, 1, 'Food and stuff', 350, 1, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (24, 2, 'House expenses', 120, 2, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (24, 7, 'Business payments', 58, 4, 'Y');        
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (24, 4, 'Car fuel', 65, 5, 'Y');
INSERT INTO pf_expenses (monthly_sum_id, expense_category_id, expense, amount_all, regular_expense_id, update_regular_expense) VALUES (24, 5, 'Restaurants', 50, 7, 'Y');

/*
UPDATE pf_monthly_sum ms
SET (ms.incomes_all, ms.incomes_received) = 
    (SELECT SUM(i.amount_all), SUM(i.amount_received) 
    FROM pf_incomes i
    WHERE i.user_group_id = ms.user_group_id AND i.monthly_sum_id = ms.monthly_sum_id)
WHERE user_group_id = 1
AND month_closed = 'Y';

UPDATE pf_monthly_sum ms
SET (ms.incomes_all, ms.incomes_open) = 
    (SELECT SUM(i.amount_all), SUM(i.amount_open) 
    FROM pf_incomes i
    WHERE i.user_group_id = ms.user_group_id AND i.monthly_sum_id = ms.monthly_sum_id)
WHERE user_group_id = 1
AND month_closed = 'N';

UPDATE pf_monthly_sum ms
SET (ms.expenses_all, ms.expenses_paid) = 
    (SELECT SUM(e.amount_all), SUM(e.amount_paid) 
    FROM pf_expenses e
    WHERE e.user_group_id = ms.user_group_id AND e.monthly_sum_id = ms.monthly_sum_id)
WHERE user_group_id = 1
AND month_closed = 'Y';

UPDATE pf_monthly_sum ms
SET (ms.expenses_all, ms.expenses_open) = 
    (SELECT SUM(e.amount_all), SUM(e.amount_open) 
    FROM pf_expenses e
    WHERE e.user_group_id = ms.user_group_id AND e.monthly_sum_id = ms.monthly_sum_id)
WHERE user_group_id = 1
AND month_closed = 'N';
*/

COMMIT;