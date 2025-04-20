
-- Row-level trigger to processes after the pf_currencies update
CREATE OR REPLACE TRIGGER trg_au_row_pf_currencies
AFTER UPDATE ON pf_currencies
FOR EACH ROW
BEGIN
    UPDATE pf_money_allocation
        SET allocation_value = allocation_amount * :NEW.currency_rate
    WHERE currency_code = :NEW.currency_code;
    
END trg_au_row_pf_currencies;
/

