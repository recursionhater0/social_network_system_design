// -------- Данные юзеров будут храниться в отдельной базе. Скорее всего это будет отдельный SSO.
// Данный SSO не входит в дизайн системы, поэтому в расчетах база данных пользователей присутствовать не будет
Table users {
  id uuid [pk]
  phone_number varchar(50) [unique]
  password_hash varchar(255)
  // Статусы по типу Забанен, Удален
  status varchar(20)
}

Table profile {
  user_id uuid [ref: - users.id]
  first_name varchar(50)
  last_name varchar(64)
  middle_name varchar(50)
  // avatar
  image_path varchar(255)

  indexes {
    user_id [pk]
  }
}

// -------- Все данные, связанные с постам, будут храниться в отдельной базе
Table posts {
  id uuid [pk]
  text text
  // Специальный тип, который знает, что координаты — это широта/долгота на сфере
  location GEOGRAPHY(Point, 4326)
  user_id uuid
  created_at datetime
  updated_at datetime
}

// Images
Table post_images {
  id uuid [pk]
  post_id uuid [ref: > posts.id]
  image_path varchar(255)
  // Для сортировки
  order_index int
  created_at datetime
  updated_at datetime
}

// -- Комментарии будут храниться в отдельной базе
Table comments {
  id uuid [pk]
  post_id uuid [ref: > posts.id]
  text text
  parent_comment uuid [ref: > comments.id]
  user_id uuid
  created_at datetime
}

// -------- Данные о подписках будут храниться в отдельной базе
// Subsriptions
Table subscriptions {
  // Кто подписывается
  follower_id  uuid
  // На кого подписывается
  following_id uuid
  created_at datetime

  indexes {
    (follower_id, following_id) [pk]
  }
}
