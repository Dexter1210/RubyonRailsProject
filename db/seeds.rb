# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting tables..."

connection = ActiveRecord::Base.connection()
connection.execute("delete from action_text_rich_texts");
connection.execute("delete from active_storage_attachments");
connection.execute("delete from active_storage_blobs");
# connection.execute("delete from friendly_id_slugs");
connection.close()

Tagging.delete_all
Comment.delete_all
Post.delete_all
Tag.delete_all
Category.delete_all
User.delete_all






#create will immeditaely save the tags in db

tag_js=Tag.create(name:"javascript")
tag_react=Tag.create(name:"react")
tag_ruby=Tag.create(name:"ruby")
tag_rails=Tag.create(name:"rails")

devesh=User.create(email:"deveshsharma1210@gmail.com",password:"Modinagar12@",password_confirmation:"Modinagar12@")
yogesh=User.create(email:"yogeshsharma1210@gmail.com",password:"Modinagar12@",password_confirmation:"Modinagar12@")




cat_prog=Category.create(name:"Programming",description:"All about Programming",published: true)
cat_prog1=Category.create(name:"Programming1",description:"All about Programming1",published: true)
cat_prog2=Category.create(name:"Programming2",description:"All about Programming1",published: true)

20.times do |i|
    Post.create(
        user: i%2==0 ? devesh : yogesh,
        title:"Post #{i}",
        body:"Post #{i} goes here...",
        published: true,
        category: i%2==0 ?cat_prog : cat_prog1,
        tags: i%2 ==0? [tag_rails,tag_ruby] : [tag_js,tag_react]
    )
end

Post.all.each do |post|
    3.times do |i|
    post.comments.build(title: Faker::ChuckNorris.fact,
    content: Faker::ChuckNorris.fact, 
    user: i%2==0? devesh : yogesh
     )

     post.save

    end
end

