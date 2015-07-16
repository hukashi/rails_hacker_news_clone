User.create(username: "hukashi", first_name: "Jonathan", last_name: "Chung", password: "bootcamp")
User.create(username: "spongebob", first_name: "Sponge", last_name: "Bob", password: "pineapple")

Post.create(title: "Hacker News", body: "This is the first post to my news blog. It's really boring.", user_id: 1)
Post.create(title: "Being a sponge", body: "I'm very absorbent and useful. However, most of my sponge friends have irregular shapes but I am just a reactangle. They make fun of me all the time. I'm sad.", user_id: 2)

Comment.create(body: "You are damn right! It's boring as hell!", post_id: 1, user_id: 2)
Comment.create(body: "I feel the urge to clean something. Come here...", post_id: 2, user_id: 1)
