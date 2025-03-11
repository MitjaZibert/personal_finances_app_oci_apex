/*DECLARE
l_user_groups_no NUMBER := 0;
l_user_group_id NUMBER;
BEGIN
    l_user_groups_no := pf_users_pkg.check_user_in_groups_number(:APP_USER);

    IF l_user_groups_no > 1 THEN
        :P0_USER_NUMBER_OF_GROUPS := pf_users_pkg.check_user_in_groups_number(:APP_USER);

    ELSE
        apex_util.set_session_state('P0_USER_NUMBER_OF_GROUPS', 1);
        apex_util.set_session_state('APP_USER_GROUP_ID', 991);
        
        l_user_group_id := pf_users_pkg.get_user_group_id(:APP_USER);
        pf_users_pkg.set_user_group_id_context(l_user_group_id);
    END IF;
END;*/


--apex.navigation.redirect("f?p=&APP_ID.:2:&APP_SESSION.");


SELECT pf_users_pkg.get_user_group_id('PF_Demo') FROM DUAL;


SELECT 1 
FROM dual
WHERE SYS_CONTEXT('pf_users_context', 'user_group_id') IS NOT NULL;




    --apex_util.set_session_state('P0_USER_NUMBER_OF_GROUPS', 1);
    --apex_util.set_session_state('APP_USER_GROUP_ID', l_user_groups_no);