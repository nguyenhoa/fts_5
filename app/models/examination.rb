class Examination < ActiveRecord::Base
  has_many :answer_sheets
  has_many :questions, through: :answer_sheets
  belongs_to :user
  belongs_to :subject
  belongs_to :exam
  accepts_nested_attributes_for :exam
end
