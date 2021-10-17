insert into occupations (name)
values ('Estudando');

insert into occupations (name)
values ('Trabalhando');

insert into occupations (name)
values ('Trabalhando e estudando');

-- OK

insert into networks (name)
values ('Twitter');

insert into networks (name)
values ('Linkedin');

insert into networks (name)
values ('Github');

-- OK

insert into users
    (name_complete, name_certificated, name_url, email, password, bio, birth_date, occupation_id)
    values ('José Murillo Nunes Rodrigues', 'José Murillo N Rodrigues', 'jose-murilloc', 'jooseemurillo@gmail.com', '123456', 'Sou um estudante de computação, e claro poderia escrever muito mais aqui para informar mais sobre minhas habilidades uma breve bio', '1998-07-16', 1);

-- OK

insert into users_networks (user_id, network_id, link)
values (1, 1, 'https://twitter.com/JoseMuriloc');

insert into users_networks (user_id, network_id, link)
values (1, 2, 'https://www.linkedin.com/in/jose-murillodev/')

insert into users_networks (user_id, network_id, link)
values (1, 3, 'https://github.com/JoseMurilloc/');

-- OK

insert into area_interests (name)
VALUES ('Programação');

insert into area_interests (name)
VALUES ('Front-end');

insert into area_interests (name)
VALUES ('Back-end');

insert into area_interests (name)
VALUES ('Data Science');

insert into area_interests (name)
VALUES ('DevOps');

insert into area_interests (name)
VALUES ('UX & Design');

insert into area_interests (name)
VALUES ('Mobile');

insert into area_interests (name)
VALUES ('Inovação & Gestão');

-- OK

insert into users_interests (user_id, interest_id)
values (1, 1);

insert into users_interests (user_id, interest_id)
values (1, 2);

insert into users_interests (user_id, interest_id)
values (1, 3);

-- OK

insert into educational_institutions (user_id, name, course)
values (1, 'FACAPE', 'Ciencia da computação');

insert into companies (user_id, name, responsibility)
values (1, 'Sistema OK', 'Desenvolvedor back end');

