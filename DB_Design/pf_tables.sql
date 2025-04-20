

--===================================
-- TABLES
--===================================

DROP TABLE pf_money_correction;
DROP TABLE pf_money_allocation;
DROP TABLE pf_currencies;
DROP TABLE pf_incomes;
DROP TABLE pf_expenses;
DROP TABLE pf_monthly_sum;
DROP TABLE pf_regular_incomes;
DROP TABLE pf_regular_expenses;
DROP TABLE pf_income_categories;
DROP TABLE pf_expense_categories;

DROP TABLE pf_app_variables;
DROP TABLE temp_pf_changes;



-- TABLE pf_app_variables
 
CREATE TABLE pf_app_variables (
  currency_check_sum NUMBER(10,2) DEFAULT 0,
  pre_app_money_sum NUMBER(10,2) DEFAULT 0
);



--TABLE pf_income_categories;

CREATE TABLE pf_income_categories (
  income_category_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  income_category_name VARCHAR2(250) NOT NULL,
  income_category_notes VARCHAR2(2500),
  income_category_id_old NUMBER,
  CONSTRAINT pk_income_categories PRIMARY KEY (income_category_id),
  CONSTRAINT uk_income_category_name UNIQUE (income_category_name)
);


--TABLE pf_expense_categories;

CREATE TABLE pf_expense_categories (
  expense_category_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  expense_category_name VARCHAR2(250) NOT NULL,
  expense_category_notes VARCHAR2(2500),
  expense_category_id_old NUMBER,
  CONSTRAINT pk_expense_categories PRIMARY KEY (expense_category_id),
  CONSTRAINT uk_expense_category_name UNIQUE (expense_category_name)
);



--TABLE pf_regular_incomes;

CREATE TABLE pf_regular_incomes (
  regular_income_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  income_category_id NUMBER NOT NULL,
  regular_income_name VARCHAR2(500) NOT NULL,
  amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  months VARCHAR2(100),
  regular_income_notes VARCHAR2(2500),
  is_active VARCHAR2(1) DEFAULT 'Y',
  regular_income_id_old NUMBER,
  income_category_id_old NUMBER,
  CONSTRAINT pk_regular_incomes PRIMARY KEY (regular_income_id),
  CONSTRAINT uk_regular_income_name UNIQUE (regular_income_name)
);

ALTER TABLE pf_regular_incomes
ADD CONSTRAINT fk_pf_regular_incomes_pf_incomes_categories
FOREIGN KEY (income_category_id)
REFERENCES pf_income_categories(income_category_id);



--TABLE pf_regular_expenses;

CREATE TABLE pf_regular_expenses (
  regular_expense_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  expense_category_id NUMBER NOT NULL,
  regular_expense_name VARCHAR2(500) NOT NULL,
  amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  months VARCHAR2(100),
  regular_expense_notes VARCHAR2(2500),
  is_active VARCHAR2(1) DEFAULT 'Y',
  regular_expense_id_old NUMBER,
  expense_category_id_old NUMBER,
  CONSTRAINT pk_regular_expenses PRIMARY KEY (regular_expense_id),
  CONSTRAINT uk_regular_expense_name UNIQUE (regular_expense_name)
);

ALTER TABLE pf_regular_expenses
ADD CONSTRAINT fk_pf_regular_expenses_pf_expense_categories
FOREIGN KEY (expense_category_id)
REFERENCES pf_expense_categories(expense_category_id);




--TABLE pf_monthly_sum;

CREATE TABLE pf_monthly_sum (
  monthly_sum_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  pf_year NUMBER NOT NULL,
  pf_month NUMBER NOT NULL,
  incomes_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  incomes_open NUMBER(10,2) GENERATED ALWAYS AS (incomes_all - incomes_received) VIRTUAL,
  incomes_received NUMBER(10,2) DEFAULT 0 NOT NULL,
  expenses_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  expenses_open NUMBER(10,2) GENERATED ALWAYS AS (expenses_all - expenses_paid) VIRTUAL,
  expenses_paid NUMBER(10,2) DEFAULT 0 NOT NULL,
  month_closed VARCHAR2(1) DEFAULT 'N',
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_monthly_sum PRIMARY KEY (monthly_sum_id),
  CONSTRAINT uk_year_month UNIQUE (pf_year, pf_month)
);


-- TABLE pf_incomes;
-- DROP TABLE pf_incomes;

CREATE TABLE pf_incomes (
  income_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  monthly_sum_id NUMBER NOT NULL,
  income_category_id NUMBER NOT NULL,
  income VARCHAR2(500) NOT NULL,
  amount_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_open NUMBER(10,2) GENERATED ALWAYS AS (amount_all - amount_received) VIRTUAL,
  amount_received NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_correction NUMBER(10,2) DEFAULT 0,
  regular_income_id NUMBER,
  update_regular_income VARCHAR2(1) DEFAULT 'Y',
  incomes_notes VARCHAR2(2500),
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_incomes PRIMARY KEY (income_id)
);

ALTER TABLE pf_incomes
ADD CONSTRAINT fk_pf_incomes_pf_monthly_sum
FOREIGN KEY (monthly_sum_id)
REFERENCES pf_monthly_sum(monthly_sum_id);

ALTER TABLE pf_incomes
ADD CONSTRAINT fk_pf_incomes_pf_income_categories
FOREIGN KEY (income_category_id)
REFERENCES pf_income_categories(income_category_id);

ALTER TABLE pf_incomes
ADD CONSTRAINT fk_pf_incomes_pf_regular_incomes
FOREIGN KEY (regular_income_id)
REFERENCES pf_regular_incomes(regular_income_id);



-- TABLE pf_expenses;
-- DROP TABLE pf_expenses;

CREATE TABLE pf_expenses (
  expense_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  monthly_sum_id NUMBER NOT NULL,
  expense_category_id NUMBER NOT NULL,
  expense VARCHAR2(500) NOT NULL,
  amount_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_open NUMBER(10,2) GENERATED ALWAYS AS (amount_all - amount_paid) VIRTUAL,
  amount_paid NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_correction NUMBER(10,2) DEFAULT 0,
  regular_expense_id NUMBER,
  update_regular_expense VARCHAR2(1) DEFAULT 'Y',
  expenses_notes VARCHAR2(2500),
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_expenses PRIMARY KEY (expense_id)
);

ALTER TABLE pf_expenses
ADD CONSTRAINT fk_pf_expenses_pf_monthly_sum
FOREIGN KEY (monthly_sum_id)
REFERENCES pf_monthly_sum(monthly_sum_id);

ALTER TABLE pf_expenses
ADD CONSTRAINT fk_pf_incomes_pf_expense_categories
FOREIGN KEY (expense_category_id)
REFERENCES pf_expense_categories(expense_category_id);

ALTER TABLE pf_expenses
ADD CONSTRAINT fk_pf_expenses_pf_regular_expenses
FOREIGN KEY (regular_expense_id)
REFERENCES pf_regular_expenses(regular_expense_id);


-- TABLE pf_currencies

CREATE TABLE pf_currencies (
  currency_code VARCHAR2(3) NOT NULL,
  currency_name VARCHAR2(250) NOT NULL,
  currency_rate NUMBER(10,2) DEFAULT 0 NOT NULL,
  rate_date DATE NOT NULL,
  CONSTRAINT pk_currencies PRIMARY KEY (currency_code),
  CONSTRAINT uk_currency_name UNIQUE (currency_name)
);


-- TABLE pf_money_allocation

CREATE TABLE pf_money_allocation (
  allocation_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  allocation VARCHAR2(500) NOT NULL,
  allocation_amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  currency_code VARCHAR2(3) NOT NULL,
  allocation_value NUMBER(10,2) DEFAULT 0 NOT NULL,
  is_available VARCHAR2(1) DEFAULT 'Y',
  allocation_notes VARCHAR2(2500),
  CONSTRAINT pk_money_allocation PRIMARY KEY (allocation_id),
  CONSTRAINT uk_allocation UNIQUE (allocation)
);

ALTER TABLE pf_money_allocation
ADD CONSTRAINT fk_pf_money_allocation_pf_currencies
FOREIGN KEY (currency_code)
REFERENCES pf_currencies(currency_code);



-- TABLE pf_money_correction

CREATE TABLE pf_money_correction (
  money_correction_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  monthly_sum_id NUMBER NOT NULL,
  correction_amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  correction_notes VARCHAR2(2500),
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_money_correction PRIMARY KEY (money_correction_id)
);

ALTER TABLE pf_money_correction
ADD CONSTRAINT fk_pf_money_correction_pf_monthly_sum
FOREIGN KEY (monthly_sum_id)
REFERENCES pf_monthly_sum(monthly_sum_id);




--===================================
-- VIEWS
--===================================
CREATE OR REPLACE VIEW pf_view_monthly_sum AS
SELECT monthly_sum_id, 
        pf_year, 
        pf_month, 
        --TO_CHAR(TO_DATE(pf_month, 'MM'), 'Month', 'NLS_DATE_LANGUAGE = ' || SYS_CONTEXT('pf_app_context', 'app_language')) AS month_name, 
        TO_CHAR(TO_DATE(pf_month, 'MM'), 'Month', 'NLS_DATE_LANGUAGE = SLOVENIAN') AS month_name, 
        incomes_all, 
        incomes_open, 
        incomes_received, 
        expenses_all,
        expenses_open, 
        expenses_paid, 
        (incomes_all - expenses_all) AS monthly_balance,
        SUM(incomes_all - expenses_all) OVER (ORDER BY pf_year, pf_month) AS cumulative_balance,
        month_closed
FROM pf_monthly_sum;


--===================================
-- GLOBAL TEMPORARY TABLES
--===================================

DROP TABLE temp_pf_changes;

CREATE GLOBAL TEMPORARY TABLE temp_pf_changes (
  monthly_sum_id NUMBER,
  allocation_id NUMBER
) ON COMMIT DELETE ROWS;


--===================================
-- Database Contexts
--===================================

-- Context: pf_app_context
CREATE OR REPLACE CONTEXT pf_app_context USING pf_app_pkg;