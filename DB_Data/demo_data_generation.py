print ("-- pf_monthly_sum")
print ("")

for i in range(1, 13):
    print("INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2024, " +  str(i) + ", TRUE);")

for i in range(1, 3):
    print("INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, " +  str(i) + ", TRUE);")

for i in range(3, 13):
    print("INSERT INTO pf_monthly_sum (user_group_id, year, month, month_closed) VALUES (1, 2025, " +  str(i) + ", FALSE);")

print ("")
print ("")
print ("-- pf_incomes")
print ("")

for i in range(1, 13):
    print("INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, " +  str(i) + ", 1, 'Monthly salary', 2050, 0, 2050, 1, FALSE);")
    
    if i in (3, 7):
        print("INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, " +  str(i) + ", 2, 'PL/SQL script', 240, 0, 240, 'Freelance client 1');")
    
    if i == 12:
        print("INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, " +  str(i) + ", 2, 'APEX custom module', 1025, 0, 1025, 'Freelance client 1');")
    
    if i in (8, 13):
       print("INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, " +  str(i) + ", 2, 'SQL optimization', 140, 0, 140, 'Freelance client 2');")
        

for i in range(13, 15):
    print("INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, " +  str(i) + ", 1, 'Monthly salary', 2350, 0, 2350, 1, FALSE);")
    
    if i == 14:
        print("INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, incomes_notes) VALUES (1, " +  str(i) + ", 2, 'Consulting', 320, 0, 320, 'Freelance client 3');")
    

for i in range(15, 25):
    print("INSERT INTO pf_incomes (user_group_id, monthly_sum_id, income_category_id, income, amount_all, amount_open, amount_received, regular_income_id, update_regular_income) VALUES (1, " +  str(i) + ", 1, 'Monthly salary', 2350, 0, 2350, 1, TRUE);")


print ("")
print ("")
print ("-- pf_expenses")
print ("")


for i in range(1, 15):
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 1, 'Food and stuff', 350, 0, 350, 1, FALSE);")
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 2, 'House expenses', 120, 0, 120, 2, FALSE);")

    if i in (10, 11, 12):
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 3, 'Business tax', 195.55, 0, 195.55, 3, FALSE);")
    

    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 7, 'Business payments', 58, 0, 58, 4, FALSE);")
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 4, 'Car fuel', 65, 0, 65, 5, FALSE);")
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 5, 'Restaurants', 45, 0, 45, 7, FALSE);")

    if i == 3:
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, " +  str(i) + ", 7, 'Business tax', 60, 0, 60);")

    if i == 7:
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, " +  str(i) + ", 7, 'Business tax', 60, 0, 60);")
    
    if i == 9:
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, " +  str(i) + ", 6, 'Vacation', 1250, 0, 1250);")

    if i == 12:
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, " +  str(i) + ", 7, 'Business tax', 256.25, 0, 256.25);")

    if i in (8, 13):
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, " +  str(i) + ", 7, 'Business tax', 35, 0, 35);")
    
    if i == 14:
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid) VALUES (1, " +  str(i) + ", 7, 'Business tax', 80, 0, 80);")

    if i == 8:
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 4, 'Car insurance', 344.25, 0, 344.25, 6, FALSE);")
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 4, 'Car maintenance', 95.55, 0, 95.55, 6, FALSE);")


for i in range(15, 25):
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 1, 'Food and stuff', 350, 0, 350, 1, TRUE);")
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 2, 'House expenses', 120, 0, 120, 2, TRUE);")
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 7, 'Business payments', 58, 0, 58, 4, TRUE);")
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 4, 'Car fuel', 65, 0, 65, 5, TRUE);")
    print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 5, 'Restaurants', 50, 0, 50, 7, TRUE);")

    
    if i == 8:
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 4, 'Car insurance', 365, 0, 365, 6, TRUE);")
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 4, 'Car maintenance', 125, 0, 125, 6, TRUE);")

    if i in (10, 11, 12):
        print("INSERT INTO pf_expenses (user_group_id, monthly_sum_id, expense_category_id, expense, amount_all, amount_open, amount_paid, regular_expense_id, update_regular_expense) VALUES (1, " +  str(i) + ", 3, 'Business tax', 200, 0, 200, 3, TRUE);")
    