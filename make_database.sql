/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     19. 12. 2019 13:14:23                        */
/*==============================================================*/


alter table Artikel
   drop constraint FK_ARTIKEL_ARTIKEL_S_VRSTA_AR;

alter table Poslovalnica
   drop constraint FK_POSLOVAL_POSLOVALN_POSTA;

alter table Postavka
   drop constraint FK_POSTAVKA_PO_R_RACUN;

alter table Postavka
   drop constraint FK_POSTAVKA_Z_PO_ZALOGE;

alter table Racun
   drop constraint FK_RACUN_POSLOVALN_POSLOVAL;

alter table Racun
   drop constraint FK_RACUN_ZAPOSLENI_ZAPOSLEN;

alter table Zaloge
   drop constraint FK_ZALOGE_V_ZALOGI__ARTIKEL;

alter table Zaloge
   drop constraint FK_ZALOGE_ZALOGA_PR_POSLOVAL;

alter table Zaposleni
   drop constraint FK_ZAPOSLEN_POSLOVALN_POSLOVAL;

alter table Zaposleni
   drop constraint FK_ZAPOSLEN_ZAPOSLENI_JOB_DESC;

alter table artikel_je_v_akciji
   drop constraint FK_ARTIKEL__ARTIKEL_J_AKCIJA;

alter table artikel_je_v_akciji
   drop constraint FK_ARTIKEL__ARTIKEL_J_ARTIKEL;

drop index artikel_spada_v_kategorijo_FK;

drop table Artikel cascade constraints;

drop table Job_description cascade constraints;

drop index poslovalnica_je_v_mestu_FK;

drop table Poslovalnica cascade constraints;

drop table Posta cascade constraints;

drop index Po_R_FK;

drop index Z_Po_FK;

drop table Postavka cascade constraints;

drop index zaposleni_izda_racun_FK;

drop index poslovalnica_hrani_racune_FK;

drop table Racun cascade constraints;

drop table Vrsta_artikla cascade constraints;

drop index zaloga_pripada_poslovalnici_FK;

drop index v_zalogi_je_artikel_FK;

drop table Zaloge cascade constraints;

drop index zaposleni_na_poziciji_FK;

drop index poslovalnica_ma_zaposlene_FK;

drop table Zaposleni cascade constraints;

drop table akcija cascade constraints;

drop index artikel_je_v_akciji2_FK;

drop index artikel_je_v_akciji_FK;

drop table artikel_je_v_akciji cascade constraints;

/*==============================================================*/
/* Table: Artikel                                               */
/*==============================================================*/
create table Artikel  (
   ID_ARTIKLA           NUMBER                          not null,
   ID_KAT               NUMBER                          not null,
   IME_ARTIKLA          VARCHAR2(1024),
   CENA_brez_DDV        NUMBER(8,2)                     not null,
   constraint PK_ARTIKEL primary key (ID_ARTIKLA)
);

/*==============================================================*/
/* Index: artikel_spada_v_kategorijo_FK                         */
/*==============================================================*/
create index artikel_spada_v_kategorijo_FK on Artikel (
   ID_KAT ASC
);

/*==============================================================*/
/* Table: Job_description                                       */
/*==============================================================*/
create table Job_description  (
   Naziv                VARCHAR2(1024)                  not null,
   Placa                NUMBER(8,2)                     not null,
   constraint PK_JOB_DESCRIPTION primary key (Naziv)
);

/*==============================================================*/
/* Table: Poslovalnica                                          */
/*==============================================================*/
create table Poslovalnica  (
   ID_POSLOVALNICE      NUMBER                          not null,
   POŠTNA_ST            NUMBER                          not null,
   TEL_ST               NUMBER,
   ULICA                VARCHAR2(1024)                  not null,
   Hisna_St             NUMBER                          not null,
   constraint PK_POSLOVALNICA primary key (ID_POSLOVALNICE)
);

/*==============================================================*/
/* Index: poslovalnica_je_v_mestu_FK                            */
/*==============================================================*/
create index poslovalnica_je_v_mestu_FK on Poslovalnica (
   POŠTNA_ST ASC
);

/*==============================================================*/
/* Table: Posta                                                 */
/*==============================================================*/
create table Posta  (
   POŠTNA_ŠT            NUMBER                          not null,
   MESTO                VARCHAR2(1024),
   constraint PK_POSTA primary key (POŠTNA_ŠT)
);

/*==============================================================*/
/* Table: Postavka                                              */
/*==============================================================*/
create table Postavka  (
   ID_ZALOGE            NUMBER                          not null,
   ID_RAÈ               NUMBER                          not null,
   ammount              NUMBER,
   constraint PK_POSTAVKA primary key (ID_ZALOGE, ID_RAÈ)
);

/*==============================================================*/
/* Index: Z_Po_FK                                               */
/*==============================================================*/
create index Z_Po_FK on Postavka (
   ID_ZALOGE ASC
);

/*==============================================================*/
/* Index: Po_R_FK                                               */
/*==============================================================*/
create index Po_R_FK on Postavka (
   ID_RAÈ ASC
);

/*==============================================================*/
/* Table: Racun                                                 */
/*==============================================================*/
create table Racun  (
   ID_RAÈ               NUMBER                          not null,
   ID_Zaposlenega       NUMBER                          not null,
   ID_POSLOVALNICE      NUMBER                          not null,
   SKUPNA_CENA          NUMBER(8,2)                     not null,
   DATUM                DATE                            not null,
   constraint PK_RACUN primary key (ID_RAÈ)
);

/*==============================================================*/
/* Index: poslovalnica_hrani_racune_FK                          */
/*==============================================================*/
create index poslovalnica_hrani_racune_FK on Racun (
   ID_POSLOVALNICE ASC
);

/*==============================================================*/
/* Index: zaposleni_izda_racun_FK                               */
/*==============================================================*/
create index zaposleni_izda_racun_FK on Racun (
   ID_Zaposlenega ASC
);

/*==============================================================*/
/* Table: Vrsta_artikla                                         */
/*==============================================================*/
create table Vrsta_artikla  (
   ID_KAT               NUMBER                          not null,
   KATEGORIJA           VARCHAR2(1024)                  not null,
   DAVEK                NUMBER                          not null,
   constraint PK_VRSTA_ARTIKLA primary key (ID_KAT)
);

/*==============================================================*/
/* Table: Zaloge                                                */
/*==============================================================*/
create table Zaloge  (
   ID_ZALOGE            NUMBER                          not null,
   ID_ARTIKLA           NUMBER                          not null,
   ID_POSLOVALNICE      NUMBER                          not null,
   KOLIÈINA             NUMBER                          not null,
   constraint PK_ZALOGE primary key (ID_ZALOGE)
);

/*==============================================================*/
/* Index: v_zalogi_je_artikel_FK                                */
/*==============================================================*/
create index v_zalogi_je_artikel_FK on Zaloge (
   ID_ARTIKLA ASC
);

/*==============================================================*/
/* Index: zaloga_pripada_poslovalnici_FK                        */
/*==============================================================*/
create index zaloga_pripada_poslovalnici_FK on Zaloge (
   ID_POSLOVALNICE ASC
);

/*==============================================================*/
/* Table: Zaposleni                                             */
/*==============================================================*/
create table Zaposleni  (
   IME                  VARCHAR2(1024),
   PRIIMEK              VARCHAR2(1024),
   ID_Zaposlenega       NUMBER                          not null,
   Naziv                VARCHAR2(1024)                  not null,
   ID_POSLOVALNICE      NUMBER                          not null,
   constraint PK_ZAPOSLENI primary key (ID_Zaposlenega)
);

/*==============================================================*/
/* Index: poslovalnica_ma_zaposlene_FK                          */
/*==============================================================*/
create index poslovalnica_ma_zaposlene_FK on Zaposleni (
   ID_POSLOVALNICE ASC
);

/*==============================================================*/
/* Index: zaposleni_na_poziciji_FK                              */
/*==============================================================*/
create index zaposleni_na_poziciji_FK on Zaposleni (
   Naziv ASC
);

/*==============================================================*/
/* Table: akcija                                                */
/*==============================================================*/
create table akcija  (
   ID_AKCIJE            NUMBER                          not null,
   DATUM_OD             DATE                            not null,
   DATUM_DO             DATE                            not null,
   POPUST               NUMBER                          not null,
   constraint PK_AKCIJA primary key (ID_AKCIJE)
);

/*==============================================================*/
/* Table: artikel_je_v_akciji                                   */
/*==============================================================*/
create table artikel_je_v_akciji  (
   ID_AKCIJE            NUMBER                          not null,
   ID_ARTIKLA           NUMBER                          not null,
   constraint PK_ARTIKEL_JE_V_AKCIJI primary key (ID_AKCIJE, ID_ARTIKLA)
);

/*==============================================================*/
/* Index: artikel_je_v_akciji_FK                                */
/*==============================================================*/
create index artikel_je_v_akciji_FK on artikel_je_v_akciji (
   ID_AKCIJE ASC
);

/*==============================================================*/
/* Index: artikel_je_v_akciji2_FK                               */
/*==============================================================*/
create index artikel_je_v_akciji2_FK on artikel_je_v_akciji (
   ID_ARTIKLA ASC
);

alter table Artikel
   add constraint FK_ARTIKEL_ARTIKEL_S_VRSTA_AR foreign key (ID_KAT)
      references Vrsta_artikla (ID_KAT)
      on delete cascade;

alter table Poslovalnica
   add constraint FK_POSLOVAL_POSLOVALN_POSTA foreign key (POŠTNA_ST)
      references Posta (POŠTNA_ŠT);

alter table Postavka
   add constraint FK_POSTAVKA_PO_R_RACUN foreign key (ID_RAÈ)
      references Racun (ID_RAÈ);

alter table Postavka
   add constraint FK_POSTAVKA_Z_PO_ZALOGE foreign key (ID_ZALOGE)
      references Zaloge (ID_ZALOGE)
      on delete cascade;

alter table Racun
   add constraint FK_RACUN_POSLOVALN_POSLOVAL foreign key (ID_POSLOVALNICE)
      references Poslovalnica (ID_POSLOVALNICE);

alter table Racun
   add constraint FK_RACUN_ZAPOSLENI_ZAPOSLEN foreign key (ID_Zaposlenega)
      references Zaposleni (ID_Zaposlenega);
	  
ALTER TABLE racun SET UNUSED (skupna_cena);
ALTER TABLE racun DROP UNUSED COLUMNS;

alter table Zaloge
   add constraint FK_ZALOGE_V_ZALOGI__ARTIKEL foreign key (ID_ARTIKLA)
      references Artikel (ID_ARTIKLA)
      on delete cascade;

alter table Zaloge
   add constraint FK_ZALOGE_ZALOGA_PR_POSLOVAL foreign key (ID_POSLOVALNICE)
      references Poslovalnica (ID_POSLOVALNICE)
      on delete cascade;

alter table Zaposleni
   add constraint FK_ZAPOSLEN_POSLOVALN_POSLOVAL foreign key (ID_POSLOVALNICE)
      references Poslovalnica (ID_POSLOVALNICE)
      on delete cascade;

alter table Zaposleni
   add constraint FK_ZAPOSLEN_ZAPOSLENI_JOB_DESC foreign key (Naziv)
      references Job_description (Naziv)
      on delete cascade;

alter table artikel_je_v_akciji
   add constraint FK_ARTIKEL__ARTIKEL_J_AKCIJA foreign key (ID_AKCIJE)
      references akcija (ID_AKCIJE);

alter table artikel_je_v_akciji
   add constraint FK_ARTIKEL__ARTIKEL_J_ARTIKEL foreign key (ID_ARTIKLA)
      references Artikel (ID_ARTIKLA);

