-- Buscar os dados gerais
select u.name_complete, u.name_certificated, u.name_url, u.email, u.status_private
from users u
where u.id = 1;

-- Sobre você e sua ocupação
select u.bio, u.birth_date, o as occupation, c as company, ei as education
from users u
join occupations o on u.occupation_id = o.id
left join companies c on u.id = c.user_id
left join educational_institutions ei on u.id = ei.user_id
where u.id = 1;

-- As redes do usuário logado
select u.name_complete, n.name,  un.link from users u
left join users_networks un on u.id = un.user_id
left join networks n on un.network_id = n.id
where u.id = 1;

-- Buscar meus interresses
select u.name_complete, array_agg(ai.name) from users u
left join users_interests ui on u.id = ui.user_id
left join area_interests ai on ui.interest_id = ai.id
where u.id = 1
group by u.name_complete;
