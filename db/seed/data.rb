30.times do
  Product.create(
    name: Faker::Commerce.product_name,
    short_description: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs(number: 5).join(" "),
    ingredients: Faker::Lorem.words.join(" "),
    enabled: true,
    description_ar: Faker::Lorem.paragraphs(number: 5).join(" "),
    tags: Faker::Lorem.words.join(" "),
    reference: Faker::Commerce.promotion_code,
    original_name: Faker::Commerce.product_name,
    slug: Faker::Commerce.promotion_code
  )
end

10.times do
  Category.create(
    name: Faker::Commerce.department,
    name_ar: Faker::Commerce.department,
    description: Faker::Lorem.paragraphs(number: 3).join(" "),
    slug: Faker::Commerce.promotion_code,
    enabled: Faker::Boolean.boolean
  )
end



Product.all.each do |product|
  categories = Category.order("RANDOM()").limit(rand(1..4))
  product.categories = categories
end
