supplier = Supplier.create({
  name: "Anna Lisa Illustration",
  email: "annalisaillo@gmail.com",
  phone_number: "555-666-777",
})

supplier = Supplier.create({
  name: "Threadless",
  email: "threadless@email.com",
  phone_number: "333-444-5555",
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2018/08/IMG_2637-1030x1030.jpg",
  product_id: 1,
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2012/03/IMG_4708-773x1030.jpg",
  product_id: 2,
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2012/03/product_image.jpg",
  product_id: 3,
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2012/03/Trashqueen_small.jpg",
  product_id: 4,
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2012/03/UmWwBQ-66dAKbB5KFdjXRCqt1yVWl06aijVoRD2emx4FERLOZoN8d-zQr439SpnG-796x1030.jpg",
  product_id: 5,
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2015/10/Inktober_2015_day30-773x1030.jpg",
  product_id: 6,
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2015/10/Inktober_2015_day26-773x1030.jpg",
  product_id: 7,
})

image = Image.create({
  url: "http://annalisaillustration.com/wp-content/uploads/2014/08/heartbutt_poster_color-772x1030.jpg",
  product_id: 3,
})

product = Product.create({
  name: "Uppers and Downers Enamel Pin Set",
  price: 12.95,
  description: "Keep things on the level",
  supplier_id: 1,
})

product = Product.create({
  name: "Whiskey Makes Me Friskey Pin",
  price: 2.95,
  description: "Cheers!",
  supplier_id: 1,
})

product = Product.create({
  name: "Heart Butt Enamel Pin",
  price: 8.00,
  description: "Let it all hang out",
  supplier_id: 1,
})

product = Product.create({
  name: "Trash Queen Print",
  price: 15.00,
  description: "You might be trash, but you're royal trash.",
  supplier_id: 2,
})

product = Product.create({
  name: "Home Sweet Home Print",
  price: 15.00,
  description: "Cuz there's no place like it.",
  supplier_id: 2,
})

product = Product.create({
  name: "Crystal Heart Print",
  price: 15.00,
  description: "Don't go breaking my...",
  supplier_id: 2,
})

product = Product.create({
  name: "Death of Magic Print",
  price: 15.00,
  description: "Magic is dead. Bummer.",
  supplier_id: 2,
})
