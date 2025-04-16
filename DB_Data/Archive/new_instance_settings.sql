
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

COMMIT;