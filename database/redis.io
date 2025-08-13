// Reactions
1. Ключ: posts:{post_id}:reactions
   Описание: Хранит реакции пользователей на пост. Без TTL.
   Значение:
     {user_id} {reaction_type}
   Пример:
     Ключ: posts:6e4d5511-37e4-447d-b3d0-9917c941076b:reactions
     Значение:
       user:5c171289-743f-409f-a7d1-934e55c1c00f like
       user:0c4681e6-84a6-4afd-9550-72f4c8db22b2 wow
       user:8a3f2d1b-6e89-4c72-9d31-7f5e3a9b1234 love

2. Ключ: posts:{post_id}:counters
   Описание: Счетчики реакций по типам. Без TTL
   Значение:
     {reaction_type} {count}
   Пример:
     Ключ: posts:6e4d5511-37e4-447d-b3d0-9917c941076b:counters
     Значение:
       like 45
       love 12
       wow 3
       haha 0
       sad 0
       angry 0
       total 60

3. Ключ: comments:{comment_id}:reactions
   Тип: Hash
   Описание: Реакции на комментарий. Без TTL
   Значение:
     {user_id} {reaction_type}
   Пример:
     Ключ: comments:789abc-def012-345678:reactions
     Значение:
       user:5c171289-743f-409f-a7d1-934e55c1c00f like
       user:0c4681e6-84a6-4afd-9550-72f4c8db22b2 love

4. Ключ: comments:{comment_id}:counters
   Описание: Счетчики реакций на комментарий. Без TTL
   Значение:
     {reaction_type} {count}
   Пример:
     Ключ: comments:789abc-def012-345678:counters
     Значение:
       like 8
       love 2
       total 10
