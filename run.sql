-- Function test
do
$$
    begin
        ASSERT (SELECT get_count_of_class_name_game_session('Warrior')) = 1, 'WRONG RESULT!';
    end;
$$ LANGUAGE plpgsql;

--Procedure test
CALL create_temporary_table_for_tests('classes', '_temp_table');

select *
from classes_temp_table;

--Trigger test should rise an error
insert into fractions(id, name) VALUES (4, 'asdasdasd');
