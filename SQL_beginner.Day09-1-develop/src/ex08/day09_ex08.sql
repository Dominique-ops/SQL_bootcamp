CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop int default 10)
RETURNS table (num bigint) AS $$
DECLARE
	start_0 int:= 0;
	start_1 int:=1;
BEGIN
    While start_1<pstop loop
	num :=start_1;
	start_1:=start_1+start_0;
	start_0:=num;
	return next;
	end loop;
END;
$$ LANGUAGE plpgsql;