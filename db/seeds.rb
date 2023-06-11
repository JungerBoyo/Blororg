# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'


puts "Seeding..."

## password = fake123!
User.create(id: 0, email: "admin@admin", encrypted_password:"$2a$12$GwA7Nx9CD6mjaNFYZJV4y.KEif4L3o.CajO3MSZ33VPdh5aj1FPcu",created_at: DateTime.now, updated_at: DateTime.now+1, nick: "admin", role: 2)
User.create(id: 1, email: "jan@kowalski", encrypted_password:"$2a$12$GwA7Nx9CD6mjaNFYZJV4y.KEif4L3o.CajO3MSZ33VPdh5aj1FPcu",created_at: DateTime.now, updated_at: DateTime.now+1, nick: "jan", role: 0)

Category.create(id: 0, name: "Food",created_at: DateTime.now, updated_at: DateTime.now+1)
Category.create(id: 1, name: "Social media",created_at: DateTime.now, updated_at: DateTime.now+1)
Category.create(id: 2, name: "Hardware",created_at: DateTime.now, updated_at: DateTime.now+1)
Category.create(id: 3, name: "Politics",created_at: DateTime.now, updated_at: DateTime.now+1)
Category.create(id: 4, name: "Sport",created_at: DateTime.now, updated_at: DateTime.now+1)

Tag.create(id: 0, name: "Breakfast",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 1, name: "Dinner",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 2, name: "Snacks",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 3, name: "Caloric",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 4, name: "Facebook",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 5, name: "YouTube",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 6, name: "Twitter",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 7, name: "PC",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 8, name: "Laptop",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 10, name: "Elections",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 11, name: "Poland",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 12, name: "Football",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 13, name: "Basketball",created_at: DateTime.now, updated_at: DateTime.now+1)
Tag.create(id: 14, name: "Olympics",created_at: DateTime.now, updated_at: DateTime.now+1)

Post.create(id: 0, title: "The fastest breakfast", contents: "I'm looking for the fastest and caloric breakfast",
            is_private: false ,created_at: DateTime.new(2023,1,1,12,0,0),
            updated_at: DateTime.new(2023,1,2,12,0,0), user_id: 0, category_id: 0)
Post.create(id: 1, title: "Facebook password policy", contents: "After update i have problems with login to my account.",
            is_private: false ,created_at: DateTime.new(2023,2,2,10,0,0),
            updated_at: DateTime.new(2023,2,2,10,0,0), user_id: 1, category_id: 1)
Post.create(id: 2, title: "PC for gaming", contents: "Building monster pc for new games",
            is_private: false ,created_at: DateTime.new(2023,3,3,8,0,0),
            updated_at: DateTime.new(2023,3,4,8,0,0), user_id: 0, category_id: 2)
Post.create(id: 3, title: "Elections in Poland", contents: "Feel free to give your opinion ;)",
            is_private: false ,created_at: DateTime.new(2023,4,4,15,15,0),
            updated_at: DateTime.new(2023,4,5,15,15,0), user_id: 1, category_id: 3)
Post.create(id: 4, title: "Olympics in Tokyo",contents: "What do you think about last Olympics?",
            is_private: false ,created_at: DateTime.new(2023,6,6,18,35,0),
            updated_at: DateTime.new(2023,6,7,18,35,0), user_id: 0, category_id: 4)

TagBinding.create(post_id: 0, tag_id: 0, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))
TagBinding.create(post_id: 0, tag_id: 2, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))
TagBinding.create(post_id: 0, tag_id: 3, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))
TagBinding.create(post_id: 1, tag_id: 4, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))
TagBinding.create(post_id: 2, tag_id: 7, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))
TagBinding.create(post_id: 3, tag_id: 10, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))
TagBinding.create(post_id: 3, tag_id: 11, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))
TagBinding.create(post_id: 4, tag_id: 14, created_at: DateTime.new(2023,1,1,12,0,0), updated_at: DateTime.new(2023,1,1,15,0,0))


Comment.create(id: 0, post_id: 0, user_id: 1, contents: "Try scrambled eggs with bacon!", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 1, post_id: 0, user_id: 0, contents: "I hate bacon...", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 2, post_id: 0, user_id: 1, contents: "Change ur mind if you want to increase your weight", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))

Comment.create(id: 3, post_id: 1, user_id: 0, contents: "Can you more specify problem? Write DM to me", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 4, post_id: 1, user_id: 1, contents: "Ok. Check spam because my email is fake", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))

Comment.create(id: 5, post_id: 2, user_id: 1, contents: "Find model G4M3R in xkom. I have for 5 years and it keep high performance
                in Hogwart Legacy and Diablo 4", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 6, post_id: 2, user_id: 0, contents: "It's too expensive... Some alternatives?", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 7, post_id: 2, user_id: 1, contents: "Go work and come back with more money xd", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))

Comment.create(id: 8, post_id: 3, user_id: 0, contents: "only Prawo i Sprawiedliwość", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 9, post_id: 3, user_id: 1, contents: "only Koalicja Obywatelska", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 10, post_id: 3, user_id: 0, contents: "NIEEEEEEEEEE!", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))

Comment.create(id: 11, post_id: 4, user_id: 1, contents: "This was the best experience in my life", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 12, post_id: 4, user_id: 0, contents: "Yeah. You are right. I hope they will keep this level and standards",
               created_at: DateTime.new(2023,1,2,12,15,0), updated_at: DateTime.new(2023,1,2,12,0,0))
Comment.create(id: 13, post_id: 4, user_id: 1, contents: "I love runners, they are most motivated <3", created_at: DateTime.new(2023,1,2,12,15,0),
               updated_at: DateTime.new(2023,1,2,12,0,0))

puts "Seeding done."