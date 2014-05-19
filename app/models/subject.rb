class Subject < ActiveRecord::Base
  has_many :examinations
  has_many :users, through: :examinations
  has_many :questions, dependent: :destroy
end
