CREATE OR REPLACE PACKAGE pf_currencies_pkg 
AS
    FUNCTION get_next_month (p_monthly_sum_id in NUMBER) RETURN NUMBER;
    PROCEDURE transfer_income (p_income_id IN NUMBER);
    PROCEDURE transfer_expense (p_expense_id IN NUMBER);
END pf_currencies_pkg;
/

CREATE OR REPLACE PROCEDURE pf_currencies_pkg (
    p_curr_list IN VARCHAR2,
    p_rates_cur OUT SYS_REFCURSOR
) AS
    l_http_request  UTL_HTTP.req;
    l_http_response UTL_HTTP.resp;
    l_response_text CLOB;
    l_url           VARCHAR2(1000) := 'http://api.currencylayer.com/live';
    l_params        VARCHAR2(1000);
    l_rates_json    JSON_OBJECT_T;
    l_quotes_json   JSON_OBJECT_T;
    l_eur_rate      NUMBER;
BEGIN
    -- Build parameters
    l_params := 'access_key=df080fbd6c0040d3f079496b64a06ed4&currencies=' 
             || p_curr_list 
             || '&format=1';
    
    -- Make HTTP request
    l_http_request := UTL_HTTP.begin_request(l_url || '?' || l_params);
    l_http_response := UTL_HTTP.get_response(l_http_request);
    
    -- Get response
    UTL_HTTP.read_text(l_http_response, l_response_text);
    UTL_HTTP.end_response(l_http_response);
    
    -- Parse JSON
    l_rates_json := JSON_OBJECT_T.parse(l_response_text);
    l_quotes_json := TREAT(l_rates_json.get('quotes') AS JSON_OBJECT_T);
    
    -- Get EUR rate
    l_eur_rate := l_quotes_json.get_Number('USDEUR');
    
    -- Return results as a cursor
    OPEN p_rates_cur FOR
    SELECT 
        CASE 
            WHEN curr = 'EUR' THEN 'USD'
            ELSE curr
        END AS currency,
        CASE 
            WHEN curr = 'EUR' THEN 1/rate
            ELSE rate/l_eur_rate
        END AS eur_rate
    FROM (
        SELECT 
            SUBSTR(key, 4) AS curr,
            value AS rate
        FROM 
            JSON_TABLE(
                l_response_text, 
                '$.quotes.*' 
                COLUMNS (
                    key VARCHAR2(10) PATH '@.key',
                    value NUMBER PATH '@.value'
                )
            )
    );
    
EXCEPTION
    WHEN OTHERS THEN
        IF UTL_HTTP.is_open(l_http_response) THEN
            UTL_HTTP.end_response(l_http_response);
        END IF;
        RAISE;
END pf_currencies_pkg;