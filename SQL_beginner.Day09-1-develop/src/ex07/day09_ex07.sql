CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric AS $$
DECLARE
	min_val numeric;
	num numeric;
BEGIN
    IF array_length(arr, 1) IS NULL THEN
        RETURN NULL;
    END IF;
	min_val:=arr[1];
    FOREACH num IN ARRAY arr
    LOOP
        IF num < min_val THEN
            min_val:= num;
        END IF;
    END LOOP;
    RETURN min_val;
END;
$$ LANGUAGE plpgsql;