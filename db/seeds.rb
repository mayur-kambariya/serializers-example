User.destroy_all
Friend.destroy_all

harum = User.create(name: "Harum Helmy", password: "boops", email: "harumendhah@gmail.com")
austen = User.create(name: "Austen MC", password: "butts", email: "amackcrane@eparade.net")

helen = Friend.create(user_id: harum.id, name: "Helen", pronouns: "they/them", appreciation: "I love Helen because they are a thoughtful person who loves deeply and fights for what they believe in. I love that they are very critical, we like to read the same books, etc etc", starred: true)

dani = Friend.create(user_id: harum.id, name: "Dani", pronouns: "she/her", appreciation: "Dani is the best, she makes me laugh and takes me to Costco, she sends me memes, makes the best food, and loves fiercely", starred: true)

