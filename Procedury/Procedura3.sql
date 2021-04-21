/*Procedura tworzaca nowa rozgrywke, jednoczesnie sprawdzajaca, czy zawodnicy spelniaja kryteria wiekowe*/
set serveroutput on;
CREATE OR REPLACE PROCEDURE nowa_rozgrywka_w_turnieju
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
END;

/*
execute nowa_rozgrywka_w_turnieju(1,'2000/01/01','n',1,2,1,1,1,3,3);*/