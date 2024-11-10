# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# categories = %w[Clothing Electronics Footwear Jewelery ]

# categories.each do |category_name|
#   Category.create(name: category_name)
# end

# db/seeds.rb

# # Find the category with the name 'Clothing' and update it
# clothing_category = Category.find_by(name: 'Clothing')
# if clothing_category
#   clothing_category.update(name: 'Fashion & Apparel')
# end

# # You might want to re-associate products to this category
# products = Product.where(category: clothing_category)
# products.update_all(category_id: clothing_category.id)


# db/seeds.rb

# Find the "Electronics" category and update its name
# Jewellery_category = Category.find_by(name: 'Jewellery')
# if Jewellery_category
#   Jewellery_category.update(name: 'Jewelry Collection')
# else
#   puts "Electronics category not found!"
# end

# # Add the new "Health & Beauty" category
# health_and_beauty_category = Category.find_by(name: 'Health & Beauty')
# if health_and_beauty_category.nil?
#   Category.create(name: 'Health & Beauty')
# else
#   puts "Health & Beauty category already exists!"
# end

# You might also want to update products that belong to the old "Electronics" category (if necessary)
# Ensure products linked to "Electronics" are correctly reflected under the new "Electronics & Gadgets" category
# (This step assumes you have a 'category' association in the Product model)

# Product.where(category: 'Electronics').update_all(category_id: electronics_category.id)

# puts "Categories updated successfully."
Product.where(quantity: nil).update_all(quantity: 2)
