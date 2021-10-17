create dabatase sysReq;

create table curso
(
    cuncodg serial
        constraint curso_pkey
            primary key,
    cuanome varchar(255)
        constraint curso_cuanome_key
            unique
);

create table tiporequerimento
(
    trncodg serial
        constraint tiporequerimento_pkey
            primary key,
    tranome varchar(255)
        constraint tiporequerimento_tranome_key
            unique
);

create table custorequerimento
(
    crncodg serial
        constraint custorequerimento_pkey
            primary key,
    crnvalr double precision,
    cradesc varchar(255)
        constraint custorequerimento_cradesc_key
            unique
);

create table situacao
(
    stncodg integer not null
        constraint situacao_pkey
            primary key,
    staestd varchar(255)
        constraint situacao_stanome_key
            unique
);

create table pessoa
(
    pencodg serial
        constraint pessoa_pkey
            primary key,
    peanome varchar(255),
    peamail varchar(255)
        constraint pessoa_peamail_key
            unique,
    peafone char(10),
    peacpf  char(11)
        constraint pessoa_peacpf_key
            unique
);

create table aluno
(
    alncodg serial
        constraint aluno_pkey
            primary key,
    alaregn varchar(5),
    alncgcu integer not null
        constraint aluno_alncurs_fkey
            references curso,
    alncgpe integer not null
        constraint aluno_alnpess_fkey
            references pessoa,
    allmatr boolean
);

create table setor
(
    sencodg serial
        constraint setor_pkey
            primary key,
    seanome varchar(255)
        constraint setor_seanome_key
            unique
);

create table cargo
(
    cgncodg serial
        constraint cargo_pkey
            primary key,
    cganome varchar(255)
);

create table bancaexaminadora
(
    bencodg serial
        constraint bancaexaminadora_pkey
            primary key,
    beadesc varchar(255)
        constraint bancaexaminadora_beadesc_key
            unique
);

create table funcionario
(
    funcodg serial
        constraint funcionario_pkey
            primary key,
    funcgpe integer not null
        constraint funcionario_funcgpe_fkey
            references pessoa,
    funcgcg integer not null
        constraint funcionario_funcgcg_fkey
            references cargo,
    funcgse integer not null
        constraint funcionario_funcgse_fkey
            references setor
);

create table processo
(
    prncodg serial
        constraint processo_pkey
            primary key,
    prdinic timestamp default now(),
    prdfim  timestamp,
    prlativ boolean   default true,
    prncgfu integer not null
        constraint processo_funccgfu_fkey
            references funcionario
);

create table requerimento
(
    rencodg serial
        constraint requerimento_pkey
            primary key,
    rencgst integer not null
        constraint requerimento_rencgst_fkey
            references situacao,
    rencgtr integer not null
        constraint requerimento_rencgtr_fkey
            references tiporequerimento,
    rencgpr integer not null
        constraint requerimento_rencgpr_fkey
            references processo,
    reaobse text,
    reaargu text,
    redcret timestamp default now(),
    readesc varchar(255),
    rencgcr integer not null
        constraint requerimento_funccgcr_fkey
            references custorequerimento
);

create table pagamento
(
    pgncodg serial
        constraint pagamento_pkey
            primary key,
    pgnvalr double precision not null,
    pgddata timestamp default now(),
    pgncgpr integer          not null
        constraint pagamento_pgncgpr_fkey
            references processo,
    pgncgal integer          not null
        constraint pagamento_pgncgal_fkey
            references aluno
);

create table anexorequerimento
(
    arncodg serial
        constraint anexorequerimento_pkey
            primary key,
    araarqv varchar(255)
        constraint anexorequerimento_araarqv_key
            unique,
    arnfreq integer not null
        constraint anexorequerimento_arnfreq_fkey
            references requerimento
);

create table despache
(
    dencgfu integer not null
        constraint despache_dencgfu_fkey
            references funcionario,
    dencgpr integer not null
        constraint despache_dencgpr_fkey
            references processo,
    deacncd boolean,
    deaargm text,
    deddata date,
    constraint despache_pkey
        primary key (dencgfu, dencgpr)
);

create table integrantesbanca
(
    itncgfu integer not null
        constraint integrantesbanca_itncgfu_fkey
            references funcionario,
    itncgbe integer not null
        constraint integrantesbanca_itncgbe_fkey
            references bancaexaminadora,
    constraint integrantesbanca_pkey
        primary key (itncgfu, itncgbe)
);

