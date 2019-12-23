select poslovalnica.id_poslovalnice, zaloge.id_zaloge,artikel.ime_artikla,zaloge.kolièina from poslovalnica 
  join zaloge on poslovalnica.id_poslovalnice=zaloge.id_poslovalnice
  join artikel on artikel.id_artikla=zaloge.id_artikla;
  
select akcija.id_akcije, artikel.id_artikla, artikel.ime_artikla from akcija
  join artikel_je_v_akciji on akcija.id_akcije=artikel_je_v_akciji.id_akcije
  join artikel on artikel_je_v_akciji.id_artikla=artikel.id_artikla
  where TO_DATE('2018/07/15 00:00:00', 'yyyy/mm/dd hh24:mi:ss') between akcija.datum_od and akcija.datum_do;
  

select unique racun.id_raè, vrsta_artikla.kategorija from racun
  join postavka on postavka.id_raè=racun.id_raè
  join zaloge on zaloge.id_zaloge=postavka.id_zaloge
  join artikel on artikel.id_artikla=zaloge.id_artikla
  join vrsta_artikla on vrsta_artikla.id_kat=artikel.id_kat
  where racun.id_raè=3;
  
select posta.poštna_št, posta.mesto, poslovalnica.ulica || ' ' || poslovalnica.hisna_st as naslov, poslovalnica.tel_st from poslovalnica
  join posta on poslovalnica.poštna_st=posta.poštna_št
  where poslovalnica.id_poslovalnice = 2;

select * from zaposleni where naziv = 'prodajalec';

select poslovalnica.id_poslovalnice from poslovalnica
  join zaloge on poslovalnica.id_poslovalnice= zaloge.id_poslovalnice
  join artikel on artikel.id_artikla=zaloge.id_artikla
  join artikel_je_v_akciji on artikel_je_v_akciji.id_artikla=artikel.id_artikla
  join akcija on akcija.id_akcije=artikel_je_v_akciji.id_akcije
  where TO_DATE('2018/11/15 00:00:00', 'yyyy/mm/dd hh24:mi:ss') between akcija.datum_od and akcija.datum_do;
  
select unique artikel.id_artikla, artikel.ime_artikla from racun
  join postavka on postavka.id_raè=racun.id_raè
  join zaloge on zaloge.id_zaloge=postavka.id_zaloge
  join artikel on artikel.id_artikla=zaloge.id_artikla
  where racun.id_raè=3;
  
select zaposleni.id_zaposlenega,job_description.placa from zaposleni
  join job_description on zaposleni.naziv=job_description.naziv;
  

select racun.id_raè, artikel.id_artikla, artikel.ime_artikla, postavka.ammount from racun
  join postavka on postavka.id_raè=racun.id_raè
  join zaloge on zaloge.id_zaloge=postavka.id_zaloge
  join artikel on artikel.id_artikla=zaloge.id_artikla
  where artikel.id_artikla=2;
  
select zaposleni.id_zaposlenega,zaposleni.ime, zaposleni.priimek, zaposleni.naziv from zaposleni
  join racun on racun.id_zaposlenega=zaposleni.id_zaposlenega
  where zaposleni.id_poslovalnice=1;
