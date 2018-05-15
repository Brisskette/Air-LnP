# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
title_first = ["jolie", "beau", "ravissant", "superbe", "enchenteur"]
title_second =["endroit", "terrain", "jardin" , "parking" ]


price = [1,3,10,15,18,38,73]

surface = [15,25,37,39]


for i in 1..15 do
  Land.create!(user: User.first, title: "#{title_first.sample} #{title_second.sample}", description: " Lorem ipsum#{i}",price: "#{price.sample}", surface:"#{surface.sample + i}" )

end
