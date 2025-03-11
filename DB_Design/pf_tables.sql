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
DROP TABLE pf_users;
DROP TABLE pf_user_groups;



-- TABLE pf_user_groups

CREATE TABLE pf_user_groups (
  user_group_id NUMBER NOT NULL,
  user_group_name VARCHAR2(250) NOT NULL,
  CONSTRAINT pk_user_groups PRIMARY KEY (user_group_id),
  CONSTRAINT uk_user_group_name UNIQUE (user_group_name)
);

-- TABLE pf_users
 
CREATE TABLE pf_users (
  user_group_id VARCHAR2(250) NOT NULL,
  user_name VARCHAR2(250) NOT NULL,
  CONSTRAINT pk_users PRIMARY KEY (user_group_id, user_name)
);


-- TABLE pf_app_variables
 
CREATE TABLE pf_app_variables (
  user_group_id NUMBER NOT NULL,
  currency_check_sum NUMBER(10,2) DEFAULT 0,
  pre_app_money_sum NUMBER(10,2) DEFAULT 0,
  CONSTRAINT pk_app_variables PRIMARY KEY (user_group_id)
);

ALTER TABLE pf_app_variables
ADD CONSTRAINT fk_pf_app_variables_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);


--TABLE pf_income_categories;

CREATE TABLE pf_income_categories (
  income_category_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  income_category_name VARCHAR2(250) NOT NULL,
  income_category_notes VARCHAR2(2500),
  user_group_id NUMBER NOT NULL,
  income_category_id_old NUMBER,
  CONSTRAINT pk_income_categories PRIMARY KEY (user_group_id, income_category_id),
  CONSTRAINT uk_income_category_name UNIQUE (user_group_id, income_category_name)
);

ALTER TABLE pf_income_categories
ADD CONSTRAINT fk_pf_income_categories_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);

--TABLE pf_expense_categories;

CREATE TABLE pf_expense_categories (
  expense_category_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  expense_category_name VARCHAR2(250) NOT NULL,
  expense_category_notes VARCHAR2(2500),
  user_group_id NUMBER NOT NULL,
  expense_category_id_old NUMBER,
  CONSTRAINT pk_expense_categories PRIMARY KEY (user_group_id, expense_category_id),
  CONSTRAINT uk_expense_category_name UNIQUE (user_group_id, expense_category_name)
);

ALTER TABLE pf_expense_categories
ADD CONSTRAINT fk_pf_expense_categories_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);


--TABLE pf_regular_incomes;

CREATE TABLE pf_regular_incomes (
  regular_income_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  income_category_id NUMBER NOT NULL,
  regular_income_name VARCHAR2(500) NOT NULL,
  amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  months VARCHAR2(100),
  regular_income_notes VARCHAR2(2500),
  is_active BOOLEAN DEFAULT TRUE,
  user_group_id NUMBER NOT NULL,
  regular_income_id_old NUMBER,
  income_category_id_old NUMBER,
  CONSTRAINT pk_regular_incomes PRIMARY KEY (user_group_id, regular_income_id),
  CONSTRAINT uk_regular_income_name UNIQUE (user_group_id, regular_income_name)
);

ALTER TABLE pf_regular_incomes
ADD CONSTRAINT fk_pf_regular_incomes_pf_incomes_categories
FOREIGN KEY (user_group_id, income_category_id)
REFERENCES pf_income_categories(user_group_id, income_category_id);

ALTER TABLE pf_regular_incomes
ADD CONSTRAINT fk_pf_regular_incomes_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);


--TABLE pf_regular_expenses;

CREATE TABLE pf_regular_expenses (
  regular_expense_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  expense_category_id NUMBER NOT NULL,
  regular_expense_name VARCHAR2(500) NOT NULL,
  amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  months VARCHAR2(100),
  regular_expense_notes VARCHAR2(2500),
  is_ctive BOOLEAN DEFAULT TRUE,
  user_group_id NUMBER NOT NULL,
  regular_expense_id_old NUMBER,
  expense_category_id_old NUMBER,
  CONSTRAINT pk_regular_expenses PRIMARY KEY (user_group_id, regular_expense_id),
  CONSTRAINT uk_regular_expense_name UNIQUE (user_group_id, regular_expense_name)
);

ALTER TABLE pf_regular_expenses
ADD CONSTRAINT fk_pf_regular_expenses_pf_expense_categories
FOREIGN KEY (user_group_id, expense_category_id)
REFERENCES pf_expense_categories(user_group_id, expense_category_id);

ALTER TABLE pf_regular_expenses
ADD CONSTRAINT fk_pf_regular_expenses_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);



--TABLE pf_monthly_sum;

CREATE TABLE pf_monthly_sum (
  monthly_sum_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  year NUMBER NOT NULL,
  month NUMBER NOT NULL,
  incomes_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  incomes_open NUMBER(10,2) DEFAULT 0 NOT NULL,
  incomes_received NUMBER(10,2) DEFAULT 0 NOT NULL,
  expenses_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  expenses_open NUMBER(10,2) DEFAULT 0 NOT NULL,
  expenses_paid NUMBER(10,2) DEFAULT 0 NOT NULL,
  month_closed BOOLEAN DEFAULT FALSE,
  user_group_id NUMBER NOT NULL,
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_monthly_sum PRIMARY KEY (user_group_id, monthly_sum_id),
  CONSTRAINT uk_year_month UNIQUE (user_group_id, year, month)
);

ALTER TABLE pf_monthly_sum
ADD CONSTRAINT fk_pf_monthly_sum_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);

-- TABLE pf_incomes;
-- DROP TABLE pf_incomes;

CREATE TABLE pf_incomes (
  income_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  monthly_sum_id NUMBER NOT NULL,
  income_category_id NUMBER NOT NULL,
  income VARCHAR2(500) NOT NULL,
  amount_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_open NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_received NUMBER(10,2) DEFAULT 0 NOT NULL,
  regular_income_id NUMBER,
  update_regular_income BOOLEAN DEFAULT FALSE,
  incomes_notes VARCHAR2(2500),
  user_group_id NUMBER NOT NULL,
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_incomes PRIMARY KEY (user_group_id, income_id)
);

ALTER TABLE pf_incomes
ADD CONSTRAINT fk_pf_incomes_pf_monthly_sum
FOREIGN KEY (user_group_id, monthly_sum_id)
REFERENCES pf_monthly_sum(user_group_id, monthly_sum_id);

ALTER TABLE pf_incomes
ADD CONSTRAINT fk_pf_incomes_pf_income_categories
FOREIGN KEY (user_group_id, income_category_id)
REFERENCES pf_income_categories(user_group_id, income_category_id);

ALTER TABLE pf_incomes
ADD CONSTRAINT fk_pf_incomes_pf_regular_incomes
FOREIGN KEY (user_group_id, regular_income_id)
REFERENCES pf_regular_incomes(user_group_id, regular_income_id);

ALTER TABLE pf_incomes
ADD CONSTRAINT fk_pf_incomes_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);


-- TABLE pf_expenses;
-- DROP TABLE pf_expenses;

CREATE TABLE pf_expenses (
  expense_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  monthly_sum_id NUMBER NOT NULL,
  expense_category_id NUMBER NOT NULL,
  expense VARCHAR2(500) NOT NULL,
  amount_all NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_open NUMBER(10,2) DEFAULT 0 NOT NULL,
  amount_paid NUMBER(10,2) DEFAULT 0 NOT NULL,
  regular_expense_id NUMBER,
  update_regular_expense BOOLEAN DEFAULT FALSE,
  expenses_notes VARCHAR2(2500),
  user_group_id NUMBER NOT NULL,
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_expenses PRIMARY KEY (user_group_id, expense_id)
);

ALTER TABLE pf_expenses
ADD CONSTRAINT fk_pf_expenses_pf_monthly_sum
FOREIGN KEY (user_group_id, monthly_sum_id)
REFERENCES pf_monthly_sum(user_group_id, monthly_sum_id);

ALTER TABLE pf_expenses
ADD CONSTRAINT fk_pf_incomes_pf_expense_categories
FOREIGN KEY (user_group_id, expense_category_id)
REFERENCES pf_expense_categories(user_group_id, expense_category_id);

ALTER TABLE pf_expenses
ADD CONSTRAINT fk_pf_expenses_pf_regular_expenses
FOREIGN KEY (user_group_id, regular_expense_id)
REFERENCES pf_regular_expenses(user_group_id, regular_expense_id);

ALTER TABLE pf_expenses
ADD CONSTRAINT fk_pf_expenses_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);


-- TABLE pf_currencies

CREATE TABLE pf_currencies (
  currency_code VARCHAR2(3) NOT NULL,
  currency_name VARCHAR2(250) NOT NULL,
  currency_rate NUMBER(10,2) DEFAULT 0 NOT NULL,
  rate_date DATE NOT NULL,
  user_group_id NUMBER NOT NULL,
  CONSTRAINT pk_currencies PRIMARY KEY (user_group_id, currency_code),
  CONSTRAINT uk_currency_name UNIQUE (user_group_id, currency_name)
);

ALTER TABLE pf_currencies
ADD CONSTRAINT fk_pf_currencies_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);

-- TABLE pf_money_allocation

CREATE TABLE pf_money_allocation (
  allocation_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  allocation VARCHAR2(500) NOT NULL,
  allocation_amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  currency_code VARCHAR2(3) NOT NULL,
  allocation_value NUMBER(10,2) DEFAULT 0 NOT NULL,
  is_available BOOLEAN DEFAULT FALSE,
  allocation_notes VARCHAR2(2500),
  user_group_id NUMBER NOT NULL,
  CONSTRAINT pk_money_allocation PRIMARY KEY (user_group_id, allocation_id),
  CONSTRAINT uk_allocation UNIQUE (user_group_id, allocation)
);

ALTER TABLE pf_money_allocation
ADD CONSTRAINT fk_pf_money_allocation_pf_currencies
FOREIGN KEY (user_group_id, currency_code)
REFERENCES pf_currencies(user_group_id, currency_code);

ALTER TABLE pf_money_allocation
ADD CONSTRAINT fk_pf_money_allocation_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);


-- TABLE pf_money_correction

CREATE TABLE pf_money_correction (
  money_correction_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  monthly_sum_id NUMBER NOT NULL,
  correction_amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  correction_notes VARCHAR2(2500),
  user_group_id NUMBER NOT NULL,
  monthly_sum_id_old NUMBER,
  CONSTRAINT pk_money_correction PRIMARY KEY (user_group_id, money_correction_id)
);

ALTER TABLE pf_money_correction
ADD CONSTRAINT fk_pf_money_correction_pf_monthly_sum
FOREIGN KEY (user_group_id, monthly_sum_id)
REFERENCES pf_monthly_sum(user_group_id, monthly_sum_id);

ALTER TABLE pf_money_correction
ADD CONSTRAINT fk_pf_money_correction_pf_user_groups
FOREIGN KEY (user_group_id)
REFERENCES pf_user_groups(user_group_id);