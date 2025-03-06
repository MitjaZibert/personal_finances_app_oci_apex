INSERT INTO pf_user_groups (user_group_name) VALUES ('Development Group');
INSERT INTO pf_user_groups (user_group_name) VALUES ('Demo Group');
INSERT INTO pf_user_groups (user_group_name) VALUES ('MZ-Iva Group');


INSERT INTO pf_users (user_group_id, user_name) VALUES (1, 'MZ');
INSERT INTO pf_users (user_group_id, user_name) VALUES (2, 'MZ');
INSERT INTO pf_users (user_group_id, user_name) VALUES (3, 'MZ');

INSERT INTO pf_users (user_group_id, user_name) VALUES (3, 'Ivana');


INSERT INTO pf_users (user_group_id, user_name) VALUES (2, 'PF_Demo');

COMMIT;