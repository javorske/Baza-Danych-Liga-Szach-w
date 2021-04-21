/* procedura dodaje nowa nagrode z uwzglednieniem opcjonalnosci czesci rzeczowej.
Ponadto dodaje w razie potrzeby nowa nagrode rzeczowa i walute*/
CREATE OR REPLACE PROCEDURE Tworzenie_Nagrody
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
END;
/* execute Tworzenie_Nagrody(1000, 23, '343', 2, 'p32l');*/