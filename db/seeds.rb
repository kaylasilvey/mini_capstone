# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.create({
  name: "Uppers and Downers Enamel Pin Set",
  price: 12.95,
  image_url: "http://annalisaillustration.com/wp-content/uploads/2018/08/IMG_2637-1030x1030.jpg",
  description: "Keep things on the level",
})

product = Product.create({
  name: "Whiskey Makes Me Friskey Pin",
  price: 2.95,
  image_url: "http://annalisaillustration.com/wp-content/uploads/2012/03/IMG_4708-773x1030.jpg",
  description: "Cheers!",
})

product = Product.create({
  name: "Heart Butt Enamel Pin",
  price: 8.00,
  image_url: "http://annalisaillustration.com/wp-content/uploads/2012/03/product_image.jpg",
  description: "Let it all hang out",
})

product = Product.create({
  name: "Trash Queen Print",
  price: 15.00,
  image_url: "http://annalisaillustration.com/wp-content/uploads/2012/03/Trashqueen_small.jpg",
  description: "You might be trash, but you're royal trash.",
})

product = Product.create({
  name: "Home Sweet Home Print",
  price: 15.00,
  image_url: "http://annalisaillustration.com/wp-content/uploads/2012/03/UmWwBQ-66dAKbB5KFdjXRCqt1yVWl06aijVoRD2emx4FERLOZoN8d-zQr439SpnG-796x1030.jpg",
  description: "Cuz there's no place like it.",
})

product = Product.create({
  name: "Crystal Heart Print",
  price: 15.00,
  image_url: "http://annalisaillustration.com/wp-content/uploads/2015/10/Inktober_2015_day30-773x1030.jpg",
  description: "Don't go breaking my...",
})

product = Product.create({
  name: "Death of Magic Print",
  price: 15.00,
  image_url: "http://annalisaillustration.com/wp-content/uploads/2015/10/Inktober_2015_day26-773x1030.jpg",
  description: "Magic is dead. Bummer.",
})
