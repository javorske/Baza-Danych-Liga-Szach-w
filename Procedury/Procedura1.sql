
/*  Procedura dodaje nowego zawodnika do tabeli "Zawodnik"  */
  
CREATE OR REPLACE PROCEDURE DodawanieZawodnika(
v_imie IN zawodnik.imie%TYPE,
v_nazwisko IN zawodnik.nazwisko%TYPE,
v_data_urodzenia IN zawodnik.data_urodzenia%TYPE,
v_klub_id IN zawodnik.klub_id%TYPE,
v_tytul_szachowy_id IN zawodnik.tytul_szachowy_id%TYPE,
v_miejscowosc_id IN zawodnik.miejscowosc_id%TYPE,
v_narodowosc_id IN zawodnik.narodowosc_id%TYPE,
v_klub_nazwa klub.nazwa%TYPE
)
IS
v_najwyzszeID_Klubu INT;
BEGIN
  SELECT MAX(klub.id) INTO v_najwyzszeID_Klubu FROM klub ;
  IF (v_najwyzszeID_Klubu >= v_klub_id) THEN
    INSERT INTO zawodnik ("IMIE", "NAZWISKO", "DATA_URODZENIA", "KLUB_ID", "TYTUL_SZACHOWY_ID", "MIEJSCOWOSC_ID", "NARODOWOSC_ID")
    VALUES 
    (
      v_imie, 
      v_nazwisko,
      v_data_urodzenia, 
      v_klub_id, 
      v_tytul_szachowy_id, 
      v_miejscowosc_id, 
      v_narodowosc_id
    );
    COMMIT;
  ELSE
    INSERT INTO klub ("ID", "NAZWA")
    VALUES
    (
      v_klub_id,
      v_klub_nazwa
    );
    
    INSERT INTO zawodnik ("IMIE", "NAZWISKO", "DATA_URODZENIA", "KLUB_ID", "TYTUL_SZACHOWY_ID", "MIEJSCOWOSC_ID", "NARODOWOSC_ID")
    VALUES 
    (
      v_imie, 
      v_nazwisko,
      v_data_urodzenia, 
      v_klub_id, 
      v_tytul_szachowy_id, 
      v_miejscowosc_id, 
      v_narodowosc_id
    );
    COMMIT;
  END IF;
END;
/*
execute DodawanieZawodnika('Jan', 'Kowal' , '2000/01/01', 1, 1, 1, 1,'');
execute DodawanieZawodnika(imie, nazwsiko, data_urodzenia(format.yyyy/mm/dd), 
IDKlubu, Tytul_szachowy_id, IDmiejscowosci, id_narodowosci, nazwaklubu) 
*/