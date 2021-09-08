create table occupations (
    id serial primary key,
    name varchar(255) unique,

    created_at timestamp default now(),
    updated_at timestamp default now()
);

create table users (
    id serial primary key,
    name_complete varchar(255),
    name_certificated varchar(255),
    name_url varchar(255),
    email varchar(255) unique,
    password varchar(255),
    bio text null,
    birth_date date null,
    occupation_id integer not null,
    status_private boolean default true,
    photo_url varchar(255) null,

    foreign key (occupation_id) references occupations(id),

    created_at timestamp default now(),
    updated_at timestamp default now()
);

create table companies (
    user_id integer not null,
    primary key (user_id),

    name varchar(255),
    responsibility varchar(255),


    foreign key (user_id) references users(id),

    created_at timestamp default now(),
    updated_at timestamp default now()
);

create table educational_institutions (
    user_id integer not null,
    primary key (user_id),

    name varchar(255),
    course varchar(255),


    foreign key (user_id) references users(id),

    created_at timestamp default now(),
    updated_at timestamp default now()
);

create table area_interests (
    id serial primary key,
    name varchar(255) unique,
''
    created_at timestamp default now(),
    updated_at timestamp default now()
);

create table users_interests (
    user_id integer not null,
    interest_id integer not null,
    primary key (user_id, interest_id),

    foreign key (user_id) references users(id),
    foreign key (interest_id) references area_interests(id),

    created_at timestamp default now(),
    updated_at timestamp default now()
);

create table networks (
    id serial primary key,
    name varchar(255) unique,

    created_at timestamp default now(),
    updated_at timestamp default now()
);

create table users_networks (
    user_id integer not null,
    network_id integer not null,
    PRIMARY KEY (user_id, network_id),
    link varchar(255) unique,

    foreign key (user_id) references users(id),
    foreign key (network_id) references networks(id),

    created_at timestamp default now(),
    updated_at timestamp default now()
);
