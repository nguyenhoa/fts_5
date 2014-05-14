class Examination < ActiveRecord::Base
  has_many :answer_sheets
  has_many :questions, through: :answer_sheets
  belongs_to :user
  belongs_to :subject
end
