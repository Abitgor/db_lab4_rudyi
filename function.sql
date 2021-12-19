CREATE OR REPLACE FUNCTION get_count_of_class_name_game_session(class_name VARCHAR) RETURNS INT
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN (
        SELECT sum(case when cgs.id is NULL then 0 else 1 end) as number
    FROM classes c
        LEFT JOIN class_game_session cgs on c.id = cgs.class_id WHERE c.name = class_name);
END;
$$;