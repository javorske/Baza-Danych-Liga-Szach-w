CREATE OR REPLACE PACKAGE PROCEDURY
IS
PROCEDURE DodawanieZawodnika(
v_imie in zawodnik.imie%type,
v_nazwisko in zawodnik.nazwisko%type,
v_data_urodzenia in zawodnik.data_urodzenia%type,
v_klub_id in zawodnik.klub_id%type,
v_tytul_szachowy_id in zawodnik.tytul_szachowy_id%type,
v_miejscowosc_id in zawodnik.miejscowosc_id%type,
v_narodowosc_id in zawodnik.narodowosc_id%type,
v_klub_nazwa klub.nazwa%type
);

PROCEDURE zmiana_klubu_zawodnika
(
  v_id_zawodnika in zawodnik.id%type, 
  v_id_klubu in zawodnik.klub_id%type,
  v_nazwa_klubu in klub.nazwa%type
);

PROCEDURE nowa_rozgrywka_w_turnieju
(
  v_ID_turnieju rozgrywka.turniej_ID%type,
  v_Data_rozgrywki rozgrywka.data%type,
  v_czy_zakonczona rozgrywka.czy_zakonczona%type,
  v_sedzia_id rozgrywka.sedzia_id%type,
  v_przedz_wiek_id rozgrywka.przedzial_wiekowy_id%type,
  v_sala_numer_sali rozgrywka.sala_numer_sali%type,
  v_tryb_rozgrywki_id rozgrywka.tryb_rozgrywki_id%type,
  v_turniej_id rozgrywka.turniej_id%type,
  v_zawodnik_nr1_id rozgrywka.zawodnik_nr1_id%type,
  v_zawodnik_nr2_id rozgrywka.zawodnik_nr2_id%type
);

PROCEDURE Tworzenie_Nagrody --Tworzenie samej nagrody
(
  v_nag_kwota nagroda.kwota%TYPE,
  
  v_nag_wal_id nagroda.waluta_id%TYPE, 
  v_wal_nazwa waluta.nazwa%TYPE,
  
  v_nag_rzecz_rzeczowa_id nagroda.rzeczowa_id%TYPE,
  v_rzecz_nazwa rzeczowa.nazwa%TYPE 
);

PROCEDURE Tworzenie_Nagrody --przeciazenie - prztpisanie nagrody do turnieju
(
  v_nag_kwota nagroda.kwota%TYPE,
  
  v_nag_wal_id nagroda.waluta_id%TYPE, 
  v_wal_nazwa waluta.nazwa%TYPE,
  
  v_nag_rzecz_rzeczowa_id nagroda.rzeczowa_id%TYPE,
  v_rzecz_nazwa rzeczowa.nazwa%TYPE,
  
  v_turniej_id turniej_nagroda.turniej_id%TYPE
);

PROCEDURE Aktualizacja_Rozgrywki
(
  v_id rozgrywka.id%TYPE,
  v_zwyciezca rozgrywka.zwyciezca%TYPE
);

END PROCEDURY;