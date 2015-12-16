
def self.create_user(num, email)

  puts "email is: #{email}"

  user = User.create(email: email,
                     password: 'admin123',
                     first_name: email.split('@')[0].gsub('.', '_').classify,
                     last_name: "No#{num}",                     
                     phone_number: '1234567890',                     
                     confirmed_at: Time.now,
                     occupation: num,
                     facebook: "john.doe#{num}",
                     twitter: "john.doe#{num}",
                     website: "http://www.tripolis#{num}.com",
                     locale: :'vi',
                     created_by: 'system',
                     updated_by: 'system'
  )
  user
end


puts '--> starting seeding user data .....................'

internal_users = ['hdthinh@gmail.com', 'amira111@gmail.com', 'system@gmail.com', 'superadmin@gmail.com', 'admin@gmail.com']

internal_users.each_with_index do |email, index|
  create_user(index+10, email)
end

puts '--> finished seeding user data .....................'