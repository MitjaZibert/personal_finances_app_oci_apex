
-- Context: pf_users_context
--CREATE OR REPLACE CONTEXT pf_users_context USING pf_users_pkg;

-- ==================================================================

-- Package specification
CREATE OR REPLACE PACKAGE pf_users_pkg AS
    FUNCTION check_if_user_in_multiple_groups (p_user_name IN VARCHAR2) RETURN BOOLEAN;
    FUNCTION get_user_group_id (p_user_name IN VARCHAR2) RETURN NUMBER;
    PROCEDURE set_user_group_id_context (p_user_group_id IN NUMBER);
END pf_users_pkg;
/

-- Package body
CREATE OR REPLACE PACKAGE BODY pf_users_pkg AS

    -- Check if user name is in multiple groups (if yes prompt user for which group to run the app) - called instead of get_user_group_id
    FUNCTION check_if_user_in_multiple_groups (p_user_name IN VARCHAR2) RETURN BOOLEAN IS
        l_is_multi_group BOOLEAN := FALSE;
        l_multi_group_check NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO l_multi_group_check
        FROM pf_user_groups g
        JOIN pf_users u
        ON g.user_group_id = u.user_group_id
        WHERE UPPER(u.user_name) = UPPER(p_user_name);
        
        IF l_multi_group_check > 1 THEN
            l_is_multi_group := TRUE;
        END IF;

        RETURN l_is_multi_group;

        EXCEPTION
            WHEN OTHERS THEN
                -- Handle non-defined exceptions
                dbms_output.put_line('An error occurred: ' || SQLERRM);
                dbms_output.put_line('Error code: ' || SQLCODE);

    END check_if_user_in_multiple_groups;
    --============================================================================================

    -- GET user ID (called only in case when user name is just in one group)
    FUNCTION get_user_group_id (p_user_name IN VARCHAR2) RETURN NUMBER IS
        l_user_group_id NUMBER;
    BEGIN
        SELECT MAX(g.user_group_id)
        INTO l_user_group_id
        FROM pf_user_groups g
        JOIN pf_users u
        ON g.user_group_id = u.user_group_id
        WHERE UPPER(u.user_name) = UPPER(p_user_name);
        
        RETURN l_user_group_id;

        EXCEPTION
            WHEN OTHERS THEN
                -- Handle non-defined exceptions
                dbms_output.put_line('An error occurred: ' || SQLERRM);
                dbms_output.put_line('Error code: ' || SQLCODE);

    END get_user_group_id;
    --============================================================================================


    -- SET pf_app_context:user_group_id  (used in all queries)
    PROCEDURE set_user_group_id_context (p_user_group_id IN NUMBER) IS
    BEGIN
        
        -- Set the user_group_id context with the p_user_group_id parameter
        DBMS_SESSION.SET_CONTEXT('pf_app_context', 'user_group_id', p_user_group_id);
    
        EXCEPTION
            WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
    END set_user_group_id_context;
    --============================================================================================
    
END pf_users_pkg;
/

-- *** Proper usage:
-- SELECT * FROM your_table WHERE user_group_id = SYS_CONTEXT('pf_users_pkg', 'user_group_id');
-- ==================================================================
-- Apex code:
-- BEGIN
--    pf_users_pkg.set_group_id(:G_APP_USER); -- :G_APP_USES = Application item
-- END;
