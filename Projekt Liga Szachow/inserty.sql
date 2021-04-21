/*-------------1-------------*/
insert into panstwo (nazwa) values ('Polska');
insert into panstwo (nazwa) values ('Niemcy');
insert into panstwo (nazwa) values ('Portugalia');
insert into panstwo (nazwa) values ('Rosja');

/*-------------2-------------*/
insert into miejscowosc(nazwa, panstwo_id) values ('Bydgoszcz', 1);
insert into miejscowosc(nazwa, panstwo_id) values ('Warszawa', 1);
insert into miejscowosc(nazwa, panstwo_id) values ('Bremen', 2);
insert into miejscowosc(nazwa, panstwo_id) values ('Moskwa', 4);
insert into miejscowosc(nazwa, panstwo_id) values ('Lizbona', 3);
insert into miejscowosc(nazwa, panstwo_id) values ('Berlin', 2);

/*-------------3-------------*/
insert into Klub (nazwa) values ('Deutscher Schachbund');
insert into Klub (nazwa) values ('Chemik Bydgoszcz');
insert into Klub (nazwa) values ('Polonia Warszawa');
insert into Klub (nazwa) values ('Moskiewskie Szachy');

/*-------------4-------------*/
insert into tytul_szachowy(id,tytul) values (1,'Arcymistrz miêdzynarodowy');
insert into tytul_szachowy(id,tytul) values (2,'Mistrz miêdzynarodowy');
insert into tytul_szachowy(id,tytul) values (3,'Mistrz FIDE');
insert into tytul_szachowy(id,tytul) values (4,'Kandydat na mistrza FIDE');
insert into tytul_szachowy(id,tytul) values (5,'Arcymistrzyni miêdzynarodowa');
insert into tytul_szachowy(id,tytul) values (6,'Mistrzyni miêdzynarodowa');
insert into tytul_szachowy(id,tytul) values (7,'Mistrzyni FIDE');
insert into tytul_szachowy(id,tytul) values (8,'Kandydatka na mistrzyniê FIDE');

/*-------------5-------------*/
insert into narodowosc (nazwa) values ('polak');
insert into narodowosc (nazwa) values ('niemiec');
insert into narodowosc (nazwa) values ('portugalczyk');
insert into narodowosc (nazwa) values ('rosjanin');

/*-------------6-------------*/
insert into zawodnik(data_urodzenia, imie, nazwisko, Klub_ID, Tytul_szachowy_ID, Miejscowosc_ID, Narodowosc_ID) 
values (TO_DATE('1990/03/13'), 'Andrzej', 'Siarkowski' , 2, 2, 1, 1);
insert into zawodnik(data_urodzenia, imie, nazwisko, Klub_ID, Tytul_szachowy_ID, Miejscowosc_ID, Narodowosc_ID) 
values (TO_DATE('1983/04/22'), 'Marian', 'Klemecki', 3, 4, 2, 1);
insert into zawodnik(data_urodzenia, imie, nazwisko, Klub_ID, Tytul_szachowy_ID, Miejscowosc_ID, Narodowosc_ID) 
values (TO_DATE('2000/10/30'), 'Alex', 'Schmidt', 1, 3, 3, 2);
insert into zawodnik(data_urodzenia, imie, nazwisko, Klub_ID, Tytul_szachowy_ID, Miejscowosc_ID, Narodowosc_ID) 
values (TO_DATE('1966/08/22'), 'Pedro', 'Damiano', 1, 1, 5, 3);
insert into zawodnik(data_urodzenia, imie, nazwisko, Klub_ID, Tytul_szachowy_ID, Miejscowosc_ID, Narodowosc_ID) 
values (TO_DATE('1994/04/30'), 'Anna', 'Achszarumowa', 4, 6, 4, 4);
insert into zawodnik(data_urodzenia, imie, nazwisko, Klub_ID, Tytul_szachowy_ID, Miejscowosc_ID, Narodowosc_ID) 
values (TO_DATE('2003/01/01'), 'Ekaterina', 'Atalik', 4, 7 ,4, 4);

/*-------------7-------------*/
insert into sedzia (imie, nazwisko, miejscowosc_id, narodowosc_id) values ('Mateusz', 'Kosakowski', 1, 1);
insert into sedzia (imie, nazwisko, miejscowosc_id, narodowosc_id) values ('Józef', 'Kwiatkowski', 2, 1);
insert into sedzia (imie, nazwisko, miejscowosc_id, narodowosc_id) values ('Maria', 'Butinowa',4, 4);
insert into sedzia (imie, nazwisko, miejscowosc_id, narodowosc_id) values ('Jose', 'Saramago', 5, 3);
insert into sedzia (imie, nazwisko, miejscowosc_id, narodowosc_id) values ('Karl', 'Fromm', 3, 2);
insert into sedzia (imie, nazwisko, miejscowosc_id, narodowosc_id) values ('Kamil', 'Keks', 2,1);

/*-------------8-------------*/
insert into przedzial_wiekowy (rodzaj) values ('Senior');
insert into przedzial_wiekowy (rodzaj) values ('Junior');

/*-------------9-------------*/
insert into tryb_rozgrywki (nazwa) values ('Szachy blyskawiczne');
insert into tryb_rozgrywki (nazwa) values ('Szachy klasyczne');
insert into tryb_rozgrywki (nazwa) values ('Szachy szybkie');

/*-------------10-------------*/
insert into Kompleks (ulica, nazwa, numer_w_adresie, miejscowosc_ID) values ('Brakkämpe', 'Schule Grolland',16, 3);
insert into Kompleks (ulica, nazwa, numer_w_adresie, miejscowosc_ID) values ('Zieliñskiego', '4 Technikum Wroclawskie',22, 5);
insert into Kompleks (ulica, nazwa, numer_w_adresie, miejscowosc_ID) values ('Zelenyy Prospekt', 'Angliyskaya Mezhdunarodnaya Shkola',2, 4);
insert into Kompleks (ulica, nazwa, numer_w_adresie, miejscowosc_ID) values ('Romanowskiego','3 Liceum Ogólnoksztalc¹ce im. Romanowskiego', 4, 1);
insert into Kompleks (ulica, nazwa, numer_w_adresie, miejscowosc_ID) values ('Krasiñskiego', 'Uniwersytet Warszawski', 58, 1);
insert into Kompleks (ulica, nazwa, numer_w_adresie, miejscowosc_ID) values ('Breite Str.', 'Katharina-Heinroth-Grundschule', 23, 3);

/*-------------11-------------*/
insert into budynek (nazwa, kompleks_id) values ('Wydzial Matematyki', 5);
insert into budynek (nazwa, kompleks_id) values ('Budynek A', 4);
insert into budynek (nazwa, kompleks_id) values ('Casa C', 2);
insert into budynek (nazwa, kompleks_id) values ('Gmach b', 5);
insert into budynek (nazwa, kompleks_id) values ('Stroitelstvo 5', 3);
insert into budynek (nazwa, kompleks_id) values ('Gebaude C', 6);

/*-------------12-------------*/
insert into sala (budynek_id,litera_sali,numer_sali) values (1, 'A', 3);
insert into sala (budynek_id,litera_sali,numer_sali) values (2, 'C',4);
insert into sala (budynek_id,litera_sali,numer_sali) values (2, null, 1);
insert into sala (budynek_id,litera_sali,numer_sali) values (3, 'G', 2);
insert into sala (budynek_id,litera_sali,numer_sali) values (5, null,5); 
insert into sala (budynek_id,litera_sali,numer_sali) values (5, null, 6);

/*-------------13-------------*/
insert into Sponsor (nazwa_sponsora) values ('Weldon');
insert into Sponsor (nazwa_sponsora) values ('Castrol');
insert into Sponsor (nazwa_sponsora) values ('Michelin');
insert into sponsor (nazwa_sponsora) values ('Velvet');
insert into sponsor (nazwa_sponsora) values ('Volkswagen');
insert into sponsor (nazwa_sponsora) values ('Asus');
insert into sponsor (nazwa_sponsora) values ('Drutex');

/*-------------14-------------*/
insert into Rzeczowa (nazwa) values ('Zloty medal');
insert into Rzeczowa (nazwa) values ('Srebrny medal');
insert into Rzeczowa (nazwa) values ('Br¹zowy medal');

/*-------------15-------------*/
insert into Waluta (nazwa) values ('euro');
insert into Waluta (nazwa) values ('rubli');
insert into Waluta (nazwa) values ('koron');
insert into Waluta (nazwa) values ('zlotych');

/*-------------16-------------*/
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (10000, 1, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (5000, 2, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (2500, 3, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (500, null, 4);

insert into nagroda (kwota, rzeczowa_id, waluta_id) values (30000, 1, 1);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (20000, 2, 1);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (10000, 3, 1);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (5000, null, 1);


insert into nagroda (kwota, rzeczowa_id, waluta_id) values (50000, 1, 2);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (35000, 2, 2);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (20000, 3, 2);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (10000, null, 2);

insert into nagroda (kwota, rzeczowa_id, waluta_id) values (10000, 1, 3);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (5000, 2, 3);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (2500, 3, 3);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (500, null, 3);

insert into nagroda (kwota, rzeczowa_id, waluta_id) values (2000, 1, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (1000, 2, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (500, 3, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (100, null, 4);

insert into nagroda (kwota, rzeczowa_id, waluta_id) values (100000, 1, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (50000, 2, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (25000, 3, 4);
insert into nagroda (kwota, rzeczowa_id, waluta_id) values (10000, null, 4);

/*-------------17-------------*/

insert into Turniej (nazwa, rozpoczecie, zakonczenie) 
values ('Ogólnopolski turniej szachowy', TO_DATE('2019/01/01'), null);
insert into Turniej (nazwa, rozpoczecie, zakonczenie) 
values ('Rosyjski turniej szachowy', TO_DATE('2019/01/28'), TO_DATE('2019/04/13'));
insert into Turniej (nazwa, rozpoczecie, zakonczenie) 
values ('ABCChess', TO_DATE('2019/06/01'), null);
insert into Turniej (nazwa, rozpoczecie, zakonczenie) 
values ('Œl¹ski turniej szachowy', TO_DATE('2019/05/11'), null);
insert into Turniej (nazwa, rozpoczecie, zakonczenie) 
values ('38. Niemiecki Turniej Szachowy', TO_DATE('2018/01/11'), TO_DATE('2018/03/03'));
insert into Turniej (nazwa, rozpoczecie, zakonczenie) 
values ('Europejski turniej szachowy', TO_DATE('2018/05/03'), TO_DATE('2018/07/03'));

/*-------------18-------------*/

insert into turniej_nagroda (turniej_id, nagroda_id) values (1, 1);
insert into turniej_nagroda (turniej_id, nagroda_id) values (1, 2);
insert into turniej_nagroda (turniej_id, nagroda_id) values (1, 3);
insert into turniej_nagroda (turniej_id, nagroda_id) values (1, 4);

insert into turniej_nagroda (turniej_id, nagroda_id) values (2, 9);
insert into turniej_nagroda (turniej_id, nagroda_id) values (2, 10);
insert into turniej_nagroda (turniej_id, nagroda_id) values (2, 11);
insert into turniej_nagroda (turniej_id, nagroda_id) values (2, 12);

insert into turniej_nagroda (turniej_id, nagroda_id) values (3, 9);
insert into turniej_nagroda (turniej_id, nagroda_id) values (3, 10);
insert into turniej_nagroda (turniej_id, nagroda_id) values (3, 11);
insert into turniej_nagroda (turniej_id, nagroda_id) values (3, 12);

insert into turniej_nagroda (turniej_id, nagroda_id) values (4, 17);
insert into turniej_nagroda (turniej_id, nagroda_id) values (4, 18);
insert into turniej_nagroda (turniej_id, nagroda_id) values (4, 19);
insert into turniej_nagroda (turniej_id, nagroda_id) values (4, 20);

insert into turniej_nagroda (turniej_id, nagroda_id) values (5, 5);
insert into turniej_nagroda (turniej_id, nagroda_id) values (5, 6);
insert into turniej_nagroda (turniej_id, nagroda_id) values (5, 7);
insert into turniej_nagroda (turniej_id, nagroda_id) values (5, 8);

insert into turniej_nagroda (turniej_id, nagroda_id) values (6, 5);
insert into turniej_nagroda (turniej_id, nagroda_id) values (6, 6);
insert into turniej_nagroda (turniej_id, nagroda_id) values (6, 7);
insert into turniej_nagroda (turniej_id, nagroda_id) values (6, 8);

/*-------------19-------------*/
insert into Rozgrywka (Data, Czy_zakonczona, sedzia_id, przedzial_wiekowy_id, 
sala_numer_sali, tryb_rozgrywki_id, Turniej_id, zawodnik_nr1_id, zawodnik_nr2_id, zwyciezca)
values (TO_DATE('2019/01/02'), 't', 1, 2, 3, 2, 1, 1, 5, 1);
insert into Rozgrywka (Data, Czy_zakonczona, sedzia_id, przedzial_wiekowy_id, 
sala_numer_sali, tryb_rozgrywki_id, Turniej_id, zawodnik_nr1_id, zawodnik_nr2_id, zwyciezca)
values (TO_DATE('2019/01/03'), 't', 2, 2, 3, 2, 1, 1, 3, 3);
insert into Rozgrywka (Data, Czy_zakonczona, sedzia_id, przedzial_wiekowy_id, 
sala_numer_sali, tryb_rozgrywki_id, Turniej_id, zawodnik_nr1_id, zawodnik_nr2_id, zwyciezca)
values (TO_DATE('2019/01/04'), 't', 1, 2, 3, 2, 1, 3, 6, 6);
insert into Rozgrywka (Data, Czy_zakonczona, sedzia_id, przedzial_wiekowy_id, 
sala_numer_sali, tryb_rozgrywki_id, Turniej_id, zawodnik_nr1_id, zawodnik_nr2_id, zwyciezca)
values (TO_DATE('2019/01/05'), 't', 3, 2, 3, 2, 1, 6, 1, 6);
insert into Rozgrywka (Data, Czy_zakonczona, sedzia_id, przedzial_wiekowy_id, 
sala_numer_sali, tryb_rozgrywki_id, Turniej_id, zawodnik_nr1_id, zawodnik_nr2_id, zwyciezca)
values (TO_DATE('2019/05/14'), 't', 6, 1, 4, 1, 5, 4, 2, 4);
insert into Rozgrywka (Data, Czy_zakonczona, sedzia_id, przedzial_wiekowy_id, 
sala_numer_sali, tryb_rozgrywki_id, Turniej_id, zawodnik_nr1_id, zawodnik_nr2_id, zwyciezca)
values (TO_DATE('2019/05/15'), 'f', 5, 1, 1, 1, 5, 4, 2, null);

/*-------------20-------------*/
insert into turniej_kompleks (turniej_id, kompleks_id) values (1,5);
insert into turniej_kompleks (turniej_id, kompleks_id) values (2,3);
insert into turniej_kompleks (turniej_id, kompleks_id) values (6,6);
insert into turniej_kompleks (turniej_id, kompleks_id) values (4,2);
insert into turniej_kompleks (turniej_id, kompleks_id) values (5,1);
insert into turniej_kompleks (turniej_id, kompleks_id) values (3,3);

/*-------------21-------------*/
insert into sedzia_turniej (sedzia_id, turniej_id) values (1,1);
insert into sedzia_turniej (sedzia_id, turniej_id) values (2,1);
insert into sedzia_turniej (sedzia_id, turniej_id) values (3,1);
insert into sedzia_turniej (sedzia_id, turniej_id) values (6,5);
insert into sedzia_turniej (sedzia_id, turniej_id) values (5,5);

/*-------------22-------------*/
insert into turniej_zawodnik (turniej_id, zawodnik_id) values (1,1);
insert into turniej_zawodnik (turniej_id, zawodnik_id) values (1,6);
insert into turniej_zawodnik (turniej_id, zawodnik_id) values (1,5);
insert into turniej_zawodnik (turniej_id, zawodnik_id) values (1,3);
insert into turniej_zawodnik (turniej_id, zawodnik_id) values (1,4);
insert into turniej_zawodnik (turniej_id, zawodnik_id) values (1,2);

/*-------------23-------------*/
insert into turniej_sponsor (turniej_id, sponsor_id) values (1,2);
insert into turniej_sponsor (turniej_id, sponsor_id) values (1,3);
insert into turniej_sponsor (turniej_id, sponsor_id) values (1,1);
insert into turniej_sponsor (turniej_id, sponsor_id) values (3,4);
insert into turniej_sponsor (turniej_id, sponsor_id) values (4,5);
insert into turniej_sponsor (turniej_id, sponsor_id) values (5,6);
insert into turniej_sponsor (turniej_id, sponsor_id) values (6,7);

/*-------------24-------------*/
insert into trener (imie, nazwisko, miejscowosc_id, klub_id, narodowosc_id) 
values ('Adam', 'Krajewski', 1, 2, 3);
insert into trener (imie, nazwisko, miejscowosc_id, klub_id, narodowosc_id) 
values ('Adolf', 'Krohl', 3, 1, 2);
insert into trener (imie, nazwisko, miejscowosc_id, klub_id, narodowosc_id) 
values ('Marianna', 'Steckova', 4, 4, 4);
insert into trener (imie, nazwisko, miejscowosc_id, klub_id, narodowosc_id) 
values ('Siergiej', 'Kudinov', 4, 2, 4);
insert into trener (imie, nazwisko, miejscowosc_id, klub_id, narodowosc_id) 
values ('John', 'Smith', 6, 1, 2);
insert into trener (imie, nazwisko, miejscowosc_id, klub_id, narodowosc_id) 
values ('Rodriguez', 'Santiango', 5, 1, 3);

