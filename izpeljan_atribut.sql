alter table racun add skupna_cena number;
update racun set skupna_cena = (select col from
(select id_raè, sum(full_price) as col from
(select id_raè, (case 
              when popust is not null and datum between datum_od and datum_do then  (popust/100)*ammount*(cena_brez_ddv+(cena_brez_ddv*(davek/100))) 
              else  ammount*(cena_brez_ddv+(cena_brez_ddv*(davek/100))) end) as full_price from akcija 
 join artikel_je_v_akciji on akcija.id_akcije=artikel_je_v_akciji.id_akcije
 right outer join artikel on artikel.id_artikla=artikel_je_v_akciji.id_artikla
 join vrsta_artikla on vrsta_artikla.id_kat=artikel.id_kat
 join zaloge on zaloge.id_artikla=artikel.id_artikla
 join postavka on postavka.id_zaloge=zaloge.id_zaloge
 join racun on racun.id_raè=postavka.id_raè) group by id_raè order by id_raè asc) tmp
 where racun.id_raè=tmp.id_raè);
