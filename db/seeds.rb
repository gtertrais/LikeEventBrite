require 'faker'

User.destroy_all
Event.destroy_all
Participation.destroy_all


10.times do
  #create user
  city = ["Angers", "Paris", "Marseilles", "Noirmoutier"].sample
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10, supplemental: true), email: "#{Faker::Name.first_name}@yopmail.com", encrypted_password: 'password')
 
  #assign city to user


  #create gossip
  event = Event.create(title: Faker::Game.title, description: Faker::Lorem.sentence(word_count: 120, supplemental: true),price: Faker::Number.between(from: 1, to: 1000), user_id: user.id, location: city, start_date: Faker::Date.forward(days: 23), duration: Faker::Number.between(from: 1, to: 120))

 #assign gossips to user
  
  participation1 = Participation.create(stripe_customer_id: Faker::IDNumber.brazilian_citizen_number, user_id: user.id, event_id: Event.first.id)
  participation2 = Participation.create(stripe_customer_id: Faker::IDNumber.brazilian_citizen_number, user_id: user.id, event_id: Event.last.id)
  


end
puts "10 users created"
puts "10 events created"
puts "20 participations created"
puts "All values has been created!"