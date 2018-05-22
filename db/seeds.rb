# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


r1 = Restaurant.create(name: "Ophelia's Electric Soapbox", phone_number: 3039938023, address: '1215 20th Street, Denver CO', yelp_review_link: 'https://www.yelp.com/biz/ophelias-electric-soapbox-denver')
Tag.create(type: 'Greek')
Tag.create(type: 'French')
Tag.create(type: 'American')
Tag.create(type: 'Asian')
Tag.create(type: 'Venezuelan')
Tag.create(type: 'Craft Beer')