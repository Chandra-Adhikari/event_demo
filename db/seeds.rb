# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "admin@example.com",password:"password", password_confirmation: "password")
User.create!([
  {email: "testuser1@mvmanor.co.uk", name: "testuser1", phone: "1111111111"},
  {email: "testuser2@mvmanor.co.uk", name: "testuser2", phone: "2111111111"},
  {email: "testuser3@mvmanor.co.uk", name: "testuser3", phone: "2111111111"},
  {email: "testuser4@mvmanor.co.uk", name: "testuser4", phone: "4111111111"},
  {email: "testuser5@mvmanor.co.uk", name: "testuser5", phone: "5111111111"},
  {email: "testuser6@mvmanor.co.uk", name: "testuser6", phone: "6111111111"},
  {email: "testuser7@mvmanor.co.uk", name: "testuser7", phone: "7111111111"},
  {email: "testuser8@mvmanor.co.uk", name: "testuser8", phone: "8111111111"},
  {email: "testuser9@mvmanor.co.uk", name: "testuser9", phone: "9111111111"},
  {email: "testuser10@mvmanor.co.uk", name: "testuser10", phone: "0111111111"},

])