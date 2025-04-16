
-- Row-level trigger to processes the pf_view_monthly_sum updates
CREATE OR REPLACE TRIGGER trg_instead_u_row_view_monthly_sum
INSTEAD OF UPDATE ON pf_view_monthly_sum
FOR EACH ROW
BEGIN
    
    UPDATE pf_monthly_sum
        SET month_closed = :NEW.month_closed
    WHERE monthly_sum_id = :NEW.monthly_sum_id;
    
END trg_instead_u_row_view_monthly_sum;
/

