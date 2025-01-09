# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 重置数据库
puts "Resetting the restaurants and reviews..."
Restaurant.destroy_all
Review.destroy_all
puts "Reset done!"

# 创建餐厅种子数据
puts "Creating new restaurants..."
categories = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  resto = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )
  puts "Created restaurant: #{resto.name}"

  # 为每个餐厅创建随机评论
  rand(2..5).times do
    review = Review.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: resto
    )
    puts "  Added review: #{review.content} (Rating: #{review.rating})"
  end
end

puts "Seeds done!"
