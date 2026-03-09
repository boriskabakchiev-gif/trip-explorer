require 'json'

file = File.read(Rails.root.join('db/data.json'))

# махаме всички нови редове
clean_json = file.gsub(/\n/, " ")

data = JSON.parse(clean_json)

data["trips"].each do |trip|
  Trip.create!(
    name: trip["name"],
    image_url: trip["image"],
    short_description: trip["description"],
    long_description: trip["long_description"],
    rating: trip["rating"]
  )
end

puts "Trips seeded!"