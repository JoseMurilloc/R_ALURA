create table Processo (
    PRNCODG serial primary key
);

create table Despache
(
    DENCGFU integer not null,
    DENCGPR integer not null,
    primary key (DENCGFU, DENCGPR),
    foreign key (DENCGPR) references Processo (PRNCODG),
    foreign key (DENCGFU) references Funcionario (FUNCODG)
);


create table Curso (
    CUNCODG serial primary key,
    CUANOME varchar(255) unique
);

create table TipoRequerimento (
    TRNCODG serial primary key,
    TRANOME varchar(255) unique
);

create table CustoRequerimento (
    CRNCODG serial primary key,
    CRNVALR float
);



create table Situacao (
    STNCODG integer primary key,
    STANOME varchar(255) unique
);

create table Requerimento (
    RENCODG serial primary key,
    RENCGST integer not null,
    RENCGTR integer not null,
    RENCGPR integer not null,
    REAOBSE text null,
    REAARGU text null,
    REDCRET timestamp default now(),

    foreign key (RENCGTR) references TipoRequerimento(TRNCODG),
    foreign key (RENCGPR) references Processo(PRNCODG),
    foreign key (RENCGST) references Situacao(STNCODG)
);

create table AnexoRequerimento (
    ARNCODG serial primary key,
    ARAARQV varchar(255) unique,
    ARNFREQ integer not null,

    foreign key (ARNFREQ) references Requerimento(RENCODG)
);

create table Pessoa (
    PENCODG serial primary key,
    PEANOME varchar(255),
    PEAMAIL varchar(255) unique,
    PEAFONE char(10)
);

create table Aluno (
    ALNCODG serial primary key,
    ALAREGN varchar(5),
    ALNCURS integer not null,
    ALNPESS integer not null,

    foreign key (ALNPESS) references Pessoa(PENCODG),

    foreign key (ALNCURS) references Curso(CUNCODG)
);

create table Funcionario (
    FUNCODG serial primary key,
    FUNCGPE integer not null,
    FUNCGCG integer not null,
    FUNCGBE integer,
    FUNCGSE integer not null,

    foreign key (FUNCGSE) references setor(SENCODG),
    foreign key (FUNCGBE) references BancaExaminadora(BENCODG),
    foreign key (FUNCGPE) references Pessoa(PENCODG),
    foreign key (FUNCGCG) references Cargo(CGNCODG)
);

create table Setor (
    SENCODG serial primary key,
    SEANOME varchar(255) unique
);

create table Cargo (
    CGNCODG serial primary key,
    CGANOME varchar(255)
);

create table Pagamento (
    PGNCODG serial primary key,
    PGNVALR float not null,
    PGDDATA timestamp default now(),
    PGNCGPR integer not null,
    PGNCGAL integer not null,

    foreign key (PGNCGPR) references processo(PRNCODG),
    foreign key (PGNCGAL) references aluno(ALNCODG)
);

create table BancaExaminadora (
    BENCODG serial primary key
);
--- V2


alter table funcionario drop column funcgbe;
alter table processo add column prdinic timestamp default now();
alter table processo add column prdfim timestamp;
alter table processo add column prlativ boolean default true;

alter table aluno add column allmatr boolean;
alter table requerimento add column readesc varchar(255);

alter table requerimento add column rencgcr integer not null;
alter table requerimento add constraint requerimento_funccgcr_fkey foreign key (rencgcr)
    references custorequerimento(crncodg);

alter table custorequerimento add column cradesc varchar(255) unique;
alter table pessoa add column peacpf char(11) unique;

alter table despache add column deacncd boolean;
alter table despache add column deaargm text null;
alter table despache add column deddata date;
alter table bancaexaminadora add column beadesc varchar(255) unique;
alter table processo add column prncgfu integer not null;
alter table processo add constraint processo_funccgfu_fkey foreign key (prncgfu)
    references funcionario(funcodg);


alter table situacao rename column stanome to staestd;

alter table aluno rename column alncurs to alncgcu;
alter table aluno rename column alnpess to alncgpe;


create table IntegrantesBanca (
    ITNCGFU integer not null,
    ITNCGBE integer not null,
    primary key (ITNCGFU, ITNCGBE),


    foreign key (ITNCGBE) references bancaexaminadora(bencodg),
    foreign key (ITNCGFU) references funcionario(funcodg)

)