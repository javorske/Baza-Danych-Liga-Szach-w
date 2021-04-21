CREATE OR REPLACE PACKAGE BODY PROCEDURY
IS
--           ******** Pierwsza procedura ********
PROCEDURE DodawanieZawodnika
(
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
END DodawanieZawodnika;

--           ******** Druga procedura ********
PROCEDURE zmiana_klubu_zawodnika
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
END zmiana_klubu_zawodnika;
--           ******** Trzecia procedura ********
PROCEDURE nowa_rozgrywka_w_turnieju
(
  v_ID_turnieju rozgrywka.turniej_ID%TYPE,
  v_Data_rozgrywki rozgrywka.data%TYPE,
  v_czy_zakonczona rozgrywka.czy_zakonczona%TYPE,
  v_sedzia_id rozgrywka.sedzia_id%TYPE,
  v_przedz_wiek_id rozgrywka.przedzial_wiekowy_id%TYPE,
  v_sala_numer_sali rozgrywka.sala_numer_sali%TYPE,
  v_tryb_rozgrywki_id rozgrywka.tryb_rozgrywki_id%TYPE,
  v_turniej_id rozgrywka.turniej_id%TYPE,
  v_zawodnik_nr1_id rozgrywka.zawodnik_nr1_id%TYPE,
  v_zawodnik_nr2_id rozgrywka.zawodnik_nr2_id%TYPE
)

is
 v_wiek_zawodnika_1 zawodnik.data_urodzenia%TYPE;
 v_wiek_zawodnika_2 zawodnik.data_urodzenia%TYPE;
BEGIN
  IF v_zawodnik_nr1_id = v_zawodnik_nr2_id THEN
    DBMS_OUTPUT.PUT_LINE('Zawodnik jest zdublowany');
    RETURN;
  END IF;
  SELECT zawodnik.data_urodzenia INTO v_wiek_zawodnika_1 FROM zawodnik WHERE zawodnik.id = v_zawodnik_nr1_id;
  SELECT zawodnik.data_urodzenia into v_wiek_zawodnika_2 FROM zawodnik WHERE zawodnik.id = v_zawodnik_nr2_id;
  IF v_zawodnik_nr1_id = v_zawodnik_nr2_id THEN dbms_output.put_line('Podano dwa razy to samo ID'); return; end if;
  IF v_przedz_wiek_id = 1 THEN /* oznacza przedzial wiekowy seniorow, czyli minimum 30 lat)*/
    IF ((v_wiek_zawodnika_1-SYSDATE)/12) >= 30 AND ((v_wiek_zawodnika_2-SYSDATE)/12) >= 30 THEN
      INSERT INTO rozgrywka("TURNIEJ_ID","DATA","CZY_ZAKONCZONA","SEDZIA_ID","PRZEDZIAL_WIEKOWY_ID","SALA_NUMER_SALI",
                            "TRYB_ROZGRYWKI_ID","ZAWODNIK_NR1_ID","ZAWODNIK_NR2_ID")
      VALUES 
        (
          v_turniej_id,
          v_Data_rozgrywki,
          v_czy_zakonczona,
          v_sedzia_id,
          v_przedz_wiek_id,
          v_sala_numer_sali,
          v_tryb_rozgrywki_id,
          v_zawodnik_nr1_id,
          v_zawodnik_nr2_id
          );
      COMMIT;
    ELSE
      dbms_output.put_line('Jeden z zawodników nie jest seniorem! Przedzial wiekowy dla seniorow.');
    END IF;
  ELSE
    IF ((v_wiek_zawodnika_1-SYSDATE)/12) < 30 AND ((v_wiek_zawodnika_2-SYSDATE)/12) < 30 THEN
      INSERT INTO rozgrywka ("TURNIEJ_ID","DATA","CZY_ZAKONCZONA","SEDZIA_ID","PRZEDZIAL_WIEKOWY_ID","SALA_NUMER_SALI",
                            "TRYB_ROZGRYWKI_ID","ZAWODNIK_NR1_ID","ZAWODNIK_NR2_ID")
      VALUES 
        (
          v_turniej_id,
          v_Data_rozgrywki,
          v_czy_zakonczona,
          v_sedzia_id,
          v_przedz_wiek_id,
          v_sala_numer_sali,
          v_tryb_rozgrywki_id,
          v_zawodnik_nr1_id,
          v_zawodnik_nr2_id
          );
      COMMIT;
    ELSE
     dbms_output.put_line('Jeden z zawodników nie jest juniorem! Przedzial wiekowy dla juniorow.');
    END IF;
  END IF;
END nowa_rozgrywka_w_turnieju;
--           ******** Czwarta procedura ********
PROCEDURE Tworzenie_Nagrody
(
  v_nag_kwota nagroda.kwota%TYPE,
  
  v_nag_wal_id nagroda.waluta_id%TYPE, 
  v_wal_nazwa waluta.nazwa%TYPE,
  
  v_nag_rzecz_rzeczowa_id nagroda.rzeczowa_id%TYPE,
  v_rzecz_nazwa rzeczowa.nazwa%TYPE 
)
IS
max_id_rzecz INT;
max_id_wal INT;
BEGIN

  SELECT MAX(id) INTO max_id_rzecz FROM rzeczowa;
  SELECT MAX(ID) INTO max_id_wal FROM waluta;
  
  IF v_nag_rzecz_rzeczowa_id > max_id_rzecz THEN  
    max_id_rzecz := max_id_rzecz + 1;
    INSERT INTO RZECZOWA (id, nazwa) VALUES (max_id_rzecz, v_rzecz_nazwa);
    
    IF v_nag_wal_id > max_id_wal THEN
      max_id_wal := max_id_wal + 1;
      INSERT INTO waluta (id, nazwa) VALUES (max_id_wal, v_wal_nazwa);
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, max_id_wal, max_id_rzecz);
      
    ELSE
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, v_nag_wal_id, max_id_rzecz);
      
    END IF;
    
  ELSIF v_nag_rzecz_rzeczowa_id != 0 THEN
  
    IF v_nag_wal_id > max_id_wal THEN
      max_id_wal := max_id_wal + 1;
      INSERT INTO waluta (id, nazwa) VALUES (max_id_wal, v_wal_nazwa);
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, max_id_wal, v_nag_rzecz_rzeczowa_id);
      
    ELSE
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, v_nag_wal_id, v_nag_rzecz_rzeczowa_id);
    
    END IF;
    
  ELSE
    IF v_nag_wal_id > max_id_wal THEN
      INSERT INTO waluta (nazwa) VALUES (v_wal_nazwa);
      max_id_wal := max_id_wal + 1;
      INSERT INTO nagroda (kwota, waluta_id) VALUES (v_nag_kwota, max_id_wal);
      
    ELSE
      INSERT INTO nagroda (kwota, waluta_id) VALUES (v_nag_kwota, v_nag_wal_id);
    END IF;
  END IF;
  
EXCEPTION
  WHEN DUP_VAL_ON_INDEX
  THEN DBMS_OUTPUT.PUT_LINE('Nazwa waluty/rzeczowej nie moze sie powtarzac!');
END Tworzenie_Nagrody;

--           ******** Przeciazenie czwartej procedury ********

PROCEDURE Tworzenie_Nagrody
(
  v_nag_kwota nagroda.kwota%TYPE,
  
  v_nag_wal_id nagroda.waluta_id%TYPE, 
  v_wal_nazwa waluta.nazwa%TYPE,
  
  v_nag_rzecz_rzeczowa_id nagroda.rzeczowa_id%TYPE,
  v_rzecz_nazwa rzeczowa.nazwa%TYPE,
  
  v_turniej_id turniej_nagroda.turniej_id%TYPE
)
IS
max_id_rzecz INT;
max_id_wal INT;
id_nowej_nagrody INT;
BEGIN

  SELECT MAX(id) INTO max_id_rzecz FROM rzeczowa;
  SELECT MAX(ID) INTO max_id_wal FROM waluta;
  
  IF v_nag_rzecz_rzeczowa_id > max_id_rzecz THEN  
    max_id_rzecz := max_id_rzecz + 1;
    INSERT INTO RZECZOWA (id, nazwa) VALUES (max_id_rzecz, v_rzecz_nazwa);
    
    IF v_nag_wal_id > max_id_wal THEN
      max_id_wal := max_id_wal + 1;
      INSERT INTO waluta (id, nazwa) VALUES (max_id_wal, v_wal_nazwa);
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, max_id_wal, max_id_rzecz);
      
    ELSE
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, v_nag_wal_id, max_id_rzecz);
      
    END IF;
    
  ELSIF v_nag_rzecz_rzeczowa_id != 0 THEN
  
    IF v_nag_wal_id > max_id_wal THEN
      max_id_wal := max_id_wal + 1;
      INSERT INTO waluta (id, nazwa) VALUES (max_id_wal, v_wal_nazwa);
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, max_id_wal, v_nag_rzecz_rzeczowa_id);
      
    ELSE
      INSERT INTO nagroda (kwota, waluta_id, rzeczowa_id) VALUES (v_nag_kwota, v_nag_wal_id, v_nag_rzecz_rzeczowa_id);
    
    END IF;
    
  ELSE
    IF v_nag_wal_id > max_id_wal THEN
      INSERT INTO waluta (nazwa) VALUES (v_wal_nazwa);
      max_id_wal := max_id_wal + 1;
      INSERT INTO nagroda (kwota, waluta_id) VALUES (v_nag_kwota, max_id_wal);
      
    ELSE
      INSERT INTO nagroda (kwota, waluta_id) VALUES (v_nag_kwota, v_nag_wal_id);
    END IF;
  END IF;
  
  SELECT MAX(nagroda.id) INTO id_nowej_nagrody FROM nagroda;
  
  INSERT INTO turniej_nagroda (turniej_id, nagroda_id) VALUES (v_turniej_id, id_nowej_nagrody);
  
EXCEPTION
  WHEN DUP_VAL_ON_INDEX
  THEN DBMS_OUTPUT.PUT_LINE('Nazwa waluty/rzeczowej nie moze sie powtarzac!');
END Tworzenie_Nagrody;

--           ******** Piata procedura ********
PROCEDURE Aktualizacja_Rozgrywki
(
  v_id rozgrywka.id%TYPE,
  v_zwyciezca rozgrywka.zwyciezca%TYPE
)

IS
  stan_rozgrywki rozgrywka.czy_zakonczona%TYPE;
  zaw_1 rozgrywka.zawodnik_nr1_id%TYPE;
  zaw_2 rozgrywka.zawodnik_nr2_id%TYPE;
BEGIN
  SELECT r.czy_zakonczona INTO stan_rozgrywki FROM rozgrywka r WHERE r.id = v_id;
  SELECT r.zawodnik_nr1_id INTO zaw_1 FROM rozgrywka r WHERE r.id = v_id;
  SELECT r.zawodnik_nr2_id INTO zaw_2 FROM rozgrywka r WHERE r.id = v_id;
  IF v_zwyciezca = zaw_1 OR v_zwyciezca = zaw_2 OR v_zwyciezca is null THEN
    IF stan_rozgrywki = 'f' THEN
      UPDATE rozgrywka
      SET rozgrywka.czy_zakonczona = 't',
          rozgrywka.zwyciezca = v_zwyciezca
      WHERE rozgrywka.id = v_id;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Ta rozgrywka jest juz zakonczona');
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Zawodnik o ID ' || v_zwyciezca || ' nie bierze udzialu w tej rozgrywce.');
  END IF;  
END Aktualizacja_Rozgrywki;

END PROCEDURY;
/* DO SPRAWDZENIA CZY DZIALA
PROCEDURA 1:

SET SERVEROUTPUT ON;
BEGIN 
PROCEDURY.DodawanieZawodnika('CYGERT','PLASKI', '2001/01/01',1 ,1, 1, 1, 'S');
END;

PROCEDURA 2:

SET SERVEROUTPUT ON;
BEGIN 
PROCEDURY.Aktualizacja_Rozgrywki(4,3);
END;

PROCEDURA 3:

SET SERVEROUTPUT ON;
BEGIN 
PROCEDURY.zmiana_klubu_zawodnika(1,3,'Lareks');
END;

PROCEDURA 4:

SET SERVEROUTPUT ON;
BEGIN 
PROCEDURY.Tworzenie_Nagrody(1000,1,'D',1, 'D');
END;

PROCEDURA 4 - PRZECIAZENIE:

SET SERVEROUTPUT ON;
BEGIN
PROCEDURY.tworzenie_nagrody(10000,1,'s',1,'',1);
END;

PROCEDURA 5:

SET SERVEROUTPUT ON;
BEGIN 
PROCEDURY.Aktualizacja_Rozgrywki(4,3);
END;
*/