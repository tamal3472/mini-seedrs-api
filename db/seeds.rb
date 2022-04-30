# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
25.times do |iteration_number|
  # Since we are expecting from next code block- for every campaign there will be an image,
  # added this transaction to ensure the proposition
  ActiveRecord::Base.transaction do
    campaign = Campaign.create!(
      name: Faker::Name.name,
      target_amount: Faker::Commerce.price(range: 110..100_000.0),
      investment_multiple: Faker::Commerce.price(range: 1..100.0),
      sector: Faker::Commerce.department,
      country: Faker::Address.country,
    )

    begin
      image_file = File.open("#{Rails.root}/fixtures/image_#{iteration_number}.jpeg")
      campaign.image.attach(
        io: image_file, filename: "campaign_image_#{iteration_number}", content_type: 'image/jpeg',
      )
    ensure
      # opened file gets closed
      image_file.close
    end
  end
end
