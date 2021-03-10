# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.new(name: "Chuck Taylor All-Star", price: 55, img_url"https://www.converse.com/dw/image/v2/BCZC_PRD/on/demandware.static/-/Sites-cnv-master-catalog/default/dw12233c7f/images/e_08/M9160_E_08X1.jpg?sw=406", description: "A  model of casual shoe manufactured by Converse")
product.save

product = Product.new(name: "Samsung Galaxy S21", price: 799, image_url: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR1cwKijvvHScA5dHrcS_rd9JwvnRKx3SJDu5CUDyYHuT4e5bDvRc4_SVjK8PvqgQcXQ9h57AoztdhFjQQOrvfOOvKq9fo1wEkbDWCy1prEGw3Ns9Z7TSfp6g&usqp=CAE", description: "Super high-resolution camera and 8K video. Galaxy's fastest processor yet. All-day intelligent battery.")
product.save

product = Product.new(name: "Red Wing Iron Ranger Boots", price: 329, image_url: "https://embed.widencdn.net/img/redwing/fcwacxemrq/600x600px/RW08085C_MUL_N1_0416?position=S&crop=no&color=EDE8DD", description: "The Iron Ranger is an American icon that is beloved for its standout style and long-lasting construction. With its toe cap, speed hooks, and Vibram® outsole, there's no mistaking this leather legend.")
product.save

products_without_supplier = Product.where(supplier_id: nil_)

products_without_supplier.each do |product|
  random_supplier_id = Supplier.all.sample.id
  product.supplier_id = random_supplier_id
  product.save!
end