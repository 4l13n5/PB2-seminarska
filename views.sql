create or replace view ponudba_poslovalnic as 
  select poslovalnica.id_poslovalnice, (poslovalnica.poštna_st  || ' ' || posta.mesto  || ', ' || poslovalnica.ulica  || ' ' || poslovalnica.hisna_st) as naslov, vrsta_artikla.kategorija,artikel.ime_artikla,zaloge.kolièina from poslovalnica 
    join posta on posta.poštna_št=poslovalnica.poštna_st
    join zaloge on zaloge.id_poslovalnice=poslovalnica.id_poslovalnice
    join artikel on artikel.id_artikla=zaloge.id_artikla
    join vrsta_artikla on vrsta_artikla.id_kat=artikel.id_kat
    order by id_poslovalnice; 
  
create or replace view prodaje as 
  select racun.id_raè, racun.datum,racun.skupna_cena,racun.id_zaposlenega, (zaposleni.ime || ' ' || zaposleni.priimek) as zaposleni, poslovalnica.id_poslovalnice, (posta.poštna_št || ' ' || posta.mesto || ' ' || poslovalnica.ulica || ' ' || poslovalnica.hisna_st) as naslov from zaposleni
    join poslovalnica on poslovalnica.id_poslovalnice=zaposleni.id_poslovalnice
    join posta on poslovalnica.poštna_st=posta.poštna_št
    join racun on racun.id_zaposlenega=zaposleni.id_zaposlenega; 
