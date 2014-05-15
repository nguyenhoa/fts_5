class Question < ActiveRecord::Base
  has_many :answer_sheets
  has_many :examinations, through: :answer_sheets
  has_many :options, dependent: :destroy
  belongs_to :subject
  accepts_nested_attributes_for :options
end
