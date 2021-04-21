/* procedura przenosi zawodnika do innego klubu */
set serveroutput on;

CREATE OR REPLACE PROCEDURE zmiana_klubu_zawodnika
(
  v_id_zawodnika IN zawodnik.id%TYPE, 
  v_id_klubu IN zawodnik.klub_id%TYPE,
  v_nazwa_klubu IN klub.nazwa%TYPE
) 
IS

max_id zawodnik.klub_id%TYPE;
czy_jest klub.nazwa%TYPE;

BEGIN
  SELECT k.nazwa INTO czy_jest FROM klub k WHERE k.id = v_id_klubu;
  
  UPDATE zawodnik
  SET klub_id = v_id_klubu
  WHERE id = v_id_zawodnika;
 
EXCEPTION
  WHEN no_data_found
  THEN
  
  INSERT INTO klub (nazwa) VALUES (v_nazwa_klubu);
  SELECT MAX(klub.id) AS maxID INTO max_id FROM klub;
  
  UPDATE zawodnik
  SET zawodnik.klub_id = max_id
  WHERE zawodnik.id = v_id_zawodnika;
END;

/*
execute zmiana_klubu_zawodnika(id_zawodnika,id_klubu,'nazwa nowego klubu');
*/