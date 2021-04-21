select zawodnik.id,zawodnik.imie,nazwisko, zawodnik.data_urodzenia,klub.nazwa,
       count(zwyciezca) as ilosc_zwyciestw from zawodnik
       
    join klub on zawodnik.klub_id = klub.id 
    join rozgrywka on zawodnik.id = rozgrywka.zwyciezca 
  where zawodnik.data_urodzenia = 
  (
      select max(z.data_urodzenia) from zawodnik z join klub k on k.id = z.klub_id
      where k.nazwa = 'Chemik Bydgoszcz'
  )
group by zawodnik.id,nazwisko, zawodnik.data_urodzenia,klub.nazwa,rozgrywka.zwyciezca,zawodnik.imie;