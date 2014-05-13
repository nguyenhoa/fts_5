(1..100).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "123456", password_confirmation: "123456", admin: '0')
end

(1..3).each do |i| 
  User.create(name: "Admin#{i}", email: "admin#{i}@example.com", 
  password: "123456", password_confirmation: "123456", admin: '1')
end
