CREATE OR REPLACE PROCEDURE Aktualizacja_Rozgrywki
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
END;

/*EXECUTE Aktualizacja_Rozgrywki(3, 99)*/