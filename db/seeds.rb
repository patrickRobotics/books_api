# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
a1 = Author.create(name: "Douglas Adams")
a2 = Author.create(name: "Bill Bryson")
a3 = Author.create(name: "Adam Smith")
a4 = Author.create(name: "Christopher Lee")
a5 = Author.create(name: "Richard Taylor")
Book.create(title: "The Hitchhiker's Guide to the Galaxy", language_code: "eng", num_pages: 815, authors: [a1])
Book.create(title: "Notes from a Small Island", language_code: "eng", num_pages: 321, authors: [a2])
Book.create(title: "The Lord of the Rings: Weapons and Warfare", language_code: "eng", num_pages: 215, authors: [a3,a4,a5])
