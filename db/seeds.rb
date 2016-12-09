# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["users", "gardens", "gardens_items", "items", "images", "comments"].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY CASCADE")
end

User.create!([{
  username: "mickyginger",
  email: "mike.hayden@ga.co",
  password: "password",
  password_confirmation: "password"
},{
  username: "emilyi",
  email: "emily.isacke@ga.co",
  password: "password",
  password_confirmation: "password"
},{
  username: "Elliot304",
  email: "ell_304@msn.com",
  password: "password",
  password_confirmation: "password"
}])

Garden.create!([{
  title: "Japanese garden",
  date: DateTime.new(2016, 11, 23),
  description: "Lily pads and acers",
  user_id: 3
}, {
  title: "Rose garden",
  date: DateTime.new(2016, 11, 23),
  description: "A whole lotta roses",
  user_id: 3
}, {
  title: "Minimalist garden",
  date: DateTime.new(2016, 11, 23),
  description: "Nothing to see here",
  user_id: 1
}])

Item.create!([{
  name: "Acer",
  price: "£23.99",
  image: "http://www.howtogrow.co.uk/images/photos/trees-shrubs/acer-japanese-maple-tree.jpg",
  item_type: "Plant",
  description: "Japanese Maple",
  garden_ids: [1,3]
}, {
  name: "Jubilee Rose",
  price: "£11.99",
  image: "https://www.agel-rosen.de/fotos/English-Rose-Jubilee-Celebration-81704.jpg",
  item_type: "Plant",
  description: "Pink bush rose",
  garden_ids: [2]
}, {
  name: "Turf",
  price: "£199.99",
  image: "http://www.rolawn.co.uk/CMSPages/GetFile.aspx?guid=6d9ddf52-b89d-4d2a-aad1-f13752478fa9&width=650",
  item_type: "Material",
  description: "Rolawn turf",
  garden_ids: [1,2,3]
}])

Image.create!([{
  url: "https://robert47dotorg.files.wordpress.com/2013/04/garden-plans-009.jpg",
  garden_id: 2
},{
  url: "http://www.homeofficedecoration.net/wp-content/uploads/parser/Rose-Garden-Design-Layout-2.jpg",
  garden_id: 2
},{
  url: "https://s-media-cache-ak0.pinimg.com/originals/14/0f/6b/140f6b99d90b5c97513fad4a2306c9ca.jpg",
  garden_id: 3
},{
  url: "http://gardendsgn.com/wp-content/uploads/2016/04/japanese-garden-designs-koi-and-goldfish-pond-with-water-plants-decor-and-design-nature-vintage-landscaping-ideas-downloads.jpg",
  garden_id: 1
}])

Comment.create!([{
  body: "Nice roses!",
  date: DateTime.new(2016, 11, 23),
  user_id: 3,
  garden_id: 2
},{
  body: "I think so too!",
  date: DateTime.new(2016, 11, 23),
  user_id: 1,
  garden_id: 2
},{
  body: "I think i'm turning Japanese!",
  date: DateTime.new(2016, 11, 23),
  user_id: 2,
  garden_id: 1
},{
  body: "Boring buxus",
  date: DateTime.new(2016, 11, 23),
  user_id: 3,
  garden_id: 3
}])
