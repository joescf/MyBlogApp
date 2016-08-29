# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create :email => 'joescf@gmail.com',
                   :password => 'qwerty',
                   :password_confirmation => 'qwerty'

       Category.create [{:name => 'Programming'},
                        {:name => 'Event'},
                        {:name => 'Travel'},
                        {:name => 'Music'},
                        {:name => 'TV'}]

user.articles.create :title => 'Advaced Active Record',
                     :body => 'Models need to relate to each other in the real world',
                     :published_at => Date.today

user.articles.create :title => 'One-to-many associations',
                     :body => 'One-to-many associations describe a pattern',
                     :published_at => Date.today

user.articles.create :title => 'Associations',
                     :body => 'Active record makes working with association easy',
                     :published_at => Date.today
