(1..100).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "123456", password_confirmation: "123456", admin: '0')
end

(1..3).each do |i| 
  User.create(name: "Admin#{i}", email: "admin#{i}@example.com", 
  password: "123456", password_confirmation: "123456", admin: '1')
end

(1..3).each do |i| 
  Subject.create(name: "Sub#{i}", description: "question for trainning team")
  (1..20).each do |j| 
    Question.create(subject_id: i, content: "question #{i}-#{j}")
    (1..4).each do |k| 
      Option.create(question_id: j, answer: "option#{k}_ques #{i}-#{j}")
    end
  end
end
