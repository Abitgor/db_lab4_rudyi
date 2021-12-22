CREATE TRIGGER validate_fractions_name
AFTER INSERT ON fractions
FOR EACH ROW EXECUTE FUNCTION validate_fractions();

CREATE OR REPLACE FUNCTION validate_fractions() RETURNS trigger AS
$$
     BEGIN
        IF (NEW.name = 'Alliance') THEN
            NEW.name = 'Alliance';
        ELSIF (NEW.name = 'Horde') THEN
            NEW.name = 'Horde';
        ELSE
         RAISE EXCEPTION '% cannot be a fraction', NEW.name;
        END IF;
        RETURN NEW;
     END;
$$ LANGUAGE 'plpgsql';
