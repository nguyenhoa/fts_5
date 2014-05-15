class Exam < ActiveRecord::Base
  has_many :examinations
  belongs_to :subject
end
