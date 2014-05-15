class Subject < ActiveRecord::Base
  has_many :examinations
  has_many :exams, dependent: :destroy
  has_many :users, through: :examinations
  has_many :questions, dependent: :destroy
end
