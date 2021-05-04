create table AKCESORIA
(
    ID_AKCESORIUM           NUMBER            default "INF141282"."ISEQ$$_198640".nextval generated by default on null as identity
        constraint AKCESORIA_PK
        primary key,
    DATA_ZAKUPU             DATE              default TO_DATE(TO_CHAR(CURRENT_DATE, 'dd/mm/yyyy'), 'dd/mm/yyyy') not null,
    RODZAJ_AKCESORIUM_NAZWA VARCHAR2(20 char)                                                                    not null
        constraint AKCESORIA_RODZAJE_AKCESORIUM_FK
            references RODZAJE_AKCESORIUM,
    STATUS                  VARCHAR2(15 char) default 'wolne'                                                    not null
        constraint CHK_STATUS_AKCESORIUM
            check (status IN ('wypożyczone', 'wolne', 'uszkodzone', 'brak'))
)
/

create index AKCESORIA_STATUS_NAZWA
    on AKCESORIA (STATUS, RODZAJ_AKCESORIUM_NAZWA)
/
