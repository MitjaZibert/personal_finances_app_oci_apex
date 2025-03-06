/*
SELECT COUNT(*)
FROM pf_user_groups g
JOIN pf_users u
ON g.user_group_id = u.user_group_id
WHERE u.user_name = 'MZ';


*/

SELECT pf_users_pkg.check_if_user_in_multiple_groups('mz') FROM DUAL;


--pf_users_pkg.check_if_user_in_multiple_groups(:APP_USER) = true
