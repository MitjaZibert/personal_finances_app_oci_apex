-- ==================================================================

-- Package specification
CREATE OR REPLACE PACKAGE pf_app_pkg AS
    PROCEDURE set_app_language (p_language IN VARCHAR2);
END pf_app_pkg;
/

-- Package body
CREATE OR REPLACE PACKAGE BODY pf_app_pkg AS

    --============================================================================================

    -- SET pf_app_context:app_language
    PROCEDURE set_app_language (p_language IN VARCHAR2) IS
    BEGIN
        
        -- Set the user_group_id context with the p_user_group_id parameter
        DBMS_SESSION.SET_CONTEXT('pf_app_context', 'app_language', p_language);
    
        EXCEPTION
            WHEN OTHERS THEN
            -- Handle non-defined exceptions
            dbms_output.put_line('An error occurred: ' || SQLERRM);
            dbms_output.put_line('Error code: ' || SQLCODE);
    END set_app_language;
    --============================================================================================
    
END pf_app_pkg;
/
