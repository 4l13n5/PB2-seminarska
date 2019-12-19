
insert into posta (poštna_št,mesto) values (1000, 'ljubljana');

insert all into posta 
(poštna_št,mesto) 
select 3000,'Celje' from dual union all
select 5000,'Nova Gorica' from dual;



insert into job_description (naziv,placa)
select 'vodja',2000 from dual union all
select 'prodajalec', 1000 from dual union all
select 'hisnik',800 from dual;



insert into vrsta_artikla (id_kat,kategorija,davek)
select 1,'alkohol', 22 from dual union all
select 2,'elektronika',15 from dual;
insert into vrsta_artikla (id_kat,kategorija,davek) values(3,'hrana',8);



insert into akcija (id_akcije,datum_od,datum_do,popust)
select 2,(TO_DATE('2018/07/03 00:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2018/08/03 00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 10 from dual union all
select 3,(TO_DATE('2018/11/5 00:00:00', 'yyyy/mm/dd hh24:mi:ss')),(TO_DATE('2018/12/07 00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 50 from dual;



insert into artikel (id_artikla,id_kat,ime_artikla,cena_brez_ddv)
select 1, 1, 'union', 2 from dual union all
select 2, 1, 'lasko', 2 from dual union all
select 3, 2, 'kruh', 1 from dual union all
select 4, 2, 'piscanec',3 from dual union all
select 5, 3, 'iPhone7',500 from dual union all
select 6, 3, 'Asus k555',800 from dual;



select * from artikel_je_v_akciji;
insert into artikel_je_v_akciji (id_akcije,id_artikla)
select 2,5 from dual union all
select 3,4 from dual;



insert into poslovalnica (id_poslovalnice,poštna_st,tel_st,ulica,hisna_st)
select 1,1000,040152345,'Èopova',15 from dual union all
select 2,1000,031258369,'Slovenska',22 from dual union all
select 3,3000,041147789,'Celska Cesta',1 from dual union all
select 4,5000,051789456,'Partizanska',23 from dual;



insert into zaposleni (ime, priimek,id_zaposlenega,naziv,id_poslovalnice)
select 'Lojze','Petrle',1,'hisnik',1 from dual union all
select 'Janez','Jansa',2,'prodajalec',1 from dual union all
select 'Borut','Pahor',3,'vodja',1 from dual union all
select 'Katarina','Kresal',4,'hisnik',2 from dual union all
select 'Alenka','Bratovscek',5,'prodajalec',2 from dual union all
select 'Zmago','Jelincic',6,'vodja',2 from dual union all
select 'Gaspar Gaspar','Misic',7,'hisnik',3 from dual union all
select 'Zoran','Jankovic',8,'prodajalec',3 from dual union all
select 'Danilo','Turk',9,'vodja',3 from dual union all
select 'Matej','Arcon',10,'hisnik',4 from dual union all
select 'Jadranka','Kosor',11,'prodajalec',4 from dual union all
select 'Donald','Trump',12,'vodja',4 from dual;



insert into racun (id_raè,id_zaposlenega,id_poslovalnice,datum)
select 1, 2, 1, TO_DATE('2018/01/04 16:32:00', 'yyyy/mm/dd hh24:mi:ss') from dual union all
select 2, 2, 1, TO_DATE('2018/01/04 08:23:14', 'yyyy/mm/dd hh24:mi:ss') from dual union all
select 3, 5, 2, TO_DATE('2018/01/04 12:00:00', 'yyyy/mm/dd hh24:mi:ss') from dual union all
select 4, 5, 2, TO_DATE('2018/01/04 11:48:22', 'yyyy/mm/dd hh24:mi:ss') from dual union all
select 5, 8, 3, TO_DATE('2018/01/04 09:35:44', 'yyyy/mm/dd hh24:mi:ss') from dual union all
select 6, 8, 3, TO_DATE('2018/01/04 14:58:45', 'yyyy/mm/dd hh24:mi:ss') from dual union all
select 7, 11, 4, TO_DATE('2018/01/04 10:12:54', 'yyyy/mm/dd hh24:mi:ss') from dual union all
select 8, 11, 4, TO_DATE('2018/01/04 13:15:24', 'yyyy/mm/dd hh24:mi:ss') from dual;


insert into zaloge (id_zaloge,id_artikla,id_poslovalnice,kolièina)
select 1, 1, 1, 100 from dual union all
select 2, 2, 1, 200 from dual union all
select 3, 3, 2, 50 from dual union all
select 4, 4, 2, 200 from dual union all
select 5, 1, 2, 120 from dual union all
select 6, 5, 3, 75 from dual union all
select 7, 6, 3, 40 from dual union all
select 8, 1, 4, 100 from dual union all
select 9, 2, 4, 100 from dual union all
select 10, 3, 4, 75 from dual union all
select 11, 4, 4, 165 from dual;

insert into postavka (id_zaloge,id_raè,ammount)
select 1,1,20 from dual union all
select 2,1,6 from dual union all
select 2,2,1 from dual union all
select 3,3,2 from dual union all
select 4,3,1 from dual union all
select 5,3,6 from dual union all
select 4,4,1 from dual union all
select 7,5,3 from dual union all
select 6,6,3 from dual union all
select 8,7,10 from dual union all
select 9,7,10 from dual union all
select 8,8,2 from dual union all
select 11,8,1 from dual;





